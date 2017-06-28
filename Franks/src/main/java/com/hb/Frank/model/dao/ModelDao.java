package com.hb.Frank.model.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hb.Frank.model.dto.AdminVo;
import com.hb.Frank.model.dto.HeadStockVo;
import com.hb.Frank.model.dto.OrderVo;
import com.hb.Frank.model.dto.StoreEduVo;
import com.hb.Frank.model.dto.StoreOwnerVo;
import com.hb.Frank.model.dto.StoreStockVo;
import com.hb.Frank.model.dto.StoreWorkerVo;

public interface ModelDao {
	//admin
	AdminVo ad_oneInfo(int sabun) throws SQLException;
	List<HashMap<String, Object>> ad_storeRanks() throws SQLException;
	
	
	//stock
	List<HeadStockVo> stk_headStocks() throws SQLException;
	HeadStockVo stk_oneHeadStock(int stockNum, String stockName) throws SQLException;
	List<StoreStockVo> stk_storeStocks() throws SQLException;
	StoreStockVo stk_oneStoreStock(int stockNum, String stockName) throws SQLException;
	
	//order
	List<OrderVo> or_orders() throws SQLException;
	OrderVo or_oneOrder(int storeNum, String storeName, String stockName) throws SQLException;
	
	//store owner	
	List<StoreOwnerVo> so_ownerInfos() throws SQLException;
	StoreOwnerVo so_oneOwnerInfo(int ownerNum, String ownerName) throws SQLException;
	List<HashMap<String, Object>> so_storeList(String table, String pk, String search_option, String value) throws SQLException;
	
	//store worker
	List<StoreWorkerVo> sw_workerInfos() throws SQLException;
	StoreWorkerVo sw_oneworkerInfo(int workerNum, String workerName) throws SQLException;
	
	//test
	List<StoreEduVo> edu_testSubjects() throws SQLException;
	
	//storelist
	void store_addOne(HashMap<String, Object> bean) throws SQLException;
	void store_edit(HashMap<String, Object> bean) throws SQLException;
	
	//board
	List<HashMap<String, Object>> selectList(String table, String pk) throws SQLException;
	List<HashMap<String, Object>> board_paging(int idx, String table, String pk) throws SQLException;
	//List<HashMap<String, Object>> board_select(int page, String table) throws SQLException;
	Map<String, Integer> page_startEnd(int idx, String table);
	List<HashMap<String, Object>> board_list(String table, String pk) throws SQLException;
	
	List<Integer> board_pagelinks(String table) throws SQLException;
	List<Integer> board_pagelinks(int idx, String table) throws SQLException;
	List<HashMap<String, Object>> board_search(String search_type, String search_text, String table) throws SQLException;
	List<HashMap<String, Object>> board_search(String search_type, String search_text, String table, String schema, String pk) throws SQLException;
	List<HashMap<String, Object>> board_searchPaging(String search_type, String search_text, String table, String schema, String pk, int idx ) throws SQLException;
	List<Object> boardSearch_pagelinks(String search_type, String search_text, String table, String schema, int idx) throws SQLException;
	Map<String, Integer> pageSearch_startEnd(String search_type, String search_text, String table, String schema, int idx) throws SQLException;
	Map<String, Object> board_detail(int idx, String table, String pk) throws SQLException;
	Integer board_nowPage(int idx, String table, String pk);
	void board_deleteNum(int idx, String table, String schema) throws SQLException;
	void board_deleteString(String idx, String table, String schema) throws SQLException;

	//ERP_alarm_board
	void alarm_addOne(HashMap<String, Object> bean) throws SQLException;
	void alarm_cnt(int idx, String table, String pk, String cnt) throws SQLException;
	void alarm_edit(HashMap<String, Object> bean) throws SQLException;
	
	
	
}
