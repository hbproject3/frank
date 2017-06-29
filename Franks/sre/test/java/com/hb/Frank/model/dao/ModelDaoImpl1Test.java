package com.hb.Frank.model.dao;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ModelDaoImpl1Test {
	ModelDao dao;
	
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		String path = "/config-context.xml";
		ApplicationContext context = new ClassPathXmlApplicationContext(path);
		dao = (ModelDao)context.getBean("modelDao");
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSo_storeList() throws SQLException {
		//List<HashMap<String, Object>> list = dao.so_storeList();
        //System.out.println(list);
		//assertTrue((dao.so_storeList()).size()>0);
//		assertNotNull((dao.so_storeListFname("�˰�")));
        //assertTrue((dao.board_list("inform")).size()>0);
        //assertTrue(dao.board_detail(43, "inform").size()>0);
		assertTrue(dao.searchListString("stock","wnum","wtype","조리기구").size()>0);

		//assertTrue(dao.searchListString("FRANCHISE", "FNUM", "FADDRESS", "부산").size()>0);
//		int row = 23;
//		int ten = 10;
//		assertSame( row / 10, 2);
//		assertTrue(dao.alarm_pagelinks().size()>0);
		//assertTrue(dao.board_list("inform").size()>0);	
		//String search_type = "cntnt";
		//assertTrue(dao.page_startEnd(2,"INFORM").size()>0);
		//assertTrue(dao.board_search(search_type, "acnt", "inform", "acntnt").size()>0);	
	}
/*
	@Test
	public void testSetSqlSession() throws SQLException {
		fail("Not yet implemented");
	}
	@Test
	public void testAd_oneInfo() {
		fail("Not yet implemented");
	}

	@Test
	public void testAd_storeRanks() {
		fail("Not yet implemented");
	}

	@Test
	public void testStk_headStocks() {
		fail("Not yet implemented");
	}

	@Test
	public void testStk_oneHeadStock() {
		fail("Not yet implemented");
	}

	@Test
	public void testStk_storeStocks() {
		fail("Not yet implemented");
	}

	@Test
	public void testStk_oneStoreStock() {
		fail("Not yet implemented");
	}

	@Test
	public void testOr_orders() {
		fail("Not yet implemented");
	}

	@Test
	public void testOr_oneOrder() {
		fail("Not yet implemented");
	}

	@Test
	public void testSo_ownerInfos() {
		fail("Not yet implemented");
	}

	@Test
	public void testSo_oneOwnerInfo() {
		fail("Not yet implemented");
	}

	@Test
	public void testSw_workerInfos() {
		fail("Not yet implemented");
	}

	@Test
	public void testSw_oneworkerInfo() {
		fail("Not yet implemented");
	}

	@Test
	public void testEdu_testSubjects() {
		fail("Not yet implemented");
	}
*/
}
