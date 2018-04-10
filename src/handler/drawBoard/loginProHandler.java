package handler.drawBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class loginProHandler{

	@RequestMapping("/loginPro")
	public void process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("hi");
		response.sendRedirect("main/viewer/viewerMain.jsp");
	}
}
