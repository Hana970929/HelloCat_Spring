package com.hellocat.service;

import java.util.List;

import com.hellocat.dto.CartDto;
import com.hellocat.dto.ProductDtoForDetail;
import com.hellocat.dto.ProductDtoForStore;

public interface ProductService {
	List<ProductDtoForStore> store_main();
	List<ProductDtoForStore> store_toy();
	List<ProductDtoForStore> store_toy_n();
	List<ProductDtoForStore> store_food();
	List<ProductDtoForStore> store_food_n();
	List<ProductDtoForStore> store_goods();
	List<ProductDtoForStore> store_goods_n();
	ProductDtoForDetail showOnePd(String id);
	List<CartDto> showCart(String id);
}
