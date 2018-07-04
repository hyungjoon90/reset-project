package ga.beauty.reset.services;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.CommonDao;
import ga.beauty.reset.dao.entity.Event_Vo;

@Service
public class Event_Service {
	@Autowired
	CommonDao<Event_Vo> commonDao;
	
	public void listPage(Model model,Event_Vo bean) throws SQLException{
		model.addAttribute("alist",commonDao.selectAll());
	}
	
	public void addPage(Event_Vo bean) throws SQLException{
		commonDao.insertOne(bean);
	}
	
	public void updatePage(Event_Vo bean) throws SQLException{
		commonDao.updateOne(bean);
	}
	
	public void deletePage(Event_Vo bean) throws SQLException{
		commonDao.deleteOne(bean);
	}
}
