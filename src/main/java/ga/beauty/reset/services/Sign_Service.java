package ga.beauty.reset.services;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import ga.beauty.reset.dao.Companys_Dao;
import ga.beauty.reset.dao.Members_Dao;
import ga.beauty.reset.dao.User_Dao;
import ga.beauty.reset.dao.entity.Companys_Vo;
import ga.beauty.reset.dao.entity.Members_Vo;
import ga.beauty.reset.dao.entity.User_Vo;

@Service
public class Sign_Service {

	@Autowired
	User_Dao user_Dao;

	@Autowired
	Members_Dao members_Dao;

	@Autowired
	Companys_Dao companys_Dao;
	
	@Transactional
	public <C> int signUp(User_Vo userBean, C otherBean) throws SQLException {
		int resultUser=0, resultOther=0;
		if(otherBean instanceof Members_Vo) {
			resultUser = user_Dao.insertOne(userBean);
			resultOther = members_Dao.insertOne((Members_Vo) otherBean);
		}else if(otherBean instanceof Companys_Vo) {
			resultUser = user_Dao.insertOne(userBean);
			resultOther = companys_Dao.insertOne( (Companys_Vo) otherBean);
		}
		System.out.println(resultUser+"/"+resultOther);
		return 0;
	}
	
	public <T> int checkSomething(String checkCode, T compare ) throws SQLException {
		boolean result = false;
		if("check_nick".equals(checkCode)) {
			return members_Dao.checkInfo(compare);
		}else if("check_mail".equals(checkCode)){
			// 이메일 중복체크
			return members_Dao.checkInfo(compare);
		}
		
		return 9999;
	}
	
}
