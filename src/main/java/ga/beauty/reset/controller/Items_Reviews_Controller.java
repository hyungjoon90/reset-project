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

import com.fasterxml.jackson.databind.ObjectMapper;

import ga.beauty.reset.dao.Comment_DaoImpl;
import ga.beauty.reset.dao.Items_DaoImp;
import ga.beauty.reset.dao.Reviews_DaoImp;
import ga.beauty.reset.dao.entity.Comment_Vo;
import ga.beauty.reset.dao.entity.Reviews_Vo;
import ga.beauty.reset.services.Items_Reviews_Service;
import ga.beauty.reset.utils.UploadFileUtils;

@Controller
public class Items_Reviews_Controller {
	String filePath="/Users/11/git/reset-project/src/main/webapp/resources/imgs/upload_imgs";
	Logger log=Logger.getLogger(getClass());
	ObjectMapper mapper = new ObjectMapper();
	
	String goRoot="../";
	
	@Autowired
	Items_Reviews_Service service;
	
	@Autowired
	Items_DaoImp items_DaoImp;
	
	@Autowired
	Reviews_DaoImp reviews_DaoImp;
	
	@Autowired
	Comment_DaoImpl comment_DaoImpl;
	
	//랭킹 리스트 조회
	@RequestMapping(value="/ranking", method = RequestMethod.GET)
	public String ranking_list(@RequestParam("id") int cate,Model model) throws SQLException {
		log.debug("list-param: "+cate);
		service.ranking_listPage(model, cate);
		return "ranking_review/ranking_list";
	}
	
	// 랭킹 리스트 추가
	@RequestMapping(value="/rankingadd", method = RequestMethod.GET)
	public void ranking_list_add(@RequestParam("id") int cate,HttpServletResponse resp) throws SQLException, IOException {
		log.debug("list-param: "+cate);
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(mapper.writeValueAsString(items_DaoImp.rankAdd(cate)));
	}
	
	// item 상세
	@RequestMapping(value="/item/{item}",method=RequestMethod.GET)
	public String ranking_detail(@PathVariable int item,Model model) throws SQLException {
		log.debug("detail-param: "+item);
		service.ranking_detailPage(model,item);
		
		goRoot="../";
		model.addAttribute("goRoot", goRoot);
		return "ranking_review/item_detail";
	}
	
	// 리뷰 리스트 추가 ajax
	@RequestMapping(value="/item/reviewadd", method=RequestMethod.GET)
	public void reviews_list_add(@RequestParam("item") int item,HttpServletResponse resp) throws SQLException, IOException {
		log.debug("review-param: "+item);
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(mapper.writeValueAsString(reviews_DaoImp.reviewListAdd(item)));
	}
	
	// 리뷰 작성
	@RequestMapping(value="/item/{item}", method=RequestMethod.POST)
	public void review_add(@PathVariable("item") int item,Model model,@RequestParam("img") MultipartFile file,HttpServletRequest req,HttpServletResponse resp) throws Exception{
		log.debug("review_add: "+item);
		log.debug(file.getOriginalFilename());
		
		Reviews_Vo bean=new Reviews_Vo();
		bean.setItem(item);
		bean.setWriter(req.getParameter("writer"));
		bean.setGood(req.getParameter("good"));
		bean.setBad(req.getParameter("bad"));
		bean.setTip(req.getParameter("tip"));
		bean.setStar(Integer.parseInt(req.getParameter("star")));
		if(!file.getOriginalFilename().equals("")) {
			bean.setImg("imgs/upload_imgs"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
		}else {
			bean.setImg("");
		}
		
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(service.review_addPage(resp,bean));
	}
	
	// 찜목록에 추가
	@RequestMapping("/item/cartAdd")
	public void cart_Add(@RequestParam("item") int item,@RequestParam("email") String email,HttpServletResponse resp) throws SQLException, IOException {
		log.debug("param: "+item+" "+email);
		resp.getWriter().print(reviews_DaoImp.cartAdd(item,email));
	}
	
	// 리뷰 상세
	@RequestMapping(value="/item/{item}/review/{rev_no}",method=RequestMethod.GET)
	public String review_detail(@PathVariable int item,@PathVariable int rev_no,Model model) throws SQLException {
		log.debug("review_detail-param: "+item+" "+rev_no);
		
		goRoot="../../../";
			
		Comment_Vo comment=new Comment_Vo();
		comment.setCo_type("리뷰");
		comment.setP_no(rev_no);
		
		model.addAttribute("goRoot", goRoot);
		model.addAttribute("comment",comment_DaoImpl.list(comment));
		service.review_detailPage(model,item,rev_no);
		return "ranking_review/review_detail";
	}
	
	// 리뷰 수정
	@RequestMapping(value="/item/{item}/review/{rev_no}", method=RequestMethod.POST)
	public void review_update(@PathVariable("item") int item,@PathVariable("rev_no") int rev_no,@RequestParam("img") MultipartFile file, HttpServletResponse resp,HttpServletRequest req) throws Exception{
		log.debug("review_update: "+item);
		log.debug("파일이름: "+file.getOriginalFilename());
		log.debug("option: "+req.getParameter("option"));// 원래대로1,바꿈2,지움3
		int option=Integer.parseInt(req.getParameter("option"));
		// 공통
		Reviews_Vo bean=new Reviews_Vo();
		bean.setItem(item);
		bean.setRev_no(rev_no);
		bean.setWriter(req.getParameter("writer"));
		bean.setGood(req.getParameter("good"));
		bean.setBad(req.getParameter("bad"));
		bean.setTip(req.getParameter("tip"));
		bean.setStar(Integer.parseInt(req.getParameter("star")));
		bean.setPop(Integer.parseInt(req.getParameter("pop")));

		if(req.getParameter("option").equals("1")) {
			bean.setImg(req.getParameter("preimg"));
		}else if(req.getParameter("option").equals("2")) {
			bean.setImg("imgs/upload_imgs"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
		}else if(req.getParameter("option").equals("3")) {
			bean.setImg("");
		}
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(service.review_updatePage(option,bean));
	}
	
	// 리뷰 삭제
	@RequestMapping(value="/item/{item}/review/{rev_no}", method=RequestMethod.DELETE)
	public void review_delete(@PathVariable("item") int item,@PathVariable("rev_no") int rev_no,HttpServletResponse resp,HttpServletRequest req) throws Exception{
		log.debug("review_delete: "+item+"/"+rev_no);
		
		// 공통
		Reviews_Vo bean=new Reviews_Vo();
		bean.setItem(item);
		bean.setRev_no(rev_no);
		bean.setWriter(req.getParameter("writer"));
		
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().print(service.review_deletePage(filePath,bean));
	}
	
}
