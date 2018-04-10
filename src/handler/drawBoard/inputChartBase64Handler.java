package handler.drawBoard;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import drawBoard.BoardDao;
import handler.CommandHandler;

@Controller
public class inputChartBase64Handler implements CommandHandler {

	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/inputChart")	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html; charset=UTF-8"); 		 
//		List<PathTDataBean> list = boardDao.selectPath();		
//		request.setAttribute("list", list);	
		String get = request.getParameter("image");
		get = get.replaceAll("\\p{Z}", "+");	 
		get = get.replaceAll("_", "/");
		get = get.replaceAll("-", "+"); 
		request.setAttribute("get", get);
		return new ModelAndView("chartBase64Ajax");
	}

}
