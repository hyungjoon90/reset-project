package ga.beauty.reset.services;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.beauty.reset.dao.Exp_Dao;

@Service
public class Exp_Service {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Exp_Dao Exp_Dao;
	
	public int up(String email,String type) throws SQLException {
		return Exp_Dao.up(email,type); 
	}
	
	public int down(String email,String type) throws SQLException {
		return Exp_Dao.down(email,type); 
	}	
}
