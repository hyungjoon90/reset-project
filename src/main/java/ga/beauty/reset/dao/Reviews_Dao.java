package ga.beauty.reset.dao;

import java.sql.SQLException;
import java.util.List;

import ga.beauty.reset.dao.entity.Items_Vo;
import ga.beauty.reset.dao.entity.Ranks_Vo;
import ga.beauty.reset.dao.entity.Reviews_Vo;

public interface Reviews_Dao<C> {
	Ranks_Vo totAll(int c) throws SQLException;
	List<C> reviewAll(int c)throws SQLException;
	List<C> reviewListAdd(int c) throws SQLException;
	int reviewAdd(C c) throws SQLException;
	Reviews_Vo reviewOne(int c, int v) throws SQLException;
	int reviewUpdate(C C) throws SQLException;
	int reviewDelete(C C) throws SQLException;
	int cartAdd(int c,String v) throws SQLException;
}
