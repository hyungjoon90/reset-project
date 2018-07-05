package ga.beauty.reset.services;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Notice_Dao;
import ga.beauty.reset.dao.entity.Notice_Vo;

@Service
public class Notice_Service {

	@Autowired
	Notice_Dao notice_Dao;
	
	public void listPage(Model model) throws SQLException {
		model.addAttribute("alist", notice_Dao.selectAll());
	}
	
	public void addPage(Notice_Vo bean) throws SQLException {
		notice_Dao.insertOne(bean);
	}
	
	public void deletePage(Notice_Vo bean) throws SQLException {
		notice_Dao.deleteOne(bean);
		
	}
	
	public void updatePage(Notice_Vo bean) throws SQLException {
		notice_Dao.updateOne(bean);
	}
	
}
