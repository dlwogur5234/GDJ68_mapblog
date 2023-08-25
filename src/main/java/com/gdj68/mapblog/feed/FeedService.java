package com.gdj68.mapblog.feed;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.util.FileManager;
import com.gdj68.mapblog.util.Pager;

@Service
public class FeedService {

	@Autowired
	private FeedDAO feedDAO;
	
	@Autowired
	private FileManager fileManager;
	
	/* ----------------------------------------------------------- */
	
	// getList
	public List<FeedDTO> getList(Pager pager) throws Exception {
		pager.makeRowNum();
		Long total = feedDAO.getTotal(pager);
		pager.makePageNum(total);
		
		return feedDAO.getList(pager);
	}
	
	// setAdd
	public int setAdd(FeedDTO feedDTO, MultipartFile [] files, HttpSession session) throws Exception {
		
		String path = "/resources/upload/board/";
		
		int result = feedDAO.setAdd(feedDTO);
		
		for (MultipartFile multipartFile : files) {
			
			if(!multipartFile.isEmpty()) {
				
				String fileName = fileManager.fileSave(path, session, multipartFile);
				
				FeedFileDTO feedFileDTO = new FeedFileDTO();
				feedFileDTO.setFeedNum(feedDTO.getFeedNum());
				feedFileDTO.setOriginalName(multipartFile.getOriginalFilename());
				feedFileDTO.setFileName(fileName);
				
				result = feedDAO.setFileAdd(feedFileDTO);
			}
			
		}
		
		return result;
	}
	
	
	// getDetail
	public FeedDTO getDetail(FeedDTO feedDTO) throws Exception {
		feedDAO.setHitUpdate(feedDTO);
		return feedDAO.getDetail(feedDTO);
	}
	
	
	// setDelete
	public int setDelete(FeedDTO feedDTO) throws Exception {
		return feedDAO.setDelete(feedDTO);
	}
	
	
	// setUpdate
	public int setUpdate(FeedDTO feedDTO, MultipartFile [] files, HttpSession session) throws Exception {
		return feedDAO.setUpdate(feedDTO);
	}
	
	
	// setFileDelete
	public int setFileDelete(FeedFileDTO feedFileDTO, HttpSession session) throws Exception {
		// 폴더 파일 삭제
		feedFileDTO = feedDAO.getFileDetail(feedFileDTO);
		boolean flag = fileManager.fileDelete(feedFileDTO, "/resources/upload/board/", session);
		
		if(flag) {
			// DB에서 삭제
			return feedDAO.setFileDelete(feedFileDTO);
		}
		
		return 0;
	}
	
	// setContentsImgDelete
	public boolean setContentsImgDelete(String path, HttpSession session)throws Exception{
		//path: /resources/upload/board/파일명
		FeedFileDTO feedFileDTO = new FeedFileDTO();
		
//		System.out.println(path.substring(path.lastIndexOf("/")+1));
		feedFileDTO.setFileName(path.substring(path.lastIndexOf("/") + 1));
		
		path = "/resources/upload/board/";
		return fileManager.fileDelete(feedFileDTO, path, session);
	}
	
	
	// setContentsImg
	public String setContentsImg(MultipartFile file, HttpSession session) throws Exception {
		String path = "/resources/upload/board/";
		String fileName = fileManager.fileSave(path, session, file);
		return path + fileName;
	}
	

}
