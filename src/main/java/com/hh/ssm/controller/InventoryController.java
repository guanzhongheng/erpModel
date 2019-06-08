package com.hh.ssm.controller;

import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.*;
import com.hh.ssm.entity.RawOutInfo;
import com.hh.ssm.service.IInventoryService;
import com.hh.ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@Controller
@RequestMapping(value = "/inventory")
public class InventoryController {
    @Autowired
    private IInventoryService inventoryService;


    @RequestMapping("/find")
    public String find() throws Exception {
        return "inventory/inventory_list";
    }


    @RequestMapping("/add")
    public String add() throws Exception {
        return "inventory/inventory_in";
    }

    @RequestMapping("/edit")
    public String edit() throws Exception {
        return "inventory/inventory_edit";
    }

    @RequestMapping("/out")
    public String out() throws Exception {
        return "inventory/inventory_out_list";
    }


    @RequestMapping(value = "/updateBatch")
    @ResponseBody
    private CustomResult updateBatch(@RequestBody List<InventoryVo> invList) throws Exception {
        int rs = inventoryService.updateBatch(invList);
        return ResultUtil.dealResult(rs, 101, "更新库存信息失败");
    }

    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getListByExsist(Integer page, Integer rows, InventoryOperVo vo) throws Exception {
        if (vo == null) {
            vo = new InventoryOperVo();
        }
        vo.setFlg(1);
        EUDataGridResult result = inventoryService.getList(page, rows, vo);
        return result;
    }

    @RequestMapping("/listAll")
    @ResponseBody
    public EUDataGridResult getList(Integer page, Integer rows, InventoryOperVo vo) throws Exception {
        EUDataGridResult result = inventoryService.getList(page, rows, vo);
        return result;
    }


    @RequestMapping("rawmater/find")
    public String rawmaterFind() throws Exception {
        return "inventory/rawMaterial_list";
    }

    @RequestMapping("rawmater/edit")
    public String rawmaterEdit() throws Exception {
        return "inventory/rawMaterial_edit";
    }

    @RequestMapping("rawmater/out")
    public String rawmaterOut() throws Exception {
        return "inventory/rawMaterial_out";
    }

    @RequestMapping("rawmater/add")
    public String rawmaterAdd() throws Exception {
        return "inventory/rawMaterial_in";
    }

    @RequestMapping("rawmater/set")
    public String rawmaterSet() throws Exception {
        return "inventory/rawMaterial_threadhold";
    }

    @RequestMapping("rawmater/checkout")
    public String rawmaterCheckout() throws Exception {
        return "inventory/rawMaterial_checkout_list";
    }


    @RequestMapping("rawmater/checkoutlist")
    @ResponseBody
    public EUDataGridResult getList(Integer page, Integer rows, RawOutInfo vo) throws Exception {
        if (vo == null) {
            vo = new RawOutInfo();
        }
        vo.setStatus('0');
        EUDataGridResult result = inventoryService.getRawMaterCheckoutList(page, rows, vo);
        return result;
    }

    @RequestMapping("rawmater/checkoutDetail")
    public String rawmaterCheckoutDetail() throws Exception {
        return "inventory/rawMaterial_checkout_detail";
    }


    @RequestMapping(value = "rawmater/doCheckoutDetail", method = RequestMethod.GET)
    @ResponseBody
    public List<RawmaterCheckoutDetailVo> rawmaterDoCheckoutDetailByRawCode(@RequestParam String code) throws Exception {
        List<RawmaterCheckoutDetailVo> list = inventoryService.findByRawOutCode(code);
        return list;
    }


    @RequestMapping(value = "rawmater/doConfirmCheckout")
    @ResponseBody
    public CustomResult doConfirmRawMaterCheckout(@RequestBody List<RawmaterCheckoutDetailVo> ckLst) throws Exception {
        int rs = inventoryService.confirmRawMaterCheckout(ckLst);
        if (rs == -1) {
            return ResultUtil.dealResult(rs, 101, "出库数必须大于等于0");
        }else if(rs==-2){
            return ResultUtil.dealResult(rs, 101, "出库数大于库存数量");
        }
        return ResultUtil.dealResult(rs, 101, "出库失败");
    }

    @RequestMapping(value = "doConfirmCheckout")
    @ResponseBody
    public CustomResult doConfirmProductCheckout(@RequestBody List<DeliveryListDetailVO> dlvList) throws Exception {
        int rs = inventoryService.confirmProductCheckout(dlvList);
        if (rs == -1) {
            return ResultUtil.dealResult(rs, 101, "出库数必须大于等于0");
        }else if(rs==-2){
            return ResultUtil.dealResult(rs, 101, "出库数大于库存数量");
        }
        return ResultUtil.dealResult(rs, 101, "出库失败");
    }


    @RequestMapping(value = "/update")
    @ResponseBody
    private CustomResult update(@RequestBody InventoryVo vo) throws Exception {
        int rs = inventoryService.update(vo);
        return ResultUtil.dealResult(rs, 101, "更新产品库存信息失败");
    }

    @RequestMapping(value = "rawmater/update")
    @ResponseBody
    private CustomResult rawmaterUpdate(@RequestBody RawMaterialVO vo) throws Exception {
        int rs = inventoryService.updateRawMaterial(vo);
        return ResultUtil.dealResult(rs, 101, "更新产品库存信息失败");
    }


    @RequestMapping(value = "rawmater/insert")
    @ResponseBody
    private CustomResult rawmaterInsert(@RequestBody RawMaterialVO vo) throws Exception {
        int rs = inventoryService.insertRawmater(vo);
        return ResultUtil.dealResult(rs, 101, "添加原材料失败");
    }


    @RequestMapping(value = "rawmater/updateThreadholdByBatch")
    @ResponseBody
    private CustomResult updateThreadholdByBatch(@RequestBody List<RawMaterialVO> voList) throws Exception {
        int rs = inventoryService.updateThreadholdByBatch(voList);
        return ResultUtil.dealResult(rs, 101, "更新合同信息失败");
    }


    @RequestMapping("rawmater/list")
    @ResponseBody
    public EUDataGridResult getList(Integer page, Integer rows, RawMaterialVO vo) throws Exception {
        if (vo == null) {
            vo = new RawMaterialVO();
        }
        vo.setFlg(1);
        EUDataGridResult result = inventoryService.getRawMaterList(page, rows, vo);
        return result;
    }


    @RequestMapping("rawmater/listAll")
    @ResponseBody
    public EUDataGridResult getListAll(Integer page, Integer rows, RawMaterialVO vo) throws Exception {
        EUDataGridResult result = inventoryService.getRawMaterList(page, rows, vo);
        return result;
    }

    @RequestMapping("checkoutDetail")
    public String prodCheckoutDetail() throws Exception {
        return "inventory/inventory_out_detail";
    }
}
