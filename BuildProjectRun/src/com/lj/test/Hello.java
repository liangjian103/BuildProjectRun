package com.lj.test;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

public class Hello {
	
	private static final Logger LOG = LoggerFactory.getLogger(Hello.class);

	public static void main(String[] args) {
		Hello hello = new Hello();
		hello.springTest();
	}
	
	public void springTest() {
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate jdbcTemplate = (JdbcTemplate) context.getBean("oracleJdbcTemplate");
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = jdbcTemplate.queryForList("select * from tb_vehicle");
		System.out.println(list);
		LOG.info("rs:{}",list);
		try {
			Thread.sleep(60000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
