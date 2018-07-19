package ga.beauty.reset.dao;

import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ga.beauty.reset.dao.entity.Members_Vo;
import ga.beauty.reset.dao.entity.Ranks_Vo;
import ga.beauty.reset.dao.entity.Reviews_Vo;

@Repository
public class Reviews_DaoImp implements Reviews_Dao<Reviews_Vo> {
	Logger log=Logger.getLogger(getClass());
	
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
		return sqlSession.selectList("reviews.reviewAll", item);
	}
	
	//TODO: 3.크롤링 dao 부분
	@Override
	public List<Reviews_Vo> reviewListAdd(int item,int review_num) throws SQLException {
		log.debug("DaoImp-reviewAdd-param: "+item+" "+review_num);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("item", item);
		map.put("review_num", review_num);
		return sqlSession.selectList("reviews.reviewListAdd", map);
	}

	@Override
	public int reviewAdd(Reviews_Vo bean) throws SQLException {
		log.debug("DaoImp-reviewAdd:"+bean);
		return sqlSession.insert("reviews.reviewAdd", bean);
	}

	@Override
	public Reviews_Vo reviewOne(int item,int rev_no) throws SQLException {
		log.debug("param: "+item+" "+rev_no);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("item", item);
		map.put("rev_no", rev_no);
		
		return sqlSession.selectOne("reviews.reviewOne", map);
	}
	
	@Override
	public int reviewUpdate(Reviews_Vo bean) throws SQLException {
		return sqlSession.update("reviews.reviewUpdate",bean);
	}
	
//	@Override // TODO 충희씨 확인바람
//	public int reviewUpdate(int option,Reviews_Vo bean) throws SQLException {
//		if(option==1) {
//			log.debug("확인"+bean.getImg());
//			StringBuffer sb=new StringBuffer(bean.getImg());
//			sb.insert(26,"s_");
//			log.debug("재확인: "+sb);
//			String temp=sb.toString();
//			bean.setImg(temp);
//		}
//		return sqlSession.update("reviews.reviewUpdate",bean);
//	}

	@Override
	public int reviewDelete(String filePath,Reviews_Vo bean) throws SQLException {
		
		bean=sqlSession.selectOne("reviews.reviewOne", bean);
		//open=0으로 인한 생략
//		filePath=filePath.replaceFirst("imgs/upload_imgs", "");
//		if(!bean.getImg().equals("")) {
//			log.debug(filePath+bean.getImg());
//			String temp=filePath+bean.getImg();
//			log.debug(temp);
//			temp.replace("/", "\\");
//			log.debug(temp);
//			File file1 = new File(temp);
//			file1.delete();
//			
//			String[] temp2=temp.split("s_");
//			temp=temp2[0]+temp2[1];
//			log.debug(temp);
//			File file2 = new File(temp);
//			file2.delete();
//		}
		return sqlSession.delete("reviews.reviewDelete", bean);
	}

	@Override
	public int cartAdd(int item, String email) throws SQLException {
		log.debug("DaoImp param: "+item+" "+email);
		
		Members_Vo member=sqlSession.selectOne("items.cartAll", email);
		log.debug(member.getCart());
		String cart=member.getCart();
		
		String temp="@"+item;
		log.debug(cart.contains(temp));
		
		if(!cart.contains(temp)) {
		cart+="@"+item;
		log.debug("변경"+cart);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cart", cart);
		map.put("email", email);
		
		return sqlSession.insert("items.cartAdd",map);
		} else {
			return 3;
		}
		
	}

	@Override
	public int reviewTot(int item) throws SQLException {
		return sqlSession.selectOne("reviews.reviewTot", item);
	}


}
