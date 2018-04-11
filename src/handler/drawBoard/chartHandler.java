package handler.drawBoard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import drawBoard.BoardDao;
import drawBoard.PathTDataBean;
import handler.CommandHandler;

@Controller
public class chartHandler implements CommandHandler {
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/main")
	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html; charset=UTF-8"); 		 
		List<PathTDataBean> list = boardDao.selectPath();			
		request.setAttribute("list", list);		
		return new ModelAndView("chartAjax");
	}	
}