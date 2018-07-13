package ga.beauty.reset.services;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.beauty.reset.dao.Comment_Dao;
import ga.beauty.reset.dao.entity.Comment_Vo;

@Service
public class Comment_Service {
	
	@Autowired
	Comment_Dao<Comment_Vo> commentDao;
	
	public int countComment(Comment_Vo bean) throws SQLException{
		return commentDao.count(bean);
	}
	
	public void addComment(Comment_Vo bean) throws SQLException{
		commentDao.create(bean);
	}
	
	public List<Comment_Vo> listComment(Comment_Vo bean) throws SQLException{
		return commentDao.list(bean);
	}
	
	public void modifyComment(Comment_Vo bean) throws SQLException{
		commentDao.update(bean);
	}
	
	public void removeComment(Comment_Vo bean) throws SQLException{
		commentDao.delete(bean);
	}
	
	public void removeAllComment(Comment_Vo bean) throws SQLException{
		commentDao.deleteAll(bean);
	}
}
