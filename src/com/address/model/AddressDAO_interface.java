package com.address.model;

import java.util.List;


public interface AddressDAO_interface {
	public List<String> getcity();
	public List<String> gettownBycity(String city);
	public List<String> getroadBytown(String town);
	
}
