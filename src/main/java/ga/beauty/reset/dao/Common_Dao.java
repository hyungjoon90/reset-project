package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;


import ga.beauty.reset.dao.Common_Dao;
import ga.beauty.reset.dao.entity.Members_Vo;

public interface Common_Dao<C> {

	C selectOne(C bean) throws SQLException;
	List<C> selectAll() throws SQLException;
	int insertOne(C otherBean) throws SQLException;
	int updateOne(C bean) throws SQLException;
	int deleteOne(C bean) throws SQLException;
}
