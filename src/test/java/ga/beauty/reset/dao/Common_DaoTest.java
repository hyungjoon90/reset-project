package ga.beauty.reset.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import ga.beauty.reset.dao.entity.TestVo;


public class Common_DaoTest {

	
	private static SqlSession sqlSession;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		Resource resource = new ClassPathResource("applicationContext.xml");
		XmlBeanFactory factory = new XmlBeanFactory(resource);
		sqlSession = (SqlSession) factory.getBean("sqlSession");
	}


	@Test
	public void testSelectAll() throws SQLException {
		List<TestVo> list =(List<TestVo>) sqlSession.getMapper(Common_Dao.class).selectAll();
		assertNotNull(list);
		assertTrue(list.size()>0);
		System.out.println(list.toString());
	}

}
