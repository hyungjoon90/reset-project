package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

public interface Comment_Dao<C> {
	public int count(C bean) throws SQLException;
	
	public List<C> list(C bean) throws SQLException;
	
	public void create(C bean) throws SQLException;
	
	public void update(C bean) throws SQLException;
	
	public void delete(C bean) throws SQLException;
	
	public void deleteAll(C bean) throws SQLException;
	
}
