package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;


import ga.beauty.reset.dao.entity.CommonDao;

public interface CommonDao {

	<C> List<C> selectAll() throws SQLException;
	<C> insertOne(C bean) throws SQLException;
	<C> void selectOne(C bean) throws SQLException;
	<C> int updateOne(C bean) throws SQLException;
	<C> int deleteOne(C bean) throws SQLException;
	
}
