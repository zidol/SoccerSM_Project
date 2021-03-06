package soccershop.master;

import java.sql.Timestamp;

public class SoccerShopDataBean {
	private int product_id;//상픔 등록번호
	private String product_kind;//상품 분류
	private String product_title;//상품 이름
	private int product_price;//상품 가격
	private short product_count;//상품의 재고수량
	private String area;//생산지
	private String brand;//제조사
	private String launch_date;//출시일
	private String product_image;//상품이미지
	private String product_content;//상품 내용
	private byte discount_rate;//할인율
	private Timestamp reg_date;//등록 날짜
	private String product_contimage;//상품 내용이미지
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_kind() {
		return product_kind;
	}
	public void setProduct_kind(String product_kind) {
		this.product_kind = product_kind;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public short getProduct_count() {
		return product_count;
	}
	public void setProduct_count(short product_count) {
		this.product_count = product_count;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getLaunch_date() {
		return launch_date;
	}
	public void setLaunch_date(String launch_date) {
		this.launch_date = launch_date;
	}
	public String getProduct_image() {
		return product_image;
	}
	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public byte getDiscount_rate() {
		return discount_rate;
	}
	public void setDiscount_rate(byte discount_rate) {
		this.discount_rate = discount_rate;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getProduct_contimage() {
		return product_contimage;
	}
	public void setProduct_contimage(String product_contimage) {
		this.product_contimage = product_contimage;
	}
	
}
