package ga.beauty.reset.services;

import java.sql.SQLException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.beauty.reset.dao.Likes_Dao;
import ga.beauty.reset.dao.entity.Likes_Vo;


@Service
public class Likes_Service {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Likes_Dao<Likes_Vo> Likes_Dao;
	
	public Likes_Vo check(Likes_Vo bean) throws SQLException {
		log.debug("likes_dao param: "+bean);
		return Likes_Dao.check(bean);
	}
	
	public int up(Likes_Vo bean) throws SQLException {
		Likes_Dao.likesAdd(bean);
		return Likes_Dao.up(bean); 
	}
	
	public int down(Likes_Vo bean) throws SQLException {
		Likes_Dao.likesDel(bean);
		return Likes_Dao.down(bean); 
	}
}
