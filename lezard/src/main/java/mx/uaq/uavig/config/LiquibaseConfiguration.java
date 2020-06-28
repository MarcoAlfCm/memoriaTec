package mx.uaq.uavig.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import liquibase.integration.spring.SpringLiquibase;

@Configuration
public class LiquibaseConfiguration {

	@Autowired private DataSource dataSource;
	
	@Bean
	@Profile("dev")
	public SpringLiquibase springLiquibase() {
		SpringLiquibase springLiquibase = new SpringLiquibase();
		springLiquibase.setDataSource(dataSource);
		springLiquibase.setChangeLog("classpath:liquibase/changelog.xml");
		
		return springLiquibase;
	}
}