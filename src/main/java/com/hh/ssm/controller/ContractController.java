package com.hh.ssm.controller;

import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.*;
import com.hh.ssm.entity.Contract;
import com.hh.ssm.entity.ContractDetail;
import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.ProductPlanInfo;
import com.hh.ssm.service.IContractService;
import com.hh.ssm.service.IProductPlanInfoService;
import com.hh.ssm.service.IProductService;
import com.hh.ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@Controller
@RequestMapping(value = "/contract")
public class ContractController {
    @Autowired
    private IContractService contractService;

    @Autowired
    private IProductService productService;

    @Autowired
    private IProductPlanInfoService productPlanInfoService;


    @RequestMapping("/find")
    public String find() throws Exception {
        return "contract/contract_list";
    }


    @RequestMapping("/add")
    public String add() throws Exception {
        return "contract/contract_add";
    }

    @RequestMapping("/edit")
    public String edit() throws Exception {
        return "contract/contract_edit";
    }

    @RequestMapping("/search")
    public String search() throws Exception {
        return "contract/contract_search";
    }

    @RequestMapping("/productDesignList")
    public String prodPlanEdit() throws Exception {
        return "contract/productDesign_list";
    }

    @RequestMapping("/productEditorDesign")
    public String productEditorDesign() throws Exception {
        return "contract/productDesign_editor";
    }

    @RequestMapping("/productDesign")
    public String prodPDesinEdit() throws Exception {
        return "contract/product_design";
    }


    @RequestMapping("/product")
    @ResponseBody
    public List<ProductVO> getProdList() throws Exception {
        Product product = new Product();
        product.setCategory('0');
        List<Product> prods = productService.getList(product);
        List<ProductVO> list = null;
        if (prods != null && !prods.isEmpty()) {
            list = new ArrayList<ProductVO>(prods.size());
            for (Product pt : prods) {
                ProductVO vo = new ProductVO();
                vo.setId(pt.getId());
                vo.setName(pt.getName());
                vo.setCode(pt.getCode());
                vo.setSpecification(pt.getSpecification());
                vo.setProdType('1');
                list.add(vo);
            }
        }


        return list;
    }

    @RequestMapping("/prodPracticaInfo")
    @ResponseBody
    public List<ProductDesinVo> getProdPracticaInfolListByConId(@RequestParam String contId) throws Exception {

        return contractService.getProdPracticaInfolListByConId(contId);
    }


    @RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public Contract getItemById(@RequestParam String code) throws Exception {
        Contract contract = contractService.findByConCode(code);
        //转换vo
        return contract;
    }

    @RequestMapping(value = "/validContract")
    @ResponseBody
    public List<ContractVo> getValidItems(@Valid Character status) throws Exception {
        ContractVo contract = new ContractVo();
        contract.setStatus(status);
        return contractService.findList(contract);
    }


    @RequestMapping(value = "/gotoProdInfo", method = RequestMethod.GET)
    @ResponseBody
    public List<ProductPlanInfo> gotoProdInfo(@RequestParam String code) {
        return productPlanInfoService.findProductPlanInfosByConId(code);
    }

    @RequestMapping(value = "/contractdetails", method = RequestMethod.GET)
    @ResponseBody
    public EUDataGridResult listContractDetailById(Integer page, Integer rows, String contId) throws Exception {
        EUDataGridResult result = contractService.listContractDetailById(page, rows, contId);
        return result;
    }

    @RequestMapping(value = "/contractdetail", method = RequestMethod.GET)
    @ResponseBody
    public List<ContractDetailVo> getContractDetailById(@RequestParam String code) throws Exception {
        List<ContractDetail> details = contractService.getDetailByConId(code);
        if (details != null && !details.isEmpty()) {
            List<ContractDetailVo> list = new ArrayList<ContractDetailVo>(details.size());
            for (ContractDetail cd : details) {
                ContractDetailVo vo = new ContractDetailVo();
                vo.setContDetailId(cd.getId());
                vo.setProdId(cd.getProdId());
                vo.setProdCode(cd.getProdCode());
                vo.setProdName(cd.getProdName());
                vo.setProdType(cd.getProdType());
                vo.setSpecification(cd.getSpecification());
                vo.setQuantity(cd.getQuantity());
                vo.setUnQuantity(cd.getUnQuantity());
                vo.setProdUnit(cd.getProdUnit());
                vo.setRemark(cd.getRemark());
                vo.setProdType(cd.getProdType());
                list.add(vo);
            }

            return list;
        }
        //转换vo
        return null;
    }


    @RequestMapping("/get_data")
    @ResponseBody
    public List<ContractVo> getData() throws Exception {
        return contractService.findAllList();
    }

    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getList(Integer page, Integer rows, ContractVo contract) throws Exception {
        EUDataGridResult result = contractService.getList(page, rows, contract);
        return result;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public CustomResult insert(@RequestBody ContractVo vo) throws Exception {
        if (contractService.findByConCode(vo.getContCode()) != null) {
            return new CustomResult(0, "该合同编号已经存在，请更换合同编号！", null);
        } else {
            int res = contractService.insert(vo);
            return ResultUtil.dealResult(res, 101, "新增合同信息失败");

        }
    }


    @RequestMapping(value = "/updateContDetail")
    @ResponseBody
    public CustomResult updateContDetail(@RequestBody List<ContractDetailVo> contDetaiList) throws Exception {
        int rs = contractService.updateDetail(contDetaiList);
        return ResultUtil.dealResult(rs, 101, "更新合同信息失败");
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public CustomResult update(@RequestBody ContractVo contract) throws Exception {
        int rs = contractService.update(contract);
        return ResultUtil.dealResult(rs, 101, "更新合同信息失败");
    }


    @RequestMapping(value = "/delete")
    @ResponseBody
    public CustomResult delete(String id) throws Exception {
        int rs = contractService.delete(id);

        return ResultUtil.dealResult(rs, 101, "删除合同信息失败");
    }

    @RequestMapping(value = "/delete_batch")
    @ResponseBody
    public CustomResult deleteBatch(String[] ids) throws Exception {
        int rs = contractService.deleteBatch(Arrays.asList(ids));

        return ResultUtil.dealResult(rs, 101, "批量删除合同信息失败");
    }


    @RequestMapping(value = "/saveProDesin", method = RequestMethod.POST)
    @ResponseBody
    public CustomResult saveProDesinInfo(@RequestBody ProductDesinOperVo vo) throws Exception {
        int res = contractService.saveProductDesinInfo(vo);
        if (res == -1) {
            return ResultUtil.dealResult(res, 101, "产品规格修改了，产品编号也要更改");
        } else if (res == -2) {
            return ResultUtil.dealResult(res, 101, "非标准产品，则需要添加半成品组成");
        } else {
            return ResultUtil.dealResult(res, 101, "产品设计失败");
        }
    }

    @RequestMapping(value = "/updateProDesin", method = RequestMethod.POST)
    @ResponseBody
    public CustomResult updateProductDesinInfo(@RequestBody ProductDesinOperVo vo) throws Exception {
        int res = contractService.updateProductDesinInfo(vo);
        if (res == -1) {
            return ResultUtil.dealResult(res, 101, "合同Id和产品Id不存在");
        } else if (res == -2) {
            return ResultUtil.dealResult(res, 101, "标准产品不能修改组成成分");
        } else if (res == -3) {
            return ResultUtil.dealResult(res, 101, "修改半产品信息在库中不存在");

        } else {
            return ResultUtil.dealResult(res, 101, "更新产品计划失败");
        }
    }

    @RequestMapping(value = "/deleteProDesin", method = RequestMethod.POST)
    @ResponseBody
    public CustomResult deleteProductDesinInfo(@RequestBody ProductDesinOperVo vo) {
        int res = contractService.delteProductDesinInfo(vo);

        if (res == -1) {
            return ResultUtil.dealResult(res, 101, "标准产品组成不可修改");
        } else {

            return ResultUtil.dealResult(res, 101, "更新产品计划失败");
        }
    }


}
