package com.hh.ssm.controller;

import com.hh.ssm.entity.WarehourseDefective;
import com.hh.ssm.service.IWarehourseDefectiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@RestController
@RequestMapping(value = "/warehourseDefective")
public class WarehourseDefectiveController {
    @Autowired
    private IWarehourseDefectiveService warehourseDefectiveService;

    @RequestMapping(value = {"/list", ""}, method = RequestMethod.GET)
    public Object list() {
        List<WarehourseDefective> warehourseDefectives = warehourseDefectiveService.findAllList();
        return warehourseDefectives;
    }

    @RequestMapping(value = {"/get"}, method = RequestMethod.GET)
    public Object get(@RequestParam String id) {
        WarehourseDefective warehourseDefective = warehourseDefectiveService.get(id);
        return warehourseDefective;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestBody WarehourseDefective warehourseDefective) {
        if (warehourseDefectiveService.insert(warehourseDefective) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/insertBatch", method = RequestMethod.POST)
    public String insertBatch(@RequestBody List<WarehourseDefective> warehourseDefectives) {
        if (warehourseDefectiveService.insertBatch(warehourseDefectives) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestBody WarehourseDefective warehourseDefective) {
        if (warehourseDefectiveService.update(warehourseDefective) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestBody WarehourseDefective warehourseDefective) {
        if (warehourseDefectiveService.delete(warehourseDefective) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

}
