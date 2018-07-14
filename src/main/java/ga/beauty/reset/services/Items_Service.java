package ga.beauty.reset.services;


import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.beauty.reset.dao.Items_Dao;
import ga.beauty.reset.dao.entity.Items_Vo;

@Service
public class Items_Service {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Items_Dao<Items_Vo> Items_Dao;
		
	// 아이템 검색
	public 	List<Items_Vo> item_searchPage(String condition, String type) throws SQLException {
		log.debug("items_servic param: "+condition+"/"+type);
		return Items_Dao.itemSearch(condition,type);
	}
	
}

