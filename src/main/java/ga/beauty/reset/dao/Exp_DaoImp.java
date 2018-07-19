package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Exp_DaoImp implements Exp_Dao {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	SqlSession sqlSession;

	
	//TODO exp service 쪽으로 옮기기
	@Override
	public int up(String email, String type) throws SQLException {
		int exp=0;
		if(type.equals("review")) {
			exp=10;
		}else if(type.equals("comment")) {
			exp=5;
		}else if(type.equals("like")) {
			exp=1;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("exp", exp);
		return sqlSession.update("exp.expUp",map);
	}

	@Override
	public int down(String email, String type) throws SQLException {
		int exp=0;
		if(type.equals("review")) {
			exp=10;
		}else if(type.equals("comment")) {
			exp=5;
		}else if(type.equals("like")) {
			exp=1;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("exp", exp);
		return sqlSession.update("exp.expDown",map);
	}

}
