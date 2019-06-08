package com.hh.ssm.controller;

import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.ContractVo;
import com.hh.ssm.entity.Contract;
import com.hh.ssm.entity.ContractDetail;
import com.hh.ssm.service.IContractDetailService;
import com.hh.ssm.service.IContractService;
import com.hh.ssm.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Author chh
 * Date 2019-05-25
 * 任务分配
 */
@Controller
@RequestMapping("/taskasgn")
public class TaskAssignmentController {

    @Autowired
    private IContractService contractService;
    @Autowired
    private IContractDetailService contractDetailService;

    @RequestMapping("/find")
    public String find() throws Exception {
        return "task/task_asgn_list";
    }
    @RequestMapping("/edit")
    public String edit() throws Exception {
        return "task/task_asgn_edit";
    }
    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getList(Integer page, Integer rows, ContractVo contract) throws Exception {
        //查询待分配的合同
        contract.setStatus('1');
        EUDataGridResult result = contractService.getList(page, rows, contract);
        return result;
    }

    @RequestMapping("/update")
    @ResponseBody
    public CustomResult getList(@RequestBody ContractVo contract, BindingResult bindingResult) throws Exception {
        List<ContractDetail> list = new ArrayList<>();
        List<Map<String,Object>> prodList = contract.getProdList();
        if(!prodList.isEmpty()) {
            for(int i = 0, length = prodList.size(); i < length; i++) {
                Map<String,Object> map = prodList.get(i);
                ContractDetail contractDetail = new ContractDetail();
                contractDetail.setContId(contract.getContId());
                contractDetail.setProdCode((String) map.get("code"));
                contractDetail.setSpecification((String) map.get("specification"));
                contractDetail.setProdManager((String) map.get("username"));
                list.add(contractDetail);
            }
        }
        if (bindingResult.hasErrors()) {
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        int rs = contractDetailService.updateBatch(list);
        return ResultUtil.dealResult(rs, 101, "合同任务分配失败");
    }

}
