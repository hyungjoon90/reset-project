package ga.beauty.reset.controller;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.dao.Items_DaoImp;
import ga.beauty.reset.dao.Reviews_DaoImp;
import ga.beauty.reset.dao.entity.Items_Vo;
import ga.beauty.reset.services.Items_Reviews_Service;

@Controller
public class Items_Reviews_Controller {
	Logger log=Logger.getLogger(getClass());
	ObjectMapper mapper = new ObjectMapper();
	
	@Autowired
	Items_Reviews_Service service;
	
	@Autowired
	Items_DaoImp items_DaoImp;
	
	@Autowired
	Reviews_DaoImp reviews_DaoImp;
	
	String view="redirect:/ranking/";
	
	@RequestMapping(value="/ranking", method = RequestMethod.GET)
	public String ranking_list(@RequestParam("id") int cate,Model model) throws SQLException {
		log.debug("list-param: "+cate);
		service.listPage(model, cate);
		return "ranking/ranking_list";
	}
	
	@RequestMapping(value="/rankingadd", method = RequestMethod.GET)
	public void ranking_list_add(@RequestParam("id") int cate,HttpServletResponse resp) throws SQLException, IOException {
		log.debug("list-param: "+cate);
		log.debug(mapper.writeValueAsString(items_DaoImp.rankAdd(cate)));
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(mapper.writeValueAsString(items_DaoImp.rankAdd(cate)));
	}
	
	@RequestMapping(value="/item/{item}")
	public String ranking_detail(@PathVariable int item,Model model) throws SQLException {
		log.debug("detail-param: "+item);
		service.detailPage(model,item);
		return "ranking/ranking_detail";
	}
	
	@RequestMapping(value="/item/reviewadd", method = RequestMethod.GET)
	public void reviews_list_add(@RequestParam("item") int item,HttpServletResponse resp) throws SQLException, IOException {
		log.debug("review-param: "+item);
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(mapper.writeValueAsString(reviews_DaoImp.reviewAdd(item)));
	}
	
	@RequestMapping(value="/item/{item}",method=RequestMethod.POST)
	public String review_add(@PathVariable int item,Model model) throws SQLException{
		log.debug("review_add: "+item);
		service.detailPage(model,item);
		return "ranking/ranking_detail";
	}
}
