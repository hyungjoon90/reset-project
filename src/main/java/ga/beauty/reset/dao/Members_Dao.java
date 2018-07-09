package ga.beauty.reset.dao;

import java.sql.SQLException;

import ga.beauty.reset.dao.entity.Members_Vo;

public interface Members_Dao extends Common_Dao<Members_Vo> {
	public <T> int checkInfo(T compare) throws SQLException;
}
