package com.hh.ssm.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface IPictureService {
	
	/**
	 * 
	 *
	 * @param  
	 * @return
	 */
	Map<String,Object> uploadPicture(MultipartFile uploadFile) throws Exception;
	
	boolean deleteFile(String picName) throws Exception;
}
