package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

public interface Items_Dao<C> {
	
	//ranking 페이지에서만 사용할 selectAll
	List<C> rankAll(int type) throws SQLException;
	
	List<C> selectAll() throws SQLException;
	void insertOne(C bean) throws SQLException;
	C selectOne(C bean) throws SQLException;
	int updateOne(C bean) throws SQLException;
	int deleteOne(C bean) throws SQLException;
	
	
}
