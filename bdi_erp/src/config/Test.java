package config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class Test {

	public static void main(String[] args) {
		String path = "/config/db.properties";
		InputStream is = Test.class.getResourceAsStream(path);
		Properties prop = new Properties();
		
		try {
			prop.load(is);
			System.out.println(prop.getProperty("driver"));
			System.out.println(prop.getProperty("url"));
			System.out.println(prop.getProperty("id"));
			System.out.println(prop.getProperty("pwd"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
