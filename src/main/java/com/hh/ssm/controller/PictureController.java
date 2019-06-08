package com.hh.ssm.controller;

import com.hh.ssm.service.IPictureService;
import com.hh.ssm.util.CollectionsFactory;
import com.hh.ssm.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * 
 * created on 2016年9月27日 
 *
 * 上传图片处理
 *
 * @author  admin
 * @version  0.0.1
 */
@RestController
public class PictureController {
    @Autowired
	private IPictureService pictureService;
	
	@RequestMapping("/pic/upload")
	public String pictureUpload(MultipartFile uploadFile) throws Exception{
		Map<String,Object> result = pictureService.uploadPicture(uploadFile);
		//为了保证功能的兼容性，需要把Result转换成json格式的字符串。
		String json = JsonUtils.objectToJson(result);
		return json;
	}
	
	@RequestMapping("/pic/delete")
	public String pictureDelete(@RequestParam String picName) throws Exception{
		pictureService.deleteFile(picName);
		Map<String,Object> result = CollectionsFactory.newHashMap();
		result.put("data", "success");
		String json = JsonUtils.objectToJson(result);
		return json;
	}
}
