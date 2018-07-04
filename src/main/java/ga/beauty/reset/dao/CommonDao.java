package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;


import ga.beauty.reset.dao.CommonDao;

public interface CommonDao {

	<C> List<C> selectAll() throws SQLException;
	<C> void insertOne(C bean) throws SQLException;
	<C> C selectOne(C bean) throws SQLException;
	<C> int updateOne(C bean) throws SQLException;
	<C> int deleteOne(C bean) throws SQLException;
	
}
