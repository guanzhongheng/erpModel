package com.hh.ssm.controller;

import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.DeliveryListVO;
import com.hh.ssm.domain.vo.RawMaterialVO;
import com.hh.ssm.entity.RawMaterial;
import com.hh.ssm.entity.RawOutInfo;
import com.hh.ssm.service.IRawMaterialService;
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
@RequestMapping(value = "/rawmaterial")
public class RawMaterialController {
    @Autowired
    private IRawMaterialService rawMaterialService;

    @RequestMapping(value = "/get")
    @ResponseBody
    public List<RawMaterialVO> findList() throws Exception {
        //转换vo
        List<RawMaterial> rawMaterials = rawMaterialService.findAllList();
        List<RawMaterialVO> list = null;
        if(rawMaterials!=null && !rawMaterials.isEmpty()){
          list = new ArrayList<>(rawMaterials.size());
            for (RawMaterial rawMaterial:
                    rawMaterials  ) {
                RawMaterialVO rawMaterialVO = new RawMaterialVO();
                rawMaterialVO.setId(rawMaterial.getId());
                rawMaterialVO.setName(rawMaterial.getName());
                rawMaterialVO.setSupplier(rawMaterial.getSupplier());
                rawMaterialVO.setCode(rawMaterial.getCode());
                list.add(rawMaterialVO);

            }
        }
        return list;
    }

    @RequestMapping("/find")
    public String find() throws Exception {
        return "dictionary/raw_material_list";
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public List<RawMaterial> getData() throws Exception {
        return rawMaterialService.findAllList();
    }

    @RequestMapping("/add")
    public String add() throws Exception {
        return "dictionary/raw_material_add";
    }

    @RequestMapping("/edit")
    public String edit() throws Exception {
        return "dictionary/raw_material_edit";
    }

    @RequestMapping("/search")
    public String search() throws Exception {
        return "dictionary/raw_material_search";
    }

    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getList(RawMaterialVO vo) throws Exception {
        RawMaterial rawMaterial = new RawMaterial();
        BeanUtils.copyProperties(vo, rawMaterial);
        EUDataGridResult result = rawMaterialService.getList(vo.getPage(), vo.getRows(), rawMaterial);
        return result;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public CustomResult insert(@RequestBody RawMaterialVO vo, BindingResult bindingResult) throws Exception {
        RawMaterial rawMaterial = new RawMaterial();
        BeanUtils.copyProperties(vo, rawMaterial);
        rawMaterial.setCreateTime(new Date(System.currentTimeMillis()));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        rawMaterial.setCode(Const.RAW_MT_PREFIX + sdf.format(new Date()));
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        int res = rawMaterialService.insert(rawMaterial);
        return ResultUtil.dealResult(res, 101, "新增产品信息失败");
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public CustomResult update(@RequestBody RawMaterialVO vo, BindingResult bindingResult) throws Exception {
        RawMaterial rawMaterial = new RawMaterial();
        BeanUtils.copyProperties(vo, rawMaterial);
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        RawMaterial rm = rawMaterialService.get(rawMaterial.getId()+"");
        int rs;
        if(!rm.getName().equals(rawMaterial.getName()) || !rm.getSupplier().equals(rawMaterial.getSupplier())) {
            rawMaterial.setCreateTime(new Date(System.currentTimeMillis()));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
            rawMaterial.setCode(Const.RAW_MT_PREFIX + sdf.format(new Date()));
            rs = rawMaterialService.insert(rawMaterial);
            return ResultUtil.dealResult(rs, 101, "新增原材料信息失败");
        }else{
            rawMaterial.setUpdateTime(new Date(System.currentTimeMillis()));
            rs = rawMaterialService.update(rawMaterial);
            return ResultUtil.dealResult(rs, 101, "更新原材料信息失败");
        }
    }

    @RequestMapping(value = "/update_all")
    @ResponseBody
    public CustomResult updateAll(@Valid RawMaterial rawMaterial, BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        int rs = rawMaterialService.updateAll(rawMaterial);

        return ResultUtil.dealResult(rs, 101, "批量更新产品信息失败");
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public CustomResult delete(String id) throws Exception {
        int rs = rawMaterialService.delete(id);

        return ResultUtil.dealResult(rs, 101, "删除产品信息失败");
    }

    @RequestMapping(value = "/delete_batch")
    @ResponseBody
    private CustomResult deleteBatch(String[] ids) throws Exception {
        int rs = rawMaterialService.deleteBatch(Arrays.asList(ids));
        return ResultUtil.dealResult(rs, 101, "批量删除产品信息失败");
    }

}
