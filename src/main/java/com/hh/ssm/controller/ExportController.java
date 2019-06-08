package com.hh.ssm.controller;

import com.hh.ssm.domain.vo.DeliveryListDetailVO;
import com.hh.ssm.entity.ContractDetail;
import com.hh.ssm.service.IContractService;
import com.hh.ssm.service.IDeliveryListService;
import com.hh.ssm.util.DateUtil;
import com.hh.ssm.util.JxlsExcelView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Project : ffprSystem
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/28  2:45 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/28    create
 */
@Controller
public class ExportController {
    private static String TEMPLATE_PATH = "jxls/template/";
    @Autowired
    private IContractService contractService;
    @Autowired
    private IDeliveryListService deliveryListService;
    @RequestMapping(value = "/export/productDesin",method = RequestMethod.GET)
    public ModelAndView productDesinExport(HttpServletResponse response, @RequestParam("contId") String contId){
        Map<String, Object> result = new HashMap<String, Object>();
        List<ContractDetail> dailList = contractService.getDetailByConId(contId);
        result.put("contDetailList", dailList);
        return new ModelAndView(
                new JxlsExcelView(
                        TEMPLATE_PATH + "outInfo.xlsx",
                        "产品设计清单-"+ DateUtil.date2Str(new Date(),"yyyy-MM-dd")),
                result);
    }


    @RequestMapping(value = "/export/productOutInfo",method = RequestMethod.GET)
    public ModelAndView productOutInfoExport(HttpServletResponse response, @RequestParam Long id){
        Map<String, Object> result = new HashMap<String, Object>();
        List<DeliveryListDetailVO> list = deliveryListService.selectByDetailByDeliveryListId(id);
        result.put("dlvList", list);
        return new ModelAndView(
                new JxlsExcelView(
                        TEMPLATE_PATH + "productOutInfo.xlsx",
                        "产品出库清单-"+ DateUtil.date2Str(new Date(),"yyyy-MM-dd")),
                result);
    }
}