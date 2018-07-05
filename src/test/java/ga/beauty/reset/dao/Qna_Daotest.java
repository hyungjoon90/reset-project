package ga.beauty.reset.dao;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import ga.beauty.reset.dao.entity.Qna_Vo;

public class Qna_Daotest {

	private static SqlSession sqlsession;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSelectAll() {

		
Qna_Vo question = new Qna_Vo();
question.setEmail("email : 질문자 email");
question.setAnswer("answer : 리셋의 답변입니다");
question.setCon("con : 질문 내용입니다");
question.setQa_type();		
	}

}
