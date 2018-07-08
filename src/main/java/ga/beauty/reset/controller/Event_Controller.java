package ga.beauty.reset.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ga.beauty.reset.dao.entity.Event_Vo;
import ga.beauty.reset.services.Event_Service;

@Controller
public class Event_Controller {

	private static final Logger logger = LoggerFactory.getLogger(Event_Controller.class);
	
	@Autowired
	Event_Service service;
	
	String view="redirect:/event";

	@RequestMapping(value = "/event", method = RequestMethod.GET)
	public String list(Model model) throws SQLException {
		service.listPage(model);
		return "event/event_list";
	}
	
	@RequestMapping(value = "/event/{eve_no}", method = RequestMethod.GET)
	public String detail(@PathVariable int eve_no ,Model model) throws SQLException {
		Event_Vo bean=new Event_Vo();
		bean.setEve_no(eve_no);
		service.detailPage(model, bean);
		return "event/event_detail";
	}
	
	@RequestMapping("/event/add")
	public String addForm(Model model) {
		return "event/event_add";
	}
	
	@RequestMapping(value = "/event", method = RequestMethod.POST)
	public String add(@ModelAttribute Event_Vo bean) throws SQLException {
		service.addPage(bean);
		return view;
	}
	
	@RequestMapping(value = "/event/{eve_no}", method = RequestMethod.DELETE)
	public String delete(@PathVariable int eve_no) throws SQLException {
		Event_Vo bean=new Event_Vo();
		bean.setEve_no(eve_no);
		service.deletePage(bean);
		return view;
	}
	
	// 다중파일업로드
    @RequestMapping(value = "/file_uploader", /*editor/sample/photo_uploader/attach 에 337라인 참고*/
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
        // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
            // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
            String filePath = "C:\\Users\\hyung\\OneDrive\\바탕 화면\\3차 프로젝트\\Coding\\src\\main\\webapp\\resources\\photoUpload\\";
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(filePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append("http://localhost:8080/Spring/resources/photoUpload/")
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

}
