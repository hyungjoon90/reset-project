package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

public interface Items_Dao<C> {
	
	//ranking 페이지에서만 사용
	List<C> rankAll(int type) throws SQLException;
	//ranking 상세페이지
	C selectOne(int c) throws SQLException;
	
	//item 검색
	List<C> itemSearch(String c,String v) throws SQLException;
}
