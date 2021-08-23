package com.hellocat.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellocat.dao.ProductDaoImpl;
import com.hellocat.dto.CartDto;
import com.hellocat.dto.ProductDtoForDetail;
import com.hellocat.dto.ProductDtoForStore;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDaoImpl dao;

	@Override
	public List<ProductDtoForStore> store_main() {
		List<ProductDtoForStore> storeMainList = dao.store_main();
		
		return storeMainList;
	}

	@Override
	public List<ProductDtoForStore> store_toy() {
		List<ProductDtoForStore> storeToyList = dao.store_toy();
		return storeToyList;
	}

	@Override
	public List<ProductDtoForStore> store_toy_n() {
		List<ProductDtoForStore> storeToyList = dao.store_toy_n();
		return storeToyList;
	}

	@Override
	public List<ProductDtoForStore> store_food() {
		List<ProductDtoForStore> storeFoodList = dao.store_food();
		return storeFoodList;
	}

	@Override
	public List<ProductDtoForStore> store_food_n() {
		List<ProductDtoForStore> storeFoodList = dao.store_food_n();
		return storeFoodList;
	}

	@Override
	public List<ProductDtoForStore> store_goods() {
		List<ProductDtoForStore> storeGoodsList = dao.store_goods();
		return storeGoodsList;
	}

	@Override
	public List<ProductDtoForStore> store_goods_n() {
		List<ProductDtoForStore> storeGoodsList = dao.store_goods_n();
		return storeGoodsList;
	}

	@Override
	public ProductDtoForDetail showOnePd(String id) {
		ProductDtoForDetail showOnePdList = dao.showOnePd(id);
		return showOnePdList;
	}

	@Override
	public List<CartDto> showCart(String id) {
		List <CartDto> cartList = null;
		return null;
	}
	
}
