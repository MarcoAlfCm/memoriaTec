package mx.uaq.uavig.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = { "mx.uaq.uavig.dao" })
public class PersistenceJPAConfiguration {

	@Autowired
	@Qualifier("jpaProperties")
	private Properties jpaPropertiesAdicionales;
	
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource) {
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setDataSource(dataSource);
		em.setPackagesToScan(new String[] { "mx.uaq.uavig.model" });
		
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		em.setJpaVendorAdapter(vendorAdapter);
		em.setJpaProperties(jpaPropertiesAdicionales);
		
		return em;
	}

	@Bean
	public PlatformTransactionManager transactionManager(EntityManagerFactory emf) {
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(emf);
		
		return transactionManager;
	}

	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
	
	
	@Bean(name = "jpaProperties")
	@Profile("dev")
	public static Properties additionalProperties() {
		Properties properties = new Properties();
		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		properties.setProperty("hibernate.show_sql", "true");
		properties.setProperty("hibernate.default_schema", "PUBLIC");
		properties.setProperty("hibernate.format_sql", "true");
		
		return properties;
	}
	
	@Bean(name ="jpaProperties")
	@Profile({"prod","qa","pre"})
	public static Properties crearPropiedadesAdicionalesProd() {
		Properties properties=new Properties();

		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.Oracle10gDialect");
		properties.setProperty("hibernate.show_sql", "true");
		properties.setProperty("hibernate.format_sql", "false");
		properties.setProperty("hibernate.jdbc.use_get_generated_keys", "true");
		return properties;
		
	}
	
	
	
//	@Bean(name = "jpaProperties")
//	public static Properties additionalProperties() {
//		Properties properties = new Properties();
//		properties.setProperty("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
//		properties.setProperty("hibernate.show_sql", "true");
//		properties.setProperty("hibernate.format_sql", "false");
//		properties.setProperty("hibernate.default_schema", "PUBLIC");
//		
//		return properties;
//	}
}