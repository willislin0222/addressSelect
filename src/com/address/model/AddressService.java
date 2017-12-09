package com.address.model;

import java.util.List;

public class AddressService {
	
	AddressDAO_interface dao =new AddressDAO();
	
	public List<String> getcity(){
		return dao.getcity();
	}
	
	public List<String> getTownByCity(String city){
		return dao.gettownBycity(city);
	}
	
	public List<String> getRoadByTown(String town){
		return dao.getroadBytown(town);
	}
}
