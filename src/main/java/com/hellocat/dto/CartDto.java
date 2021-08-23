package com.hellocat.dto;

public class CartDto {
	private String user_id;
	private String pd_id;
	private int order_cnt;
	private String name;
	private String explain;
	private String[] photo;
	private int order_price;
	private int price;
	
	public CartDto() {}
	public CartDto(String user_id, String pd_id, int order_cnt, String name, String explain, String photo,
			int order_price, int price) {
		this.user_id = user_id;
		this.pd_id = pd_id;
		this.order_cnt = order_cnt;
		this.name = name;
		this.explain = explain;
		this.photo = photo.split("\\*");
		this.order_price = order_price;
		this.price = price;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPd_id() {
		return pd_id;
	}
	public void setPd_id(String pd_id) {
		this.pd_id = pd_id;
	}
	public int getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(int order_cnt) {
		this.order_cnt = order_cnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String[] getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo.split("\\*");
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "CartDto [user_id=" + user_id + ", pd_id=" + pd_id + ", order_cnt=" + order_cnt + ", name=" + name
				+ ", explain=" + explain + ", photo=" + photo + ", order_price=" + order_price + ", price=" + price
				+ "]";
	}
	
	
}
