package com.hellocat.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.hellocat.dto.CartDto;
import com.hellocat.dto.ProductDtoForDetail;
import com.hellocat.dto.ProductDtoForStore;

public class ProductDaoImpl implements ProductDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductDtoForStore> store_main() {
		List<ProductDtoForStore> storeMainList = sqlSession.selectList("com.hellocat.mapper.productMapper.selectPdMain");
		return storeMainList;
	}

	@Override
	public List<ProductDtoForStore> store_toy() {
		List<ProductDtoForStore> storeToyList = sqlSession.selectList("com.hellocat.mapper.productMapper.selectPdToy");
		return storeToyList;
	}

	@Override
	public List<ProductDtoForStore> store_toy_n() {
		List<ProductDtoForStore> storeToyList = sqlSession.selectList("com.hellocat.mapper.productMapper.selectPdToyNew");
		return storeToyList;
	}

	@Override
	public List<ProductDtoForStore> store_food() {
		List<ProductDtoForStore> storeFoodList = sqlSession.selectList("com.hellocat.mapper.productMapper.selectPdFood");
		return storeFoodList;
	}

	@Override
	public List<ProductDtoForStore> store_food_n() {
		List<ProductDtoForStore> storeFoodList_n = sqlSession.selectList("com.hellocat.mapper.productMapper.selectPdFoodNew");
		return storeFoodList_n;
	}

	@Override
	public List<ProductDtoForStore> store_goods() {
		List<ProductDtoForStore> storeGoodsList = sqlSession.selectList("com.hellocat.mapper.productMapper.selectPdGoods");
		return storeGoodsList;
	}

	@Override
	public List<ProductDtoForStore> store_goods_n() {
		List<ProductDtoForStore> storeGoodsList_n = sqlSession.selectList("com.hellocat.mapper.productMapper.selectPdGoodsNew");
		return storeGoodsList_n;
	}

	@Override
	public ProductDtoForDetail showOnePd(String id) {
		ProductDtoForDetail showOnePdList = sqlSession.selectOne("com.hellocat.mapper.productMapper.selectOnePd", id);
		return showOnePdList;
	}

}
