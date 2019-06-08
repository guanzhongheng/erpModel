package com.hh.ssm.util;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * 说明：路径工具类
 * 作者：FH Admin Q313596790
 *
 */
public class PathUtil {

	/**获取Projectpath
	 * @return
	 */
	public static String getProjectpath(){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String path = request.getServletContext().getRealPath("/").replaceAll("%20", " ").replaceAll("file:/", "").trim();
		return path;
	}
	
	/**获取Classpath
	 * @return
	 */
	public static String getClasspath(){
		String path =  (String.valueOf(Thread.currentThread().getContextClassLoader().getResource(""))).replaceAll("file:/", "").replaceAll("%20", " ").trim();	
		if(path.indexOf(":") != 1){
			path = File.separator + path;
		
		}
		//path = "C:\\";  //当项目以jar、war包运行时，路径改成实际硬盘位置
		return path;
	}
	
}
