package com.hellocat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellocat.dao.MemberDaoImpl;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDaoImpl dao;
	
	@Override
	public boolean login(String id, String pw) {
		return dao.login(id, pw);
	}

}
