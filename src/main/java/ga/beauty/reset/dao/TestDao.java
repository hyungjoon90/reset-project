package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import ga.beauty.reset.dao.entity.Qna_Vo;
import ga.beauty.reset.dao.entity.TestVo;

public interface TestDao {

	List<TestVo> selectAll() throws SQLException;
	TestVo selectOne(int sabun) throws SQLException;
	int updateOne(TestVo bean) throws SQLException;
	int deleteOne(int sabun) throws SQLException;
	
	
}
