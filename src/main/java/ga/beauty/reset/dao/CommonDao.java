package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;


import ga.beauty.reset.dao.CommonDao;

public interface CommonDao<C> {

	List<C> selectAll() throws SQLException;
	void insertOne(C bean) throws SQLException;
	C selectOne(C bean) throws SQLException;
	int updateOne(C bean) throws SQLException;
	int deleteOne(C bean) throws SQLException;
	
}
