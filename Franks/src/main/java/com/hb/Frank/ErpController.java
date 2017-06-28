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
	
	@RequestMapping("/erp/alarm")
	public String alarm(Model model){
		try {
			model.addAttribute("alist", modelDao.board_list("inform","ANUM"));
			model.addAttribute("links", modelDao.board_pagelinks("inform"));
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
		
		
		
		try {
			List<HashMap<String, Object>> alist = null;
			if(search_text == null || req.getMethod().equals("GET")){
				alarm(model); //ÇÁ·ÐÆ®¾Øµå·Î Á¦¾îÇÒÁö, ¹é¾Øµå·Î Á¦¾îÇÒÁö °í¹Î Áß
				
			}else if(search_text != null && req.getMethod().equals("POST")){
				if(search_type.equals("sub")){
					model.addAttribute("alist", modelDao.board_search(search_type, search_text,"inform","ASUB","ANUM"));
					
				}
				if(search_type.equals("cntnt")){
					model.addAttribute("alist", modelDao.board_search(search_type, search_text,"inform","ACNTNT","ANUM"));
				}
				//if(search_type == "author") model.addAttribute("alist", modelDao.board_search(search_type, search_text,"inform","A"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "erp/alarm_list";
	}	

//	@RequestMapping(value="/erp/alarm/{idx}",method=RequestMethod.GET)
//	public String alarmPages(@PathVariable int idx, Model model){
//		try {
//			model.addAttribute("alist", modelDao.board_select(idx,"INFORM"));
//			Map<String, Integer> startend = modelDao.page_startEnd(idx,"INFORM");
//			
//			int pageNum = startend.get("pageNum");
//			int colCnt = ((idx-1)/ 5 )+1; 
//			int maxCol = ((pageNum - 1)/ 5 ) + 1 ;
//			
//			if(idx > pageNum){
//				return "error/404";
//			}
//			
//			System.out.println(maxCol);
//			model.addAttribute("links", modelDao.board_pagelinks(idx, "INFORM"));	
//			model.addAttribute("idx", idx);
//			model.addAttribute("colCnt", colCnt);
//			model.addAttribute("maxCol", maxCol);
//	
//			if(colCnt > 1 && colCnt < maxCol ) {
//				model.addAttribute("prevPg", startend.get("prevPage"));
//				model.addAttribute("nextPg", startend.get("nextPage"));
//			}else if(colCnt < 2) {
//				if (maxCol > 2){
//					model.addAttribute("nextPg", startend.get("nextPage"));
//				}else{}
//			}else if(colCnt == maxCol) {
//				model.addAttribute("prevPg", startend.get("prevPage"));
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return "erp/alarm_list";
//	}
	
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
		try {
			if(req.getParameter("search_text") == null && req.getMethod().equals("POST") || sess.getAttribute("searText") == null && req.getMethod().equals("GET") || req.getParameter("list")!= null && req.getMethod().equals("POST")){
				sess.setAttribute("searType", null);
				sess.setAttribute("searText", null);
				
				if(!( req.getParameter("search_text") == null && req.getMethod().equals("GET") ) ){
					idx = 1;
				}
				
				System.out.println("¸¸·á"+sess);
				model.addAttribute("alist", modelDao.board_paging(idx,"INFORM","anum"));
				startend = modelDao.page_startEnd(idx,"INFORM");		
				
				model.addAttribute("links", modelDao.board_pagelinks(idx, "INFORM"));
			
			}else if(sess.getAttribute("searText") != null && req.getMethod().equals("GET")){
				String sess_text = (String) sess.getAttribute("searText");
				String sess_type = (String) sess.getAttribute("searType");
				System.out.println("µµÁß"+sess);
				
				if(sess_type.equals("sub")){
					model.addAttribute("alist", modelDao.board_searchPaging(sess_type, sess_text,"inform","ASUB","ANUM", idx));
					startend = modelDao.pageSearch_startEnd(sess_type, sess_text,"inform","ASUB",idx);
					model.addAttribute("links", modelDao.boardSearch_pagelinks(sess_type,sess_text,"INFORM","ASUB", idx));
				}
				if(sess_type.equals("cntnt")){
					model.addAttribute("alist", modelDao.board_searchPaging(sess_type, sess_text,"inform","ACNTNT","ANUM", idx));
					startend = modelDao.pageSearch_startEnd(sess_type, sess_text,"inform","ACNTNT",idx);
					model.addAttribute("links", modelDao.boardSearch_pagelinks(sess_type,sess_text,"INFORM","ACNTNT", idx));
				}
				//if(sess_type == "author") model.addAttribute("alist", modelDao.board_search(sess_type, sess_text,"inform","A"));
				
				model.addAttribute("sess_text", (String) sess.getAttribute("searText"));
				model.addAttribute("sess_type", (String) sess.getAttribute("searType"));
				
			}else if(req.getParameter("search_text") != null && req.getMethod().equals("POST")) {
				
				idx = 1;
				
				System.out.println("Ã³½"+sess);
				sess.setAttribute("searType", search_type);
				sess.setAttribute("searText", search_text);	
				
				if(search_type.equals("sub")){
					
					model.addAttribute("alist", modelDao.board_searchPaging(search_type, search_text,"inform","ASUB", "ANUM", idx));
					startend = modelDao.pageSearch_startEnd(search_type, search_text,"inform","ASUB",idx);
					model.addAttribute("links", modelDao.boardSearch_pagelinks(search_type,search_text,"INFORM","ASUB", idx));
				}
				if(search_type.equals("cntnt")){
					model.addAttribute("alist", modelDao.board_searchPaging(search_type, search_text,"inform","ACNTNT", "ANUM", idx));
					startend = modelDao.pageSearch_startEnd(search_type, search_text,"inform","ACNTNT",idx);
					model.addAttribute("links", modelDao.boardSearch_pagelinks(search_type,search_text,"INFORM","ACNTNT", idx));
				}
				//if(search_type == "author") model.addAttribute("alist", modelDao.board_search(search_type, search_text,"inform","A"));
				
				
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
			
			//|| req.getParameter("sty") != null && req.getParameter("ste") != null)
			//			if(req.getParameter("hiddentext") != null && req.getParameter("hiddentext").equals(search_text) ){
			//				search_text = req.getParameter("hiddentext");
			//				search_type = req.getParameter("hiddentype");
			//			}else{
							
			//			}
			
			
			
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

		return "erp/alarm_list";
	}	
	

	@RequestMapping(value="/erp/alarm/add",method={RequestMethod.GET,RequestMethod.POST})
	public String alarmAdd(HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		if(req.getMethod().equals("GET")){
			
		}else if(req.getMethod().equals("POST")){
			HashMap<String, Object> bean = new HashMap<String, Object>();
			String sub = req.getParameter("sub");
			String cntnt = req.getParameter("cntnt");
			bean.put("sub", sub);
			bean.put("cntnt", cntnt);
			
			try {
				System.out.println("bean: " + bean);
				modelDao.alarm_addOne(bean);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "redirect:1";
		}
		return "erp/alarm_add";
	}
	
	@RequestMapping(value="/erp/alarm/detail/{idx}", method=RequestMethod.GET)
	public String alarmDetail(@PathVariable int idx, Model model){
		try{
			model.addAttribute("detail", modelDao.board_detail(idx, "inform", "anum"));
			modelDao.alarm_cnt(idx, "inform", "anum", "achk");
			model.addAttribute("nowPage", modelDao.board_nowPage(idx, "inform", "anum"));
			model.addAttribute("idx", idx);
		}catch (SQLException e){
			e.printStackTrace();
		}
		return "erp/alarm_detail";
	}	
	
	@RequestMapping(value="/erp/alarm/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String alarmEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("detail", modelDao.board_detail(idx, "inform", "anum"));
				model.addAttribute("nowPage", modelDao.board_nowPage(idx, "inform", "anum"));
			}else if(req.getMethod().equals("POST")){
	
				HashMap<String,Object> bean = new HashMap<String,Object>();
				bean.put("sub", req.getParameter("sub"));
				bean.put("cntnt", req.getParameter("cntnt"));
				bean.put("anum", req.getParameter("anum"));
				modelDao.alarm_edit(bean);
				
				Integer nowPage = modelDao.board_nowPage(idx, "inform", "anum");
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/alarm_edit";
			
	}

	@RequestMapping("/erp/alarm/delete/{idx}")
	public String alarmDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			nowPage = modelDao.board_nowPage(idx, "inform","anum");
			modelDao.board_deleteNum(idx,"inform","anum");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}
	
	@RequestMapping("/erp/edu/menu")
	public String eduMenu(){
		return "/erp/edu_menu";
	}
	@RequestMapping("/erp/edu/test")
	public String eduTest(){
		return "/erp/edu_test";
	}
	@RequestMapping("/erp/goods/stock/manage")
	public String gdstkmanage(){
		return "/erp/goodsStock_manage";
	}
	@RequestMapping("/erp/head-alarm")
	public String headAlarm(){
		return "/erp/head_alarm";
	}
	@RequestMapping("/erp/margin/detail")
	public String mrgnDetail(){
		return "/erp/margin_detail";
	}
	@RequestMapping("/erp/margin/menu")
	public String mrgnMenu(){
		return "/erp/margin_menu";
	}
	@RequestMapping("/erp/margin/rank")
	public String mrgnRank(){
		return "/erp/margin_rank";
	}
	@RequestMapping("/erp/margin/store")
	public String mrgnStore(){
		return "/erp/margin_store";
	}
	@RequestMapping("/erp/mystore/info")
	public String myStoreInfo(){
		return "/erp/mystore_info";
	}
	@RequestMapping("/erp/order/add")
	public String orderAdd(){
		return "/erp/order_add";
	}
	@RequestMapping("/erp/order/delete")
	public String orderDel(){
		return "/erp/order_delete";
	}
	@RequestMapping("/erp/order/list")
	public String orderList(){
		return "/erp/order_list";
	}
	@RequestMapping("/erp/order/modify")
	public String orderModify(){
		return "/erp/order_modify";
	}
	@RequestMapping("/erp/rev-cost")
	public String revCost(){
		return "/erp/revenue_cost";
	}

	

	@RequestMapping(value="/erp/store/list",method={RequestMethod.GET,RequestMethod.POST})
	public String storeList (Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String area = req.getParameter("area");
		String fname = req.getParameter("fname");
		
		try {
			if(area == null && fname == null || req.getMethod().equals("GET")){
					model.addAttribute("slist", modelDao.selectList("franchise","FNUM"));
			}else if(area!=null && req.getMethod().equals("POST")){
					model.addAttribute("slist", modelDao.so_storeList("franchise","fnum","area",area));
			}else if (fname!=null && req.getMethod().equals("POST")) {
				System.out.println("fname");
					model.addAttribute("slist", modelDao.so_storeList("franchise","fnum","fname",fname));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/store_list";
	}	

	
	@RequestMapping("/erp/store/detail/{idx}")
	public String storeDetail(@PathVariable int idx, Model model){
		try {
			model.addAttribute("list", modelDao.board_detail(idx,"franchise","FNUM"));
			model.addAttribute("nowPage", modelDao.board_nowPage(idx, "franchise", "fnum"));
			model.addAttribute("idx", idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return "/erp/store_detail";
	}
	
	@RequestMapping(value="/erp/store/edit/{idx}",method={RequestMethod.GET, RequestMethod.POST})
	public String storeEdit(@PathVariable int idx, Model model, HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			if(req.getMethod().equals("GET")){
				model.addAttribute("list", modelDao.board_detail(idx, "franchise","FNUM"));
				model.addAttribute("nowPage", modelDao.board_nowPage(idx, "franchise", "fnum"));
				model.addAttribute("idx", idx);
				return "erp/store_edit";
			}else if(req.getMethod().equals("POST")){
	
				HashMap<String,Object> bean = new HashMap<String,Object>();
				bean.put("faddress", req.getParameter("faddress"));
				bean.put("fphone", req.getParameter("fphone"));
				bean.put("fname", req.getParameter("fname"));
				bean.put("fnum", idx);
				modelDao.store_edit(bean);
				
				Integer nowPage = modelDao.board_nowPage(idx, "franchise", "fnum");
				return "redirect:../" + nowPage;	
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "erp/store_edit";
			
	}
	
	@RequestMapping(value="/erp/store/add",method={RequestMethod.GET,RequestMethod.POST})
	public String storeAdd(HttpServletRequest req){
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		if(req.getMethod().equals("GET")){
			return  "/erp/store_add";
		}else if(req.getMethod().equals("POST")){
			HashMap<String, Object> bean = new HashMap<String, Object>();
			bean.put("fname" ,req.getParameter("fname"));
			bean.put("fphone", req.getParameter("fphone"));
			bean.put("faddress", req.getParameter("faddress"));
			
			try {
				modelDao.store_addOne(bean);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "redirect:list";
		}
		return "/erp/store_add";
	}
	
	@RequestMapping("/erp/store/delete/{idx}")
	public String storeDelete(@PathVariable int idx){
		Integer nowPage = null;
		try {
			modelDao.board_deleteNum(idx,"franchise","fnum");
			nowPage = modelDao.board_nowPage(idx, "franchise", "fnum");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "redirect:../" + nowPage;
	}


	@RequestMapping("/erp/store/stock")
	public String storeStock(){
		return "/erp/storeStock_search";
	}

	@RequestMapping("/erp/main")
	public String intro(){
		return "/erp/system_main";
	}
	

}
