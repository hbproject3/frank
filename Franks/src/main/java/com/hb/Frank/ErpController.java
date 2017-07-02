package com.hb.Frank;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hb.Frank.model.dao.ModelDao;

@Controller
public class ErpController{
	@Autowired
	private ModelDao modelDao;
	private static final Logger logger = LoggerFactory.getLogger(ErpController.class);
	
	@RequestMapping(value={"/erp/contact/{idx}"} ,method={RequestMethod.POST,RequestMethod.GET})
	public String contactSearch (@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String search_text = req.getParameter("search_text");	
		String search_type = req.getParameter("search_type");
		 
		Map<String, Integer> startend = null;
		HttpSession sess = req.getSession();

		HashMap<String, Object> bean = new HashMap<String, Object>();
		
		System.out.println("¸¸·á"+sess);
		bean.put("idx", idx);
		bean.put("table", "CONTACT");
		bean.put("pk", "QNUM");

		try {
			if(req.getParameter("search_text") == null && req.getMethod().equals("POST") || sess.getAttribute("searText") == null && req.getMethod().equals("GET") || req.getParameter("list")!= null && req.getMethod().equals("POST")){
				sess.setAttribute("searType", null);
				sess.setAttribute("searText", null);
				
				if(!( req.getParameter("search_text") == null && req.getMethod().equals("GET") ) ){
					idx = 1;
				}
				startend = modelDao.page_startEnd(bean);		
				model.addAttribute("links", modelDao.board_pagelinks(bean)); //table, idx
				
				model.addAttribute("list", modelDao.board_paging(bean)); //table, idx, pk
			
			}else if(sess.getAttribute("searText") != null && req.getMethod().equals("GET")){
				String sess_text = (String) sess.getAttribute("searText");
				String sess_type = (String) sess.getAttribute("searType");
				System.out.println("세션: "+sess);
				
				bean.put("search_text", sess_text);
				bean.put("search_type", sess_type);

				if(search_type.equalsIgnoreCase("name")){
					
					bean.put("schema","QNAME");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(search_type.equalsIgnoreCase("cntnt")){
					
					bean.put("schema","QCNTNT");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(search_type.equalsIgnoreCase("type")){
					
					bean.put("schema","QTYPE");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				//if(sess_type == "author") model.addAttribute("board", modelDao.board_search(sess_type, sess_text,"CONTACT","Q"));
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
				
			}else if(req.getParameter("search_text") != null && req.getMethod().equals("POST")) {
				
				idx = 1;
				
				System.out.println("세션: "+sess);
				sess.setAttribute("searType", search_type);
				sess.setAttribute("searText", search_text);	
				
				bean.put("search_text", search_text);
				bean.put("search_type", search_type);

				if(search_type.equalsIgnoreCase("name")){
					
					bean.put("schema","QNAME");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(search_type.equalsIgnoreCase("cntnt")){
					
					bean.put("schema","QCNTNT");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(search_type.equalsIgnoreCase("type")){
					
					bean.put("schema","QTYPE");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}


				//if(search_type == "author") model.addAttribute("board", modelDao.board_search(search_type, search_text,"CONTACT","Q"));
				
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
			}
		
			int pageNum = startend.get("pageNum");
			int colCnt = ((idx - 1) / 5) + 1; 
			int maxCol = ((pageNum - 1) / 5) + 1 ;
			int nextCol = (idx-1) / 5 * 5 + 6;
			
			if(idx > pageNum){
				return "error/404";
			}
			
			//model.addAttribute("links", links);
			model.addAttribute("idx", idx);
			model.addAttribute("colCnt", colCnt);
			model.addAttribute("maxCol", maxCol);

			if(colCnt == 1) {
				if (maxCol > 1){
					model.addAttribute("nextPg", startend.get("nextPage"));
				}else if(maxCol == 1){}
			}else if(colCnt > 1) {
				if (colCnt < maxCol){
					model.addAttribute("prevPg", startend.get("prevPage"));
					model.addAttribute("nextPg", startend.get("nextPage"));
				}else if(colCnt == maxCol) {
					model.addAttribute("prevPg", startend.get("prevPage"));
				}	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "erp/contact_list";
	}
	
	
	
	
	
	
	//headnotice

	@RequestMapping(value={"/erp/headnotice/{idx}"} ,method={RequestMethod.POST,RequestMethod.GET})
	public String headnoticeSearch (@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String search_text = req.getParameter("search_text");	
		String search_type = req.getParameter("search_type");
		 
		Map<String, Integer> startend = null;
		HttpSession sess = req.getSession();

		Map<String, Object> bean = new HashMap<String, Object>();
		
		
		System.out.println("¸¸·á"+sess);
		bean.put("idx", idx);
		bean.put("table", "HEADNOTICE");
		bean.put("pk", "BNUM");
		try {
			if(req.getParameter("search_text") == null && req.getMethod().equals("POST") || sess.getAttribute("searText") == null && req.getMethod().equals("GET") || req.getParameter("list")!= null && req.getMethod().equals("POST")){
				sess.setAttribute("searType", null);
				sess.setAttribute("searText", null);
				
				if(!( req.getParameter("search_text") == null && req.getMethod().equals("GET") ) ){
					idx = 1;
				}
				
				System.out.println("1:"+bean);
				startend = modelDao.page_startEnd(bean);	
				System.out.println("2:"+bean);
				model.addAttribute("links", modelDao.board_pagelinks(bean)); //table, idx
				
				model.addAttribute("list", modelDao.board_paging(bean)); //table, idx, pk
			
			}else if(sess.getAttribute("searText") != null && req.getMethod().equals("GET")){
				String sess_text = (String) sess.getAttribute("searText");
				String sess_type = (String) sess.getAttribute("searType");
				System.out.println("세션: "+sess);
				
				bean.put("search_text", sess_text);
				bean.put("search_type", sess_type);
				
				if(sess_type.equalsIgnoreCase("sub")){
					
					bean.put("schema","BSUB");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(sess_type.equalsIgnoreCase("cntnt")){
					
					bean.put("schema","BCNTNT");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				//if(sess_type == "author") model.addAttribute("board", modelDao.board_search(sess_type, sess_text,"FREEBOARD","B"));
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
				
			}else if(req.getParameter("search_text") != null && req.getMethod().equals("POST")) {
				
				idx = 1;
				
				System.out.println("세션: "+sess);
				sess.setAttribute("searType", search_type);
				sess.setAttribute("searText", search_text);	
				
				bean.put("search_text", search_text);
				bean.put("search_type", search_type);
				
				if(search_type.equalsIgnoreCase("sub")){
					
					bean.put("schema","BNAME");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(search_type.equalsIgnoreCase("cntnt")){
					
					bean.put("schema","BCNTNT");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				//if(search_type == "author") model.addAttribute("board", modelDao.board_search(search_type, search_text,"FREEBOARD","B"));
				
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
			}
		
			int pageNum = startend.get("pageNum");
			int colCnt = ((idx - 1) / 5) + 1; 
			int maxCol = ((pageNum - 1) / 5) + 1 ;
			int nextCol = (idx-1) / 5 * 5 + 6;
			
			if(idx > pageNum){
				return "error/404";
			}
			
			//model.addAttribute("links", links);
			model.addAttribute("idx", idx);
			model.addAttribute("colCnt", colCnt);
			model.addAttribute("maxCol", maxCol);

			if(colCnt == 1) {
				if (maxCol > 1){
					model.addAttribute("nextPg", startend.get("nextPage"));
				}else if(maxCol == 1){}
			}else if(colCnt > 1) {
				if (colCnt < maxCol){
					model.addAttribute("prevPg", startend.get("prevPage"));
					model.addAttribute("nextPg", startend.get("nextPage"));
				}else if(colCnt == maxCol) {
					model.addAttribute("prevPg", startend.get("prevPage"));
				}	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "erp/headnotice_list";
	}	
	

	//alarm

	@RequestMapping("/erp/alarm")
	public String alarm(Model model){
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("table", "INFORM");
			bean.put("pk", "ANUM");
			
			model.addAttribute("links", modelDao.board_pagelinks(bean));
			model.addAttribute("list", modelDao.board_list(bean));
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/alarm_list";
	}
	
	@RequestMapping(value="/erp/alarm",method=RequestMethod.POST)
	public String alarmSearch ( Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String search_text = req.getParameter("search_text");
		String search_type = req.getParameter("search_type");
		System.out.println("st"+search_text+"ty"+search_type);
		
		HashMap<String,Object> bean = new HashMap<String,Object>();
		bean.put("table","INFORM");
		bean.put("pk","ANUM");
		
		try {
			List<HashMap<String, Object>> alist = null;
			if(search_text == null || req.getMethod().equals("GET")){
				model.addAttribute("list", modelDao.selectList(bean));
				
			}else if(search_text != null && req.getMethod().equals("POST")){

				bean.put("search_text", search_text);
				bean.put("search_type", search_type);

				if(search_type.equalsIgnoreCase("sub")){
					bean.put("schema","ASUB");
					model.addAttribute("list", modelDao.board_search(bean));
					
				}
				if(search_type.equalsIgnoreCase("cntnt")){
					bean.put("schema","ACNTNT");
					model.addAttribute("list", modelDao.board_search(bean));
				}
				//if(search_type == "author") model.addAttribute("list", modelDao.board_search(search_type, search_text,"FREEBOARD","A"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "erp/alarm_list";
	}	
	

	//freeboard
	@RequestMapping(value={"/erp/freeboard/{idx}"} ,method={RequestMethod.POST,RequestMethod.GET})
	public String freeboardSearch (@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String search_text = req.getParameter("search_text");	
		String search_type = req.getParameter("search_type");
		 
		Map<String, Integer> startend = null;
		HttpSession sess = req.getSession();

		HashMap<String, Object> bean = new HashMap<String, Object>();
		
		
		System.out.println("¸¸·á"+sess);
		bean.put("idx", idx);
		bean.put("table", "FREEBOARD");
		bean.put("pk", "BNUM");
		try {
			if(req.getParameter("search_text") == null && req.getMethod().equals("POST") || sess.getAttribute("searText") == null && req.getMethod().equals("GET") || req.getParameter("list")!= null && req.getMethod().equals("POST")){
				sess.setAttribute("searType", null);
				sess.setAttribute("searText", null);
				
				if(!( req.getParameter("search_text") == null && req.getMethod().equals("GET") ) ){
					idx = 1;
				}
				startend = modelDao.page_startEnd(bean);		
				model.addAttribute("links", modelDao.board_pagelinks(bean)); //table, idx 
				
				model.addAttribute("list", modelDao.board_paging(bean)); //table, idx, pk
			
			}else if(sess.getAttribute("searText") != null && req.getMethod().equals("GET")){
				String sess_text = (String) sess.getAttribute("searText");
				String sess_type = (String) sess.getAttribute("searType");
				System.out.println("세션: "+sess);
				
				bean.put("search_text", sess_text);
				bean.put("search_type", sess_type);
				
				if(sess_type.equalsIgnoreCase("sub")){
					
					bean.put("schema","BSUB");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(sess_type.equalsIgnoreCase("cntnt")){
					
					bean.put("schema","BCNTNT");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(sess_type.equalsIgnoreCase("name")){
					
					bean.put("schema","BNAME");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				//if(sess_type == "author") model.addAttribute("board", modelDao.board_search(sess_type, sess_text,"FREEBOARD","B"));
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
				
			}else if(req.getParameter("search_text") != null && req.getMethod().equals("POST")) {
				
				idx = 1;
				
				System.out.println("세션: "+sess);
				sess.setAttribute("searType", search_type);
				sess.setAttribute("searText", search_text);	
				
				bean.put("search_text", search_text);
				bean.put("search_type", search_type);
				
				if(search_type.equalsIgnoreCase("sub")){
					
					bean.put("schema","BSUB");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(search_type.equalsIgnoreCase("cntnt")){
					
					bean.put("schema","BCNTNT");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(search_type.equalsIgnoreCase("name")){
					
					bean.put("schema","BNAME");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				//if(search_type == "author") model.addAttribute("board", modelDao.board_search(search_type, search_text,"FREEBOARD","B"));
				
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
			}
		
			int pageNum = startend.get("pageNum");
			int colCnt = ((idx - 1) / 5) + 1; 
			int maxCol = ((pageNum - 1) / 5) + 1 ;
			int nextCol = (idx-1) / 5 * 5 + 6;
			
			if(idx > pageNum){
				return "error/404";
			}
			
			//model.addAttribute("links", links);
			model.addAttribute("idx", idx);
			model.addAttribute("colCnt", colCnt);
			model.addAttribute("maxCol", maxCol);

			if(colCnt == 1) {
				if (maxCol > 1){
					model.addAttribute("nextPg", startend.get("nextPage"));
				}else if(maxCol == 1){}
			}else if(colCnt > 1) {
				if (colCnt < maxCol){
					model.addAttribute("prevPg", startend.get("prevPage"));
					model.addAttribute("nextPg", startend.get("nextPage"));
				}else if(colCnt == maxCol) {
					model.addAttribute("prevPg", startend.get("prevPage"));
				}	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "erp/freeboard_list";
	}	

	@RequestMapping(value={"/erp/alarm/{idx}"} ,method={RequestMethod.POST,RequestMethod.GET})
	public String alarmSearch (@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		String search_text = req.getParameter("search_text");	
		String search_type = req.getParameter("search_type");
		 
		Map<String, Integer> startend = null;
		HttpSession sess = req.getSession();
		
		HashMap<String, Object> bean = new HashMap<String, Object>();
		
		
		System.out.println("¸¸·á"+sess);
		bean.put("idx", idx);
		bean.put("table", "INFORM");
		bean.put("pk", "ANUM");
		
		try {
			if(req.getParameter("search_text") == null && req.getMethod().equals("POST") || sess.getAttribute("searText") == null && req.getMethod().equals("GET") || req.getParameter("list")!= null && req.getMethod().equals("POST")){
				sess.setAttribute("searType", null);
				sess.setAttribute("searText", null);
				
				if(!( req.getParameter("search_text") == null && req.getMethod().equals("GET") ) ){
					idx = 1;
				}
				startend = modelDao.page_startEnd(bean);		
				model.addAttribute("links", modelDao.board_pagelinks(bean)); //table, idx //table, idx
				
				model.addAttribute("list", modelDao.board_paging(bean)); //table, idx, pk
				
			
			}else if(sess.getAttribute("searText") != null && req.getMethod().equals("GET")){
				String sess_text = (String) sess.getAttribute("searText");
				String sess_type = (String) sess.getAttribute("searType");
				System.out.println("세션 "+sess);
				
				bean.put("search_text", sess_text);
				bean.put("search_type", sess_type);
				
				if(sess_type.equalsIgnoreCase("sub")){
					
					bean.put("schema","ASUB");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(sess_type.equalsIgnoreCase("cntnt")){
					
					bean.put("schema","ACNTNT");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				//if(sess_type == "author") model.addAttribute("list", modelDao.board_search(sess_type, sess_text,"FREEBOARD","B"));
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
				
			}else if(req.getParameter("search_text") != null && req.getMethod().equals("POST")) {
				
				idx = 1;
				
				System.out.println("세션: "+sess);
				sess.setAttribute("searType", search_type);
				sess.setAttribute("searText", search_text);	
				
				bean.put("search_text", search_text);
				bean.put("search_type", search_type);
				
				if(search_type.equalsIgnoreCase("sub")){
					
					bean.put("schema","ASUB");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				if(search_type.equalsIgnoreCase("cntnt")){
					
					bean.put("schema","ACNTNT");
					
					model.addAttribute("list", modelDao.board_searchPaging(bean)); // search_text, search_type, schema, table, pk, idx
					startend = modelDao.pageSearch_startEnd(bean); //table
					model.addAttribute("links", modelDao.boardSearch_pagelinks(bean)); // search_text, searcth_type, schema, table, pk, idx
				}
				//if(search_type == "author") model.addAttribute("list", modelDao.board_search(search_type, search_text,"FREEBOARD","B"));
				
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
			}
		
			int pageNum = startend.get("pageNum");
			int colCnt = ((idx - 1) / 5) + 1; 
			int maxCol = ((pageNum - 1) / 5) + 1 ;
			int nextCol = (idx-1) / 5 * 5 + 6;
			
			if(idx > pageNum){
				return "error/404";
			}
			
			model.addAttribute("idx", idx);
			model.addAttribute("colCnt", colCnt);
			model.addAttribute("maxCol", maxCol);

			if(colCnt == 1) {
				if (maxCol > 1){
					model.addAttribute("nextPg", startend.get("nextPage"));
				}else if(maxCol == 1){}
			}else if(colCnt > 1) {
				if (colCnt < maxCol){
					model.addAttribute("prevPg", startend.get("prevPage"));
					model.addAttribute("nextPg", startend.get("nextPage"));
				}else if(colCnt == maxCol) {
					model.addAttribute("prevPg", startend.get("prevPage"));
				}	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "erp/alarm_list";
	}	
	

	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/erp/stock/list",method={RequestMethod.GET,RequestMethod.POST})
	public String stockList (Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String wtype = req.getParameter("wtype");
		String wname = req.getParameter("wname");
		
		//null pointer 에러 방지
		Integer fnum = null;
		if(req.getParameter("fnum") != null){
			fnum = Integer.parseInt(req.getParameter("fnum"));
		}
		
		HashMap<String, Object> bean = new HashMap<>();
			
		try {
			bean.put("table", "franchise");
			bean.put("pk", "fnum");
			model.addAttribute("stores", modelDao.selectList(bean)); //table, pk

			bean.put("table", "ware");
			bean.put("pk", "wtype");
			model.addAttribute("type", modelDao.selectType(bean)); //table, pk
			
			bean.put("table", "stock");
			bean.put("pk", "fnum");
			
			if(wtype == null && wname == null && fnum == null || req.getMethod().equals("GET")){
				bean.put("pk", null);	
				model.addAttribute("list", modelDao.selectList(bean)); //table, pk
			}else if(wtype!=null && req.getMethod().equals("POST")){
				bean.put("search_option","wtype");
				bean.put("val",wtype);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}else if (wname!=null && req.getMethod().equals("POST")) {
				System.out.println("wname");
				bean.put("search_option","wname");
				bean.put("val",wname);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}else if (fnum!=null && req.getMethod().equals("POST")) {
				System.out.println("wname");
				bean.put("search_option","fnum");
				bean.put("val",fnum);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/stock_list";
	}	
	
	@RequestMapping(value="/erp/order/list",method={RequestMethod.GET,RequestMethod.POST})
	public String orderList (Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String wtype = req.getParameter("wtype");
		String wname = req.getParameter("wname");
		Integer fnum = null;
		if(req.getParameter("fnum") != null){
			fnum = Integer.parseInt(req.getParameter("fnum"));
		}
		
		HashMap<String, Object> bean = new HashMap<>();
		
		try {
			bean.put("table", "franchise");
			bean.put("pk", "fnum");
			model.addAttribute("stores", modelDao.selectList(bean)); //table, pk

			bean.put("table", "ware");
			bean.put("pk", "wtype");
			model.addAttribute("type", modelDao.selectType(bean)); //table, pk

			bean.put("table", "orders");
			bean.put("pk", "onum");
			
			if(wtype == null && wname == null && fnum == null || req.getMethod().equals("GET")){
				bean.put("pk", null);
	
				model.addAttribute("list", modelDao.selectList(bean)); //table, pk
			}else if(wtype!=null && req.getMethod().equals("POST")){
				bean.put("search_option","wtype");
				bean.put("val",wtype);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}else if (wname!=null && req.getMethod().equals("POST")) {
				System.out.println("wname");
				bean.put("search_option","wname");
				bean.put("val",wname);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}else if (fnum!=null && req.getMethod().equals("POST")) {
				System.out.println("wname");
				bean.put("search_option","fnum");
				bean.put("val",fnum);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/order_list";
	}	
	
	
//store
	@RequestMapping(value="/erp/store/list",method={RequestMethod.GET,RequestMethod.POST})
	public String storeList (Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String area = req.getParameter("area");
		String fname = req.getParameter("fname");
		
		HashMap<String, Object> bean = new HashMap<String, Object>();
		bean.put("table", "FRANCHISE");
		bean.put("pk", "FNUM");
		
		try {
			if(area == null && fname == null || req.getMethod().equals("GET")){
					
					model.addAttribute("list", modelDao.selectList(bean)); //table,pk 
			}else if(area!=null && req.getMethod().equals("POST")){
					bean.put("search_option", "faddress");
					bean.put("val", area);
					model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}else if (fname!=null && req.getMethod().equals("POST")) {
				System.out.println("fname");
					bean.put("search_option", "fname");
					bean.put("val", fname);
					model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/store_list";
	}	

	
	
	

	
	
	
//ware
	

	@RequestMapping("/erp/main")
	public String intro(){
		return "/erp/system_main";
	}
	
	@RequestMapping(value="/erp/menu/list",method={RequestMethod.GET,RequestMethod.POST})
	public String menuList (Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String menuType = req.getParameter("menu_type");
		String menuName = req.getParameter("menu_name");
		
		HashMap<String,Object> bean = new HashMap<String,Object>();
		bean.put("table", "menu");

		
		try {

			bean.put("pk", "menu_type");
			model.addAttribute("type", modelDao.selectType(bean)); //table, pk //table, pk

			bean.put("pk", "menu_num");
		
			if(menuType == null && menuName == null || req.getMethod().equals("GET")){
				model.addAttribute("list", modelDao.selectList(bean)); //table, pk
			}else if(menuType!=null && req.getMethod().equals("POST")){
				bean.put("search_option", "menu_type");
				bean.put("val", menuType);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}else if (menuName!=null && req.getMethod().equals("POST")) {
				System.out.println("menuName");
				bean.put("search_option", "menu_name");
				bean.put("val", menuName);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/menu_list";
	}	

	


	




	///WARE

	@RequestMapping(value="/erp/ware/list",method={RequestMethod.GET,RequestMethod.POST})
	public String wareList (Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String wtype = req.getParameter("wtype");
		String wname = req.getParameter("wname");
		
		HashMap<String, Object> bean = new HashMap<String, Object>();
		
		
		try {
			bean.put("table", "ware");
			bean.put("pk", "wtype");
			model.addAttribute("type", modelDao.selectType(bean)); //table, pk

			bean.put("pk", "wnum");
		
			if(wtype == null && wname == null || req.getMethod().equals("GET")){
				model.addAttribute("list", modelDao.selectList(bean)); //table, pk
			}else if(wtype!=null && req.getMethod().equals("POST")){
				bean.put("search_option", "wtype");
				bean.put("val", wtype);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}else if (wname!=null && req.getMethod().equals("POST")) {
				System.out.println("wname");
				bean.put("search_option", "wname");
				bean.put("val", wname);
				model.addAttribute("list", modelDao.searchListSearch(bean)); //table,pk,search_option,val
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/ware_list";
	}	

///////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////


	@RequestMapping(value="/erp/contact/detail/{idx}", method=RequestMethod.GET)
	public String contactDetail(@PathVariable int idx, Model model){
		try{
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "CONTACT");
			bean.put("pk", "QNUM");
			
			model.addAttribute("detail", modelDao.board_detail(bean)); //idx, table, pk
			model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk
			
			bean.put("cnt", "QCNT");
			modelDao.board_cnt(bean);
			
			model.addAttribute("idx", idx);
		}catch (SQLException e){
			e.printStackTrace();
		}
		return "erp/contact_detail";	
	}	
	
	@RequestMapping(value="/erp/freeboard/detail/{idx}", method=RequestMethod.GET)
	public String freeboardDetail(@PathVariable int idx, Model model){
		try{			
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "FREEBOARD");
			bean.put("pk", "BNUM");
			model.addAttribute("detail", modelDao.board_detail(bean)); //idx, table, pk //table, pk, dix
			model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk //table, pk, idx

			bean.put("cnt", "BCNT");
			modelDao.board_cnt(bean); //table, pk, idx, cnt
			
			model.addAttribute("idx", idx);
		}catch (SQLException e){
			e.printStackTrace();
		}
		return "erp/freeboard_detail";	
	}	


	@RequestMapping(value="/erp/headnotice/detail/{idx}", method=RequestMethod.GET)
	public String headnoticeDetail(@PathVariable int idx, Model model){
		try{
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "CONTACT");
			bean.put("pk", "BNUM");
			
			model.addAttribute("detail", modelDao.board_detail(bean)); //idx, table, pk
			model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk
			
			bean.put("cnt", "BCNT");
			modelDao.board_cnt(bean);
			
			model.addAttribute("idx", idx);
		}catch (SQLException e){
			e.printStackTrace();
		}
		return "erp/headnotice_detail";	
	}	

	@RequestMapping(value="/erp/alarm/detail/{idx}", method=RequestMethod.GET)
	public String alarmDetail(@PathVariable int idx, Model model){
		try{
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "FREEBOARD");
			bean.put("pk", "BNUM");
			
			model.addAttribute("detail", modelDao.board_detail(bean)); //idx, table, pk
			model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk
			
			bean.put("cnt", "achk");
			
			modelDao.board_cnt(bean);
			
			model.addAttribute("idx", idx);
		}catch (SQLException e){
			e.printStackTrace();
		}
		return "erp/alarm_detail";
	}	


///////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////





	@RequestMapping(value="/erp/alarm/add",method={RequestMethod.GET,RequestMethod.POST})
	public String alarmAdd(HttpServletRequest req, Model model){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		
		HashMap<String, Object> bean = new HashMap<String, Object>();
		HttpSession sess = req.getSession();

		//로그인 유저 가게 번호 불러서 jsp파일로 보내는 작업
		Integer fnum = Integer.parseInt((String)sess.getAttribute(("fnum")));
		model.addAttribute("myFnum", fnum);

		if(req.getMethod().equals("GET")){
			
			bean = new HashMap<String, Object>();
			bean.put("table", "franchise");
			bean.put("pk","FNUM");
			
			try {
				model.addAttribute("receive_store", modelDao.selectList(bean));
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}else if(req.getMethod().equals("POST")){
			int arstore = Integer.parseInt(req.getParameter("receive_store"));

			if(arstore == fnum){
				return "erp/alarm_add";
			}

			bean = new HashMap<String, Object>();
			bean.put("table", "FREEBOARD");

			bean.put("asub", req.getParameter("sub"));
			bean.put("acntnt", req.getParameter("cntnt"));
			bean.put("asstore", fnum);
			bean.put("arstore", arstore);
			
			try {
				System.out.println("bean: " + bean);
				modelDao.addOne(bean);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "redirect:1";
		}
		return "erp/alarm_add";
	}
	@RequestMapping(value="/erp/contact/add",method={RequestMethod.GET,RequestMethod.POST})
	public String contactAdd(HttpServletRequest req, Model model){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		if(req.getMethod().equals("GET")){	
		}else if(req.getMethod().equals("POST")){

			HashMap<String, Object> bean = new HashMap<String, Object>();
	
			bean.put("table", "CONTACT");

			bean.put("qname", req.getParameter("name"));
			bean.put("qphone", req.getParameter("phone"));
			bean.put("qnarea", req.getParameter("narea"));
			bean.put("qcntnt", req.getParameter("cntnt"));
			bean.put("qntype", req.getParameter("ntype"));
			bean.put("qnsize", req.getParameter("nsize"));
			bean.put("qtype", req.getParameter("type"));

			try {
				System.out.println("bean: " + bean); 
				modelDao.addOne(bean); //table, add parameters
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return "redirect:1";
		}
		return "erp/contact_add";
	}	
	//yes FK
	@RequestMapping(value="/erp/sales/add",method={RequestMethod.GET,RequestMethod.POST})
	public String salesAdd(HttpServletRequest req, Model model){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
	
			if(req.getMethod().equals("GET")){	
				bean.put("table", "MENU");
				bean.put("pk", "MENU_NUM");
				model.addAttribute("menu_list",modelDao.selectList(bean));
	
				bean.put("table", "FRANCHISE");
				bean.put("pk", "FNUM");
				model.addAttribute("store_list",modelDao.selectList(bean));
	
			}else if(req.getMethod().equals("POST")){
	
				bean.put("table", "SALES");
	
				bean.put("smenu", Integer.parseInt(req.getParameter("menu_list")));
				bean.put("spay", Integer.parseInt(req.getParameter("pay")));
				bean.put("stype", Integer.parseInt(req.getParameter("type")));
				bean.put("fnum", Integer.parseInt(req.getParameter("store_list")));
		
				System.out.println("bean: " + bean); 
				modelDao.addOne(bean); //table, add parameters
			
				return "redirect:1";
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/sales_add";
	}
	//yes FK
	@RequestMapping(value="/erp/stock/add",method={RequestMethod.GET,RequestMethod.POST})
	public String stockAdd(HttpServletRequest req, Model model){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		try {
		
			HashMap<String, Object> bean = new HashMap<String, Object>();
		
			if(req.getMethod().equals("GET")){	
				bean.put("table", "WARE");
				bean.put("pk", "WNUM");
				model.addAttribute("ware_list",modelDao.selectList(bean));
	
				bean.put("table", "FRANCHISE");
				bean.put("pk", "FNUM");
				model.addAttribute("store_list",modelDao.selectList(bean));
	
			}else if(req.getMethod().equals("POST")){	
				bean.put("table", "stock");
	
				bean.put("fnum", Integer.parseInt(req.getParameter("store_list")));
				bean.put("wnum", Integer.parseInt(req.getParameter("ware_list")));
				bean.put("nowstock", Integer.parseInt(req.getParameter("stock_num")));
			
				System.out.println("bean: " + bean); 
				modelDao.addOne(bean); //table, add parameters
				
				return "redirect:1";
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "erp/stock_add";
	}
	//no FK	
	@RequestMapping(value="/erp/freeboard/add",method={RequestMethod.GET,RequestMethod.POST})
	public String freeboardAdd(HttpServletRequest req, Model model){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		if(req.getMethod().equals("GET")){	
		}else if(req.getMethod().equals("POST")){

			HashMap<String, Object> bean = new HashMap<String, Object>();
	
			bean.put("table", "FREEBOARD");

			bean.put("fname", req.getParameter("name"));
			bean.put("fsub", req.getParameter("sub"));
			bean.put("fpw", req.getParameter("pw"));
			bean.put("fcntnt", req.getParameter("cntnt"));
			
			try {
				System.out.println("bean: " + bean); 
				modelDao.addOne(bean); //table, add parameters
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return "redirect:1";
		}
		return "erp/freeboard_add";
	}	

	//no FK
	@RequestMapping(value="/erp/headnotice/add",method={RequestMethod.GET,RequestMethod.POST})
	public String headnoticeAdd(HttpServletRequest req, Model model){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		if(req.getMethod().equals("GET")){	
		}else if(req.getMethod().equals("POST")){

			HashMap<String, Object> bean = new HashMap<String, Object>();
	
			bean.put("table", "CONTACT");

			bean.put("bsub", req.getParameter("sub"));
			bean.put("bcntnt", req.getParameter("cntnt"));
			
			try {
				System.out.println("bean: " + bean); 
				modelDao.addOne(bean); //table, add parameters
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return "redirect:1";
		}
		return "erp/headnotice_add";
	}

	//no FK
	@RequestMapping(value="/erp/menu/add",method={RequestMethod.GET,RequestMethod.POST})
	public String menuAdd(HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		if(req.getMethod().equals("GET")){	
		}else if(req.getMethod().equals("POST")){
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("table", "MENU");
			
			bean.put("menu_name" ,req.getParameter("name"));
			bean.put("menu_price", Integer.parseInt(req.getParameter("price")));
			bean.put("menu_type", req.getParameter("type"));
			bean.put("menu_count", 1);
			
			try {
				modelDao.addOne(bean); // table, add parameters
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "redirect:list";
		}
		return "/erp/menu_add";
	}

	//yes FK
	@RequestMapping(value="/erp/order/add",method={RequestMethod.GET,RequestMethod.POST})
	public String orderAdd(Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		HttpSession sess = req.getSession();
		//로그인 유저 가게 번호 불러서 jsp파일로 보내는 작업
		Integer fnum = Integer.parseInt((String)sess.getAttribute(("fnum")));
		model.addAttribute("myFnum", fnum);

		HashMap<String, Object> bean = new HashMap<String, Object>();

		try {
			if(req.getMethod().equals("GET")){	
				bean.put("table","ware");
				bean.put("pk","wnum");
				model.addAttribute("ware_list", modelDao.selectList(bean)); //table, pk

				bean.put("table","stock");
				bean.put("pk","fnum");

				model.addAttribute("stock_list", modelDao.selectList(bean)); //table: stock, pk: fnum
				
				model.addAttribute("store_list", modelDao.selectType(bean)); //table, pk //table: stock, pk: fnum

			}else if(req.getMethod().equals("POST")){
				
				bean.put("table", "ORDERS");
				
				bean.put("wnum" ,Integer.parseInt(req.getParameter("ware_num")));
				bean.put("ocount", Integer.parseInt(req.getParameter("count")));
				bean.put("otype", Integer.parseInt(req.getParameter("type")));
				bean.put("osstore", Integer.parseInt(req.getParameter("send_store")));
				bean.put("orstore", fnum);

				modelDao.addOne(bean); // table, add parameters
				return "redirect:list";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "/erp/order_add";
	}
	//no FK
	@RequestMapping(value="/erp/store/add",method={RequestMethod.GET,RequestMethod.POST})
	public String storeAdd(HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		if(req.getMethod().equals("GET")){	
		}else if(req.getMethod().equals("POST")){
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("table", "FRANCHISE");
			
			bean.put("fname" ,req.getParameter("fname"));
			bean.put("fphone", req.getParameter("fphone"));
			bean.put("faddress", req.getParameter("faddress"));
			
			try {
				modelDao.addOne(bean); //table, add parameters
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "redirect:list";
		}
		return "/erp/store_add";
	}
	//no FK
	@RequestMapping(value="/erp/ware/add",method={RequestMethod.GET,RequestMethod.POST})
	public String wareAdd(HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		if(req.getMethod().equals("GET")){	
		}else if(req.getMethod().equals("POST")){
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("table", "WARE");
			
			bean.put("wname" ,req.getParameter("name"));
			bean.put("wtype", req.getParameter("type"));
			
			try {
				modelDao.addOne(bean); // table, add parameters
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "redirect:list";
		}
		return "/erp/ware_add";
	}
	
///////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

	//yes FK
	@RequestMapping(value="/erp/alarm/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String alarmEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession sess = req.getSession();
		Integer fnum = Integer.parseInt((String)req.getAttribute("fnum"));

		HashMap<String, Object> bean = new HashMap<String, Object>();
		bean.put("idx", idx);
		bean.put("table", "INFORM");
		bean.put("pk", "ANUM");
		

		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("detail", modelDao.board_detail(bean)); //idx, table, pk
				model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk
			
				bean.put("table", "FRANCHISE");
				bean.put("pk", "FNUM");
				model.addAttribute("receive_store", modelDao.selectList(bean));

				model.addAttribute("idx", idx);
			}else if(req.getMethod().equals("POST")){

				Integer nowPage = modelDao.board_nowPage(bean);
				
				Integer arstore = Integer.parseInt(req.getParameter("receive_store"));

				if(arstore == fnum){
					return "erp/alarm_edit";
				}

				bean.put("asub", req.getParameter("sub"));
				bean.put("acntnt", req.getParameter("cntnt"));
				bean.put("anum", idx);
				bean.put("arstore", Integer.parseInt(req.getParameter("receive_store")));
				
				modelDao.editOne(bean); //table, edit parameters
				
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/alarm_edit";
			
	}	

	//yes FK
	@RequestMapping(value="/erp/order/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String orderEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HttpSession sess = req.getSession();
		Integer fnum = Integer.parseInt((String)req.getAttribute("fnum"));

		HashMap<String, Object> bean = new HashMap<String, Object>();
		bean.put("idx", idx);
		bean.put("table", "ORDERS");
		bean.put("pk", "ONUM");
		

		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("detail", modelDao.board_detail(bean)); //idx, table, pk
				model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk
				
				bean.put("table", "WARE");
				bean.put("pk", "WNUM");
				model.addAttribute("ware_list", modelDao.selectList(bean)); //idx, table, pk

				bean.put("table", "FRANCHISE");
				bean.put("pk", "FNUM");
				model.addAttribute("send_store", modelDao.selectList(bean)); //idx, table, pk

				model.addAttribute("idx", idx);
			}else if(req.getMethod().equals("POST")){

				Integer nowPage = modelDao.board_nowPage(bean);

				Integer osstore = Integer.parseInt(req.getParameter("send_store"));

				if(osstore == fnum){
					return "erp/order_edit";
				}

				bean.put("wnum", Integer.parseInt(req.getParameter("ware_list")));
				bean.put("nowstock", Integer.parseInt(req.getParameter("now")));
				bean.put("instock", Integer.parseInt(req.getParameter("in")));
				bean.put("outstock", Integer.parseInt(req.getParameter("out")));

				modelDao.editOne(bean); //table, edit parameters
				
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/order_edit";
			
	}

	//no FK
	@RequestMapping(value="/erp/freeboard/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String freeboardEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HashMap<String, Object> bean = new HashMap<String, Object>();
		bean.put("idx", idx);
		bean.put("table", "FREEBOARD");
		bean.put("pk", "BNUM");
		
		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("detail", modelDao.board_detail(bean)); //idx, table, pk
				model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk

				model.addAttribute("idx", idx);
			}else if(req.getMethod().equals("POST")){

				Integer nowPage = modelDao.board_nowPage(bean);
				
				bean.put("bsub", req.getParameter("sub"));
				bean.put("bcntnt", req.getParameter("cntnt"));
				bean.put("bnum", req.getParameter("num"));
				
				modelDao.editOne(bean); //table, edit parameters
				
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/freeboard_edit";
			
	}

	//no FK
	@RequestMapping(value="/erp/headnotice/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String headnoticeEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		HashMap<String, Object> bean = new HashMap<String, Object>();
		bean.put("idx", idx);
		bean.put("table", "HEADNOTICE");
		bean.put("pk", "BNUM");
		
		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("detail", modelDao.board_detail(bean)); //idx, table, pk
				model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk

				model.addAttribute("idx", idx);
			}else if(req.getMethod().equals("POST")){

				Integer nowPage = modelDao.board_nowPage(bean);
				
				bean.put("bsub", req.getParameter("sub"));
				bean.put("bcntnt", req.getParameter("cntnt"));
				bean.put("bnum", req.getParameter("num"));
				
				modelDao.editOne(bean); //table, edit parameters
				
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/headnotice_edit";
			
	}
	//no FK
	@RequestMapping(value="/erp/store/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String storeEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		HashMap<String,Object> bean = new HashMap<String,Object>();
		bean.put("idx", idx);
		bean.put("table", "FRANCHISE");
		bean.put("pk", "FNUM");
		
		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("list", modelDao.board_detail(bean)); //idx, table, pk
				model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk
				
				model.addAttribute("idx", idx);
				return "erp/store_edit";
			}else if(req.getMethod().equals("POST")){

				Integer nowPage = modelDao.board_nowPage(bean);
				
				bean.put("fname", req.getParameter("name"));
				bean.put("fphone", req.getParameter("phone"));
				bean.put("faddress", req.getParameter("address"));
				bean.put("fnum", idx);
				
				modelDao.editOne(bean); //table, edit parameters 
	
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/store_edit";
			
	}
	//no FK
	@RequestMapping(value="/erp/menu/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String menuEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		HashMap<String,Object> bean = new HashMap<String,Object>();
		bean.put("idx", idx);
		bean.put("table", "MENU");
		bean.put("pk", "MENU_NUM");
		
		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("list", modelDao.board_detail(bean)); //idx, table, pk
				model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk
				
				model.addAttribute("idx", idx);
				return "erp/menu_edit";
			}else if(req.getMethod().equals("POST")){

				Integer nowPage = modelDao.board_nowPage(bean);
				
				bean.put("menu_name" ,req.getParameter("name"));
				bean.put("menu_price", req.getParameter("price"));
				bean.put("menu_type", req.getParameter("type"));
				bean.put("menu_num", idx);
				
				modelDao.editOne(bean); //table, edit parameters 
	
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/menu_edit";
			
	}

	//no FK
	@RequestMapping(value="/erp/ware/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String wareEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		HashMap<String,Object> bean = new HashMap<String,Object>();
		bean.put("idx", idx);
		bean.put("table", "WARE");
		bean.put("pk", "WNUM");
		
		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("list", modelDao.board_detail(bean)); //idx, table, pk
				model.addAttribute("nowPage", modelDao.board_nowPage(bean)); //idx, table, pk
				
				model.addAttribute("idx", idx);
				return "erp/ware_edit";
			}else if(req.getMethod().equals("POST")){

				Integer nowPage = modelDao.board_nowPage(bean);
				
				bean.put("wname" ,req.getParameter("name"));
				bean.put("wtype", req.getParameter("type"));
				bean.put("wnum", idx);
				
				modelDao.editOne(bean); //table, edit parameters 
	
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/ware_edit";
			
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
	//delete

	@RequestMapping("/erp/contact/delete/{idx}")
	public String contactDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "CONTACT");
			bean.put("pk", "QNUM");

			nowPage = modelDao.board_nowPage(bean);
			
			modelDao.deleteOne(bean); //table, idx, pk
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}

	@RequestMapping("/erp/sales/delete/{idx}")
	public String salesDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "SALES");
			bean.put("pk", "SNUM");

			nowPage = modelDao.board_nowPage(bean);
			
			modelDao.deleteOne(bean); //table, idx, pk
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}

	@RequestMapping("/erp/headnotice/delete/{idx}")
	public String headnoticeDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "CONTACT");
			bean.put("pk", "BNUM");

			nowPage = modelDao.board_nowPage(bean);
			
			modelDao.deleteOne(bean); //table, idx, pk
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}

	@RequestMapping("/erp/freeboard/delete/{idx}")
	public String freeboardDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "FREEBOARD");
			bean.put("pk", "BNUM");

			nowPage = modelDao.board_nowPage(bean);
			
			modelDao.deleteOne(bean); //table, idx, pk
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}

	@RequestMapping("/erp/alarm/delete/{idx}")
	public String alarmDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "INFORM");
			bean.put("pk", "ANUM");

			nowPage = modelDao.board_nowPage(bean);
			
			modelDao.deleteOne(bean); //table, idx, pk
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}


	@RequestMapping("/erp/store/delete/{idx}")
	public String storeDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "FRANCHISE");
			bean.put("pk", "FNUM");

			nowPage = modelDao.board_nowPage(bean); //idx, table, pk
			modelDao.deleteOne(bean); //table, idx, pk 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}

	@RequestMapping("/erp/order/delete/{idx}")
	public String orderDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "ORDERS");
			bean.put("pk", "ONUM");

			nowPage = modelDao.board_nowPage(bean); //idx, table, pk
			modelDao.deleteOne(bean); //table, idx, pk 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}


	@RequestMapping("/erp/menu/delete/{idx}")
	public String menuDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "MENU");
			bean.put("pk", "MENU_NUM");

			nowPage = modelDao.board_nowPage(bean); //idx, table, pk
			modelDao.deleteOne(bean); //table, idx, pk 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}

	@RequestMapping("/erp/ware/delete/{idx}")
	public String wareDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("idx", idx);
			bean.put("table", "WARE");
			bean.put("pk", "WNUM");

			nowPage = modelDao.board_nowPage(bean); //idx, table, pk
			modelDao.deleteOne(bean); //table, idx, pk 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}

///////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////




	
//	@RequestMapping("/erp/edu/menu")
//	public String eduMenu(){
//		return "/erp/edu_menu";
//	}
//	@RequestMapping("/erp/edu/test")
//	public String eduTest(){
//		return "/erp/edu_test";
//	}
//	@RequestMapping("/erp/goods/stock/manage")
//	public String gdstkmanage(){
//		return "/erp/goodsStock_manage";
//	}
//	@RequestMapping("/erp/margin/detail")
//	public String mrgnDetail(){
//		return "/erp/margin_detail";
//	}
//	@RequestMapping("/erp/margin/menu")
//	public String mrgnMenu(){
//		return "/erp/margin_menu";
//	}
//	@RequestMapping("/erp/margin/rank")
//	public String mrgnRank(){
//		return "/erp/margin_rank";
//	}
//	@RequestMapping("/erp/margin/store")
//	public String mrgnStore(){
//		return "/erp/margin_store";
//	}
//	@RequestMapping("/erp/mystore/info")
//	public String myStoreInfo(){
//		return "/erp/mystore_info";
//	}
//	@RequestMapping("/erp/order/add")
//	public String orderAdd(){
//		return "/erp/order_add";
//	}
//	@RequestMapping("/erp/order/delete")
//	public String orderDel(){
//		return "/erp/order_delete";
//	}
//	@RequestMapping("/erp/order/list")
//	public String orderList(){
//		return "/erp/order_list";
//	}
//	@RequestMapping("/erp/order/modify")
//	public String orderModify(){
//		return "/erp/order_modify";
//	}
//	@RequestMapping("/erp/rev-cost")
//	public String revCost(){
//		return "/erp/revenue_cost";
//	}
//	@RequestMapping("/erp/store/stock")
//	public String storeStock(){
//		return "/erp/storeStock_search";
//	}
	


}
