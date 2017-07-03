package com.hb.Frank.model.dao;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.hb.Frank.model.dto.AdminVo;
import com.hb.Frank.model.dto.HeadStockVo;
import com.hb.Frank.model.dto.OrderVo;
import com.hb.Frank.model.dto.StoreEduVo;
import com.hb.Frank.model.dto.StoreOwnerVo;
import com.hb.Frank.model.dto.StoreStockVo;
import com.hb.Frank.model.dto.StoreWorkerVo;

public class ModelDaoImpl1 implements ModelDao {
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession;
	private static Logger log = Logger.getLogger(ModelDaoImpl1.class);
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public AdminVo ad_oneInfo(int sabun) throws SQLException {
		return sqlSession.selectOne("model.ad_oneInfo", sabun);
	}

	@Override
	public List<Map<String, Object>> ad_storeRanks() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HeadStockVo> stk_headStocks() throws SQLException {
		return null;
	}

	@Override
	public HeadStockVo stk_oneHeadStock(int stockNum, String stockName) throws SQLException {
		return null;
	}

	@Override
	public List<StoreStockVo> stk_storeStocks() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreStockVo stk_oneStoreStock(int stockNum, String stockName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderVo> or_orders() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderVo or_oneOrder(int storeNum, String storeName, String stockName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoreOwnerVo> so_ownerInfos() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreOwnerVo so_oneOwnerInfo(int ownerNum, String ownerName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoreWorkerVo> sw_workerInfos() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoreWorkerVo sw_oneworkerInfo(int workerNum, String workerName) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<StoreEduVo> edu_testSubjects() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Map<String, Object>> searchListSearch(Map<String, Object> bean) throws SQLException {
		List<Map<String, Object>> list = null;
		String table = (String) bean.get("table");
		
		if(bean.get("val") instanceof Integer){
			if(table.equalsIgnoreCase("stock")){
				list = sqlSession.selectList("model.searchStockListOptionNum", bean);
				System.out.println(list);
				return list;
			}if(table.equalsIgnoreCase("Orders")){
				list = sqlSession.selectList("model.searchOrdersListOptionNum", bean);
				System.out.println(list);
				return list;
			}
			list = sqlSession.selectList("model.searchListOptionNum", bean);
			System.out.println(list);
			return list;
		}else{
			
			if(table.equalsIgnoreCase("stock")){
				list = sqlSession.selectList("model.searchStockListOptionString", bean);
				System.out.println(list);
				return list;
			}else if(table.equalsIgnoreCase("orders")){
				list = sqlSession.selectList("model.searchOrdersListOptionString", bean);
				System.out.println(list);
				return list;
			}
			
			list = sqlSession.selectList("model.searchListOptionString", bean);
			
			System.out.println(list);
			return list;
			
		}
	}

	@Override
	public List<Map<String, Object>> selectList(Map<String, Object> bean) throws SQLException {
		List<Map<String, Object>> list = null;
		String table = (String) bean.get("table");
		
		if(table.equalsIgnoreCase("stock")){
			list = sqlSession.selectList("model.selectAllStock");
			System.out.println(list);
			return list;
		}else if(table.equalsIgnoreCase("orders")){
			list = sqlSession.selectList("model.selectAllOrders");
			System.out.println(list);
			return list;
		}else if(table.equalsIgnoreCase("sales")){
			list = sqlSession.selectList("model.selectAllSales");
			System.out.println(list);
			return list;
		}
		list = sqlSession.selectList("model.selectAll", bean);
		System.out.println(list);
		return list;

	}
	
	@Override
	public List<Map<String, Object>> board_list(Map<String, Object> bean) throws SQLException {

		List<Map<String, Object>> list = sqlSession.selectList("model.boardList", bean);
		System.out.println(list);
		return list;
	}

	
	@Override
	public List<Integer> board_pagelinks(Map<String, Object> bean) throws SQLException {
			String table = (String) bean.get("table");
		
		if(bean.get("idx")!=null){
			int idx=(int) bean.get("idx");
			
			int colCnt = ((idx-1)/ 5 )+1;                       
			int startPage  = ( ( (idx-1) / 5) * 5 ) + 1;
			int maxRow = sqlSession.selectOne("model.boardCount", table);
			int endPage = ( ( (idx-1) / 5) * 5 ) + 5; 
			
			System.out.println("mr:"+ maxRow);
			int pageNum = 0;
			
			if(maxRow > 10){
				pageNum = maxRow / 10;
				if( maxRow % (10 * pageNum) != 0){
					pageNum ++;
				}
			}else{
				pageNum = 1;
			}
			
			int maxCol = ((pageNum - 1)/ 5 ) + 1 ;
			
			System.out.println("mc"+ maxCol);
			System.out.println("p"+ pageNum);
			System.out.println("sp"+ startPage);
			int subtr = pageNum - idx;
			System.out.println("pd" + (subtr));
			
			// && (pageNum - idx) < 4
			if(colCnt == maxCol){
				endPage = ( ( (idx-1) / 5) * 5 ) + ( pageNum - startPage + 1);
			}
			
			List<Integer> pages = new ArrayList<Integer>();
			System.out.println("colCnt: "+colCnt+", startPage: "+startPage+", endPage: "+endPage);
			for (int i = startPage; i <= endPage; i++) {
				pages.add(i);
			}
			return pages;
		}else{
			int rownum = sqlSession.selectOne("model.boardCount", table);
			System.out.println(rownum);
			
			int pagenum = 0;
			if(rownum > 10){
				pagenum = rownum / 10;
				if( rownum % (10 * pagenum) != 0){
					pagenum ++;
				}
			}
			
			List<Integer> pages = new ArrayList<Integer>();
			System.out.println(pagenum);
			for (int i = 1; i <= pagenum; i++) {
				pages.add(i);
			}
			
			return pages;
		}
		
	}

	@Override
	public List<Map<String, Object>> board_paging(Map<String, Object> bean) throws SQLException{
		HashMap<String, Object> params = new HashMap<String, Object>();

		int page = (int) bean.get("idx");
		
		int maxRow = sqlSession.selectOne("model.boardCount", (String) bean.get("table"));
		int row_max = maxRow - ((--page) * 10 );
		int row_min = row_max - 9;
		
		List<Map<String, Object>> list = null;
		
		if(row_min < 0){
			row_min = 0;
		}
		
		System.out.println(row_min);
		System.out.println(row_max);
	
		bean.put("min", row_min);
		bean.put("max", row_max);

		if(maxRow>0){
			list = sqlSession.selectList("model.boardPaging", bean);
		}
		System.out.println(list);
		return list;
	}

	@Override
	public Map<String, Integer> page_startEnd(Map<String, Object> bean) {
		int idx=(int) bean.get("idx");
		
		int maxRow = sqlSession.selectOne("model.boardCount", (String)bean.get("table"));
		int pageNum = 0;

		if(maxRow > 10){
			pageNum = maxRow / 10;
			if( maxRow % (10 * pageNum) != 0){
				pageNum ++;
			}
		}else{
			pageNum = 1;
		}
				
		Map<String, Integer> startEnd = new HashMap<String, Integer>();
		startEnd.put("pageNum", pageNum);
		int prevPage = (idx-1) / 5 * 5 ;
		int nextPage = (((idx-1) / 5 ) * 5 ) + 6;
		System.out.println("prevP "+prevPage+" nextP "+nextPage);
		startEnd.put("prevPage", prevPage);
		startEnd.put("nextPage", nextPage);		
		return startEnd;
	}

	@Override
	public Map<String, Integer> pageSearch_startEnd(Map<String,Object> params) throws SQLException {

		int maxRow = sqlSession.selectOne("model.boardSearchCount", params);
		int pageNum = 0;
		
		System.out.println("startendmaxRow: "+ maxRow);
		
		if(maxRow > 10){
			pageNum = maxRow / 10;
			if( maxRow % (10 * pageNum) != 0){
				pageNum ++;
			}
		}else{
			pageNum = 1;
		}
		
		int idx = (int) params.get("idx");
		
		System.out.println("pageNum: " + pageNum);
		
		Map<String, Integer> startEnd = new HashMap<String, Integer>();
		startEnd.put("pageNum", pageNum);
		int prevPage = (idx-1) / 5 * 5 ;
		int nextPage = (((idx-1) / 5 ) * 5 ) + 6;
		System.out.println("prevP "+prevPage+" nextP "+nextPage);
		startEnd.put("prevPage", prevPage);
		startEnd.put("nextPage", nextPage);		
		return startEnd;
	}

	@Override
	public List<Map<String, Object>> board_search(Map<String, Object> params) throws SQLException{
		List<Map<String, Object>> list = null;
		
		String search_type = (String) params.get("search_type");
		
		if(search_type.equalsIgnoreCase("sub")){
			list = sqlSession.selectList("model.boardSearch", params);
		}else if(search_type.equalsIgnoreCase("cntnt")){
			list = sqlSession.selectList("model.boardSearch", params);
		}else if(search_type.equalsIgnoreCase("author")){
			list = sqlSession.selectList("model.boardSearch", params);
		}

		/*else if(search_type == "date"){
			list = sqlSession.selectList("model.boardDateSearch", params);
		}*/
		
		System.out.println(list);
		return list;
	}
	
	
	public List<Map<String, Object>> board_date_search(String search_type, String search_text, String table, String first, String last) throws SQLException{
		return null;
		
	}



	@Override
	public List<Map<String, Object>> board_searchPaging(Map<String, Object> params) throws SQLException {
		List<Map<String, Object>> list = null;
		
		// if(search_type.equals("sub")){
		// 	list = sqlSession.selectList("model.boardSearch", params);
		// }else if(search_type.equals("cntnt")){
		// 	list = sqlSession.selectList("model.boardSearch", params);
		// }else if(search_type.equals("author")){
		// 	list = sqlSession.selectList("model.boardSearch", params);
		// }

		/*else if(search_type == "date"){
			list = sqlSession.selectList("model.boardDateSearch", params);
		}*/
		
		
		int idx= (int) params.get("idx");
		int maxRow = sqlSession.selectOne("model.boardSearchCount", params);
		
		System.out.println("pagingmaxRow"+ maxRow);
		int row_max = maxRow - ((--idx) * 10 );
		int row_min = row_max - 9;
		
		if(row_min < 0 ){
			row_min = 0;
		}

		params.put("min", row_min);
		params.put("max", row_max);
		
		
		if(maxRow > 0){
			list = sqlSession.selectList("model.boardSearchPaging", params);
		}

		System.out.println(list);
		return list;
	}

	@Override
	public List<Object> boardSearch_pagelinks(Map<String, Object> params) throws SQLException {


		int maxRow = sqlSession.selectOne("model.boardSearchCount", params);
		
		int idx = (int) params.get("idx");
		
		int colCnt = ((idx-1)/ 5 )+1;                       
		int startPage  = ( ( (idx-1) / 5) * 5 ) + 1;
		int endPage = ( ( (idx-1) / 5) * 5 ) + 5; 
		
		int pageNum = 0;
		
		System.out.println("mR"+maxRow);
		
		if(maxRow > 10){
			pageNum = maxRow / 10;
			if( maxRow % (10 * pageNum) != 0){
				pageNum ++;
			}
		}else{
			pageNum = 1;
		}
		
		int maxCol = ((pageNum - 1)/ 5 ) + 1 ;
		
		System.out.println("mc"+ maxCol);
		System.out.println(pageNum);
		System.out.println(startPage);
		int subtr = pageNum - idx;
		System.out.println("pd" + (subtr));
		
		// && (pageNum - idx) < 4
		
		if(colCnt == maxCol){
			endPage = ( ( (idx-1) / 5) * 5 ) + ( pageNum - startPage + 1);
		}
		
		List<Object> pages = new ArrayList<Object>();
		System.out.println("colCnt: "+colCnt+", startPage: "+startPage+", endPage: "+endPage);
		for (int i = startPage; i <= endPage; i++) {
			pages.add(i);
			
		}
		System.out.println(pages);
		return pages;
	}

	

	

	

	@Override
	public Map<String, Object> board_detail(Map<String, Object> bean) throws SQLException {
		Map<String, Object> list = sqlSession.selectOne("model.boardDetailOne", bean);
		System.out.println(list);
		return list;
	}
	
	@Override
	public Integer board_nowPage(Map<String, Object> bean) {
     // int maxRow = sqlSession.selectOne("model.boardCount", table);
				
		int pageIdx = sqlSession.selectOne("model.boardPageCount", bean);
		
		System.out.println("pageIDx: "+pageIdx);
		
		int maxRow = sqlSession.selectOne("model.boardCount", (String)bean.get("table") );
		
		int nowRow = (maxRow - pageIdx) + 1;
		int pageNum = 0;
		if(nowRow > 10){
			pageNum = nowRow / 10;
			if( nowRow % (10 * pageNum) != 0){
				pageNum ++;
			}
		}else{
			pageNum = 1;
		}
		System.out.println("pageNum"+pageNum);
		
		return pageNum;
	}
	
	@Override
	public void addOne(Map<String, Object> bean) throws SQLException {
		String table =(String)bean.get("table");
		
		if(table.equalsIgnoreCase("inform")){
			sqlSession.insert("model.alarmAdd", bean);
		}else if(table.equalsIgnoreCase("franchise")){
			sqlSession.insert("model.so_storeAdd", bean);
		}else if(table.equalsIgnoreCase("freeboard")){
			sqlSession.insert("model.freeboardAdd", bean);
		}else if(table.equalsIgnoreCase("contact")){
			sqlSession.insert("model.contactAdd", bean);
		}else if(table.equalsIgnoreCase("sales")){
			sqlSession.insert("model.salesAdd", bean);
		}else if(table.equalsIgnoreCase("freeboard")){
			sqlSession.insert("model.freeboardAdd", bean);
		}else if(table.equalsIgnoreCase("menu")){
			sqlSession.insert("model.menuAdd", bean);
		}else if(table.equalsIgnoreCase("stock")){
			sqlSession.insert("model.stockAdd", bean);
		}else if(table.equalsIgnoreCase("orders")){
			sqlSession.insert("model.orderAdd", bean);
		}else if(table.equalsIgnoreCase("ware")){
			sqlSession.insert("model.wareAdd", bean);
		}
	}

	@Override
	public void editOne(Map<String, Object> bean) throws SQLException {
		String table =(String)bean.get("table");
		
		if(table.equalsIgnoreCase("inform")){
			sqlSession.update("model.alarmEdit", bean);
		}else if(table.equalsIgnoreCase("franchise")){
			sqlSession.update("model.so_storeEdit", bean);
		}else if(table.equalsIgnoreCase("freeboard")){
			sqlSession.update("model.freeboardEdit", bean);
		}else if(table.equalsIgnoreCase("contact")){
			sqlSession.update("model.contactEdit", bean);
		}else if(table.equalsIgnoreCase("sales")){
			sqlSession.update("model.salesEdit", bean);
		}else if(table.equalsIgnoreCase("freeboard")){
			sqlSession.update("model.freeboardEdit", bean);
		}else if(table.equalsIgnoreCase("menu")){
			sqlSession.update("model.menuEdit", bean);
		}else if(table.equalsIgnoreCase("stock")){
			sqlSession.update("model.stockEdit", bean);
		}else if(table.equalsIgnoreCase("orders")){
			sqlSession.update("model.orderEdit", bean);
		}else if(table.equalsIgnoreCase("ware")){
			sqlSession.update("model.wareEdit", bean);
		}
	}
	
	@Override
	public void deleteOne(Map<String, Object> bean) throws SQLException {		
		if( bean.get("idx") instanceof Integer ){
			sqlSession.delete("model.DeleteOne_Num",bean);
		}else{
			sqlSession.delete("model.DeleteOne_String",bean);
		}
	}

	
	
	@Override
	public void board_cnt(Map<String, Object> bean) throws SQLException {	
		HashMap<String, Object> result = sqlSession.selectOne("model.boardViewCnt", bean);
		System.out.println(result);
		
		String pk = ((String)bean.get("pk")).toUpperCase();
		String cnt = ((String)bean.get("cnt")).toUpperCase();
		
		if(( (String)bean.get("table")).equalsIgnoreCase("inform")){
			//alarm board
		
			// ����! ������ �빮�� warning: you must type the names of parameters in Uppercase
			int nowcnt = Integer.parseInt(String.valueOf(result.get(pk)));
			int anum = Integer.parseInt(String.valueOf(result.get(cnt)));

			System.out.println("nowcnt: " + nowcnt + " anum: " + anum);
			
			if(nowcnt < 1){
				sqlSession.update("model.alarmUpCnt", anum);
			}
		
		}else{
		
			// ����! ������ �빮�� warning: you must type the names of parameters in Uppercase
			int pkv = Integer.parseInt(String.valueOf(result.get(pk)));
			int cntv = Integer.parseInt(String.valueOf(result.get(cnt)));
	
			System.out.println(pk+": " + pkv +" " + cnt+ ": " + cntv);
			
			int nowcnt = cntv + 1;
	
			if(nowcnt > cntv){
				bean.put("nowcnt", nowcnt);
				sqlSession.update("model.boardUpCnt", bean);
			}
		}
	}

	@Override
	public List<Map<String, Object>> selectType(Map<String, Object> bean) throws SQLException{
		List<Map<String, Object>> types = null;
		
		/* 보류
		 * if(table.equalsIgnoreCase("stock")){
			types = sqlSession.selectList("model.selectStockStoreType");
			System.out.println(types);
			return types;
		}*/
		
		String table = (String) bean.get("table");


		if(table.equalsIgnoreCase("stock")){
			types = sqlSession.selectList("model.selectAllStockStoreType");
			System.out.println(types);
			return types;
		}else{
			types = sqlSession.selectList("model.selectAllType", bean);
			System.out.println(types);
			return types;
		}
	}





	


	
	
	
}
