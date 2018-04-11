package handler.viewer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import drawBoard.BoardDao;
import drawBoard.PatientTDataBean;
import handler.CommandHandler;

@Controller
public class searchInfoHandler implements CommandHandler {

	@Resource(name="boardDao")
	private BoardDao boardDao;
	
	@RequestMapping("/searchInfo")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding( "utf-8" );
		response.setContentType("text/html; charset=utf-8");
		
		String info = request.getParameter("info");
		String type = request.getParameter("type");
	
		if(type.equals("patId")) {
			List<PatientTDataBean> patient = boardDao.selectPatientById(info);
			request.setAttribute("patient", patient);			
		} else if(type.equals("patName")){
			List<PatientTDataBean> patient = boardDao.selectPatientByName(info);
			
			for(PatientTDataBean v : patient) {
				System.out.println(v.getName());
			}
			request.setAttribute("patient", patient);
		}
		
		return new ModelAndView("/viewer/searchInfo");
	}

}
