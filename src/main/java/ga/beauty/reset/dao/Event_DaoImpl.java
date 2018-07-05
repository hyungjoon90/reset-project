package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Event_Vo;

@Repository
public class Event_DaoImpl implements Common_Dao<Event_Vo>{
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Event_Vo> selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("event.selectAll");
	}

	@Override
	public Event_Vo selectOne(Event_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.selectOne", bean);
	}
	
	@Override
	public void insertOne(Event_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.insert("event.insertOne", bean);
	}
	
	@Override
	public int updateOne(Event_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.update("event.updateOne", bean);
	}

	@Override
	public int deleteOne(Event_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.delete("event.deleteOne", bean);
	}



}
