package com.hellocat.www;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hellocat.dao.CartDaoImpl;
import com.hellocat.dao.MemberDaoImpl;
import com.hellocat.dao.ProductDaoImpl;
import com.hellocat.dto.CartDto;
import com.hellocat.dto.ProductDtoForDetail;
import com.hellocat.dto.ProductDtoForStore;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class DaoTest {
	
	@Autowired
	private ProductDaoImpl productDao;
	@Autowired
	private CartDaoImpl cartDao;
	@Autowired
	private MemberDaoImpl memberDao;
	
	@Test
	public void storeMain() throws Exception {
		List<ProductDtoForStore> list = productDao.store_main();
		System.out.println(list);
	}
	@Test
	public void storeToy() throws Exception {
		List<ProductDtoForStore> list = productDao.store_toy();
		System.out.println(list);
	}
	@Test
	public void storeToy_n() throws Exception {
		List<ProductDtoForStore> list = productDao.store_toy_n();
		System.out.println(list);
	}
	@Test
	public void showOnePd() throws Exception {
		ProductDtoForDetail list = productDao.showOnePd("food_treat_013");
		System.out.println(list);
	}
	@Test
	public void showCart() throws Exception {
		List<CartDto> list = cartDao.showCart("dodoo");
		System.out.println("showcart!");
		System.out.println(list);
	}
	@Test
	public void loginTest() throws Exception {
		String id = "coke1316";
		String pw = "1316";
		if(memberDao.login(id, pw)) {
			System.out.println("테스트 성공!");
		} else {
			System.out.println("뭐가 문제지..?");
		}
	}
}
