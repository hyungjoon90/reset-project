package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Items_Vo;

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

	@Override
	public List<Items_Vo> itemSearch(String condition,String type) throws SQLException {
		log.debug("DaoImp-itemSearch-param: "+condition+"/"+type);
		if(type.equals("brand")) {
			log.debug("브랜드 검색");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("brand", condition);
			return sqlSession.selectList("items.itemBrand", map);
		}else if(type.equals("name")) {
			log.debug("이름 검색");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("name", condition);
			log.debug(sqlSession.selectList("items.itemName", map));
			return sqlSession.selectList("items.itemName", map);
		}else {
			return null;
		}
	}
	
	
}
