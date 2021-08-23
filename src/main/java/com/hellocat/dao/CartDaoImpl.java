package com.hellocat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hellocat.dto.CartDto;

public class CartDaoImpl implements CartDao{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CartDto> showCart(String id) {
		List <CartDto> cartList = sqlSession.selectList("com.hellocat.mapper.CartMapper.showCart",id);
		return cartList;
	}
	
}
