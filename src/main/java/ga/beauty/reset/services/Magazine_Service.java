package ga.beauty.reset.services;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Common_Dao;
import ga.beauty.reset.dao.entity.Event_Vo;
import ga.beauty.reset.dao.entity.Magazine_Vo;

@Service
public class Magazine_Service {
	@Autowired
	Common_Dao<Magazine_Vo> commonDao;
	
	public Magazine_Service() {
	}
	
	public void listPage(Model model) throws SQLException{
		model.addAttribute("alist",commonDao.selectAll());
	}
	
	public void detailPage(Model model,Magazine_Vo bean) throws SQLException{
		model.addAttribute("detail",commonDao.selectOne(bean));
	}
	
	public void addPage(Magazine_Vo bean) throws SQLException{
		commonDao.insertOne(bean);
	}
	
	public void updatePage(Magazine_Vo bean) throws SQLException{
		commonDao.updateOne(bean);
	}
	
	public void deletePage(Magazine_Vo bean) throws SQLException{
		commonDao.deleteOne(bean);
	}
}
