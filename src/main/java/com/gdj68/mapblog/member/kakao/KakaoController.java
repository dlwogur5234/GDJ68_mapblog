package com.gdj68.mapblog.member.kakao;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.gdj68.mapblog.member.AgreeDTO;
import com.gdj68.mapblog.member.MemberDTO;


@Controller
@RequestMapping("/kakao/*")
public class KakaoController {

	@Autowired
	private KakaoService kakaoService;
	
	// 로그인: 인가 코드 및 토큰 발급
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String getLogin(@RequestParam("code") String code, HttpSession session, Model model) throws Exception{
       
        // 1. header 생성
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add(HttpHeaders.CONTENT_TYPE, "application/x-www-form-urlencoded;charset=utf-8");

        // 2. body 생성
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("grant_type", "authorization_code"); //고정값
        params.add("client_id", "9df9221dadf27f4338ac3350e1787ae9");
        params.add("redirect_uri", "http://localhost:82/kakao/login"); //등록한 redirect uri
        params.add("code", code); 

        // 3. header + body
        HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<MultiValueMap<String, String>>(params, httpHeaders);
        
        // 4. http 요청하기
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                httpEntity,
                String.class     
        );

        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj = (JSONObject) jsonParser.parse(response.getBody());

        String accessToken  = (String) jsonObj.get("access_token");
        
        // 발급받은 토큰 정보로 유저 정보를 얻어옴
        MemberDTO memberDTO = getUserInfoWithToken(accessToken);
                
        MemberDTO memberDTO2 = kakaoService.getEmailCheck(memberDTO);
        System.out.println(memberDTO2);
        
        if(memberDTO2 != null) {
			//4. 세션에 저장
			System.out.println("기존 정보 있음");
			session.setAttribute("member", memberDTO2);				
			return "/member/kakaoLoginS";
		}else {
			System.out.println("기존 정보 없음");
			session.setAttribute("kakaoMember", memberDTO);
			return "/member/beforeKakaoJoin";
		}			
	
	}

	private MemberDTO getUserInfoWithToken(String accessToken) throws ParseException {
		
        //HttpHeader 생성
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        
        //HttpHeader 담기
        RestTemplate rt = new RestTemplate();
        HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(headers);
        ResponseEntity<String> response = rt.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                httpEntity,
                String.class
        );
        
        //Response 데이터 파싱
        JSONParser jsonParser = new JSONParser();
        JSONObject jsonObj    = (JSONObject) jsonParser.parse(response.getBody());
        JSONObject account = (JSONObject) jsonObj.get("kakao_account");
        
        String email = String.valueOf(account.get("email"));
        
        MemberDTO memberDTO = new MemberDTO();
        memberDTO.setEmail(email);
        
        return memberDTO;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
			System.out.println("여기는 logout");
			session.invalidate();
	        
			return "redirect:../";
	}
	
	// 카카오 회원가입(모델은 동의 사항 데이터 전달을 위해 필요) 
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String midJoin(AgreeDTO agreeDTO, Model model) throws Exception{
		model.addAttribute("agree", agreeDTO);
		
		return "member/kakaoJoin";
	}
}
