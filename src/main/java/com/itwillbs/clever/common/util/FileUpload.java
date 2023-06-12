package com.itwillbs.clever.common.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.clever.mapper.ProductMapper;
import com.itwillbs.clever.service.ProductService;

@Service
public class FileUpload {

// 이 곳은 이미지, text 등 모든 파일을 업로드 하는 Service 입니다 ~	
	
	@Autowired
	private ProductMapper mapper;
	
	public void upload(ArrayList<MultipartFile> file, HttpSession session, Map<String, Object> paramMap) {
		
		if (file != null) {
			String uploadDir = "/resources/fileUpload"; //프로젝트상의 가상 업로드 경로
			String saveDir = session.getServletContext().getRealPath(uploadDir); //실제 업로드 경로
			System.out.println("saveDir : " + saveDir);
			String file_path = "";
			for(MultipartFile f: file) {
				try {
					Date date = new Date(); //java.util.Date 클래스 사용하기
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
					
					file_path = "/" + sdf.format(date);
					
					saveDir = saveDir + file_path; //실제 업로드 경로와 서브 디렉토리 경로 결합하여 저장
					System.out.println("saveDir : " + saveDir);
					Path path = Paths.get(saveDir);
					Files.createDirectories(path);
				} catch (IOException e) {
					e.printStackTrace();
				}
				String originalFileName = f.getOriginalFilename();
				String uuid = UUID.randomUUID().toString(); //파일명 중복 방지를 위한 코드
				String UUIDpath = uuid.substring(0, 8) + "_" + originalFileName;
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("file_div", paramMap.get("file_div")); // 경매, 공지사항 등 파일 업로드 할때 각각의 컨트롤러에서 변경해줘야함
				map.put("file_num", paramMap.get("file_num")); // 이것도 마찬가지
				map.put("file_name", UUIDpath);
				map.put("file_path", file_path);
				map.put("file_size", f.getSize());
				map.put("file_exe", f.getContentType());
				mapper.insertFile(map);
				
				try {
					f.transferTo (new File(saveDir, UUIDpath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
