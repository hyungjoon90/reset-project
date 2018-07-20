package ga.beauty.reset.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ga.beauty.reset.dao.Comment_Dao;
import ga.beauty.reset.dao.entity.Comment_Vo;
import ga.beauty.reset.dao.entity.Magazine_Vo;
import ga.beauty.reset.utils.runner.Common_Listener;
import ga.beauty.reset.utils.runner.Magzine_Listener;

@Service
public class Comment_Service {
	
	@Autowired
	Comment_Dao<Comment_Vo> commentDao;
	
	@Autowired
	@Qualifier("magzine_Listener")
	Common_Listener magzine_Listener;

	public Comment_Service() {
	}
	
	public int countComment(Comment_Vo bean) throws SQLException{
		return commentDao.count(bean);
	}
	
	@Transactional
	public void addComment(Comment_Vo bean) throws Exception{
		commentDao.create(bean);
		if(bean.getCo_type().equals("매거진")) {
			Magazine_Vo target = new Magazine_Vo();
			target.setMag_no(bean.getP_no());
			magzine_Listener.addLog(target, "num", -1);
		}
	}
	
	public List<Comment_Vo> listComment(Comment_Vo bean) throws SQLException{
		return commentDao.list(bean);
	}
	
	public void modifyComment(Comment_Vo bean) throws SQLException{
		commentDao.update(bean);
	}
	
	@Transactional
	public void removeComment(Comment_Vo bean) throws Exception{
		commentDao.delete(bean);
		if(bean.getCo_type().equals("매거진")) {
			Magazine_Vo target = new Magazine_Vo();
			target.setMag_no(bean.getP_no());
			magzine_Listener.addLog(target, "num", -1);
		}
	}
	
	public void removeAllComment(Comment_Vo bean) throws SQLException{
		commentDao.deleteAll(bean);
	}
}
