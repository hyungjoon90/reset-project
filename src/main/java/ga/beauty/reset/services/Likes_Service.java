package ga.beauty.reset.services;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ga.beauty.reset.dao.Likes_Dao;
import ga.beauty.reset.dao.entity.Likes_Vo;


@Service
public class Likes_Service {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Likes_Dao<Likes_Vo> Likes_Dao;
	
	@Autowired
	SqlSession sqlSession;
	
	public Likes_Vo check(Likes_Vo bean) throws SQLException {
		log.debug("likes_dao param: "+bean);
		bean.setType(convert_Type(bean.getType()));
		return Likes_Dao.check(bean);
	}
	
	@Transactional
	public Map up(Likes_Vo bean) throws SQLException {
		log.debug("bean"+bean);
		bean.setType(convert_Type(bean.getType()));
		Likes_Dao.likesAdd(bean);//insert하고

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
		Map<String, Object> map2 = new HashMap<String, Object>();
		map.put("type", bean.getType());
		map.put("type_no", type_no);
		map.put("p_no", bean.getP_no());
		int result=Likes_Dao.up(map);//1을 추가시킴
		int like=Likes_Dao.likesCheck(map);//좋아요 수를 확인
		
		map2.put("result", result);
		map2.put("like",like);
		return map2;
	}
	
	@Transactional
	public Map down(Likes_Vo bean) throws SQLException {
		log.debug("bean"+bean);
		bean.setType(convert_Type(bean.getType()));
		Likes_Dao.likesDel(bean);//Del하고
		
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
		Map<String, Object> map2 = new HashMap<String, Object>();
		map.put("type", bean.getType());
		map.put("type_no", type_no);
		map.put("p_no", bean.getP_no());
		int result=Likes_Dao.down(map);//1을 추가시킴
		int like=Likes_Dao.likesCheck(map);//좋아요 수를 확인
		
		map2.put("result", result);
		map2.put("like",like);
		return map2;
	}
	
	
	private String convert_Type(String type) {
		// co_type를 영어에서 한글로 바꾸는 메소드 입니다.
		if(type.equals("event")){
			return type="이벤트";
		}else if(type.equals("magazine")) {
			return type="매거진";
		}else if(type.equals("review")) {
			return type="리뷰";
		}else {
			return type="에러";
		}
	}
}
