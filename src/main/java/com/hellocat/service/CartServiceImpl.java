package com.hellocat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellocat.dao.CartDaoImpl;
import com.hellocat.dto.CartDto;

@Service
public class CartServiceImpl implements CartService{
	@Autowired
	CartDaoImpl dao;
	
	@Override
	public List<CartDto> showCart(String id) {
		List<CartDto> cartList = dao.showCart(id);
		return cartList;
	}
	
}
