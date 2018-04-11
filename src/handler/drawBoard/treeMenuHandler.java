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
import handler.CommandHandler;

@Controller
public class treeMenuHandler implements CommandHandler {
	
	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/treeMenu")
	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html; charset=UTF-8"); 		 
		List<FormTDataBean> list = boardDao.selectForm();		
		request.setAttribute("list", list);		
		return new ModelAndView("treeMenuAjax");
	}

}
