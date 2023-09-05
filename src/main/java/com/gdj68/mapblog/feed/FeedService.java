package com.gdj68.mapblog.feed;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.file.FileDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.FileManager;
import com.gdj68.mapblog.util.Pager;


@Service
public class FeedService {

	@Autowired
	private FeedDAO feedDAO;
	
	@Autowired
	private FileManager fileManager;
	
	/* ----------------------------------------------------------- */
	
	// 리스트
	public List<FeedDTO> getList(Pager pager) throws Exception {
		pager.setPerPage(9L);
		pager.makeRowNum();
		Long total = feedDAO.getTotal(pager);
		pager.makePageNum(total);
		
		return feedDAO.getList(pager);
	}
	
	
	public List<FeedDTO> getList(MemberDTO memberDTO) throws Exception {
	     return feedDAO.getList(memberDTO);
	}
	
	
	public FeedDTO getUrl(FeedDTO feedDTO) throws Exception {

		return feedDAO.getUrl(feedDTO);
	}
	
	
	public MemberDTO getUser(FeedDTO feedDTO) {
		return feedDAO.getUser(feedDTO);
		
	}


	public Pager getPage(Pager pager) throws Exception {
		// 한 페이지에 보여질 ROW 갯수 (Count 역할)
		pager.setPerPage(4L);
		
		pager.makeRowNum();
		Long total = feedDAO.getTotal(pager);
		pager.makePageNum(total);
//		pager.setTotal(total);
		
		
		Long totalPage;
		
		if (total % 4L != 0) {
			totalPage = total / 4L + 1;
		} else {
			totalPage = total / 4L;
		}

		return pager;
	}


	// 글 추가
	public int setAdd(FeedDTO feedDTO, MultipartFile [] files, HttpSession session) throws Exception {
		
		String path = "/resources/upload/feed/";
		
		int result = feedDAO.setAdd(feedDTO);
		
		for (MultipartFile file : files) {
			
			if(!file.isEmpty()) {
	
			String fileName = fileManager.fileSave(path, session, file);
			
			FeedFileDTO feedFileDTO = new FeedFileDTO();
			feedFileDTO.setFeedNum(feedDTO.getFeedNum());
			feedFileDTO.setOriginalName(file.getOriginalFilename());
			feedFileDTO.setFileName(fileName);
			
			result = feedDAO.setFileAdd(feedFileDTO);
				
			}
		}
		
		return result;
	}
	
	
	// 글 디테일
	public FeedDTO getDetail(FeedDTO feedDTO) throws Exception {
		feedDAO.setHitUpdate(feedDTO);
		return feedDAO.getDetail(feedDTO);
	}
	
	
	// 글 삭제
	public int setDelete(FeedDTO feedDTO) throws Exception {
		return feedDAO.setDelete(feedDTO);
	}
	
	
	// 글 수정
	public int setUpdate(FeedDTO feedDTO, MultipartFile [] files, HttpSession session) throws Exception {

		int result = feedDAO.setUpdate(feedDTO);

		String path = "/resources/upload/feed/";
		
		
		for (MultipartFile file : files) {
			
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, session, file);
				
				FeedFileDTO feedFileDTO = new FeedFileDTO();
				
				feedFileDTO.setFeedNum(feedDTO.getFeedNum());
				feedFileDTO.setOriginalName(file.getOriginalFilename());
				feedFileDTO.setFileName(fileName);
				
				result = feedDAO.setFileAdd(feedFileDTO);			
			}

		}
		
		return result;
	}
	
	
	/* 파일 관련 ------------------------------- */
	
	public FeedFileDTO getFileDown(FeedFileDTO feedFileDTO) throws Exception {
		return feedDAO.getFileDetail(feedFileDTO);
	}
	
	// 파일 삭제
	public int setFileDelete(FeedFileDTO feedFileDTO, HttpSession session) throws Exception {
		// 폴더 파일 삭제
		feedFileDTO = feedDAO.getFileDetail(feedFileDTO);
		boolean flag = fileManager.fileDelete(feedFileDTO, "/resources/upload/feed/", session);
		
		if(flag) {
			
			//db삭제
			return feedDAO.setFileDelete(feedFileDTO);
		}
		
		return 0;
	}
	
	
	
	/* 첨부된 이미지 관련 ------------------------------- */
	
	// 콘텐츠 이미지 삭제
	public boolean setContentsImgDelete(String path, HttpSession session) throws Exception {
		// path: /resources/upload/feed/파일명
//		FeedFileDTO feedFileDTO = new FeedFileDTO();
		
		FileDTO fileDTO = new FileDTO();

		System.out.println(path.substring(path.lastIndexOf("/")+1));
		fileDTO.setFileName(path.substring(path.lastIndexOf("/") + 1));

		path = "/resources/upload/feed/";
		return fileManager.fileDelete(fileDTO, path, session);
	}

	// 콘텐츠 이미지 추가
	public String setContentsImg(MultipartFile file, HttpSession session) throws Exception {
		String path = "/resources/upload/feed/";
		String fileName = fileManager.fileSave(path, session, file);
		return path + fileName;
	}
	
	
	
	/* 좋아요 관련 ------------------------------- */

	// 좋아요 체크
	public int checkLikes(LikesDTO likesDto) throws Exception {
		return feedDAO.checkLikes(likesDto);
	}

	// 좋아요 등록
	public int addLikes(LikesDTO likesDto) throws Exception {
		return feedDAO.addLikes(likesDto);
	}

	// 좋아요 카운트
	public int countLikes(LikesDTO likesDto) throws Exception {
		return feedDAO.countLikes(likesDto);
	}

	// 좋아요 삭제
	public int deleteLikes(LikesDTO likesDto) throws Exception {
		return feedDAO.deleteLikes(likesDto);
	}
	
	// 좋아요 리스트
	public List<FeedDTO> getLikesList(Pager pager) throws Exception {

		pager.makeRowNum();
		Long total = feedDAO.getLikesCount(pager);
		pager.makePageNum(total);

		return feedDAO.getLikesList(pager);
	}
	
	
	/* 댓글 관련 ------------------------------- */
	
	// 코멘트 목록
	public List<FeedCommentDTO> getCommentList(FeedCommentDTO feedCommentDTO) throws Exception {
		return feedDAO.getCommentList(feedCommentDTO);
	}

	public int setAddComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return feedDAO.setAddComment(feedCommentDTO);
	}

	public int setDeleteComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return feedDAO.setDeleteComment(feedCommentDTO);
	}
	
	public int setUpdateComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return feedDAO.setUpdateComment(feedCommentDTO);
	}

	
	

	
	
	
	
}
