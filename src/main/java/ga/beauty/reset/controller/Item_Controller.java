package ga.beauty.reset.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.dao.Items_DaoImp;
import ga.beauty.reset.dao.entity.Items_Vo;
import ga.beauty.reset.services.Items_Service;
import ga.beauty.reset.utils.UploadFileUtils;

@Controller
public class Item_Controller {
	String filePath="/Users/11/git/reset-project/src/main/webapp/resources/imgs/item_imgs";
	String essence="/essence";
	String lotion="/lotion";
	String skin="/skin";
	String oil="/oil";
	String dry="/dry";
	String sen="/sen";
	String subPath="";
	Logger log=Logger.getLogger(getClass());
	ObjectMapper mapper = new ObjectMapper();
	
	String goRoot="../";
	
	@Autowired
	Items_DaoImp items_DaoImp;
	
	@Autowired
	Items_Service items_service;
	
	// 아이템 검색 페이지 이동
	@RequestMapping("/item")
	public String item_page(Model model) {
		goRoot="./";
		model.addAttribute("goRoot", goRoot);
		return "item/item_search";
	}
	
	// admin 아이템 검색 페이지 이동
	@RequestMapping(value="/admin/item",method=RequestMethod.GET)
	public String admin_item_page(Model model) {
		goRoot="../";
		model.addAttribute("goRoot", goRoot);
		return "item/admin_item_search";
	}
	
	// 아이템 검색
	@RequestMapping("/itemSearch")
	public void item_search_page(@RequestParam("search") String condition,@RequestParam("type") String type,HttpServletResponse resp) throws JsonProcessingException, IOException, SQLException {
		log.debug("itemSearch param: "+condition+"/"+type);
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(mapper.writeValueAsString(items_service.item_search(condition, type)));
	}
	
	// admin item 상세
	@RequestMapping(value="/admin/item/{item}",method=RequestMethod.GET)
	public String ranking_detail(@PathVariable int item,Model model) throws SQLException {
		log.debug("detail-param: "+item);
		items_service.item_detailPage(model,item);
		
		goRoot="../../";
		model.addAttribute("goRoot", goRoot);
		return "item/admin_item_detail";
	}
	
	// 아이템 추가 페이지 이동
	@RequestMapping(value="/admin/itemAdd",method=RequestMethod.GET)
	public String item_add_page(Model model) {
		model.addAttribute("goRoot", goRoot);
		return "item/admin_item_Add";
	}
	
	// 아이템 추가
	@RequestMapping(value="/admin/item",method=RequestMethod.POST)
	public void item_add(@RequestParam("img") MultipartFile file,HttpServletRequest req,HttpServletResponse resp) throws IOException, Exception {
		log.debug(file.getOriginalFilename());

		
		Items_Vo bean=new Items_Vo();
		bean.setName(req.getParameter("name"));
		if(req.getParameter("cate").equals("essence")) {
			bean.setCate(1);
			filePath+=essence;
			subPath+=essence;
		}else if(req.getParameter("cate").equals("lotion")) {
			bean.setCate(2);
			filePath+=lotion;
			subPath+=lotion;
		}else if(req.getParameter("cate").equals("skin")) {
			bean.setCate(3);
			filePath+=skin;
			subPath+=skin;
		}
		bean.setBrand(req.getParameter("brand"));
		bean.setVol(req.getParameter("vol"));
		bean.setPrice(Integer.parseInt(req.getParameter("price")));
		if(req.getParameter("type").equals("oil")) {
			bean.setOil(1);
			filePath+=oil;
			subPath+=oil;
		}else if(req.getParameter("type").equals("dry")) {
			bean.setDry(1);
			filePath+=dry;
			subPath+=dry;
		}else if(req.getParameter("type").equals("sen")) {
			bean.setSen(1);
			filePath+=sen;
			subPath+=sen;
		}
		bean.setTags(req.getParameter("tags"));
		
		if(!file.getOriginalFilename().equals("")) {
			bean.setImg("imgs/item_imgs"+subPath+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
		}
		log.debug(bean);
		
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(items_service.item_add(bean));
	}

	
	// 아이템 수정
	@RequestMapping(value="/admin/itemUpdate/{item}",method=RequestMethod.POST)
	public void item_update(@PathVariable("item") int item,@RequestParam("img") MultipartFile file, HttpServletResponse resp,HttpServletRequest req) throws IOException, Exception {

		log.debug("item_update: "+item);
		log.debug("option: "+req.getParameter("option"));// 원래대로1,바꿈2
		int option=Integer.parseInt(req.getParameter("option"));
		log.debug(option);
		// 공통
		Items_Vo bean=new Items_Vo();
		bean.setItem(item);
		bean.setName(req.getParameter("name"));
		if(req.getParameter("cate").equals("essence")) {
			bean.setCate(1);
			filePath+=essence;
			subPath+=essence;
		}else if(req.getParameter("cate").equals("lotion")) {
			bean.setCate(2);
			filePath+=lotion;
			subPath+=lotion;
		}else if(req.getParameter("cate").equals("skin")) {
			bean.setCate(3);
			filePath+=skin;
			subPath+=skin;
		}
		bean.setBrand(req.getParameter("brand"));
		bean.setVol(req.getParameter("vol"));
		bean.setPrice(Integer.parseInt(req.getParameter("price")));
		if(req.getParameter("type").equals("oil")) {
			bean.setOil(1);
			filePath+=oil;
			subPath+=oil;
		}else if(req.getParameter("type").equals("dry")) {
			bean.setDry(1);
			filePath+=dry;
			subPath+=dry;
		}else if(req.getParameter("type").equals("sen")) {
			bean.setSen(1);
			filePath+=sen;
			subPath+=sen;
		}
		bean.setTags(req.getParameter("tags"));
		bean.setTot(Double.parseDouble(req.getParameter("tot")));
		
		
		if(req.getParameter("option").equals("1")) {
			bean.setImg(req.getParameter("preimg"));
		}else if(req.getParameter("option").equals("2")) {
			bean.setImg("imgs/item_imgs"+subPath+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
		}
		log.debug("item controller param: "+bean);
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(items_service.item_update(option,bean));
	}
	
	// 아이템 삭제
	@RequestMapping(value="/admin/item/{item}",method=RequestMethod.DELETE)
	public void item_delete(@PathVariable("item") int item,HttpServletResponse resp) throws IOException, SQLException {
		log.debug("item del param: "+item);
		
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(items_service.item_delete(item));
	}
	
	
		
}
