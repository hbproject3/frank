package com.hb.Frank.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import com.hb.Frank.model.dto.MemberVo;

public class MemberDao implements MemberDaoImp {
	private SqlSession sqlSession;
	private static Logger log = Logger.getLogger(MemberDao.class);
	
	
	public void setSqlSession(SqlSession sqlSession) {

		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<MemberVo> selectAll(String mid) throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList("selectAll", mid);
		
	}

	@Override
	public int selectCount(String fid, String upw) throws SQLException {
		
		MemberVo bean = new MemberVo(0,"",fid,upw,0,0);
		System.out.println(sqlSession.selectOne("member.selectCount",bean));
		
		return sqlSession.selectOne("member.selectCount",bean);
	}
	
	@Override
	public MemberVo selectOne(String fid) throws SQLException {
		
		System.out.println(sqlSession.selectOne("member.selectOne",fid));
		
		return sqlSession.selectOne("member.selectOne",fid);
	}

	@Override
	public List<MemberVo> selectAllMb() throws SQLException {
		
		return sqlSession.selectList("selectAllMember");
	}

	@Override
	public void deletsMember(List num) throws SQLException {
/*	for(int i=0; i>num.size(); i++){
		
		}
	return sqlSession.delete("deletsMember", num);*/
	
	}
	
	public int membrAdd(MemberVo bean) throws SQLException {
		System.out.println(bean);
	  return sqlSession.insert("memberAdd", bean);
	}
}
