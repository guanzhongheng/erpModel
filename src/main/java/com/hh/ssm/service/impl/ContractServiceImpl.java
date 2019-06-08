package com.hh.ssm.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hh.ssm.common.DictUtils;
import com.hh.ssm.dao.ContractDetailMapper;
import com.hh.ssm.dao.ContractDetailTraceMapper;
import com.hh.ssm.dao.ContractMapper;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.param.ProductForm;
import com.hh.ssm.domain.vo.*;
import com.hh.ssm.entity.*;
import com.hh.ssm.service.IContractService;
import com.hh.ssm.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@Service
public class ContractServiceImpl implements IContractService {
    @Autowired
    private ContractMapper contractMapper;
    @Autowired
    private ContractDetailMapper contractDetailMapper;
    @Autowired
    private ContractDetailTraceMapper contractDetailTraceMapper;
    @Autowired
    private IProductService productService;

    @Override
    public Contract get(Long id) {
        return contractMapper.get(id);
    }

    @Override
    public Contract findByConCode(String contCode) {
        return contractMapper.findByConCode(contCode);
    }

    @Override
    public List<ContractDetail> getDetailByConId(String code) {
        return contractDetailMapper.getByConId(code);
    }

    @Override
    public List<ContractVo> findList(ContractVo contract) {
        return contractMapper.findList(contract);
    }

    @Override
    public List<ContractVo> findAllList() {
        return contractMapper.findAllList();
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int insert(ContractVo vo) {
        int res = -1;
        Date current = new Date();
        Contract contract = buildContractFromVo(vo, current);
        res = contractMapper.insert(contract);
        if (res > 0) {
            //新增合同明细
            if (vo.getProdList() != null && !vo.getProdList().isEmpty()) {
                List<ContractDetail> contDetails = new ArrayList<>(vo.getProdList().size());
                ContractDetail cd;
                for (ContractDetailVo cdVo : vo.getDetailVoList()) {
                    cd = buildContractDetailFromVo(cdVo, current);
                    contDetails.add(cd);
                }

                res = contractDetailMapper.insertBatch(contDetails);
            }

        }
        return res;
    }

    /**
     * @Description: 合同信息由vo转入库实体
     * @Param: [vo, current]
     * @return: com.hh.ssm.entity.Contract
     * @Author: lijinku
     * @Iteration : 1.0
     * @Date: 2019/5/23 6:01 PM
     */
    private Contract buildContractFromVo(ContractVo vo, Date current) {
        Contract contract = new Contract();
        contract.setName(vo.getContName());
        contract.setManager(vo.getManager());
        contract.setAttachment(vo.getAttachment());
        contract.setCode(vo.getContCode());
        contract.setSignDate(vo.getSignDate());
        contract.setCreateTime(current);
        contract.setDeleveyDate(vo.getDeleveyDate());
        contract.setStatus('0');
        return contract;
    }

    @Override
    public int insertBatch(List<Contract> contracts) {
        return contractMapper.insertBatch(contracts);
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int update(ContractVo vo) {
        int res = -1;
        Long contId = vo.getContId();
        Contract dbPo = contractMapper.get(contId);
        if (dbPo != null) {
            Date current = new Date();
            Contract po = new Contract();
            po.setId(contId);
            po.setCode(vo.getContCode());
            po.setAttachment(vo.getAttachment());
            po.setManager(vo.getManager());
            po.setSignDate(vo.getSignDate());
            po.setDeleveyDate(vo.getDeleveyDate());
            po.setStatus('1');
            po.setUpdateTime(current);
            res = contractMapper.update(po);

            if (res > 0) {
                if (vo.getProdList() != null && !vo.getProdList().isEmpty()) {
                    boolean flg = true;
                    List<ContractDetail> contDetailPos = contractDetailMapper.getByConId(String.valueOf(contId));
                    if (contDetailPos != null && contDetailPos.size() == vo.getProdList().size()) {
                        for (ContractDetailVo cdVo : vo.getDetailVoList()) {
                            for (ContractDetail cd : contDetailPos) {
                                if (!(cdVo.getContDetailId().equals(cd.getId()) && cdVo.getProdType().equals(cd.getProdType()))) {
                                    flg = false;
                                    break;
                                }
                            }
                        }
                    } else {
                        flg = false;
                    }

                    if (flg) {
                        return res;
                    }

                    //删除旧信息，增加新的信息
                    res = contractDetailMapper.delete(contId);
                    if (res > 0) {
                        List<ContractDetail> cdLst = new ArrayList<>(vo.getProdList().size());
                        for (ContractDetailVo cdVo : vo.getDetailVoList()) {
                            ContractDetail cdPo = buildContractDetailFromProductVo(cdVo, contId, current);
                            cdLst.add(cdPo);
                        }
                        res = contractDetailMapper.insertBatch(cdLst);
                        if (res > 0) {
                            if (contDetailPos != null && !contDetailPos.isEmpty()) {
                                List<ContractDetailTrace> traceList = new ArrayList<>(contDetailPos.size());
                                for (ContractDetail cd : contDetailPos) {
                                    ContractDetailTrace trace = buildTraceFromNomal(cd, current);
                                    traceList.add(trace);
                                }
                                res = contractDetailTraceMapper.insertBatch(traceList);
                            }
                        }


                    }
                }

            }
        }
        return res;
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int updateAll(Contract contract) {
        return 0;
    }

    /**
     * @Description: 正常转痕迹
     * @Param: [cd, current]
     * @return: com.hh.ssm.entity.ContractDetailTrace
     * @Author: lijinku
     * @Iteration : 1.0
     * @Date: 2019/5/24 3:59 PM
     */
    private ContractDetailTrace buildTraceFromNomal(ContractDetail cd, Date current) {
        ContractDetailTrace trace = new ContractDetailTrace();
        trace.setContId(cd.getContId());
        trace.setCreateTime(current);
        trace.setProdId(cd.getProdId());
        trace.setProdType(cd.getProdType());
        trace.setQuantity(cd.getQuantity());
        trace.setUnQuantity(cd.getUnQuantity());
        return trace;
    }

    /**
     * @Description: 产品BVo转换合同明细
     * @Param: [vo, contId, current]
     * @return: com.hh.ssm.entity.ContractDetail
     * @Author: lijinku
     * @Iteration : 1.0
     * @Date: 2019/5/24 3:47 PM
     */
    private ContractDetail buildContractDetailFromProductVo(ContractDetailVo vo, Long contId, Date current) {
        ContractDetail cdPo = new ContractDetail();
        cdPo.setContId(contId);
        cdPo.setUnQuantity(vo.getUnQuantity());
        cdPo.setQuantity(vo.getQuantity());
        cdPo.setProdType(vo.getProdType());
        cdPo.setProdId(vo.getProdId());
        cdPo.setProdCode(vo.getProdCode());
        cdPo.setCreateTime(current);
        return cdPo;
    }

    @Override
    public int delete(String code) {
        return contractMapper.delete(code);
    }

    @Override
    public int deleteBatch(List<String> codeLst) {
        return contractMapper.deleteBatch(codeLst);
    }

    @Override
    public EUDataGridResult getList(int page, int rows, ContractVo contract) throws Exception {
        //分页处理
        PageHelper.startPage(page, rows);
        List<ContractVo> list = contractMapper.findList(contract);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<ContractVo> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public int updateDetail(List<ContractDetailVo> cdList) {
        if (cdList != null && !cdList.isEmpty()) {
            Date current = new Date();
            //先判断是否是非标准产品
            List<ContractDetail> pos = new ArrayList<>(cdList.size());
            if (cdList != null && !cdList.isEmpty()) {
                for (ContractDetailVo cd :
                        cdList) {
                    ContractDetail po = buildContractDetailFromVo(cd, current);
                    pos.add(po);
                }

                //更新合同状态
                Contract contract = new Contract();
                contract.setId(cdList.get(0).getContId());
                contract.setStatus('1');
                contract.setUpdateTime(current);
                contractMapper.update(contract);
                return contractDetailMapper.insertOrUpdateByBatch(pos);
            }
        }

        return -1;
    }

    @Override
    public EUDataGridResult listContractDetailById(Integer page, Integer rows, String id) {
        PageHelper.startPage(page, rows);
        List<ContractDetail> list = contractDetailMapper.getByConId(id);
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<ContractDetail> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public List<ProductDesinVo> getProdPracticaInfolListByConId(String contId) {
        List<ProductDesinVo> list = null;
        List<ContractDetail> cdList = contractDetailMapper.getByConId(contId);
        if (cdList != null && !cdList.isEmpty()) {
            list = new ArrayList<>();
            List<Long> prodIds = new ArrayList<>(cdList.size());
            for (ContractDetail cd :
                    cdList) {
                ProductDesinVo pdVo = buildProductDesinVoFromContDetail(cd);
                list.add(pdVo);
                prodIds.add(cd.getProdId());

            }

            List<Product> prods = DictUtils.getProductsByIds(prodIds);
            if (prods != null && !prods.isEmpty()) {
                for (Product pd : prods) {
                    List<Long> semiIdList = null;
                    String semiProds = pd.getSemiProdCons();
                    if (semiProds != null) {
                        semiIdList = new ArrayList<>();
                        List<JSONObject> jsObjs = JSONArray.parseArray(semiProds, JSONObject.class);
                        for (JSONObject jbObj : jsObjs) {
                            Long semiId = jbObj.getLong("id");
                            semiIdList.add(semiId);
                        }
                        List<SemiProduct> semiProdList = DictUtils.getSemiProdsByIds(semiIdList);
                        if (semiProdList != null && !semiIdList.isEmpty()) {
                            for (SemiProduct semProd :
                                    semiProdList) {
                                ProductDesinVo pdVo = new ProductDesinVo();
                                pdVo.setParentId(pd.getId());
                                pdVo.setSpecification(semProd.getSpecification());
                                pdVo.setProdId(semProd.getId());
                                pdVo.setContDetailId(cdList.get(0).getId());
                                pdVo.setProdName(semProd.getName());
                                pdVo.setProdCode(semProd.getCode());
                                pdVo.setProdType('2');
                                list.add(pdVo);
                            }
                        }


                    }
                }
            }

        }
        return list;
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int saveProductDesinInfo(ProductDesinOperVo vo) {
        int res = 0;
        Date current = new Date();
        Long prodId = vo.getProdId();
        //先判断是否是非标准产品
        Product product = DictUtils.getProductById(prodId);
        if (product != null) {
            if (!(product.getSpecification().equals(vo.getSpecification()))) {
                if (product.getCode().equals(vo.getProdCode())) {
                    return -1;
                }

                if (!(vo.getSemiProdList() != null && !vo.getSemiProdList().isEmpty())) {
                    return -2;
                }
                Product pdPo = new Product();
                pdPo.setType(vo.getProdType());
                pdPo.setCategory('1');
                pdPo.setCode(vo.getProdCode());
                pdPo.setSpecification(vo.getSpecification());
                pdPo.setName(vo.getProdName());
                pdPo.setCreateTime(current);
                List<SemiProductOperVo> semiProdList = vo.getSemiProdList();
                if (semiProdList != null && !semiProdList.isEmpty()) {
                    JSONArray array = new JSONArray();
                    for (SemiProductOperVo semiProduct : semiProdList) {
                        SemiProduct semiProd = DictUtils.getSemiProductById(semiProduct.getId());
                        if (!(semiProd.getSpecification().equals(semiProduct.getSpecification()) && semiProd.getCode().equals(semiProduct.getCode()))) {
                            return -3;
                        }
                        JSONObject object = new JSONObject();
                        object.put("id", semiProduct.getId());
                        array.add(object);
                    }
                    pdPo.setSemiProdCons(array.toString());
                }
                productService.insert(pdPo);
                prodId = pdPo.getId();
//                DictUtils.putProduct(pdPo);

            }

            //生成合同明细
            ContractDetail detail = buildContractDetail(vo, prodId, current);
            List list = new ArrayList<>();
            list.add(detail);
            res = contractDetailMapper.insertOrUpdateByBatch(list);

        }
        return res;
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int updateProductDesinInfo(ProductDesinOperVo vo) {
        if (vo.getContId() == null || vo.getProdId() == null || vo.getProdType() == null) {
            return -1;
        }

        Date curernt = new Date();
        if (vo.getProdType().equals('1')) {
            Product pdPo = DictUtils.getProductById(vo.getProdId());
            if (!(pdPo.getSpecification().equals(vo.getSpecification()) && pdPo.getCode().equals(vo.getProdCode()))) {
                //判断是否是非标准产品
                if (!pdPo.getCategory().equals('0')) {
                    //更新产品信息和合同信息
                    Product product = new Product();
                    product.setId(vo.getProdId());
                    product.setSpecification(vo.getSpecification());
                    product.setCode(vo.getProdCode());
                    product.setUpdateTime(curernt);
                    productService.update(product);
                    //更新合同明细信息
                    ContractDetail detail = new ContractDetail();
                    detail.setProdUnit(vo.getProdUnit());
                    detail.setId(vo.getContDetailId());
                    detail.setQuantity(vo.getQuantity());
                    detail.setSpecification(vo.getSpecification());
                    detail.setProdCode(vo.getProdCode());
                    detail.setUpdateTime(curernt);
                    contractDetailMapper.update(detail);
                }
            }
        } else {
            SemiProduct semiProduct = DictUtils.getSemiProductById(vo.getProdId());
            if (semiProduct.getCode().equals(vo.getProdCode()) && semiProduct.getSpecification().equals(vo.getProdCode())) {
                //修改产品组成信息
                Long productId = vo.getParentId();
                Product pdDb = DictUtils.getProductById(productId);
                if (pdDb != null) {
                    //标准产品不能修改组成成分
                    return -2;
                } else {
                    pdDb = productService.get(String.valueOf(productId));
                    if (pdDb != null) {
                        String semiProdCons = pdDb.getSemiProdCons();

                    } else {
                        //修改半产品信息在库中不存在
                        return -3;
                    }

                }


            }
        }
        return 0;
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int delteProductDesinInfo(ProductDesinOperVo vo) {
        if (vo.getProdType().equals('1')) {
            return contractDetailMapper.deleteById(vo.getContDetailId());

        } else {
            Product product = DictUtils.getProductById(vo.getParentId());
            if (product != null) {
                return -1;
            }

            Date current = new Date();
            product = productService.get(String.valueOf(vo.getProdId()));
            if (product != null) {
                String semiProdCons = product.getSemiProdCons();
                List<ProductForm> formList = JSONObject.parseArray(semiProdCons, ProductForm.class);
                ProductForm delFrom = null;
                if (formList != null && !formList.isEmpty()) {
                    for (ProductForm form : formList) {
                        if (form.getId().equals(vo.getProdId())) {
                            delFrom = form;
                            break;
                        }
                    }
                }
                if (delFrom != null) {
                    formList.remove(delFrom);
                }

                String semiPros = JSONArray.parseArray(JSON.toJSONString(formList)).toJSONString();
                Product po = new Product();
                po.setId(vo.getParentId());
                po.setSemiProdCons(semiPros);
                po.setUpdateTime(current);
                return productService.update(po);
            }


        }
        return 0;
    }

    /**
     * @Description: 构建合同明细
     * @Param: [vo, prodId, current]
     * @return: com.hh.ssm.entity.ContractDetail
     * @Author: lijinku
     * @Iteration : 1.0
     * @Date: 2019/5/29 5:31 PM
     */
    private ContractDetail buildContractDetail(ProductDesinOperVo vo, Long prodId, Date current) {
        ContractDetail detail = new ContractDetail();
        detail.setContId(vo.getContId());
        detail.setProdName(vo.getProdName());
        detail.setProdType(vo.getProdType());
        detail.setProdId(prodId);
        detail.setProdCode(vo.getProdCode());
        detail.setSpecification(vo.getSpecification());
        detail.setProdUnit(vo.getProdUnit());
        detail.setQuantity(vo.getQuantity());
        detail.setRemark(vo.getRemark());
        detail.setCreateTime(current);
        detail.setUpdateTime(current);
        return detail;
    }

    /**
     * @Description: 合同明细转产品设计Vo
     * @Param: [cd]
     * @return: com.hh.ssm.domain.vo.ProductDesinVo
     * @Author: lijinku
     * @Iteration : 1.0
     * @Date: 2019/5/29 9:31 AM
     */
    private ProductDesinVo buildProductDesinVoFromContDetail(ContractDetail cd) {
        ProductDesinVo pdVo = new ProductDesinVo();
        pdVo.setContDetailId(cd.getId());
        pdVo.setContId(cd.getContId());
        pdVo.setProdCode(cd.getProdCode());
        pdVo.setProdName(cd.getProdName());
        pdVo.setProdType(cd.getProdType());
        pdVo.setProdUnit(cd.getProdUnit());
        pdVo.setQuantity(cd.getQuantity());
        pdVo.setRemark(cd.getRemark());
        pdVo.setProdId(cd.getProdId());
        pdVo.setSpecification(cd.getSpecification());
        pdVo.setParentId(0L);
        return pdVo;
    }

    /**
     * @Description: 合同Vo转Po
     * @Param: [cd, current]
     * @return: com.hh.ssm.entity.ContractDetail
     * @Author: lijinku
     * @Iteration : 1.0
     * @Date: 2019/5/27 9:01 PM
     */
    private ContractDetail buildContractDetailFromVo(ContractDetailVo cd, Date current) {
        ContractDetail po = new ContractDetail();
        po.setId(cd.getContDetailId());
        po.setContId(cd.getContId());
        po.setQuantity(cd.getQuantity());
        po.setProdUnit(cd.getProdUnit());
        po.setRemark(cd.getRemark());
        po.setSpecification(cd.getSpecification());
        po.setProdCode(cd.getProdCode());
        po.setProdId(cd.getProdId());
        po.setProdName(cd.getProdName());
        po.setProdType(cd.getProdType());
        po.setUpdateTime(current);
        po.setCreateTime(current);
        return po;
    }

}
