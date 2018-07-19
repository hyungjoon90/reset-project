package ga.beauty.reset.services;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Items_Dao;
import ga.beauty.reset.dao.entity.Items_Vo;

@Service
public class Items_Service {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Items_Dao<Items_Vo> Items_Dao;

	// 아이템 검색
	public 	List<Items_Vo> item_search(String condition, String type) throws SQLException {
		log.debug("items_servic param: "+condition+"/"+type);
		return Items_Dao.itemSearch(condition,type);
	}
	
	// 아이템 상세
	public void item_detailPage(Model model, int item) throws SQLException {
		log.debug("param: "+item);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//tag.start
		Items_Vo bean = Items_Dao.selectOne(item);
		log.debug(bean.getTags());
		String tempStr="";
		tempStr=bean.getTags().toString();
		
		StringTokenizer tokens = new StringTokenizer( tempStr, "$" );
		List<String> list=new ArrayList<String>();
		while(tokens.hasMoreTokens()) {
			list.add(tokens.nextToken());
		}
		log.debug(list.size());
		//tag.end
		
		log.debug(bean);
		if(!bean.getImg().equals("")) {
			log.debug("확인"+bean.getImg());
			String temp=bean.getImg();
			log.debug(temp);
			String[] temp2=temp.split("_s_");
			bean.setImg(temp2[0]+temp2[1]);
		}
		
		
		model.addAttribute("item_bean", bean);
		model.addAttribute("tags", list);
		model.addAttribute("map", map);
		
	}
	
	// 아이템 추가
		public int item_add(Items_Vo bean) throws SQLException, IOException {
			
			if(Items_Dao.itemAdd(bean)==1) {
				return Items_Dao.rankAdd(bean);
			}else {
				return 0;
			}
		}
	
	// 아이템 수정
	public int item_update(int option,Items_Vo bean) throws SQLException, IOException {
		log.debug("updatePage param: "+option+" "+bean);
		return Items_Dao.itemUpdate(option, bean);
	}
		
	// 아이템 삭제
	public int item_delete(int item) throws SQLException, IOException {
		log.debug("deletePage param: "+item);
		return Items_Dao.itemDelete(item);
	}
}

