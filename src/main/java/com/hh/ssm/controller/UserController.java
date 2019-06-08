package com.hh.ssm.controller;

import com.hh.ssm.domain.authority.SysUser;
import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;


    @RequestMapping("/find")
    public String find() throws Exception{
        return "user_list";
    }

    @RequestMapping("/role")
    public String userRole() throws Exception{
        return "user_role_edit";
    }

    @RequestMapping("/add")
    public String add() throws Exception{
        return "user_add";
    }

    @RequestMapping("/edit")
    public String edit() throws Exception{
        return "user_edit";
    }

    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getList(SysUser page) throws Exception{
        EUDataGridResult result = userService.getList(page.getPage(), page.getRows(), page);
        return result;
    }

    @RequestMapping("/search")
    @ResponseBody
    public List<SysUser> search(SysUser user) throws Exception{
        List<SysUser> list = userService.getList(user);
        return list;
    }

    @RequestMapping(value="/insert", method= RequestMethod.POST)
    @ResponseBody
    private CustomResult insert(@Valid SysUser user, BindingResult bindingResult) throws Exception {
        CustomResult result;
        if(bindingResult.hasErrors()){
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        if(userService.findByUserNameAndId(user.getUsername(), user.getId()).size()>0){
            return CustomResult.build(101, "该用户名已经存在，请更换用户名!");
        }else if(userService.get(user.getId()) != null){
            return CustomResult.build(101, "该用户编号已经存在，请更换用户编号！");
        }
        result = userService.insert(user);
        return result;
    }

    @RequestMapping(value="/update")
    @ResponseBody
    private CustomResult update(@Valid SysUser user, BindingResult bindingResult) throws Exception {
        if(bindingResult.hasErrors()){
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
        return userService.update(user);
    }


    @RequestMapping(value="/update_all")
    @ResponseBody
    private CustomResult updateAll(@Valid SysUser user, BindingResult bindingResult) throws Exception {
        CustomResult result;
        if(bindingResult.hasErrors()){
            FieldError fieldError = bindingResult.getFieldError();
            return CustomResult.build(100, fieldError.getDefaultMessage());
        }
//        if(userService.findByUserNameAndId(user.getUsername(), user.getId()).size()>0){
//            return CustomResult.build(101, "该用户名已经存在，请更换用户名！");
//        }

        result = userService.updateAll(user);
        return result;
    }

    @RequestMapping(value="/delete")
    @ResponseBody
    private CustomResult delete(String id) throws Exception {
        CustomResult result = userService.delete(id);
        return result;
    }

    @RequestMapping(value="/delete_batch")
    @ResponseBody
    private CustomResult deleteBatch(String[] ids) throws Exception {
        CustomResult result = userService.deleteBatch(ids);
        return result;
    }
}
