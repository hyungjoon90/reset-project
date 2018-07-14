package ga.beauty.reset.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.dao.Items_DaoImp;
import ga.beauty.reset.dao.entity.Items_Vo;
import ga.beauty.reset.services.Items_Service;
import sun.print.resources.serviceui;

@Controller
public class Item_Controller {
	String filePath="/Users/11/git/reset-project/src/main/webapp/resources/imgs/item_imgs";
	String essence="/essence";
	String lotion="/lotion";
	String skin="/skin";
	Logger log=Logger.getLogger(getClass());
	ObjectMapper mapper = new ObjectMapper();
	
	@Autowired
	Items_DaoImp items_DaoImp;
	
	@Autowired
	Items_Service items_service;
	
	// 아이템 검색 페이지 이동
	@RequestMapping("/item")
	public String item_page() {
		return "item/item_search";
	}
	
	// 아이템 검색
	@RequestMapping("/itemSearch")
	public void item_search_page(@RequestParam("search") String condition,@RequestParam("type") String type,HttpServletResponse resp) throws JsonProcessingException, IOException, SQLException {
		log.debug("itemSearch param: "+condition+"/"+type);
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(mapper.writeValueAsString(items_DaoImp.itemSearch(condition,type)));
	}
	
	// 아이템 추가 페이지 이동
	@RequestMapping("/itemAdd")
	public String item_add_page() {
		return "item/item";
	}
	
	// 아이템 추가
	@RequestMapping(value="/item",method=RequestMethod.POST)
	public int item_add(Items_Vo bean) {
		log.debug("item add: "+bean);
		
		
		
		return 1;
	}
	
	// 아이템 수정
	@RequestMapping(value="/item",method=RequestMethod.PATCH)
	public int item_update() {
		
		return 1;
	}
	
	// 아이템 삭제
	@RequestMapping(value="/item",method=RequestMethod.DELETE)
	public int item_delete() {
		
		return 1;
	}
	
}
