package ga.beauty.reset.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ga.beauty.reset.dao.entity.Comment_Vo;
import ga.beauty.reset.dao.entity.Magazine_Vo;
import ga.beauty.reset.services.Magazine_Service;
import ga.beauty.reset.utils.UpdateViewUtils;
import ga.beauty.reset.utils.UploadFileUtils;

@Controller
public class Magazine_Controller {
	private static final Logger logger = LoggerFactory.getLogger(Magazine_Controller.class);
	
	@Autowired
	Magazine_Service service;
	
	@Autowired
	UpdateViewUtils viewUtils;
	
	String view="redirect:/magazine";
	
	@RequestMapping(value="/magazine", method=RequestMethod.GET)
	public String list(Model model) throws SQLException{
		service.listPage(model);
		return "magazine/magazine_list";
	}
	
	@RequestMapping(value="/magazine/ajax",method=RequestMethod.GET)
	public String listAjax(Model model, Magazine_Vo bean) throws SQLException {
		if(bean.getCate()==99) {
				service.listPage(model);
			}else{
				service.listPage(model,bean);
			}
		return "magazine/magazine_list_ajax";
	}
	
	@RequestMapping(value="/magazine/{mag_no}", method=RequestMethod.GET)
	public String detail(@PathVariable("mag_no") int mag_no,Model model,HttpServletRequest req,HttpServletResponse resp) throws SQLException{
		Magazine_Vo bean =new Magazine_Vo();
		bean.setMag_no(mag_no);
		
		Comment_Vo comment=new Comment_Vo();
		comment.setCo_type("매거진");
		comment.setP_no(mag_no);
		
		//쿠기를 사용한 조회수 증가 입니다(3번째 인자로 review,magazine,event 중에 골라서 넣어주세요)
		viewUtils.UpdateView(resp, req, "magazine", mag_no, model);
		
		service.detailPage(model, bean, comment);
		model.addAttribute("no",mag_no);
		model.addAttribute("type","magazine");
		return "magazine/magazine_detail";
	}
	
	@RequestMapping(value="/admin/magazine/{mag_no}", method = RequestMethod.POST)
	public String updateForm(@PathVariable("mag_no") int mag_no, Model model) throws SQLException{
		Magazine_Vo bean=new Magazine_Vo();
		bean.setMag_no(mag_no);
		
		Comment_Vo comment=new Comment_Vo();
		comment.setCo_type("매거진");
		comment.setP_no(mag_no);
		
		service.detailPage(model, bean, comment);
		return "magazine/magazine_update";
	}
	
	@RequestMapping(value="/admin/magazine/{mag_no}/update",method=RequestMethod.POST)
	public String update(@PathVariable("mag_no") int mag_no, @RequestParam("img") MultipartFile file, HttpServletRequest req) throws IOException, Exception{
		String filePath="C:\\Users\\hb\\Desktop\\3차 프로젝트\\코딩\\reset_pro\\src\\main\\webapp\\resources\\thumbnail";
		Magazine_Vo bean=new Magazine_Vo();
		bean.setMag_no(mag_no);
		bean.setTitle(req.getParameter("title"));
		bean.setCon(req.getParameter("con"));
		bean.setCate(Integer.parseInt(req.getParameter("cate")));
		bean.setImg("/thumbnail"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
		bean.setTags(req.getParameter("tags"));
		service.updatePage(bean);
		return view;
	}
	
	
	
	@RequestMapping("/admin/magazine/add")
	public String addForm(Model model) throws SQLException{
		return "magazine/magazine_add";
	}
	
	@RequestMapping(value="/admin/magazine", method=RequestMethod.POST)
	public String add(@RequestParam("img") MultipartFile file,HttpServletRequest req) throws IOException, Exception{
		String filePath="/Users/hb/Desktop/3차 프로젝트/코딩/reset_pro/src/main/webapp/resources/thumbnail";
		Magazine_Vo bean =new Magazine_Vo();
		bean.setTitle(req.getParameter("title"));
		bean.setCon(req.getParameter("con"));
		bean.setCate(Integer.parseInt((req.getParameter("cate"))));
		bean.setTags(req.getParameter("tags"));
		bean.setImg("/thumbnail"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
		service.addPage(bean);
		return "view";
	}
	
	@RequestMapping(value="/admin/magazine/{mag_no}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("mag_no") int mag_no,HttpServletRequest req) throws SQLException{
		Magazine_Vo bean =new Magazine_Vo();
		bean.setMag_no(mag_no);
		
		Comment_Vo com =new Comment_Vo();
		com.setCo_type("매거진");
		com.setP_no(mag_no);
		
		String img = req.getParameter("img");
		String Largeimg=img.replaceAll("#$#", "");
		String filepath ="/Users/hb/Desktop/3차 프로젝트/코딩/reset_pro/src/main/webapp/resources";
		File file = new File(filepath+img);
		File file2 = new File(filepath+Largeimg);
		file.delete();
		file2.delete();
		
		service.deletePage(bean);
		return view;
	}
	
	
}//class end
