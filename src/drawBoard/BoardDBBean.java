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
	public List<PathTDataBean> selectPath() {
		SqlSession sqlSession =  new SqlMapClient().getSqlSession();
		List<PathTDataBean> result = sqlSession.selectList("DrawBoard.selectPath");
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
}
 
 