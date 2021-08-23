package com.hellocat.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean login(String id, String pw) {
		String rightPw = sqlSession.selectOne("com.hellocat.mapper.MemberMapper.login",id);
		if(pw.equals(rightPw)) {
			return true;
		}
		return false;
	}

}
