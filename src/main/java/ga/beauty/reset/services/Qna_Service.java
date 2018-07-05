package ga.beauty.reset.services;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Qna_Dao;
import ga.beauty.reset.dao.entity.Qna_Vo;

@Service
public class Qna_Service {
	
	@Autowired
	Qna_Dao<Qna_Vo> Qna_Dao;
	
	public void listPage(Model model) throws SQLException {
		model.addAttribute("alist", Qna_Dao.selectAll());
		
	}
	
	public void addPage(Qna_Vo bean) throws SQLException {
		Qna_Dao.insertOne(bean);
	
	}
//
//	
//	public void deletePage(Qna_Vo bean) throws SQLException {
//		qna_Dao.deleteOne(bean);
//	}
//
//	
//	public void updatePage(Qna_Vo bean) throws SQLException {
//		qna_Dao.updateOne(bean);
//	}
	
}
