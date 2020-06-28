package mx.uaq.uavig.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.env.Environment;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class PropertiesConfiguration implements EnvironmentAware {

	private Environment env;
	
	@Bean
	public PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
		PropertySourcesPlaceholderConfigurer configurer = new PropertySourcesPlaceholderConfigurer();
		configurer.setLocations(locations());
		
		return configurer;
	}

	@Bean
	public Resource[] locations() {
		String[] locations = new String[] { "application" };
		List<Resource> resourceList = new ArrayList<>(locations.length);
		String profileSuffix = createProfileSufixFromProfile();
		for (String location : locations) 
			resourceList.add(new ClassPathResource(String.format("%s%s.properties", location, profileSuffix)));
		
		return resourceList.toArray(new Resource[] {});
	}

	private String createProfileSufixFromProfile() {
		String firstActiveProfile = env.getActiveProfiles()[0];
		
		return firstActiveProfile.equals("prod") ? "" : "_" + firstActiveProfile;
	}

	@Override
	public void setEnvironment(Environment environment) {
		env = environment;
	}
}