package mx.uaq.uavig.config;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SessionListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent se) {
        se.getSession().setMaxInactiveInterval(30 * 60);
        ApplicationContext context = WebApplicationContextUtils
                .getWebApplicationContext(se.getSession().getServletContext());

        HttpSessionListener target = context.getBean(
                "httpSessionEventPublisher", HttpSessionListener.class);
        target.sessionCreated(se);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {		
		ApplicationContext context = WebApplicationContextUtils
	            .getWebApplicationContext(se.getSession().getServletContext());

	    HttpSessionListener target = context.getBean(
	            "httpSessionEventPublisher", HttpSessionListener.class);
	    target.sessionDestroyed(se);
	}
}