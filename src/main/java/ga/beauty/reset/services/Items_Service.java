package ga.beauty.reset.services;

import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Items_Dao;
import ga.beauty.reset.dao.entity.Items_Vo;

@Service
public class Items_Service {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Items_Dao<Items_Vo> Items_Dao;
	
	public void listPage(Model model,int type) throws SQLException {
		log.debug("param: "+type);
		model.addAttribute("alist", Items_Dao.rankAll(type));
		model.addAttribute("cate", type);
	}
	
	public void detailPage(Model model,int item) throws SQLException{
		log.debug("param: "+item);
		model.addAttribute("bean", Items_Dao.selectOne(item));
	}
}
