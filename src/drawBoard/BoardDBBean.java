package drawBoard;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import db.SqlMapClient;
 

@Component("boardDao")
public class BoardDBBean implements BoardDao {
	
//	@Override
//	public int selectAll() {		
//		return new SqlMapClient().getSqlSession().selectOne("DrawBoard.selectAll");
//	}

	@Override
	public int selectAll() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		int result = sqlSession.selectOne("DrawBoard.selectAll");
		sqlSession.close();
		return result;
	}
	@Override
	public List<PageTDataBean> selectList() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();		
		List<PageTDataBean> result =  sqlSession.selectList("DrawBoard.selectList");
		sqlSession.close();
		return result;
	}

	@Override
	public String selectOne() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		String result = sqlSession.selectOne("DrawBoard.selectOne");
		sqlSession.close();
		return result;
	}

	@Override
	public List<PatientTDataBean> selectPatient() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<PatientTDataBean> result = sqlSession.selectList("DrawBoard.selectPatient");
		sqlSession.close();
		return result;
	}
 
	@Override
	public PathTDataBean selectPathByPort(int pathPort) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		PathTDataBean result = sqlSession.selectOne("DrawBoard.selectPathByPort", pathPort);
		sqlSession.close();
		return result;
	}	
	
	@Override
	public List<PrescriptionTDataBean> selectPrescription() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<PrescriptionTDataBean> result = sqlSession.selectList("DrawBoard.selectPrescription");
		sqlSession.close();
		return result;
		
	}
	
	@Override
	public List<WaitDataBean> selectWait() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<WaitDataBean> result = sqlSession.selectList("DrawBoard.selectWait");
		sqlSession.close();
		return result;
		
	}
	
	@Override
		public LoginDataBean selectLogin(String id) {
			SqlSession sqlSession =  new SqlMapClient().getSqlSession();
			LoginDataBean result = sqlSession.selectOne("DrawBoard.selectLogin",id );
			sqlSession.close();
			return result;
		}
	
	@Override
		public List<PatientTDataBean> selectPatientById(String patId) {
			SqlSession sqlSession =  new SqlMapClient().getSqlSession();
			List<PatientTDataBean> patient = sqlSession.selectList("DrawBoard.selectPatientById",patId);
			sqlSession.close();
			return patient;
		}
	
	@Override
		public List<PatientTDataBean> selectPatientByName(String patName) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<PatientTDataBean> patient = sqlSession.selectList("DrawBoard.selectPatientByName",patName);
		sqlSession.close();
		return patient;
		}
	/////////////////////////////////////////////////////////////////////////////////////////////////////	
	@Override
	public List<FormTDataBean> selectForm() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<FormTDataBean> result = sqlSession.selectList("DrawBoard.selectForm");
		sqlSession.close();
		return result;
	}
	@Override
	public int selectTreatNoByPatId(String patId) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		int result = sqlSession.selectOne("DrawBoard.selectTreatNoByPatId", patId); 
		sqlSession.close();
		return result;
	}
	@Override
	public List<PageTDataBean> selectAllPage() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<PageTDataBean> result = sqlSession.selectList("DrawBoard.selectAllPage");
		sqlSession.close();
		return result;
	}	
	@Override
	public int insertPageT(PageTDataBean page) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		int result = sqlSession.insert("DrawBoard.insertPageT", page);
		sqlSession.close();
		return result;
	}
	@Override
	public int insertChartPageT(ChartPageTDataBean chartPage) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		int result = sqlSession.insert("DrawBoard.insertChartPageT", chartPage);
		sqlSession.close();
		return result;
	}
	@Override
	public List<ChartPageTDataBean> selectChartpage(String patId) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<ChartPageTDataBean> result = sqlSession.selectList("DrawBoard.selectChartpage", patId);
		sqlSession.close();
		return result;
	}
	@Override
	public List<UserFormDataBean> selectUserform(String userid) {
	 SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<UserFormDataBean> patient = sqlSession.selectList("DrawBoard.selectUserform",userid);
		sqlSession.close();
		return patient;
	}
}
 
 