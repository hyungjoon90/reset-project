package ga.beauty.reset.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ga.beauty.reset.services.mypage.Mypage_Admin_Service;
import ga.beauty.reset.utils.LogEnum;

@Controller
public class Admin_Controller {

	Logger logger = Logger.getLogger(Admin_Controller.class);
	
	@Autowired
	Mypage_Admin_Service mypage_Admin_Service;
	
	public Admin_Controller() {
	}

	@RequestMapping("/admin/")
	public String showDashBoard(Model model, HttpSession session) {
		model.addAttribute("goRoot", "../");
		String email =(String) session.getAttribute("login_email");
		String nick =(String) session.getAttribute("login_nick");
		logger.info(LogEnum.INTER+"["+email+"/"+nick+"] 유저가 /admin/페이지에 접속함.");
		return "admin/admin_main";
	}
	
	@RequestMapping(name="/admin/{path}/",method=RequestMethod.GET)
	public String showPage(Model model, @PathVariable("path") String path) {
		model.addAttribute("goRoot", "../../");
		return "admin/"+path;
	}
	
//	@RequestMapping(name="/admin/{path}/{option}",method=RequestMethod.GET)
//	public String showPageOption(Model model
//			,@PathVariable("path") String path, @PathVariable("option") String option) {
//		model.addAttribute("goRoot", "../../");
//		
//		return "admin/"+path;
//	}
//	
	
//	
//	@RequestMapping(value = "/admin/eveaddr", method = RequestMethod.GET)
//	public String list(Model model) throws SQLException {
//		eventService.listPage(model);
//		return "eve_addr/eve_addr_list";
//	}
//	
//	@RequestMapping(value = "/admin/eveaddr/{eve_no}", method = RequestMethod.GET)
//	public String detail(@PathVariable int eve_no ,Model model,HttpServletRequest req) throws SQLException {
//		Eve_addr_Vo bean=new Eve_addr_Vo();
//		bean.setEve_no(eve_no);
//		service.listPage(model, bean);
//		return "eve_addr/eve_addr_detail";
//	}
//	
	
//	
//	@RequestMapping(value="/admin/event/{eve_no}", method = RequestMethod.POST)
//	public String updateForm(@PathVariable int eve_no ,Model model) throws SQLException {
//		String goRoot="../../";
//		model.addAttribute("goRoot",goRoot);
//		Event_Vo bean=new Event_Vo();
//		bean.setEve_no(eve_no);
//		
//		Comment_Vo comment=new Comment_Vo();
//		comment.setCo_type("이벤트");
//		comment.setP_no(eve_no);
//		
//		service.detailPage(model, bean, comment);
//		return "event/event_update";
//	}
//	
//	
//	@RequestMapping(value="/admin/event/{eve_no}/update", method = RequestMethod.POST)
//	public String update(@PathVariable("eve_no") int eve_no , @RequestParam("img") MultipartFile file, HttpServletRequest req) throws IOException, Exception {
//		//TODO : 썸네일 주소
//		String filePath="/Users/hb/Desktop/3차 프로젝트/new master/src/main/webapp/resources/imgs/event_imgs";
//		Event_Vo bean= new Event_Vo();
//		bean.setEve_no(eve_no);
//		//TODO : 썸네일 사진을 불러오는 곳입니다.
//		bean.setImg("/imgs/event_imgs"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes(),300));
//		Thread.sleep(3000);
//		bean.setTitle(req.getParameter("title"));
//		bean.setCon(req.getParameter("con"));
//		bean.setTags(req.getParameter("tags"));
//		service.updatePage(bean);
//		return view;
//	}
//	
//	@RequestMapping("/admin/event/add")
//	public String addForm(Model model) {
//		String goRoot="../../";
//		model.addAttribute("goRoot",goRoot);
//		return "event/event_add";
//	}
//	
//	@RequestMapping(value = "/admin/event", method = RequestMethod.POST)
//	public String add(@RequestParam("img") MultipartFile file,HttpServletRequest req) throws IOException, Exception {
//		//TODO : 썸네일 주소
//		String filePath="/Users/hb/Desktop/3차 프로젝트/new master/src/main/webapp/resources/imgs/event_imgs";
//		Event_Vo bean= new Event_Vo();
//		bean.setTitle(req.getParameter("title"));
//		bean.setCon(req.getParameter("con"));
//		bean.setTags(req.getParameter("tags"));
//		// 파일업로드 start
//		//TODO : 썸네일 사진을 불러오는 곳입니다.
//	    bean.setImg("/imgs/event_imgs"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes(),285));
//	    Thread.sleep(3000);
//	    // 파일업로드 end
//		service.addPage(bean);
//		return view;
//	}
//	
//	@RequestMapping(value = "/admin/event/{eve_no}", method = RequestMethod.DELETE)
//	public String delete(@PathVariable("eve_no") int eve_no,HttpServletRequest req) throws SQLException {
//		/*
//		Event_Vo bean=new Event_Vo();
//		bean.setEve_no(eve_no);
//		
//		Comment_Vo com=new Comment_Vo();
//		com.setCo_type("이벤트");
//		com.setP_no(eve_no);
//
//		String img = req.getParameter("img");
//		String Largeimg=img.replaceAll("#$#", "");
//		String filepath ="/Users/hb/Desktop/3차 프로젝트/코딩/reset_pro/src/main/webapp/resources";
//		File file = new File(filepath+img);
//		File file2 = new File(filepath+Largeimg);
//		file.delete();
//		file2.delete();
//		*/
//		Event_Vo bean=new Event_Vo();
//		bean.setEve_no(eve_no);
//		service.deletePage(bean);
//		return view;
//	}
	
//	// admin 아이템 검색 페이지 이동
//	@RequestMapping(value="/admin/item",method=RequestMethod.GET)
//	public String admin_item_page(Model model) throws SQLException {
//		goRoot="../";
//		model.addAttribute("goRoot", goRoot);
//		model.addAttribute("alist", items_DaoImp.itemAll());
//		return "item/admin_item_search";
//	}
//	
//	// 아이템 검색
//	@RequestMapping("/itemSearch")
//	public void item_search_page(@RequestParam("search") String condition,@RequestParam("type") String type,HttpServletResponse resp) throws JsonProcessingException, IOException, SQLException {
//		log.debug("itemSearch param: "+condition+"/"+type);
//		resp.setCharacterEncoding("utf-8");
//		resp.getWriter().print(mapper.writeValueAsString(items_service.item_search(condition, type)));
//	}
//	
//	// admin item 상세
//	@RequestMapping(value="/admin/item/{item}",method=RequestMethod.GET)
//	public String ranking_detail(@PathVariable int item,Model model) throws SQLException {
//		log.debug("detail-param: "+item);
//		items_service.item_detailPage(model,item);
//		
//		goRoot="../../";
//		model.addAttribute("goRoot", goRoot);
//		return "item/admin_item_detail";
//	}
//	
//	// 아이템 추가 페이지 이동
//	@RequestMapping(value="/admin/itemAdd",method=RequestMethod.GET)
//	public String item_add_page(Model model) {
//		model.addAttribute("goRoot", goRoot);
//		return "item/admin_item_Add";
//	}
//	
//	// 아이템 추가
//	@RequestMapping(value="/admin/item",method=RequestMethod.POST)
//	public void item_add(@RequestParam("img") MultipartFile file,HttpServletRequest req,HttpServletResponse resp) throws IOException, Exception {
//		log.debug(file.getOriginalFilename());
//
//		
//		Items_Vo bean=new Items_Vo();
//		bean.setName(req.getParameter("name"));
//		if(req.getParameter("cate").equals("essence")) {
//			bean.setCate(1);
//			filePath+=essence;
//			subPath+=essence;
//		}else if(req.getParameter("cate").equals("lotion")) {
//			bean.setCate(2);
//			filePath+=lotion;
//			subPath+=lotion;
//		}else if(req.getParameter("cate").equals("skin")) {
//			bean.setCate(3);
//			filePath+=skin;
//			subPath+=skin;
//		}
//		bean.setBrand(req.getParameter("brand"));
//		bean.setVol(req.getParameter("vol"));
//		bean.setPrice(Integer.parseInt(req.getParameter("price")));
//		if(req.getParameter("type").equals("oil")) {
//			bean.setOil(1);
//			filePath+=oil;
//			subPath+=oil;
//		}else if(req.getParameter("type").equals("dry")) {
//			bean.setDry(1);
//			filePath+=dry;
//			subPath+=dry;
//		}else if(req.getParameter("type").equals("sen")) {
//			bean.setSen(1);
//			filePath+=sen;
//			subPath+=sen;
//		}
//		bean.setTags(req.getParameter("tags"));
//		
//		if(!file.getOriginalFilename().equals("")) {
//			bean.setImg("imgs/item_imgs"+subPath+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes(),100));
//		}
//		log.debug(bean);
//		
//		resp.setCharacterEncoding("utf-8");
//		resp.getWriter().print(items_service.item_add(bean));
//	}
//
//	
//	// 아이템 수정
//	@RequestMapping(value="/admin/itemUpdate/{item}",method=RequestMethod.POST)
//	public void item_update(@PathVariable("item") int item,@RequestParam("img") MultipartFile file, HttpServletResponse resp,HttpServletRequest req) throws IOException, Exception {
//
//		log.debug("item_update: "+item);
//		log.debug("option: "+req.getParameter("option"));// 원래대로1,바꿈2
//		int option=Integer.parseInt(req.getParameter("option"));
//		log.debug(option);
//		// 공통
//		Items_Vo bean=new Items_Vo();
//		bean.setItem(item);
//		bean.setName(req.getParameter("name"));
//		if(req.getParameter("cate").equals("essence")) {
//			bean.setCate(1);
//			filePath+=essence;
//			subPath+=essence;
//		}else if(req.getParameter("cate").equals("lotion")) {
//			bean.setCate(2);
//			filePath+=lotion;
//			subPath+=lotion;
//		}else if(req.getParameter("cate").equals("skin")) {
//			bean.setCate(3);
//			filePath+=skin;
//			subPath+=skin;
//		}
//		bean.setBrand(req.getParameter("brand"));
//		bean.setVol(req.getParameter("vol"));
//		bean.setPrice(Integer.parseInt(req.getParameter("price")));
//		if(req.getParameter("type").equals("oil")) {
//			bean.setOil(1);
//			filePath+=oil;
//			subPath+=oil;
//		}else if(req.getParameter("type").equals("dry")) {
//			bean.setDry(1);
//			filePath+=dry;
//			subPath+=dry;
//		}else if(req.getParameter("type").equals("sen")) {
//			bean.setSen(1);
//			filePath+=sen;
//			subPath+=sen;
//		}
//		bean.setTags(req.getParameter("tags"));
//		bean.setTot(Double.parseDouble(req.getParameter("tot")));
//		
//		if(!file.getOriginalFilename().equals("")) {
//			bean.setImg("imgs/item_imgs"+subPath+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes(),100));
//		}
//		log.debug(bean);
//		
//		if(req.getParameter("option").equals("1")) {
//			bean.setImg(req.getParameter("preimg"));
//		}else if(req.getParameter("option").equals("2")) {
//			bean.setImg("imgs/upload_imgs"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes(),100));
//		}else if(req.getParameter("option").equals("3")) {
//			bean.setImg("");
//			// bean.setImg("imgs/item_imgs"+subPath+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
//		}
//		log.debug("item controller param: "+bean);
//		resp.setCharacterEncoding("utf-8");
//		resp.getWriter().print(items_service.item_update(option,bean));
//	}
//	
//	
//	// 아이템 삭제
//	@RequestMapping(value="/admin/item/{item}",method=RequestMethod.DELETE)
//	public void item_delete(@PathVariable("item") int item,HttpServletResponse resp) throws IOException, SQLException {
//		log.debug("item del param: "+item);
//		
//		resp.setCharacterEncoding("utf-8");
//		resp.getWriter().print(items_service.item_delete(item));
//	}
//	
//	
//	@RequestMapping("/admin/magazine/add")
//	public String addForm(Model model) throws SQLException{
//		String goRoot="../../";
//		model.addAttribute("goRoot",goRoot);
//		return "magazine/magazine_add";
//	}
//	
//	@RequestMapping(value="/admin/magazine", method=RequestMethod.POST)
//	public String add(@RequestParam("img") MultipartFile file,HttpServletRequest req) throws IOException, Exception{
//		//TODO : 썸네일 사진 저장 장소 입니다.
//		String filePath="/Users/hb/Desktop/3차 프로젝트/코딩/reset_pro/src/main/webapp/resources/thumbnail";
//		Magazine_Vo bean =new Magazine_Vo();
//		bean.setTitle(req.getParameter("title"));
//		bean.setCon(req.getParameter("con"));
//		bean.setCate(Integer.parseInt((req.getParameter("cate"))));
//		bean.setTags(req.getParameter("tags"));
//		//TODO : 썸네일 사진을 불러오는 곳입니다.
//		bean.setImg("/thumbnail"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes(),300));
//		service.addPage(bean);
//		return "view";
//	}
//	
//	@RequestMapping(value="/admin/magazine/{mag_no}", method=RequestMethod.DELETE)
//	public String delete(@PathVariable("mag_no") int mag_no,HttpServletRequest req) throws SQLException{
//		Magazine_Vo bean =new Magazine_Vo();
//		bean.setMag_no(mag_no);
//		service.deletePage(bean);
//		return view;
//	}
	
}
