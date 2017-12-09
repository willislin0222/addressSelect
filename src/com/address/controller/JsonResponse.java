package com.address.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.address.model.AddressService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonResponse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//取得citys資料
		if("citydata".equals(request.getParameter("action"))){
			AddressService addressSvc = new AddressService();
			List<String> list = addressSvc.getcity();
			//將資料轉成JSON格式
			JSONArray array = new JSONArray();
			for(String citys:list){
				JSONObject obj = new JSONObject();
				try{
					obj.put("city", citys);
				}catch(Exception e){}
				array.add(obj);
			}
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
		}
		
		//取得towns資料
		if("towndata".equals(request.getParameter("action"))){
			String city=request.getParameter("city");
			AddressService addressSvc = new AddressService();
			List<String> list = addressSvc.getTownByCity(city);
			//將資料轉成JSON格式
			JSONArray array = new JSONArray();
			for(String towns:list){
				JSONObject obj = new JSONObject();
				try{
					obj.put("town", towns);
				}catch(Exception e){}
				array.add(obj);
			}
			System.out.println(array.toString());
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
		}
		
		//取得roads資料
		if("roaddata".equals(request.getParameter("action"))){
			String town=request.getParameter("town");
			AddressService addressSvc = new AddressService();
			List<String> list = addressSvc.getRoadByTown(town);
			//將資料轉成JSON格式
			JSONArray array = new JSONArray();
			for(String roads:list){
				JSONObject obj = new JSONObject();
				try{
					obj.put("road", roads);
				}catch(Exception e){}
				array.add(obj);
			}
			System.out.println(array.toString());
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			out.write(array.toString());
			out.flush();
			out.close();
		}
	}

}
