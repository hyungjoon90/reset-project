package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import ga.beauty.reset.dao.entity.Items_Vo;
import ga.beauty.reset.dao.entity.Rank_Vo;
import ga.beauty.reset.dao.entity.Review_Vo;

public interface Items_Dao<C> {
	
	//ranking 페이지에서만 사용
	List<C> rankAll(int type) throws SQLException;
	//ranking 상세페이지
	C selectOne(int c) throws SQLException;
	Rank_Vo totAll(int c) throws SQLException;
	Review_Vo reviewAll(int c)throws SQLException;
	
	void insertOne(C bean) throws SQLException;
	C selectOne(C bean) throws SQLException;
	int updateOne(C bean) throws SQLException;
	int deleteOne(C bean) throws SQLException;

	
}
