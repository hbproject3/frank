package com.hb.Frank;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hb.Frank.model.dao.MemberDao;
import com.hb.Frank.model.dto.MemberVo;

@Controller
public class MemberController {
	
	@Autowired
	MemberDao memberdao;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	
	@RequestMapping("erp/loginck")
	public String loginck(@RequestParam String fid,@RequestParam String upw, Model model,HttpServletRequest request){
		int result = 0;
		MemberVo bean = new MemberVo();
		System.out.println(fid+"//"+upw);
		try {
			result = memberdao.selectCount(fid,upw);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		/*리퀘스트안에 세션이 있다*/
		if(result<=0) {
			return "logins/login";
			
		}else {
			try {
				bean = memberdao.selectOne(fid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("bean", bean);
			session.setAttribute("bean", bean.getUnum());
			session.setAttribute("uname", bean.getUname());
			return "erp/erpm";
		}
		
	}
	
	@RequestMapping("erp/erpm")
	public void erpPage(Model model, HttpServletRequest request){
		Integer unum = (Integer) request.getSession().getAttribute("unum");
		String uname = (String) request.getSession().getAttribute("uname");
		model.addAttribute("uname",uname);
	}
	
	@RequestMapping("board/freeboard")
	public void fBoard(Model model){
		// board select
	}
	
	@RequestMapping("erp/member/memberList")
	public String memberList(Model model) {
		try {
			model.addAttribute("alist", memberdao.selectAllMb());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "erp/member/memberList";
	
	}
	
	@RequestMapping("erp/member/memberDelete")
	public String memberDelete(Model model,String... unum) {
		System.out.println("memberDeletepage");
		
		List<String> dnums = new ArrayList<String>();
		
		if(unum != null){
			for(String dnum : unum){
				dnums.add(dnum);
			}
			
			for(int i=0; i>dnums.size(); i++){
				Integer.parseInt(dnums.get(i));
			}
		
			int count = dnums.size();
			System.out.println(count);
			return "redirect:memberList";
		}else {
			return "redirect:memberList";
		}
		
		
	}
	
	@RequestMapping(value="erp/member/memberAddform")
	public void memberAddform(){
		
	}
	
	@RequestMapping(value="erp/member/memberAdd",method=RequestMethod.GET)
	public String memberAdd(HttpServletRequest request){
		MemberVo bean = new MemberVo();
		System.out.println("추가하기 기능 컨트롤러");
		Enumeration<String> enumr = request.getParameterNames();
		
		while(enumr.hasMoreElements()){
			String param = enumr.nextElement();
			String param2="";
			try {
				request.setCharacterEncoding("UTF-8");
				String params= request.getParameter(param);
				param2 = new String(params.getBytes("8859_1"),"UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			if(param.equals("uname")){
				bean.setUname(param2);
			}else if(param.equals("fid")){
				bean.setFid(param2);
			}else if(param.equals("upw")){
				bean.setUpw(param2);
			}else if(param.equals("utype")){
				bean.setUtype(Integer.parseInt(param2));
			}else if(param.equals("phone")){
				bean.setPhone(param2);
			}else if(param.equals("email")){
				bean.setEmail(param2);
			}
		}
		try {
			memberdao.membrAdd(bean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:memberList";
	}
}
