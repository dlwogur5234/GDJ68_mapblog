package com.gdj68.mapblog.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.admin.member.AdminMemberDTO;
import com.gdj68.mapblog.file.FileDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.qna.qnaComment.QnaCommentDTO;
import com.gdj68.mapblog.util.FileManager;
import com.gdj68.mapblog.util.Pager;


@Service
public class QnaService {
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private FileManager fileManager;
	
	//qnaComment
	public List<QnaCommentDTO> getCommentList(Pager pager, QnaCommentDTO qnaCommentDTO) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		pager.makeRowNum();
		pager.makePageNum(qnaDAO.getCommentTotal(qnaCommentDTO));
		map.put("pager",pager);
		map.put("comment", qnaCommentDTO);
		return qnaDAO.getCommentList(map);
	}
	public int setCommentAdd(QnaCommentDTO qnaCommentDTO) throws Exception{
		return qnaDAO.setCommentAdd(qnaCommentDTO);
	}
	public int setCommentDelete(QnaCommentDTO qnaCommentDTO) throws Exception{
		return qnaDAO.setCommentDel(qnaCommentDTO);
	}
	public int setCommentUp(QnaCommentDTO qnaCommentDTO) throws Exception{
		return qnaDAO.setCommentUp(qnaCommentDTO);
	}
	
	
	//qna
	public String setContentsImg(MultipartFile file,HttpSession session)throws Exception{
		String path = "/resources/upload/qna/";
		String fileName=fileManager.fileSave(path, session, file);
		return path+fileName;
	}
	public boolean setContentsImgDelete(String path,HttpSession session ) throws Exception{
		//path: /resources/upload/notice/파일명
		FileDTO fileDTO = new FileDTO();
//		path= path.substring(0, path.lastIndexOf("\\")+1);
		System.out.println(path.substring(path.lastIndexOf("/")+1));
		fileDTO.setFileName(path.substring(path.lastIndexOf("/")+1));
		path="/resources/upload/notice/";
		return fileManager.fileDelete(fileDTO, path, session);
	}
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
	
	public QnaDTO getDetail(QnaDTO qnaDTO,MemberDTO memberDTO,AdminMemberDTO adminMemberDTO) throws Exception{
		/*
		 * boolean result = memberDTO != null &&
		 * memberDTO.getId().equals(qnaDTO.getMemberId());
		 */
		qnaDTO=qnaDAO.getDetail(qnaDTO);
		
		if(qnaDTO.getPrivateContents() == 0 ) {
			if((memberDTO != null && memberDTO.getId().equals(qnaDTO.getMemberId())) || adminMemberDTO != null) {
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
