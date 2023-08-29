package com.gdj68.mapblog.qna;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdj68.mapblog.file.FileDTO;
import com.gdj68.mapblog.util.FileManager;
import com.gdj68.mapblog.util.Pager;

@Repository
public class QnaDAO {
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.gdj68.mapblog.qna.QnaDAO.";
	
	
	
	public Long getTotal(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotal");
	}
	public List<QnaDTO> getList(Pager pager) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"getList",pager);
	}
	public int setAdd(QnaDTO qnaDTO) throws Exception{
		System.out.println(qnaDTO.getMemberId());
		return sqlSession.insert(NAMESPACE+"setAdd", qnaDTO);
	}
	public int setFileAdd(QnaFileDTO qnaFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setFileAdd", qnaFileDTO);
	}
	public QnaDTO getDetail(QnaDTO qnaDTO) throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getDetail", qnaDTO);
	}
	public int setUp(QnaDTO qnaDTO) throws Exception{
		
		return sqlSession.update(NAMESPACE+"setUp", qnaDTO);
	}
	public int setDel(QnaDTO qnaDTO) throws Exception{
		
		return sqlSession.delete(NAMESPACE+"setDel", qnaDTO);
	}
	public long getSequence() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getSequence");
	}
	
		
}
