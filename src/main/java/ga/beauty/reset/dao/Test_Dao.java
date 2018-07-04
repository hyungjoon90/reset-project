package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;


import ga.beauty.reset.dao.entity.Test_Vo;

public interface Test_Dao {

	List<Test_Vo> selectAll() throws SQLException;
	Test_Vo selectOne(int sabun) throws SQLException;
	int updateOne(Test_Vo bean) throws SQLException;
	int deleteOne(int sabun) throws SQLException;
	
	
}
