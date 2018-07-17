package ga.beauty.reset.dao;

import java.sql.SQLException;

import ga.beauty.reset.dao.entity.Likes_Vo;

public interface Likes_Dao<C> {
	
	public Likes_Vo check(C bean) throws SQLException;
	
	public int likesAdd(C bean) throws SQLException;
	
	public int likesDel(C bean) throws SQLException;
	
	public int up(C bean) throws SQLException;
	
	public int down(C bean) throws SQLException;
	
}
