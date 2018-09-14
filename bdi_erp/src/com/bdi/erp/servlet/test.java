package com.bdi.erp.servlet;

import java.util.HashMap;
import java.util.Map;

public class test {

	public static void main(String[] args) {
		String s = new String("a");
		
		try {
			Class c = Class.forName("java.lang.String");
			s = (String) c.newInstance();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
