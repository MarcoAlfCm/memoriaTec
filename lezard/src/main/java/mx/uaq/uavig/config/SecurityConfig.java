package mx.uaq.uavig.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import mx.uaq.uavig.security.authentication.AuthenticationProvider;
import mx.uaq.uavig.security.authentication.CustomUserDetailsService;
import mx.uaq.uavig.security.authentication.UaqWebAuthenticationFailureHandler;
import mx.uaq.uavig.security.authentication.UaqWebUrlAuthenticationSuccessHandler;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends  WebSecurityConfigurerAdapter{

	public static final String LOGOUT_PERMISO_DENEGADO = "/api/logout?causaLogout=permisoDenegado";
	
	@Autowired private UaqWebAuthenticationFailureHandler webAuthenticationFailureHandler;
	@Autowired private UaqWebUrlAuthenticationSuccessHandler webUrlAuthenticationSuccessHandler;
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
	
	@Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(getAuthenticationProvider());
    }
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring()
			.antMatchers("/resources/**/*.{js,html,css,png,woff}");
	}
	
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http.exceptionHandling().accessDeniedHandler(crearDeniedHandler())
            .and()
            .formLogin()
            .loginProcessingUrl("/api/authenticate")
            .loginPage("/login")
            .failureHandler(webAuthenticationFailureHandler)
            .successHandler(webUrlAuthenticationSuccessHandler)
            .usernameParameter("username")
            .passwordParameter("password")
            .permitAll()
            .and()
            .logout()
            .logoutUrl("/api/logout")
            .invalidateHttpSession(true)
            .clearAuthentication(true)
            .logoutSuccessHandler(new LogoutSuccessHandler() {
                @Override
                public void onLogoutSuccess(final HttpServletRequest httpServletRequest, 
                		final HttpServletResponse httpServletResponse, final Authentication authentication) throws IOException, ServletException {
                    Object causaLogout = httpServletRequest.getParameter("causaLogout");
                    String causaLogoutQuery = causaLogout==null?"logout":causaLogout.toString();
                    httpServletResponse.setStatus(HttpStatus.OK.value());
                    httpServletResponse.sendRedirect(String.format("%s/%s?%s",httpServletRequest.getContextPath(),"",causaLogoutQuery));
                    httpServletResponse.getWriter().flush();
                }
            })
            .deleteCookies("JSESSIONID")
            .permitAll()
            .and()
            .headers()
            .frameOptions()
            .sameOrigin()
            .and()
            .authorizeRequests()
            .antMatchers("/admin/**").hasRole("ADMINISTRADOR")
            .antMatchers("/maestro/**").hasRole("MAESTRO")
            .antMatchers("/alumno/**").hasRole("ALUMNO")
            .and()
            .sessionManagement()
            .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
            .maximumSessions(1)
            .maxSessionsPreventsLogin(false)
            .expiredUrl("/login?expiredSession")
            .and().invalidSessionUrl("/login?expiredSession")
            .sessionFixation().newSession()
            .and().csrf().disable();
    }
	
	 @Bean
    public AccessDeniedHandler crearDeniedHandler() {
        return new AccessDeniedHandler() {
            @Override
            public void handle(final HttpServletRequest httpServletRequest, final HttpServletResponse
                    httpServletResponse, final AccessDeniedException e) throws IOException, ServletException {
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath() +
                        LOGOUT_PERMISO_DENEGADO);
            }
        };
    }
	
	@Bean
    public AbstractUserDetailsAuthenticationProvider getAuthenticationProvider() {
        return new AuthenticationProvider();
    }
	
	@Bean
    public UserDetailsService userDetailsService() {
    	return new CustomUserDetailsService();
    }
	
	
	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
	    return new HttpSessionEventPublisher();
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
