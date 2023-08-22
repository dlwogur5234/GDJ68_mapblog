package com.gdj68.mapblog.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		return result;
	}
	
	public QnaDTO getDetail(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.getDetail(qnaDTO);
	}
	public int setUp(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setUp(qnaDTO);
	}
	public int setDel(QnaDTO qnaDTO) throws Exception{
		return qnaDAO.setDel(qnaDTO);
	}
}
