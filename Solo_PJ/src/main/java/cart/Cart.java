package cart;

public class Cart {
	private int cartId;
	private String userID;
	private String pdId;
	private int amount;
	
	public Cart() {};
	
	
	public void cart(int cartId, String userId, String pdId, int amount) {
		this.cartId=cartId;
		this.userID=userId;
		this.pdId=pdId;
		this.amount=amount;
	}
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPdId() {
		return pdId;
	}
	public void setPdId(String pdId) {
		this.pdId = pdId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}
