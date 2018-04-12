package handler.drawBoard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import drawBoard.BoardDao;
import drawBoard.ChartPageTDataBean;
import handler.CommandHandler;

@Controller
public class memoHandler implements CommandHandler {

	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/memo")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html; charset=UTF-8"); 		 

		String patId=request.getParameter("patId");
		System.out.println("patid능?"+patId);
		
		List<ChartPageTDataBean> cplist=boardDao.selectChartpage(patId);
		
		request.setAttribute("cplist", cplist);
		
		System.out.println("cplist는?"+cplist);
		
		return new ModelAndView("/viewer/memo");
	}

}
