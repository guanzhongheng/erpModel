package com.hh.ssm.controller;

import com.hh.ssm.domain.authority.SysMenu;
import com.hh.ssm.domain.authority.SysPermission;
import com.hh.ssm.domain.customize.ActiveUser;
import com.hh.ssm.service.SysMenuService;
import com.hh.ssm.service.SysService;
import com.hh.ssm.util.CollectionsFactory;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

import static com.hh.ssm.common.Constants.ACTIVE_USER;
import static com.hh.ssm.common.Constants.ERROR_HAPPENS;


@Controller
public class FirstController {

	private static final Logger logger = LoggerFactory.getLogger(FirstController.class);

	@Autowired
	private SysService sysService;

	@Autowired
	private SysMenuService sysMenuService;

	//跳转登录
	@RequestMapping(value={"/","/first","/login"})
	public String first(Model model)throws Exception{
		return "login";
	}
	
	//首页
	@RequestMapping("/home")
	public String home(HttpSession session, Model model, HttpServletRequest request)throws Exception{
		
		Subject subject = SecurityUtils.getSubject();
		ActiveUser activeUser = (ActiveUser)subject.getPrincipal();
		
		List<SysPermission> permissionList = null;



		try {
			permissionList = sysService.findPermissionListByUserId(activeUser.getUserId());
		} catch (Exception e) {
			logger.error(ERROR_HAPPENS, e.getMessage());
		}

		List<SysMenu> menuList = sysMenuService.listAllMenuQx("menu",0,activeUser.getUserId());
		List<String> sysPermissionList = CollectionsFactory.newArrayList();
		if(permissionList != null){
			permissionList.forEach(n-> {sysPermissionList.add(n.getPercode());});
		}

		// 处理菜单
		for(int i=0;i<menuList.size();i++){
			if(CollectionUtils.isEmpty(menuList.get(i).getSubMenu())){
				menuList.remove(i);
				i--;
			}
		}

		model.addAttribute(ACTIVE_USER, activeUser);
		model.addAttribute("menuList", menuList);
		session.setAttribute("sysPermissionList", sysPermissionList);
		return "home";


	}
}	
