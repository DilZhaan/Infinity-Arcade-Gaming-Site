package com.InfinityArcade.models;

public class Userduplicate {
    @Override
	public String toString() {
		return "Userduplicate [username=" + username + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", address=" + address + ", mobile=" + mobile + ", email=" + email + ", password=" + password
				+ ", isAdmin=" + isAdmin + "]";
	}
	private String username;
    private String firstName;
    private String lastName;
    private String address;
    private String mobile;
    private String email;
    private String password;
    private boolean isAdmin;
    
    
    public Userduplicate(String username, String firstName, String lastName, String address, String mobile, String email, String password, boolean isAdmin) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.mobile = mobile;
        this.email = email;
        this.password = password;
        this.isAdmin = isAdmin;
    }
    
    
    
    public Userduplicate(String username, String firstName, String lastName, String address, String mobile, String email, boolean isAdmin) {
        this.username = username;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.mobile = mobile;
        this.email = email;
        this.isAdmin = isAdmin;
    }



	public Userduplicate() {
		
	}



	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}


	
}
