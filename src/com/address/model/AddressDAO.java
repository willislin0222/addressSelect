package com.address.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import hibernate.util.HibernateUtil;


public class AddressDAO implements AddressDAO_interface{

	private static final String GET_CITY="select distinct city from AddressVO";
	private static final String GET_TOWNS_BY_CITY="select distinct town from AddressVO where city=?";
	private static final String GET_ROADS_BY_TOWN="select distinct road from AddressVO where town=?";
	@Override
	public List<String> getcity() {
		List<String> citys = null; 
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_CITY);
			citys = query.list();
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;
		}
		
		return citys;
	}
	@Override
	public List<String> gettownBycity(String city) {
		List<String> towns = null; 
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_TOWNS_BY_CITY);
			query.setParameter(0, city);
			towns = query.list();
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;
		}
		
		return towns;
	}
	@Override
	public List<String> getroadBytown(String town) {
		List<String> roads = null; 
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		try{
			session.beginTransaction();
			Query query = session.createQuery(GET_ROADS_BY_TOWN);
			query.setParameter(0, town);
			roads = query.list();
			session.getTransaction().commit();
		}catch(RuntimeException ex){
			session.getTransaction().rollback();
			throw ex;
		}
		
		return roads;
	}

}
