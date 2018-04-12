package handler.drawBoard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import drawBoard.BoardDao;
import drawBoard.FormTDataBean;
import drawBoard.UserFormDataBean;
import handler.CommandHandler;

@Controller
public class configHandler implements CommandHandler {
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/config")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html; charset=UTF-8"); 		 
		
		String userid=request.getParameter("userid");
		System.out.println("userId능?.?(config중~)"+userid);
		
		List<UserFormDataBean> uflist=boardDao.selectUserform(userid);
		request.setAttribute("uflist", uflist);
		System.out.println("uflist는?"+uflist);
		List<FormTDataBean> ftlist=boardDao.selectForm();
		request.setAttribute("ftlist", ftlist);
		System.out.println("ftlist는?"+ftlist);
		
		return new ModelAndView("configAjax");
	}
}
