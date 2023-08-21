package com.gdj68.mapblog.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.util.Pager;

@Service
public class QnaService {
	@Autowired
	private QnaDAO qnaDAO;
	
	public List<QnaDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(qnaDAO.getTotal(pager));
		return qnaDAO.getList(pager);
	}
	
	
	public int setAdd(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setAdd(qnaDTO);
	}
}
