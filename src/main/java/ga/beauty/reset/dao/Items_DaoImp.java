package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Items_Vo;
import ga.beauty.reset.dao.entity.Rank_Vo;
import ga.beauty.reset.dao.entity.Review_Vo;

@Repository
public class Items_DaoImp implements Items_Dao<Items_Vo> {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	SqlSession sqlSession;
	
	public List<Items_Vo> rankAll(int cate) throws SQLException {
		// type { 1: 스킨 ,2: 로션 ,3: 에센스 }
		log.debug("DaoImp-rankAll-param: "+cate);
		return sqlSession.selectList("items.rankAll",cate);
	}
	
	public List<Items_Vo> rankAdd(int cate) throws SQLException {
		// type { 1: 스킨 ,2: 로션 ,3: 에센스 }
		log.debug("DaoImp-rankAdd-param: "+cate);
		return sqlSession.selectList("items.rankAdd", cate);
	} 

	@Override
	public Items_Vo selectOne(int item) throws SQLException {
		log.debug("DaoImp-selectOne-param: "+item);
		return sqlSession.selectOne("items.selectOne", item);
	}
	
	public Rank_Vo totAll(int item) throws SQLException{
		log.debug("DaoImp-totAll-param: "+item);
		return sqlSession.selectOne("items.totAll", item);
	}
	
	@Override
	public Review_Vo reviewAll(int item) throws SQLException {
		log.debug("DaoImp-reviewAll-param: "+item);
		return (Review_Vo) sqlSession.selectList("items.reviewAll", item);
	}

	@Override
	public void insertOne(Items_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Items_Vo selectOne(Items_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateOne(Items_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOne(Items_Vo bean) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

	
}
