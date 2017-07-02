package com.hb.Frank.model.dao;

import java.sql.SQLException;
import java.util.Map;
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
	List<Map<String, Object>> ad_storeRanks() throws SQLException;
	
	
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
	
	
	//store worker
	List<StoreWorkerVo> sw_workerInfos() throws SQLException;
	StoreWorkerVo sw_oneworkerInfo(int workerNum, String workerName) throws SQLException;
	
	//test
	List<StoreEduVo> edu_testSubjects() throws SQLException;
		
	List<Map<String, Object>> searchListSearch(Map<String, Object> bean) throws SQLException;
	
	//board
	List<Map<String, Object>> selectList(Map<String, Object> bean) throws SQLException;
	List<Map<String, Object>> board_paging(Map<String, Object> bean) throws SQLException;
	//List<Map<String, Object>> board_select(int page, String table) throws SQLException;
	Map<String, Integer> page_startEnd(Map<String, Object> bean) throws SQLException;
	List<Map<String, Object>> board_list(Map<String, Object> bean) throws SQLException;
	
	List<Integer> board_pagelinks(Map<String, Object> bean) throws SQLException;
	
	List<Map<String, Object>> board_search(Map<String, Object> bean) throws SQLException;
	List<Map<String, Object>> board_searchPaging(Map<String, Object> bean) throws SQLException;
	List<Object> boardSearch_pagelinks(Map<String, Object> bean) throws SQLException;
	Map<String, Integer> pageSearch_startEnd(Map<String, Object> bean) throws SQLException;
	
	Map<String, Object> board_detail(Map<String, Object> bean) throws SQLException;
	Integer board_nowPage(Map<String, Object> bean);

	//delete
	void deleteOne(Map<String, Object> bean) throws SQLException;

	//add. edit
	void addOne(Map<String, Object> bean) throws SQLException;
	void editOne(Map<String, Object> bean) throws SQLException;

	//ERP_board
	void board_cnt(Map<String, Object> bean) throws SQLException;
	List<Map<String, Object>> selectType(Map<String, Object> bean) throws SQLException;
	
	
	
}
