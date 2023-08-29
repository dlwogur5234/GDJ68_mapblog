package com.gdj68.mapblog.qna.memberQna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.qna.QnaDAO;
import com.gdj68.mapblog.qna.QnaDTO;
import com.gdj68.mapblog.util.Pager;
@Service
public class MyQnaListService {

	@Autowired
	private MyQnaListDAO myQnaListDAO;
	
	//자기가 쓴 qna만 보기
		public List<QnaDTO> getMyQnaList(MemberDTO memberDTO, Pager pager) throws Exception{
			pager.setPerPage(4L);
			pager.makeRowNum();
			
			pager.makePageNum(myQnaListDAO.getTotal(pager));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("member", memberDTO);
			map.put("pager",pager);
			return myQnaListDAO.getMyQnaList(map);
		}
}
