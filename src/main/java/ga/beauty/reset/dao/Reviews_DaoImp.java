/**
 * 
 */
package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Ranks_Vo;
import ga.beauty.reset.dao.entity.Reviews_Vo;

@Repository
public class Reviews_DaoImp implements Reviews_Dao<Reviews_Vo> {
	Logger log=Logger.getLogger(getClass());
	int review_num=0;
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Ranks_Vo totAll(int item) throws SQLException {
		log.debug("DaoImp-totAll-param: "+item);
		return sqlSession.selectOne("items.totAll", item);
	}

	@Override
	public List<Reviews_Vo> reviewAll(int item) throws SQLException {
		log.debug("DaoImp-reviewAll-param: "+item);
		this.review_num=5;
		return sqlSession.selectList("items.reviewAll", item);
	}
	
	@Override
	public List<Reviews_Vo> reviewListAdd(int item) throws SQLException {
		this.review_num+=5;
		log.debug("DaoImp-reviewAdd-param: "+item+" "+this.review_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("item", item);
		map.put("review_num", this.review_num);

		return sqlSession.selectList("items.reviewListAdd", map);
	}

	@Override
	public int reviewAdd(Reviews_Vo bean) throws SQLException {
		log.debug("DaoImp-reviewAdd:"+bean);
		return sqlSession.insert("items.reviewAdd", bean);
	} 

}
