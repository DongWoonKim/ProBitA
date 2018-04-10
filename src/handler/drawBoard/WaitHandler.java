package handler.drawBoard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import drawBoard.BoardDao;
import drawBoard.PatientTDataBean;
import drawBoard.WaitDataBean;
import handler.CommandHandler;

@Controller
public class WaitHandler implements CommandHandler {
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/wait")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html; charset=UTF-8"); 		 
		
		List<PatientTDataBean> plist=boardDao.selectPatient();
		List<WaitDataBean> wlist=boardDao.selectWait();
		request.setAttribute("plist", plist);
		request.setAttribute("wlist", wlist);
		 
		return new ModelAndView("waitAjax");
	}
	
}
