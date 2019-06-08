package com.hh.ssm.controller;

import com.hh.ssm.entity.ContractDetail;
import com.hh.ssm.service.IContractDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@RestController
@RequestMapping(value = "/contractDetail")
public class ContractDetailController {
    @Autowired
    private IContractDetailService contractDetailService;

    @RequestMapping(value = {"/list", ""}, method = RequestMethod.GET)
    public Object list() {
        List<ContractDetail> contractDetails = contractDetailService.findAllList();
        return contractDetails;
    }

    @RequestMapping(value = {"/get"}, method = RequestMethod.GET)
    public Object get(@RequestParam String id) {
        ContractDetail contractDetail = contractDetailService.get(id);
        return contractDetail;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestBody ContractDetail contractDetail) {
        if (contractDetailService.insert(contractDetail) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/insertBatch", method = RequestMethod.POST)
    public String insertBatch(@RequestBody List<ContractDetail> contractDetails) {
        if (contractDetailService.insertBatch(contractDetails) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestBody ContractDetail contractDetail) {
        if (contractDetailService.update(contractDetail) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestBody ContractDetail contractDetail) {
        if (contractDetailService.delete(contractDetail) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

}
