package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Companys_Vo;

@Repository
public class Companys_DaoImp implements Companys_Dao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Companys_Vo selectOne(Companys_Vo bean) throws SQLException {
		return sqlSession.selectOne("companys.selectOne", bean);
	}

	@Override
	public List<Companys_Vo> selectAll() throws SQLException {
		return sqlSession.selectList("companys.selectAll");
	}

	@Override
	public List<Companys_Vo> selectAllLimit(Map map) throws SQLException {
		return sqlSession.selectList("companys.selectAllLimit", map);
	}
	
	@Override
	public int totCount(Map map) throws SQLException {
		return sqlSession.selectOne("companys.totCount",map);
	}
	
	
	@Override
	public int insertOne(Companys_Vo bean) throws SQLException {
		return sqlSession.insert("companys.insertOne", bean);
	}

	@Override
	public int updateOne(Companys_Vo bean) throws SQLException {
		return sqlSession.update("companys.updateOne", bean);
	}

	@Override
	public int deleteOne(Companys_Vo bean) throws SQLException {
		return 0;
	}


}
