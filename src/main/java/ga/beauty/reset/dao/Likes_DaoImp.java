package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Likes_Vo;

@Repository
public class Likes_DaoImp implements Likes_Dao<Likes_Vo> {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	SqlSession sqlSession;
	
	String convert_err = "co_type error";
	
	private String convert_Type(String type) {
		// co_type를 영어에서 한글로 바꾸는 메소드 입니다.
		if(type.equals("event")){
			return type="이벤트";
		}else if(type.equals("magazine")) {
			return type="매거진";
		}else if(type.equals("review")) {
			return type="리뷰";
		}else {
			return convert_err;
		}
	}
	
	
	@Override
	public Likes_Vo check(Likes_Vo bean) throws SQLException {
		log.debug("like_dao_param: "+bean);
		bean.setType(convert_Type(bean.getType()));
		return sqlSession.selectOne("likes.likes", bean);
	}

	@Override
	public int likesAdd(Likes_Vo bean) throws SQLException {
		log.debug("like_dao_param: "+bean);
		bean.setType(convert_Type(bean.getType()));
		return sqlSession.insert("likes.likesAdd", bean);
	}
	
	@Override
	public int likesDel(Likes_Vo bean) throws SQLException {
		log.debug("like_dao_param: "+bean);
		bean.setType(convert_Type(bean.getType()));
		return sqlSession.delete("likes.likesDel", bean);
	}
	
	@Override
	public int up(Likes_Vo bean) throws SQLException {
		log.debug("like_dao_param: "+bean);
		String type_no=null;
		if(bean.getType().equals("리뷰")) {
			bean.setType("review");
			type_no="rev_no";
		}else if(bean.getType().equals("매거진")) {
			bean.setType("magazine");
			type_no="mag_no";
		}else if(bean.getType().equals("이벤트")) {
			bean.setType("event");
			type_no="eve_no";
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", bean.getType());
		map.put("type_no", type_no);
		map.put("p_no", bean.getP_no());
		
		return sqlSession.update("likes.likesUp", map);
	}

	@Override
	public int down(Likes_Vo bean) throws SQLException {
		log.debug("like_dao_param: "+bean);
		
		String type_no=null;
		if(bean.getType().equals("리뷰")) {
			bean.setType("review");
			type_no="rev_no";
		}else if(bean.getType().equals("매거진")) {
			bean.setType("magazine");
			type_no="mag_no";
		}else if(bean.getType().equals("이벤트")) {
			bean.setType("event");
			type_no="eve_no";
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("type", bean.getType());
		map.put("type_no", type_no);
		map.put("p_no", bean.getP_no());
		
		return sqlSession.update("likes.likesDown",map);
	}


}
