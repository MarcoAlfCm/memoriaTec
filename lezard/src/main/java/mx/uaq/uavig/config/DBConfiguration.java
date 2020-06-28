package mx.uaq.uavig.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;
import org.springframework.jdbc.datasource.init.DatabasePopulator;
import org.springframework.jdbc.datasource.init.DatabasePopulatorUtils;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import liquibase.integration.spring.SpringLiquibase;


public class DBConfiguration {
	
	@Value("${config.urlDb}") private String jdbcUrl;
    @Value("${config.userDb}") private String username;
    @Value("${config.passDb}") private String password;

    @Bean(name = "dataSource")
  	@Profile(value = { "dev" })
      public DataSource getDataSourceH2() {
          DataSource dataSource = createDataSource();
          DatabasePopulatorUtils.execute(createDatabasePopulator(), dataSource);
          
          return dataSource;
      }
    
   
    
    @Bean(name = "dataSource")
  	@Profile(value = { "prod","qa","pre"})
      public DataSource getDataSourceOracleProd() {
  		HikariConfig hikariConfig = new HikariConfig();
  	    hikariConfig.setDriverClassName("oracle.jdbc.driver.OracleDriver");
          hikariConfig.setJdbcUrl(jdbcUrl);
          hikariConfig.setUsername(username);
          hikariConfig.setPassword(password);
  	    hikariConfig.setMaximumPoolSize(5);
  	    hikariConfig.setConnectionTestQuery("SELECT * from dual");
  	    hikariConfig.setPoolName("springSimaHikariCP");
  	    hikariConfig.setConnectionTimeout(10000);
  	    hikariConfig.setMaxLifetime(70000);
  	    hikariConfig.setIdleTimeout(70000);
  	    HikariDataSource dataSource = new HikariDataSource(hikariConfig);
  	    return dataSource;
      }
    
    
    private DatabasePopulator createDatabasePopulator() {
        ResourceDatabasePopulator databasePopulator = new ResourceDatabasePopulator();
        databasePopulator.setSqlScriptEncoding("UTF-8");
        databasePopulator.setContinueOnError(false);
        
        return databasePopulator;
    }
      
    
    private SimpleDriverDataSource createDataSource() {
   	 SimpleDriverDataSource simpleDriverDataSource = new SimpleDriverDataSource();
        simpleDriverDataSource.setDriverClass(org.h2.Driver.class);
        simpleDriverDataSource.setUrl(jdbcUrl);
        simpleDriverDataSource.setUsername(username);
        simpleDriverDataSource.setPassword(password);
        
        return simpleDriverDataSource;  
   }
      
    @Bean
    @Profile(value = { "dev" })
    public SpringLiquibase springLiquibase() {
        SpringLiquibase springLiquibase = new SpringLiquibase();
        springLiquibase.setDataSource(getDataSourceH2());
        springLiquibase.setDropFirst(false);
        springLiquibase.setChangeLog("classpath:liquibase/changelog.xml");
        
        return springLiquibase;
    }
    
    
}