package com.gdj68.mapblog.util;

import java.io.File;
import java.lang.reflect.Member;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.file.FileDTO;

@Component
public class FileManager {
	
	

	public boolean fileDelete(FileDTO fileDTO, String path, HttpSession session) {
		//                      ▲ fileDTO 타입으로 불가능하다면 그냥 String 타입으로 받기
		
		// 삭제할 폴더의 실제 경로
		path = session.getServletContext().getRealPath(path);


		File file = new File(path, fileDTO.getFileName());
		
		return file.delete();
	}
	
	
	
	
	public String fileSave(String path, HttpSession session, MultipartFile multipartFile) throws Exception {
		
		
		// 업로드한 파일 실제 저장 경로
		String realPath = session.getServletContext().getRealPath(path);
		
		// 실제 저장 경로 출력
		System.out.println(realPath);
		
		File file = new File(realPath);
		
		// 파일이 존재하지 않을 시 디렉토리 자동 생성
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String uId = UUID.randomUUID().toString();
		
		uId = uId + "_" + multipartFile.getOriginalFilename();
		System.out.println(uId);	// 생성된 id 출력
		
		file = new File(file, uId);
		
		multipartFile.transferTo(file);
		
		return uId;

	}
}
