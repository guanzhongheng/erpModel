package com.hh.ssm.controller;


import com.hh.ssm.domain.customize.ActiveUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import static com.hh.ssm.common.Constants.ACTIVE_USER;

@Controller
@RequestMapping("wx")
public class wxController {

    @RequestMapping("wxIndex")
    public String wxIndex(HttpSession session, Model model) throws Exception{
        Subject subject = SecurityUtils.getSubject();
        ActiveUser activeUser = (ActiveUser)subject.getPrincipal();
        model.addAttribute(ACTIVE_USER, activeUser);
        return "/wx/wxIndex";
    }
}
