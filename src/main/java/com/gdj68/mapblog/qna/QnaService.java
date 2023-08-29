package com.gdj68.mapblog.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.FileManager;
import com.gdj68.mapblog.util.Pager;

@Service
public class QnaService {
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private FileManager fileManager;
	
	
	
	
	
	public List<QnaDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(qnaDAO.getTotal(pager));
		/*
		 * Map<String, Object> params = new HashMap<>(); params.put("pager", pager);
		 * params.put("qnaDTO", qnaDTO);
		 */
		
		return qnaDAO.getList(pager);
	}
	
	
	public int setAdd(QnaDTO qnaDTO,MultipartFile[] photos, HttpSession session) throws Exception{
		
		String path = "/resources/upload/qna";
		int result=qnaDAO.setAdd(qnaDTO);
		
		for(MultipartFile multipartFile: photos) {
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName=fileManager.fileSave(path, session, multipartFile);
			QnaFileDTO qnaFileDTO = new QnaFileDTO();
			qnaFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			qnaFileDTO.setFileName(fileName);
			qnaFileDTO.setQnaNum(qnaDTO.getQnaNum());
			result = qnaDAO.setFileAdd(qnaFileDTO);
		}
		System.out.println(qnaDTO.getMemberId());
		return result;
	}
	
	public QnaDTO getDetail(QnaDTO qnaDTO,MemberDTO memberDTO) throws Exception{
		
		qnaDTO=qnaDAO.getDetail(qnaDTO);
		System.out.println(qnaDTO.getPrivateContents());
		if(qnaDTO.getPrivateContents() == 0 ) {
			if(memberDTO != null && memberDTO.getId().equals(qnaDTO.getMemberId())) {
				return qnaDAO.getDetail(qnaDTO);
			}
			else {
				return null;
			}
		}else {
		return qnaDTO;
		}
	}
	public int setUp(QnaDTO qnaDTO,MultipartFile[] photos , HttpSession session) throws Exception{
		return qnaDAO.setUp(qnaDTO);
	}
	public int setDel(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setDel(qnaDTO);
	}
}
