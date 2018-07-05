package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.entity.Qna_Vo;

@Repository
public class Qna_DaoImpl implements Qna_Dao<Qna_Vo> {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public Qna_DaoImpl() {
	
	}
	
	
	@Override
	public List<Qna_Vo> selectAll() throws SQLException {
		System.out.println(sqlSession);
		return sqlSession.selectList("qna_mapper.selectAll");
	}

	@Override
	public void insertOne(Qna_Vo bean) throws SQLException {
		sqlSession.insert("qna_mapper.insertOne", bean);
	}

	@Override
	public Qna_Vo selectOne(Qna_Vo bean) throws SQLException {
		return null;
	}

	@Override
	public int updateOne(Qna_Vo bean) throws SQLException {
		return 0;
	}

	@Override
	public int deleteOne(Qna_Vo bean) throws SQLException {
		return 0;
	}

	
	

}
