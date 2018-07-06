package ga.beauty.reset.services;

import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

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
	
	public void listPage(Model model,int type) throws SQLException {
		log.debug("param: "+type);
		model.addAttribute("alist", Items_Dao.rankAll(type));
		model.addAttribute("cate", type);
	}
	
	public void detailPage(Model model,int item) throws SQLException{
		log.debug("param: "+item);
		Items_Vo temp = Items_Dao.selectOne(item);
		log.debug(temp.getTags());
		String tempStr="";
		tempStr=temp.getTags().toString();
		String[] array = tempStr.split("$");
		log.debug("분리후 "+array[0]);
		
		StringTokenizer tokens = new StringTokenizer( tempStr, "$" );
		log.debug(tokens.nextToken());
		log.debug(tokens.nextToken());
		
		model.addAttribute("bean", Items_Dao.selectOne(item));
	}
}
