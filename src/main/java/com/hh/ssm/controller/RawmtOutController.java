package com.hh.ssm.controller;

import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.entity.RawOutInfo;
import com.hh.ssm.service.IRawmtOutService;
import com.hh.ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Author ljk
 * Date  2019-05-17
 */
@Controller
@RequestMapping(value = "/rawmtout")
public class RawmtOutController {
    @Autowired
    private IRawmtOutService rawmtOutService;

    @RequestMapping("/insert")
    @ResponseBody
    public CustomResult insert(@RequestBody RawOutInfo info) {
        int rs = rawmtOutService.out(info);
        return ResultUtil.dealResult(rs, 101, "原材料出库申请失败！");
    }


}
