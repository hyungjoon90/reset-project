package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import ga.beauty.reset.dao.entity.Companys_Vo;

public interface Companys_Dao{

	Companys_Vo selectOne(Companys_Vo bean) throws SQLException;
	List<Companys_Vo> selectAll() throws SQLException;
	int insertOne(Companys_Vo otherBean) throws SQLException;
	int updateOne(Companys_Vo bean) throws SQLException;
	int deleteOne(Companys_Vo bean) throws SQLException;
	
}
