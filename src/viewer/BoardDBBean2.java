package viewer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import db.SqlMapClient;

@Component("boardDao2")
public class BoardDBBean2 implements BoardDao2 {

	@Override
	public List<PatientFormDataBean> selectClinic(String patId) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<PatientFormDataBean> result = sqlSession.selectList("DrawBoard.selectClinic", patId);
		sqlSession.close();
		return result;
	}
	
	@Override
	public List<PatientFormDataBean> selectIndate(String patId) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<PatientFormDataBean> result = sqlSession.selectList("DrawBoard.selectIndate", patId);
		sqlSession.close();
		return result;
	}
	
	@Override
	public List<PatientFormDataBean> selectAllForm(String patId) {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<PatientFormDataBean> result = sqlSession.selectList("DrawBoard.selectAllForm", patId);
		sqlSession.close();
		return result;
	}


	
}
