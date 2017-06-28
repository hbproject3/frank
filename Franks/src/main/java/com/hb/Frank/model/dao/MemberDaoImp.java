package com.hb.Frank.model.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.hb.Frank.model.dto.MemberVo;

public interface MemberDaoImp {	
	List<MemberVo> selectAll(String mid) throws SQLException;
	int selectCount(String fid,String upw) throws SQLException;
	MemberVo selectOne(String fid) throws SQLException;
	List<MemberVo> selectAllMb() throws SQLException;
	void deletsMember(List num) throws SQLException;
	int membrAdd(MemberVo bean) throws SQLException;
}
