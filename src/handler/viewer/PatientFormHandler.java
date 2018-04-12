package handler.viewer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import viewer.BoardDao2;
import viewer.PatientFormDataBean;

@Controller
public class PatientFormHandler implements CommandHandler {

	@Resource(name="boardDao2")
	private BoardDao2 boardDao;
	
	@RequestMapping("/PatientForm")	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding( "utf-8" );
		response.setContentType("text/html; charset=utf-8");
		
		String patId = request.getParameter("patId");
		
		List<PatientFormDataBean> clinics = boardDao.selectClinic(patId);
		List<PatientFormDataBean> indates = boardDao.selectIndate(patId);
		List<PatientFormDataBean> forms = boardDao.selectAllForm(patId);
		
		request.setAttribute("clinics", clinics);
		request.setAttribute("indates", indates);
		request.setAttribute("forms", forms);
		
		
		return new ModelAndView("/viewer/patientFormData");
	}

}
