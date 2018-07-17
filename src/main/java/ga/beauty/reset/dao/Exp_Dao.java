package ga.beauty.reset.dao;

import java.sql.SQLException;

public interface Exp_Dao {
	
	public int up(String email,String type) throws SQLException;
	
	public int down(String email,String type) throws SQLException;
}
