package com.hh.ssm.controller;

import com.hh.ssm.domain.customize.ActiveUser;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

import static com.hh.ssm.common.Constants.ACTIVE_USER;

@Controller
@RequestMapping("")
public class PadManageController {

    @RequestMapping("/pad/padIndex")
    public String padIndex(HttpSession session, Model model) throws Exception{

        Subject subject = SecurityUtils.getSubject();
        ActiveUser activeUser = (ActiveUser)subject.getPrincipal();
        if(activeUser == null || StringUtils.isEmpty(activeUser.getUsername())){
            return "/padLogin";
        }
        model.addAttribute(ACTIVE_USER, activeUser);
        return "/pad/padIndex";
    }


    @RequestMapping("/pad/padProd")
    public String padProd(){
        return "/pad/padProd";
    }

    @RequestMapping("/pad/padProdMate")
    public String padProdMate(){
        return "/pad/padProdMate";
    }

    @RequestMapping("test")
    public String test(){
        return "/pad/TEST";
    }
}
