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

import ga.beauty.reset.dao.entity.Comment_Vo;
import ga.beauty.reset.dao.entity.Event_Vo;
import ga.beauty.reset.services.Event_Service;
import ga.beauty.reset.utils.UpdateViewUtils;
import ga.beauty.reset.utils.UploadFileUtils;

@Controller
public class Event_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Event_Controller.class);
	
	@Autowired
	Event_Service service;
	
	@Autowired
	UpdateViewUtils viewUtils;
	
	String view="redirect:/event";

	
	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String list(Model model) throws SQLException {
		service.listPage(model);
		return "event/event_list";
	}
	
	@RequestMapping(value = "/event/{eve_no}", method = RequestMethod.GET)
	public String detail(@PathVariable int eve_no ,Model model,HttpServletRequest req,HttpServletResponse resp) throws SQLException {
		
		Event_Vo bean=new Event_Vo();
		bean.setEve_no(eve_no);
		
		Comment_Vo comment=new Comment_Vo();
		comment.setCo_type("이벤트");
		comment.setP_no(eve_no);
		//쿠기를 사용한 조회수 증가 입니다(3번째 인자로 review,magazine,event 중에 골라서 넣어주세요)
		viewUtils.UpdateView(resp, req, "event", eve_no, model);
		
		service.detailPage(model, bean, comment);
		return "event/event_detail";
	}
	
	@RequestMapping(value="/event/{eve_no}", method = RequestMethod.POST)
	public String updateForm(@PathVariable int eve_no ,Model model) throws SQLException {
		Event_Vo bean=new Event_Vo();
		bean.setEve_no(eve_no);
		
		Comment_Vo comment=new Comment_Vo();
		comment.setCo_type("이벤트");
		comment.setP_no(eve_no);
		
		service.detailPage(model, bean, comment);
		return "event/event_update";
	}
	
	
	@RequestMapping(value="/event/{eve_no}/update", method = RequestMethod.POST)
	public String update(@PathVariable("eve_no") int eve_no , @RequestParam("img") MultipartFile file, HttpServletRequest req) throws IOException, Exception {
		String filePath="C:\\Users\\hb\\Desktop\\3차 프로젝트\\코딩\\reset_pro\\src\\main\\webapp\\resources\\thumbnail";
		Event_Vo bean= new Event_Vo();
		bean.setEve_no(eve_no);
		bean.setImg("/thumbnail"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
		bean.setTitle(req.getParameter("title"));
		bean.setCon(req.getParameter("con"));
		bean.setTags(req.getParameter("tags"));
		service.updatePage(bean);
		return view;
	}
	
	@RequestMapping("/event/add")
	public String addForm(Model model) {
		return "event/event_add";
	}
	
	@RequestMapping(value = "/event", method = RequestMethod.POST)
	public String add(@RequestParam("img") MultipartFile file,HttpServletRequest req) throws IOException, Exception {
		String filePath="C:\\Users\\hb\\Desktop\\3차 프로젝트\\코딩\\reset_pro\\src\\main\\webapp\\resources\\thumbnail";
		Event_Vo bean= new Event_Vo();
		bean.setTitle(req.getParameter("title"));
		bean.setCon(req.getParameter("con"));
		bean.setTags(req.getParameter("tags"));
		// 파일업로드 start
	    bean.setImg("/thumbnail"+UploadFileUtils.uploadFile(filePath, file.getOriginalFilename(), file.getBytes()));
	    // 파일업로드 end
		service.addPage(bean);
		return view;
	}
	
	@RequestMapping(value = "/event/{eve_no}", method = RequestMethod.DELETE)
	public String delete(@PathVariable int eve_no,HttpServletRequest req) throws SQLException {
		Event_Vo bean=new Event_Vo();
		bean.setEve_no(eve_no);
		
		Comment_Vo com=new Comment_Vo();
		com.setCo_type("이벤트");
		com.setP_no(eve_no);

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
	
//	ckeditor 서버로 이미지 업로드하고 다시 보여주는 메소드 입니다.
	@RequestMapping(value = "/add/img", method=RequestMethod.POST)
    public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
 
        OutputStream out = null;
        PrintWriter printWriter = null;
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
 
        try{
 
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String uploadPath = "C:\\Users\\hb\\Desktop\\3차 프로젝트\\코딩\\reset_pro\\src\\main\\webapp\\resources\\upload\\" + fileName;//저장경로
 
            out = new FileOutputStream(new File(uploadPath));
            out.write(bytes);
            String callback = request.getParameter("CKEditorFuncNum");
 
            printWriter = response.getWriter();
            String fileUrl = "http://localhost:8080/reset/upload/"+ fileName;//url경로
            
            printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                    + callback
                    + ",'"
                    + fileUrl
                    + "','이미지를 업로드 하였습니다.'"
                    + ")</script>");
            printWriter.flush();
 
        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
 
        return;
    }
	
}
