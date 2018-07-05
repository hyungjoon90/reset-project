package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import ga.beauty.reset.dao.entity.Qna_Vo;

public interface Qna_Dao<Qna_Vo> {
	
	 List<Qna_Vo> selectAll() throws SQLException;
	 void insertOne(Qna_Vo bean) throws SQLException;
	 Qna_Vo selectOne(Qna_Vo bean) throws SQLException;
	 int updateOne(Qna_Vo bean) throws SQLException;
	 int deleteOne(Qna_Vo bean) throws SQLException;
	
}
