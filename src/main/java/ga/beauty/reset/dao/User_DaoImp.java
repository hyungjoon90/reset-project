package ga.beauty.reset.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.User_Vo;

@Repository
public class User_DaoImp implements User_Dao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public User_Vo selectOne(User_Vo bean) throws SQLException {
		System.out.println((sqlSession.selectOne("user.selectOne", bean)).toString());
		return sqlSession.selectOne("user.selectOne", bean);
	}

	@Override
	public int insertOne(User_Vo bean) throws SQLException {
		return sqlSession.selectOne("user.insertOne", bean);
	}

	@Override
	public int updateOne(User_Vo bean) throws SQLException {
		return sqlSession.selectOne("user.updateOne", bean);
	}

	@Override
	public <T> int checkInfo(T compare) {
		return sqlSession.selectOne("user.checkInfo", compare);
	}

}
