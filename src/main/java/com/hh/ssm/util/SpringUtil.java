package com.hh.ssm.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * created on
 *
 * 加载spring容器
 *
 * @author  admin
 * @version  0.0.1
 */
public class SpringUtil {
	public static ApplicationContext context;
	static{
		context = new ClassPathXmlApplicationContext("spring/applicationContext-dao.xml");
	}
}
