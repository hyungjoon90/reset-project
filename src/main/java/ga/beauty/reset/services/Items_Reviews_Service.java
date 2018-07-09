package ga.beauty.reset.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Items_Dao;
import ga.beauty.reset.dao.Reviews_Dao;
import ga.beauty.reset.dao.entity.Items_Vo;
import ga.beauty.reset.dao.entity.Ranks_Vo;
import ga.beauty.reset.dao.entity.Reviews_Vo;

@Service
public class Items_Reviews_Service {
	Logger log=Logger.getLogger(getClass());
	
	@Autowired
	Items_Dao<Items_Vo> Items_Dao;
	
	@Autowired
	Reviews_Dao<Reviews_Vo> Reviews_Dao;
	
	public void listPage(Model model,int type) throws SQLException {
		log.debug("param: "+type);
		model.addAttribute("alist", Items_Dao.rankAll(type));
		model.addAttribute("cate", type);
	}
	
	public void detailPage(Model model,int item) throws SQLException{
		log.debug("param: "+item);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//tag.start
		Items_Vo temp = Items_Dao.selectOne(item);
		log.debug(temp.getTags());
		String tempStr="";
		tempStr=temp.getTags().toString();
		
		StringTokenizer tokens = new StringTokenizer( tempStr, "$" );
		List<String> list=new ArrayList<String>();
		while(tokens.hasMoreTokens()) {
			list.add(tokens.nextToken());
		}
		log.debug(list.size());
		//tag.end
		
		//tot start
		Ranks_Vo rank=Reviews_Dao.totAll(item);
		int total=rank.getOne()+rank.getTwo()+rank.getThree()+rank.getFour()+rank.getFive();
		log.debug("total: "+total);
		map.put("total", total);
		int one= rank.getOne()*100/total;
		int two= rank.getTwo()*100/total;
		int three= rank.getThree()*100/total;
		int four= rank.getFour()*100/total;
		int five= rank.getFive()*100/total;
		log.debug("avg: "+one+" "+two+" "+three+" "+four+" "+five);
		map.put("one", one);
		map.put("two", two);
		map.put("three", three);
		map.put("four", four);
		map.put("five", five);
		//tot end
		
		model.addAttribute("item_bean", Items_Dao.selectOne(item));
		model.addAttribute("tags", list);
		model.addAttribute("map", map);
		model.addAttribute("review_bean", Reviews_Dao.reviewAll(item));
	}
}

