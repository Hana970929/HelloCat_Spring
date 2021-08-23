package com.hellocat.dto;

import java.util.Arrays;

public class ProductDtoForDetail {
	private String id;
	private String name;
	private int price;
	private int sales;
	private String explain;
	private String[] photo;
	private double score;
	
	public ProductDtoForDetail() {}
	public ProductDtoForDetail(String id, String name, int price, int sales, String explain, String photo, double score) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.sales = sales;
		this.explain = explain;
		this.photo = photo.split("\\*");
		this.score = score;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSales() {
		return sales;
	}
	public void setSales(int sales) {
		this.sales = sales;
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
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "ProductDtoForDetail [id=" + id + ", name=" + name + ", price=" + price + ", sales=" + sales
				+ ", explain=" + explain + ", photo=" + Arrays.toString(photo) + ", score="
				+ score + "]";
	}
	
}
