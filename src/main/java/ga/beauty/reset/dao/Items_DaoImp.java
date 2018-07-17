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
	
	@Override
	public List<Items_Vo> rankAll(int cate) throws SQLException {
		// type { 1: 스킨 ,2: 로션 ,3: 에센스 }
		log.debug("DaoImp-rankAll-param: "+cate);
		return sqlSession.selectList("items.rankAll",cate);
	}
	
	@Override
	public List<Items_Vo> rankListAdd(int cate) throws SQLException {
		// type { 1: 스킨 ,2: 로션 ,3: 에센스 }
		log.debug("DaoImp-rankAdd-param: "+cate);
		return sqlSession.selectList("items.rankListAdd", cate);
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
			return sqlSession.selectList("items.itemName", map);
		}else {
			return null;
		}
	}
	
	@Override
	public int itemAdd(Items_Vo bean) throws SQLException {
		log.debug("DaoImp-itemAdd:"+bean);
		return sqlSession.insert("items.itemAdd", bean);
	}
	
	@Override
	public int rankAdd(Items_Vo bean) throws SQLException {
		return sqlSession.insert("items.rankAdd", bean);
	}


	@Override
	public int itemUpdate(int option, Items_Vo bean) throws SQLException {
		if(option==1) {
			log.debug("확인"+bean.getImg());
			StringBuffer sb=new StringBuffer(bean.getImg());
			sb.insert(26,"#$#");
			log.debug("재확인: "+sb);
			String temp=sb.toString();
			bean.setImg(temp);
		}
		return sqlSession.update("items.itemUpdate",bean);
	}
	
	@Override
	public int itemDelete(int item) throws SQLException {
		log.debug("DaoImp-itemDel: "+item);
		return sqlSession.delete("items.itemDel",item);
	}

}
