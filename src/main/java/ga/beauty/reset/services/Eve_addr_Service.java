package ga.beauty.reset.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Common_Dao;
import ga.beauty.reset.dao.entity.Eve_addr_Vo;

@Service
public class Eve_addr_Service {

	@Autowired
	Common_Dao<Eve_addr_Vo> commonDao;
	
	public void listPage(Model model,Eve_addr_Vo bean) throws SQLException{
		model.addAttribute("detail",commonDao.selectAll(bean));
	}
	
	public void addPage(Eve_addr_Vo bean) throws SQLException{
		commonDao.insertOne(bean);
	}
}
