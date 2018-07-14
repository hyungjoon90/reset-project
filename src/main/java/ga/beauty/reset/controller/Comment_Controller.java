package ga.beauty.reset.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import ga.beauty.reset.dao.entity.Comment_Vo;
import ga.beauty.reset.services.Comment_Service;

@RestController
public class Comment_Controller {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	Comment_Service service;
	
	String convert_err = "co_type error";
	
	private String convert_Type(String co_type) {
		// TODO 여기 한글 깨짐
		// co_type�� ����� �ѱ۷� �ٲٴ� �޼ҵ� �Դϴ�.
		if(co_type.equals("event")){
			return co_type="�̺�Ʈ";
		}else if(co_type.equals("magazine")) {
			return co_type="�Ű���";
		}else if(co_type.equals("review")) {
			return co_type="����";
		}else {
			return convert_err;
		}
	}
	
	
	/*//����� ������ Ȯ���ϴ� ��Ʈ�ѷ�
	@RequestMapping(value="/{co_type}/{p_no}/comment", method=RequestMethod.GET)
	public ResponseEntity<Integer> count(@PathVariable("co_type") String co_type
			,@PathVariable("p_no") int p_no){
		ResponseEntity<Integer> entity=null;
		Comment_Vo bean = new Comment_Vo();
		bean.setCo_type(co_type);
		bean.setP_no(p_no);
		try {
			entity = new ResponseEntity<>(service.countComment(bean),HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}*/
	
	//����� ����� �����ִ� ��Ʈ�ѷ�
	@RequestMapping(value="/{co_type}/{p_no}/comment/all", method=RequestMethod.GET)
	public ResponseEntity<List<Comment_Vo>> list(@PathVariable("co_type") String co_type
			,@PathVariable("p_no") int p_no){
		ResponseEntity<List<Comment_Vo>> entity=null;
		String result= convert_Type(co_type);
		Comment_Vo bean = new Comment_Vo();
		bean.setCo_type(result);
		bean.setP_no(p_no);
		try {
			entity = new ResponseEntity<>(service.listComment(bean),HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
		return entity;
	}
	
	//����� �Է��ϴ� ��Ʈ�ѷ�
	@RequestMapping(value="/{co_type}/{p_no}/comment", method=RequestMethod.POST)
	public ResponseEntity<String> register(@PathVariable("co_type") String co_type, @RequestBody Comment_Vo bean){
		ResponseEntity<String> entity=null;
		
		try {
			String result = convert_Type(co_type);
			bean.setCo_type(result);
			service.addComment(bean);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity=new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//����� �����ϴ� ��Ʈ�ѷ�
	@RequestMapping(value="/{co_type}/{p_no}/comment/{co_no}",method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("co_type") String co_type
			,@PathVariable("p_no") int p_no
			,@PathVariable("co_no") int co_no
			,@RequestBody Comment_Vo bean){
		ResponseEntity<String> entity = null;
		String result= convert_Type(co_type);
		try {
			bean.setCo_type(result);
			bean.setP_no(p_no);
			bean.setCo_no(co_no);
			service.modifyComment(bean);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity =new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	//����� �����ϴ� ��Ʈ�ѷ�
	@RequestMapping(value="/{co_type}/{p_no}/comment/{co_no}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("co_type") String co_type
			,@PathVariable("p_no") int p_no
			,@PathVariable("co_no") int co_no
			){
		ResponseEntity<String> entity =null;
		String result= convert_Type(co_type);
		try {
			Comment_Vo bean = new Comment_Vo();
			bean.setCo_type(result);
			bean.setP_no(p_no);
			bean.setCo_no(co_no);
			service.removeComment(bean);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
}//class-end
