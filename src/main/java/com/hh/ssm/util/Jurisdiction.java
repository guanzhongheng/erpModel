package com.hh.ssm.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

/**
 * 说明：权限工具类
 * 作者：FH Admin Q313596790
 *
 */
public class Jurisdiction {
	
	/**shiro管理的session
	 * @return
	 */
	public static Session getSession(){
		return SecurityUtils.getSubject().getSession();
	}
	
	/**获取当前登录的用户名
	 * @return
	 */
	public static String getUsername(){
		return getSession().getAttribute(Const.SESSION_USERNAME).toString();
	}
	
	/**获取当前登录的姓名
	 * @return
	 */
	public static String getName(){
		return getSession().getAttribute(Const.SESSION_U_NAME).toString();
	}

}
