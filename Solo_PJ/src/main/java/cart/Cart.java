package cart;

public class Cart {
	private String pdPic;
	private String pdName;
	private String rgId;
	private int pdPrice;
	private int pdAmount;

	public Cart() {};
	
	public Cart(String pdPic,String pdName, String rgId, int pdPrice) {
		super();
		this.pdPic = pdPic;
		this.pdName = pdName;
		this.rgId = rgId;
		this.pdPrice=pdPrice;
	}
	
	public String getPdPic() {
		return pdPic;
	}
	
	
	public void setPdPic(String pdPic) {
		this.pdPic = pdPic;
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
	
	public int getPdAmount() {
		return pdAmount;
	}

	public void setPdAmount(int pdAmount) {
		this.pdAmount = pdAmount;
	}
}
