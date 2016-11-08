

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.peter.util.MapToParam;
import com.yihuo.dao.IHouseDao;
import com.yihuo.domain.House;


public class TestDI {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		String conf="applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		IHouseDao housedao = ac.getBean("housedao",IHouseDao.class);
		House h = new House();
//		t.setBannerdate("2015-12-16 9:16:30");
//		t.setGamename("壹火互动");
//		t.setGamepicture("abc.jpg");
//		three.insert(t);
//		System.out.println(t);
	}

}
