package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Notice_Vo;

@Repository
public class Notice_DaoImpl implements Notice_Dao<Notice_Vo> {
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public List<Notice_Vo> selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertOne(Notice_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Notice_Vo selectOne(Notice_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateOne(Notice_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOne(Notice_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
