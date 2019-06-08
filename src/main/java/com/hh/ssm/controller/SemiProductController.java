package com.hh.ssm.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.ProductVO;
import com.hh.ssm.domain.vo.RawMaterialVO;
import com.hh.ssm.domain.vo.SemiProductVO;
import com.hh.ssm.entity.RawMaterial;
import com.hh.ssm.entity.SemiProduct;
import com.hh.ssm.service.IRawMaterialService;
import com.hh.ssm.service.ISemiProductService;
import com.hh.ssm.util.Const;
import com.hh.ssm.util.ResultUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@Controller
@RequestMapping(value = "/semiproduct")
public class SemiProductController {
    @Autowired
    private ISemiProductService semiProductService;
    @Autowired
    private IRawMaterialService rawMaterialService;

    @RequestMapping("/get/{code}")
    @ResponseBody
    public SemiProductVO getItemById(@PathVariable String id) throws Exception {
        SemiProduct semiSemiProduct = semiProductService.get(id);
        SemiProductVO SemiProductVO = new SemiProductVO();
        //转换vo
        return SemiProductVO;
    }

    @RequestMapping("/find")
    public String find() throws Exception {
        return "dictionary/semi_product_list";
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public List<SemiProduct> getData() throws Exception {
        return semiProductService.findAllList();
    }

    @RequestMapping("/add")
    public String add() throws Exception {
        return "dictionary/semi_product_add";
    }

    @RequestMapping("/edit")
    public String edit() throws Exception {
        return "dictionary/semi_product_edit";
    }

    @RequestMapping("/search")
    public String search() throws Exception {
        return "dictionary/semi_product_search";
    }

    @RequestMapping("/{id}/rawmaterial")
    @ResponseBody
    public EUDataGridResult getRawMaterialBySemiProdId(@PathVariable String id) {
        List<RawMaterialVO> list = semiProductService.getRawMaterialBySemiProdId(id);
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<RawMaterialVO> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @RequestMapping("/rawmaterial")
    @ResponseBody
    public List<RawMaterialVO> getRawMaterialList() {
        List<RawMaterialVO> vos = new ArrayList<>();
        List<RawMaterial> list = rawMaterialService.findAllList();
        if(!list.isEmpty()) {
            for(RawMaterial rawMaterial : list) {
                RawMaterialVO vo = new RawMaterialVO();
                vo.setId(rawMaterial.getId());
                vo.setCode(rawMaterial.getCode());
                vo.setName(rawMaterial.getName());
                vo.setSupplier(rawMaterial.getSupplier());
                vos.add(vo);
            }
        }
        return vos;
    }

    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getList(SemiProductVO vo) throws Exception {
        SemiProduct semiProduct = new SemiProduct();
        BeanUtils.copyProperties(vo, semiProduct);
        EUDataGridResult result = semiProductService.getList(vo.getPage(), vo.getRows(), semiProduct);
        return result;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    private CustomResult insert(@RequestBody SemiProductVO vo, BindingResult bindingResult) throws Exception {
        SemiProduct semiProduct = new SemiProduct();
        BeanUtils.copyProperties(vo, semiProduct);
        semiProduct.setCreateTime(new Date(System.currentTimeMillis()));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        semiProduct.setCode(Const.SEMI_PROD_PREFIX + sdf.format(new Date()));
        List<RawMaterialVO> rawMaterialList = vo.getRawMaterialList();
        if(!rawMaterialList.isEmpty()) {
            JSONArray array = new JSONArray();
            for(RawMaterialVO rawMaterial : rawMaterialList) {
                JSONObject object = new JSONObject();
                object.put("id", rawMaterial.getId());
                object.put("quantity", rawMaterial.getQuantity());
                object.put("unit", rawMaterial.getUnit());
                array.add(object);
            }
            semiProduct.setRawMaterialCons(array.toString());
        }
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        int res = semiProductService.insert(semiProduct);
        return ResultUtil.dealResult(res, 101, "新增产品信息失败");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    private CustomResult update(@RequestBody SemiProductVO vo, BindingResult bindingResult) throws Exception {
        SemiProduct semiProduct = new SemiProduct();
        BeanUtils.copyProperties(vo, semiProduct);
        List<RawMaterialVO> rawMaterialList = vo.getRawMaterialList();
        if(!rawMaterialList.isEmpty()) {
            JSONArray array = new JSONArray();
            for(RawMaterialVO rawMaterial : rawMaterialList) {
                JSONObject object = new JSONObject();
                object.put("id", rawMaterial.getId());
                object.put("quantity", rawMaterial.getQuantity());
                object.put("unit", rawMaterial.getUnit());
                array.add(object);
            }
            semiProduct.setRawMaterialCons(array.toString());
        }
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        SemiProduct sprod = semiProductService.get(semiProduct.getId()+"");
        int res;
        if(!sprod.getName().equals(semiProduct.getName()) || !sprod.getSpecification().equals(semiProduct.getSpecification())) {
            semiProduct.setCreateTime(new Date(System.currentTimeMillis()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
            semiProduct.setCode(Const.SEMI_PROD_PREFIX + sdf.format(new Date()));
            res = semiProductService.insert(semiProduct);
            return ResultUtil.dealResult(res, 101, "新增半产品信息失败");
        }else{
            semiProduct.setUpdateTime(new Date(System.currentTimeMillis()));
            res = semiProductService.update(semiProduct);
            return ResultUtil.dealResult(res, 101, "更新半产品信息失败");
        }
    }

    @RequestMapping(value = "/update_all")
    @ResponseBody
    private CustomResult updateAll(@Valid SemiProduct SemiProduct, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        int rs = semiProductService.updateAll(SemiProduct);

        return ResultUtil.dealResult(rs, 101, "批量更新产品信息失败");
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    private CustomResult delete(String id) throws Exception {
        int rs = semiProductService.delete(id);

        return ResultUtil.dealResult(rs, 101, "删除产品信息失败");
    }

    @RequestMapping(value = "/delete_batch")
    @ResponseBody
    private CustomResult deleteBatch(String[] ids) throws Exception {
        int rs = semiProductService.deleteBatch(Arrays.asList(ids));
        return ResultUtil.dealResult(rs, 101, "批量删除产品信息失败");
    }

}
