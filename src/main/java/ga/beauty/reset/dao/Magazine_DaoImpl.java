package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Magazine_Vo;

@Repository
public class Magazine_DaoImpl implements Common_Dao<Magazine_Vo>{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Magazine_Vo> selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("magazine.selectAll");
	}

	@Override
	public void insertOne(Magazine_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.insert("magazine.insertOne",bean);
	}

	@Override
	public Magazine_Vo selectOne(Magazine_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("magazine.selectOne", bean);
	}

	@Override
	public int updateOne(Magazine_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.update("magazine.updateOne", bean);
	}

	@Override
	public int deleteOne(Magazine_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		/*return sqlSession.delete("magazine.deleteOne", bean);*/
		return sqlSession.update("magazine.deleteOne", bean);
	}

	@Override
	public int updateView(Magazine_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.update("magazine.updateView", bean);
	}

	@Override
	public List<Magazine_Vo> selectAll(Magazine_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("magazine.selectAll",bean);
	}


}
