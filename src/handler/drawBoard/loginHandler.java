package handler.drawBoard;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import drawBoard.BoardDao;
import drawBoard.LoginDataBean;
import handler.CommandHandler;

@Controller
public class loginHandler implements CommandHandler {
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/login")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter( "userid" );
		String pw = request.getParameter( "passwd" );
		
			
		LoginDataBean user= boardDao.selectLogin(id);
		PrintWriter out = response.getWriter();
		
		if(user==null) {
			out.write("<script> alert('다시입력해주세요.') </script>");
			out.write("<script> history.back() </script>");
			out.flush();
			return null;
		}
		
		if(pw.equals(user.getPasswd()) && user!=null) {
			request.getSession().setAttribute("userId", id);
			response.sendRedirect("loginPro.do");
			return null;
			
		} else {
			out.write("<script> alert('다시입력해주세요.') </script>");
			out.write("<script> history.back() </script>");
			out.flush();
			//response.sendRedirect("main/login.jsp");
			return null;
		}
		
		

	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/login.do";
	}
}
