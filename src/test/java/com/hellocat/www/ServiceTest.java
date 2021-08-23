package com.hellocat.www;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hellocat.dto.CartDto;
import com.hellocat.dto.ProductDtoForDetail;
import com.hellocat.dto.ProductDtoForStore;
import com.hellocat.service.CartServiceImpl;
import com.hellocat.service.ProductServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ServiceTest {
	@Autowired
	private ProductServiceImpl productService;
	@Autowired
	private CartServiceImpl cartService;
	
	@Test
	public void storeMain() throws Exception {
		List<ProductDtoForStore> list = productService.store_main();
		System.out.println(list);
	}
	@Test
	public void storeToy() throws Exception {
		List<ProductDtoForStore> list = productService.store_toy();
		System.out.println(list);
	}
	@Test
	public void storeToy_n() throws Exception {
		List<ProductDtoForStore> list = productService.store_toy_n();
		System.out.println(list);
	}
	@Test
	public void showOnePd() throws Exception {
		ProductDtoForDetail list = productService.showOnePd("food_treat_013");
		System.out.println(list);
	}
	@Test
	public void showCart() throws Exception {
		List<CartDto> list = cartService.showCart("dodoo");
		System.out.println(list);
	}
	//깃허브 테스트를 위한 주석
}
