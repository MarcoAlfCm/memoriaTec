package mx.uaq.uavig.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
@EnableScheduling
@Import({ DBConfiguration.class, PersistenceJPAConfiguration.class, PropertiesConfiguration.class })
@ComponentScan({  "mx.uaq.uavig.dao", "mx.uaq.uavig.security.authentication",
	"mx.uaq.uavig.service","mx.uaq.uavig.business","mx.uaq.uavig.vo"})
public class RootConfiguration {

	@Autowired
	private DataSource dataSource;

	@Bean
	public RestTemplate createRestClient() {
		RestTemplate restTemplate = new RestTemplate();
		((SimpleClientHttpRequestFactory) restTemplate.getRequestFactory()).setConnectTimeout(60000);
		((SimpleClientHttpRequestFactory) restTemplate.getRequestFactory()).setReadTimeout(60000);

		return restTemplate;
	}

	@Bean
	public static PropertySourcesPlaceholderConfigurer propertyConfigInDev() {
		return new PropertySourcesPlaceholderConfigurer();
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver getMultipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("utf-8");

		return resolver;
	}

	@Bean
	public ObjectMapper basicJsonObjectMapper() {
		return new ObjectMapper();
	}

	@Bean
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource);
	}
}