package com.hh.ssm.controller;

import com.hh.ssm.entity.ProdRecord;
import com.hh.ssm.service.IProdRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@RestController
@RequestMapping(value = "/prodRecord")
public class ProdRecordController {
    @Autowired
    private IProdRecordService prodRecordService;

    @RequestMapping(value = {"/list", ""}, method = RequestMethod.GET)
    public Object list() {
        List<ProdRecord> prodRecords = prodRecordService.findAllList();
        return prodRecords;
    }

    @RequestMapping(value = {"/get"}, method = RequestMethod.GET)
    public Object get(@RequestParam String id) {
        ProdRecord prodRecord = prodRecordService.get(id);
        return prodRecord;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestBody ProdRecord prodRecord) {
        if (prodRecordService.insert(prodRecord) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/insertBatch", method = RequestMethod.POST)
    public String insertBatch(@RequestBody List<ProdRecord> prodRecords) {
        if (prodRecordService.insertBatch(prodRecords) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestBody ProdRecord prodRecord) {
        if (prodRecordService.update(prodRecord) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestBody ProdRecord prodRecord) {
        if (prodRecordService.delete(prodRecord) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

}
