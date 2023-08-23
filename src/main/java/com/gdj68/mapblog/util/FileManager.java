package com.gdj68.mapblog.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.AbstractView;

import com.gdj68.mapblog.file.FileDTO;

@Component
public class FileManager extends AbstractView {
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	// TODO Auto-generated method stub
		System.out.println("FileManager");
		String b = (String)model.get("board");
		FileDTO fileDTO = (FileDTO)model.get("file");
		//1. file 경로 준비
		String path = "/resources/upload/"+b;
		path=request.getSession().getServletContext().getRealPath(path);
		//2. file 객체 생성
		File file = new File(path,fileDTO.getFileName());
		
		//3. file 크기 설정
		response.setContentLength((int)file.length());
		
		//4. fileName 을 originalName으로 설정 후 한글꺠짐 대비 인코딩
		String downName = fileDTO.getOriginalName();
		downName = URLEncoder.encode(downName, "UTF-8");
		
		//5. Header 정보 설정
		response.setHeader("Content-Disposition", "attachment;fileName=\""+downName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
	
		//6. 전송
		FileInputStream is = new FileInputStream(file);
		OutputStream os = response.getOutputStream();		
		FileCopyUtils.copy(is, os);
		//7. 자원 해제 (연결된 역순으로 해제)
		os.close();
		is.close();
	}
	
	//fileDelete
		public boolean fileDelete(FileDTO fileDTO, String path,HttpSession session ) {
			//1. 삭제할 폴더의 실제 경로
			path = session.getServletContext().getRealPath(path);
			
			File file = new File(path, fileDTO.getFileName());
			
			return file.delete();
			
		}
	
	//fileSave
	public String fileSave(String path,HttpSession session, MultipartFile multipartFile) throws Exception{
		//1. 어디에 저장??
	
		
		//2. 실제 경로 알아오기
		//jsp : application
		//java : ServletContext
		String realPath = session.getServletContext().getRealPath(path);
		System.out.println(realPath);
		
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		Calendar ca = Calendar.getInstance();
		long result = ca.getTimeInMillis();
		/* file = new File(file, result+"_"+multipartFile.getOriginalFilename()); */
		
		//2. API 사용
		String uId = UUID.randomUUID().toString();
		uId = uId+"_"+multipartFile.getOriginalFilename();
		System.out.println(uId);
		file = new File(file, uId);
		
		//4. 파일을 저장
		//A. Spring에서 제공하는 API FileCopyUtils copy메서드
		//FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		//B. MultipartFile의 transferTo메서드
		multipartFile.transferTo(file);
		
		return uId;
		
	}
	}

