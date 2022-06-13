package product;

public class Product {
	private int pdId;
	private String pdName;	//작품 이름
	private String rgId;	//작품등록자 아이디
	private int pdPrice;	//작품 가격
	private String pdPic;	//작품 사진
	private String pdExp;	//작품 설명
	private String pdCate;		//작품 카테고리
	
	public int getPdId() {
		return pdId;
	}
	public void setPdId(int pdId) {
		this.pdId = pdId;
	}
	
	public String getPdName() {
		return pdName;
	}
	public void setPdName(String pdName) {
		this.pdName = pdName;
	}
	public String getRgId() {
		return rgId;
	}
	public void setRgId(String rgId) {
		this.rgId = rgId;
	}
	public int getPdPrice() {
		return pdPrice;
	}
	public void setPdPrice(int pdPrice) {
		this.pdPrice = pdPrice;
	}
	public String getPdPic() {
		return pdPic;
	}
	public void setPdPic(String pdPic) {
		this.pdPic = pdPic;
	}
	public String getPdExp() {
		return pdExp;
	}
	public void setPdExp(String pdExp) {
		this.pdExp = pdExp;
	}
	public String getPdCate() {
		return pdCate;
	}
	public void setPdCate(String pdCate) {
		this.pdCate = pdCate;
	}
	
	
	
}
