package com.hh.ssm.controller;

import com.github.pagehelper.PageInfo;
import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.DeliveryListDetailVO;
import com.hh.ssm.domain.vo.DeliveryListVO;
import com.hh.ssm.domain.vo.RawmaterCheckoutDetailVo;
import com.hh.ssm.service.IDeliveryListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Author  chh
 * Date  2019-05-27
 * 出库操作
 */
@Controller
@RequestMapping(value = "/deliveryList")
public class DeliveryListController {
    @Autowired
    private IDeliveryListService deliveryListService;

    @RequestMapping("/find")
    public String find() throws Exception {
        return "inventory/delivery_list";
    }

    @RequestMapping("/add")
    public String add() throws Exception{
        return "inventory/delivery_add";
    }

    @RequestMapping("/search")
    public String search() throws Exception{
        return "inventory/delivery_detail_search";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public CustomResult insert(@RequestBody DeliveryListVO vo) throws Exception {
        if(deliveryListService.get(vo.getDeliveryCode()) != null) {
            return new CustomResult(0, "该出库单号已经存在，请更换出库单号！", null);
        }else{
            return deliveryListService.insert(vo);
        }
    }

    @RequestMapping("/listUnDeal")
    @ResponseBody
    public EUDataGridResult getListUnDeal(DeliveryListVO vo) {
        if(vo==null){
            vo=new DeliveryListVO();
        }
        vo.setStatus('0');
        return deliveryListService.findListBySelect(vo.getPage(), vo.getRows(), vo);
    }

    @RequestMapping(value = "/doCheckoutDetail", method = RequestMethod.GET)
    @ResponseBody
    public List<DeliveryListDetailVO> prodDoCheckoutDetailById(@RequestParam Long id) throws Exception {
        List<DeliveryListDetailVO> list = deliveryListService.selectByDetailByDeliveryListId(id);
        return list;
    }

    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getList(DeliveryListVO vo) {
        return deliveryListService.getList(vo.getPage(), vo.getRows(), vo);
    }

    @RequestMapping("/{id}/detail")
    @ResponseBody
    public EUDataGridResult getDetailsById(@PathVariable String id) throws Exception {
        EUDataGridResult result = new EUDataGridResult();
        List<DeliveryListDetailVO> vos = deliveryListService.getDetailsById(id);
        result.setRows(vos);
        //取记录总条数
        PageInfo<DeliveryListDetailVO> pageInfo = new PageInfo<>(vos);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

}
