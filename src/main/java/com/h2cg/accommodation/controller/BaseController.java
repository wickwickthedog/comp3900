package com.h2cg.accommodation.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class BaseController {
	Map<String, Object> json = new HashMap<String, Object>();
	
	public void setResultJson(String res, String msg, String entity){
		json.put("res", res);
		json.put("msg", msg);
		json.put("entity", entity);
	}
	
	public void setListJson(String res, List<?> list, Integer total){
		json.put("res", res);
		json.put("rows", list);
		json.put("total", total);
	}
	
	public void setIsExistJson(String isExist){
		json.put("isExist", isExist);
	}
	
	public void setItemListJson(String res, List<?> list,List<?> itemList,int total){
		json.put("res", res);
		json.put("rows", list);
		json.put("item", itemList);
		json.put("total", total);
	}
	
	public void setSaveStatus(String savaStatus){
		json.put("status", savaStatus);
	}

	
	public void setTitleJson(String res, String msg, String title){
		json.put("res", res);
		json.put("msg", msg);
		json.put("title", title);
	}
	
//	public void setDataFormat() {
//		dobFormat = DateUtils.getDateTime(new Date());
//	}
}
