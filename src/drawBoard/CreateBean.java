package drawBoard;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
 
@Configuration
public class CreateBean {
	@Bean
	public ViewResolver viewResolver () {		 
		String prefix = "/main/";
		String suffix = ".jsp";
		UrlBasedViewResolver view = new UrlBasedViewResolver();
		view.setViewClass(JstlView.class);
		view.setPrefix(prefix);
		view.setSuffix(suffix);
		return view;
	}
	 
}
