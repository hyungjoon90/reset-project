package ga.beauty.reset.services;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ga.beauty.reset.dao.Companys_Dao;
import ga.beauty.reset.dao.Members_Dao;
import ga.beauty.reset.dao.User_Dao;
import ga.beauty.reset.dao.entity.Companys_Vo;
import ga.beauty.reset.dao.entity.Members_Vo;
import ga.beauty.reset.dao.entity.User_Vo;
import ga.beauty.reset.utils.PasswordUtil;

@Service
public class Sign_Service {

	@Autowired
	User_Dao user_Dao;

	@Autowired
	Members_Dao members_Dao;

	@Autowired
	Companys_Dao companys_Dao;
	
	@Transactional
	public <C> int signUp(User_Vo userBean, C otherBean) throws SQLException, NoSuchAlgorithmException {
		int resultUser=0, resultOther=0;
		if(otherBean instanceof Members_Vo) {
			Members_Vo memberBean = (Members_Vo) otherBean;
			String newPw = null;
			if(userBean.getUser_type().equals("일반")) {
			// salt 값으로 닉네임
			// 뒤에 붙임	
				newPw = PasswordUtil.getEncryptSHA256(userBean.getPassword()+memberBean.getNick());
				userBean.setPassword(newPw);
			}
			resultUser = user_Dao.insertOne(userBean);
			resultOther = members_Dao.insertOne(memberBean);
		}else if(otherBean instanceof Companys_Vo) {
			Companys_Vo companyBean = (Companys_Vo) otherBean;
			String newPw = null;
			if(userBean.getUser_type().equals("일반")) {
			// salt 값으로 사업자번호
				newPw = PasswordUtil.getEncryptSHA256(userBean.getPassword()+companyBean.getBisnum());
				userBean.setPassword(newPw);
			}
			resultUser = user_Dao.insertOne(userBean);
			resultOther = companys_Dao.insertOne( (Companys_Vo) companyBean);
		}
		if(resultUser==1 && resultOther ==1) return 200;
		else return 9999;
	}
	
	public int checkSomething(String checkCode, String target ) throws SQLException {
		boolean result = false;
		if("check_nick".equals(checkCode)) {
			Members_Vo compare = new Members_Vo();
			compare.setNick(target);
			return members_Dao.checkInfo(compare);
		}else if("check_mail".equals(checkCode)){
			User_Vo compare = new User_Vo();
			compare.setEmail(target);
			return user_Dao.checkInfo(compare);
		}
		return 9999;
	}

	public String findPw(HttpServletRequest req) {
		// TODO 비밀번호찾기 해야됨
		String emailFind = req.getParameter("emailFind");
		String phoneFind = req.getParameter("emailFind");
		String bisnumFind = req.getParameter("bisnumFind");
		
		return null;
	}


	public int updateProfile(User_Vo target) throws SQLException {
		// TODO Auto-generated method stub
		return user_Dao.updateOne(target);
	}

	
}
