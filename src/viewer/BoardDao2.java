package viewer;

import java.util.List;

public interface BoardDao2 {
	public List<PatientFormDataBean> selectClinic(String patId);
	public List<PatientFormDataBean> selectIndate(String patId);
	public List<PatientFormDataBean> selectAllForm(String patId);
	
}
