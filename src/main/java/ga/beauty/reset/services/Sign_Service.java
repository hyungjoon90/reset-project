package ga.beauty.reset.services;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
	
	public Sign_Service() {
	}
	
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

	
	@Transactional
	public int findPw(HttpServletRequest req) throws SQLException, NoSuchAlgorithmException {
		// TODO 비밀번호찾기 해야됨
		String emailFind = req.getParameter("emailFind");
		String phoneFind = req.getParameter("phoneFind");
		String bisnumFind = req.getParameter("bisnumFind");
		String newPwTmp = req.getParameter("tmp1");
		String newPwTmpForDB = req.getParameter("tmp2");
		if(bisnumFind==null) {
			bisnumFind ="0";
		}
		if(bisnumFind.equals("0")) {
			// 일반회원
			Members_Vo compareBean = new Members_Vo();
			compareBean.setEmail(emailFind);
			Members_Vo resultBean = members_Dao.selectOne(compareBean);
			System.out.println(resultBean);
			if(resultBean==null) return 9999;
			if(resultBean.getPhone().equals(phoneFind)) { 
				System.out.println(newPwTmp);
				System.out.println(newPwTmpForDB);
				User_Vo chBean = new User_Vo();
				chBean.setEmail(emailFind);
				chBean.setPassword(PasswordUtil.getEncryptSHA256(newPwTmpForDB+resultBean.getNick()));
				return user_Dao.updateOne(chBean);
			}
		}else {
			// 기업회원
			Companys_Vo compareBean = new Companys_Vo();
			compareBean.setEmail(emailFind);
			Companys_Vo resultBean = companys_Dao.selectOne(compareBean);
			if(resultBean==null) return 9999;
			if(resultBean.getPhone().equals(phoneFind)) {
				User_Vo chBean = new User_Vo();
				chBean.setEmail(emailFind);
				chBean.setPassword(PasswordUtil.getEncryptSHA256(newPwTmpForDB+resultBean.getBisnum()));
				return user_Dao.updateOne(chBean);
			}
		}
		return 9999;
	}


	public int updateProfile(String command, HttpSession session) throws SQLException, NoSuchAlgorithmException {
		
		if(command.equals("adds_yes")) {
			User_Vo target = new User_Vo();
			Members_Vo memGetNick = new Members_Vo();
			String email = (String)session.getAttribute("login_email");
			String nick = null;
			memGetNick.setEmail(email);
			nick = members_Dao.selectOne(memGetNick).getNick();
			target.setEmail(email);
			target.setJoin_route((String)session.getAttribute("join_route")+","+(String)session.getAttribute("login_route"));
			if(session.getAttribute("tmp")!=null) 
				target.setPassword( PasswordUtil.getEncryptSHA256((String)session.getAttribute("tmp")+nick));
			if(user_Dao.updateOne(target) ==1) {
				session.setAttribute("login_nick" ,nick);
				return 1;
			}else if(command.equals("pw_change")) {
				
				
			}
		}// adds_yes
		return 999;
	}

	
}
