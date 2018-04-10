package drawBoard;

import java.util.List;

public interface BoardDao {	 
	public int selectAll();    
	public List<PageTDataBean> selectList();
	public String selectOne();
	public List<PatientTDataBean> selectPatient();
	public List<PathTDataBean> selectPath();
	public List<PrescriptionTDataBean> selectPrescription();
	public PathTDataBean selectPathByPort(int pathPort);
	public List<WaitDataBean> selectWait();
	public LoginDataBean selectLogin(String id);
}
