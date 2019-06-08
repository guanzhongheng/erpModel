package com.hh.ssm.controller;

import com.hh.ssm.entity.WarehourseEntry;
import com.hh.ssm.service.IWarehourseEntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@RestController
@RequestMapping(value = "/warehourseEntry")
public class WarehourseEntryController {
    @Autowired
    private IWarehourseEntryService warehourseEntryService;

    @RequestMapping(value = {"/list", ""}, method = RequestMethod.GET)
    public Object list() {
        List<WarehourseEntry> warehourseEntrys = warehourseEntryService.findAllList();
        return warehourseEntrys;
    }

    @RequestMapping(value = {"/get"}, method = RequestMethod.GET)
    public Object get(@RequestParam String id) {
        WarehourseEntry warehourseEntry = warehourseEntryService.get(id);
        return warehourseEntry;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    public String insert(@RequestBody WarehourseEntry warehourseEntry) {
        if (warehourseEntryService.insert(warehourseEntry) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/insertBatch", method = RequestMethod.POST)
    public String insertBatch(@RequestBody List<WarehourseEntry> warehourseEntrys) {
        if (warehourseEntryService.insertBatch(warehourseEntrys) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestBody WarehourseEntry warehourseEntry) {
        if (warehourseEntryService.update(warehourseEntry) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(@RequestBody WarehourseEntry warehourseEntry) {
        if (warehourseEntryService.delete(warehourseEntry) > 0) {
            return "success";
        } else {
            return "failed";
        }
    }

}
