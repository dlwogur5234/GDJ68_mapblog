package com.gdj68.mapblog.notice;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.file.FileDTO;
import com.gdj68.mapblog.qna.QnaDAO;
import com.gdj68.mapblog.util.FileManager;
import com.gdj68.mapblog.util.Pager;


@Service
public class NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private FileManager fileManager;
	
	public List<NoticeDTO> getList(Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(noticeDAO.getTotal(pager));
		return noticeDAO.getList(pager);
	}
	
	public int setAdd(NoticeDTO noticeDTO,MultipartFile[] photos , HttpSession session) throws Exception{
		String path = "/resources/upload/notice";
		int result = noticeDAO.setAdd(noticeDTO);
		
		for(MultipartFile multipartFile: photos) {
			
			if(multipartFile.isEmpty()) {
				continue;
			}
			String filName = fileManager.fileSave(path, session, multipartFile);
			NoticeFileDTO noticeFileDTO = new NoticeFileDTO();
			noticeFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			noticeFileDTO.setFileName(filName);
			noticeFileDTO.setNoticeNum(noticeDTO.getNoticeNum());
			result = noticeDAO.setFileAdd(noticeFileDTO);
		}
		return result;
		
	}
	
	public NoticeDTO getDetail(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.getDetail(noticeDTO);
	}
	public int setDelete(NoticeDTO noticeDTO) throws Exception{
		return noticeDAO.setDelete(noticeDTO);
		
	}
	public int setUpdate(NoticeDTO noticeDTO,MultipartFile[] photos,HttpSession session) throws Exception{
		return noticeDAO.setUpdate(noticeDTO);
	}
	public String setContentsImg(MultipartFile file,HttpSession session)throws Exception{
		String path = "/resources/upload/notice/";
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
}
