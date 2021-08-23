package com.hellocat.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hellocat.dto.CartDto;
import com.hellocat.dto.ProductDtoForDetail;
import com.hellocat.dto.ProductDtoForStore;
import com.hellocat.service.CartServiceImpl;
import com.hellocat.service.MemberServiceImpl;
import com.hellocat.service.ProductServiceImpl;

@Controller
public class HomeController {
	@Autowired
	ProductServiceImpl pdService; 
	@Autowired
	CartServiceImpl cartService;
	@Autowired
	MemberServiceImpl memberService;
	
	DecimalFormat df = new DecimalFormat("###,###");
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	@RequestMapping(value="/storemain")
	public String storemain(Model model) {
		List<ProductDtoForStore> list = pdService.store_main();
		model.addAttribute("pdList",list);
		return "store_main";
	}
	@RequestMapping(value="/storetoy")
	public String storetoy(Model model) {
		List<ProductDtoForStore> list = pdService.store_toy();
		model.addAttribute("pdList",list);
		return "store_toy";
	}
	@RequestMapping(value="/storetoy_n")
	public String storetoyNew(Model model) {
		List<ProductDtoForStore> list = pdService.store_toy_n();
		model.addAttribute("pdList",list);
		return "store_toy_n";
	}
	@RequestMapping(value="/storefood")
	public String storefood(Model model) {
		List<ProductDtoForStore> list = pdService.store_food();
		model.addAttribute("pdList",list);
		return "store_food";
	}
	@RequestMapping(value="/storefood_n")
	public String storefoodNew(Model model) {
		List<ProductDtoForStore> list = pdService.store_food_n();
		model.addAttribute("pdList",list);
		return "store_food_n";
	}
	@RequestMapping(value="/storegoods")
	public String storegoods(Model model) {
		List<ProductDtoForStore> list = pdService.store_goods();
		model.addAttribute("pdList",list);
		return "store_goods";
	}
	@RequestMapping(value="/storegoods_n")
	public String storegoodsNew(Model model) {
		List<ProductDtoForStore> list = pdService.store_goods_n();
		model.addAttribute("pdList",list);
		return "store_goods_n";
	}
	@RequestMapping(value="/showOnePd")
	public String showOnePd(Model model, String id) {
		ProductDtoForDetail list = pdService.showOnePd(id);
		model.addAttribute("pdList",list);
		return "showDetail";
	}
	@RequestMapping(value="/showcart")
	public String showCart(Model model, HttpSession session){
//		String id = (String)session.getAttribute("user_id");
		String id = "dodoo";
		List<CartDto> list = cartService.showCart(id);
		model.addAttribute("cartList",list);
		return "cartList";
	}
	@RequestMapping(value="/Login")
	public String logIn() {
		return "Login";
	}
	@RequestMapping(value="/loginAction")
	public String loginAction(String url,String id, String pw) {
		if(memberService.login(id, pw)) {
			if(id.equals("admin")) {
				return "관리자페이지";
				//관리자페이지 미구현
			} return url;
		} else {
			return "login_fail";
		}
	}
	@RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }
}
