package com.gdj68.mapblog.feed;

import java.util.HashMap;
import java.util.List;
//import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.gdj68.mapblog.follow.FollowDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/feed/*")
public class FeedController {
	
	@Autowired
	private FeedService feedService;
	
	@ModelAttribute("board")
	public String getBoardName() {
		return "feed";
	}

	/* ---------------------------------------------- */

	// List
//	@GetMapping("list")
//	public String getList(Pager pager, Model model, HttpSession session) throws Exception {
//
//		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
//
//	      if (memberDTO != null) {
//	         pager.setId(memberDTO.getId());
//	      }
//
//		List<FeedDTO> ar = feedService.getList(pager);
//		model.addAttribute("list", ar);
//		model.addAttribute("pager", pager);
//
//		return "feed/list";
//	}

	// 개인 url 
//	@RequestMapping(value = "list/*", method = RequestMethod.GET)
//	public String getUrl (HttpServletRequest request, FeedDTO feedDTO, Model model, Pager pager) throws Exception{
//
//		StringBuffer userUrl1 = request.getRequestURL();
//		String userUrl2 = userUrl1.toString();
//		String[] userUrl3 = userUrl2.split("/");
//		String userUrl4 = userUrl3[userUrl3.length-1];
//		
//		System.out.println(userUrl4);
//		
//		feedDTO.setUrl(userUrl4);
//		
//		MemberDTO memberDTO = new MemberDTO();
//		
//		memberDTO = feedService.getUser(feedDTO);
//	
////		System.out.println(memberDTO.getId());
//		
//		List<FeedDTO> li = feedService.getList(memberDTO);
//		
//		model.addAttribute("list", li);
//		
//		pager.setId(memberDTO.getId());
//		pager = feedService.getPage(pager);
//		model.addAttribute("pager", pager);		
//
//		return "feed/list";
//		
//	}

	// Add Form
	@GetMapping("add")
	public String setAdd() throws Exception {
		return "feed/add";
	}

	// Add Insert
	@PostMapping("add")
	public String setAdd(FeedDTO feedDTO, MultipartFile[] photos, HttpSession session, Model model) throws Exception {

		int result = feedService.setAdd(feedDTO, photos, session);

		String message = "등록 실패";

		if (result > 0) {
			message = "등록 성공";
		}
		
		model.addAttribute("message", message);

		FeedDTO f = feedService.getUrl(feedDTO);
		String url = "list/" + f.getUrl();	
		model.addAttribute("url", url);

//		model.addAttribute("url", "list");
		
		return "commons/result";

	}

	
	// Detail
	@GetMapping("detail")
	public String getDetail(FeedDTO feedDTO, Model model, LikesDTO likesDTO) throws Exception {
		feedDTO = feedService.getDetail(feedDTO);
		
		FeedDTO getFeedUrl = feedService.getFeedUrl(feedDTO);
		String feedUrl = getFeedUrl.getUrl();
		feedDTO.setUrl(feedUrl);

		
		if (feedDTO != null) {
			String message = "등록성공";
			model.addAttribute("dto", feedDTO);
			
			FeedCommentDTO feedCommentDTO = new FeedCommentDTO();
			feedCommentDTO.setFeedNum(feedDTO.getFeedNum());
			List<FeedCommentDTO> commentList = feedService.getCommentList(feedCommentDTO);
			model.addAttribute("commentList", commentList);

			return "feed/detail";
			
		} else {
			
			model.addAttribute("message", "글을 불러올 수 없습니다.");
			
			model.addAttribute("url", "list");
			
			return "commons/result";
		}
	}

	// Delete
	@PostMapping("delete")
	public String setDelete(FeedDTO feedDTO, HttpSession session) throws Exception {
	      int result = feedService.setDelete(feedDTO);
	      MemberDTO m = (MemberDTO)session.getAttribute("member");
	      String url = m.getUrl();
	      
	      return "redirect:./list/"+url;
	}

	// Update form
	@GetMapping("update")
	public String setUpdate(FeedDTO feedDTO, Model model) throws Exception {
		feedDTO = feedService.getDetail(feedDTO);
		model.addAttribute("dto", feedDTO);

		return "feed/update";
	}

	// Update POST
	@PostMapping("update")
	public String setUpdate(FeedDTO feedDTO, MultipartFile[] photos, HttpSession session) throws Exception {
		int result = feedService.setUpdate(feedDTO, photos, session);

		return ("redirect:./detail?feedNum=" + feedDTO.getFeedNum());
	}

	// 첨부파일 입력란 삭제
	@GetMapping("fileDelete")
	public String setFileDelete(FeedFileDTO feedFileDTO, HttpSession session, Model model) throws Exception {

		int result = feedService.setFileDelete(feedFileDTO, session);
		model.addAttribute("result", result);

		return "commons/ajaxResult";
	}
	
	@GetMapping("fileDown")
	public String getFileDown(FeedFileDTO feedFileDTO, Model model)throws Exception{
		feedFileDTO = feedService.getFileDown(feedFileDTO);
		model.addAttribute("file", feedFileDTO);
		
		return "fileManager";
	}

	// setContentsImgDelete
	@PostMapping("setContentsImgDelete")
	public String setContentsImgDelete(String path, HttpSession session, Model model) throws Exception {

		boolean check = feedService.setContentsImgDelete(path, session);

		model.addAttribute("result", check);

		return "commons/ajaxResult";
	}

	// setContentsImg
	@PostMapping("setContentsImg")
	public String setContentsImg(MultipartFile files, HttpSession session, Model model) throws Exception {

		System.out.println("setContentsImg");
		System.out.println(files.getOriginalFilename());

		String path = feedService.setContentsImg(files, session);

		model.addAttribute("result", path);

		return "commons/ajaxResult";
	}

	
	// 좋아요
	@PostMapping("addLikes")
	@ResponseBody
	public Map<String, Integer> addLikes(LikesDTO likesDTO, HttpSession session, Model model) throws Exception {

		// 현재 로그인한 계정의 아이디를 likesDTO에 담는다.
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		likesDTO.setId(memberDTO.getId());
		
		model.addAttribute("memberDTO", memberDTO);
		
		
		Map<String, Integer> resultMap = new HashMap<String, Integer>();
		
		// 좋아요 테이블에 해당 ID를 가진 사람이 그 글에 좋아요를 누른적 있는지 체크한다.
		int check = feedService.checkLikes(likesDTO);
		model.addAttribute("check", check);

		
		if (check == 0) {
			// check 결과값이 0 => 누른적 없음.
			resultMap.put("result", feedService.addLikes(likesDTO));
		} else {
			// check 결과값이 0이 아님 => 그 id로 해당 글을 좋아요 누른 적이 있음.
			resultMap.put("result", feedService.deleteLikes(likesDTO));
		}

		// 해당 글에 눌린 좋아요 갯수가 몇 개인지 카운트
		resultMap.put("count", feedService.countLikes(likesDTO));
		model.addAttribute("resultMap", resultMap);
		
		// 담은 값들은 JSON타입형태로 ajax로 넘어가게 된다.
		return resultMap;
	}
	
	
	// 좋아요 리스트	
	@GetMapping("likesList")
	public String getLikesList(Model model, HttpSession session, Pager pager) throws Exception {

		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		
		
		// 로그인 안 했을 시에 로그인 화면으로 이동
		if (memberDTO == null) {
			model.addAttribute("memberDTO", memberDTO);
			return "redirect:../member/login";
		}

		pager.setId(memberDTO.getId());
		
		List<FeedDTO> getLikesList = feedService.getLikesList(pager);

		model.addAttribute("getLikesList", getLikesList);
		model.addAttribute("pager", pager);

		return "feed/likesList";
	}

	
	
	
	/* 댓글 */

	@PostMapping("addComment")
	public String setAddComment(FeedCommentDTO feedCommentDTO) throws Exception {

		System.out.println(feedCommentDTO.getContents());
		System.out.println(feedCommentDTO.getId());
		
		long feedNum = feedCommentDTO.getFeedNum();
		int result = feedService.setAddComment(feedCommentDTO);
		return "redirect:./getComment?feedNum=" + feedNum;
	}
	
	@GetMapping("getComment")
	public String getCommentList(FeedCommentDTO feedCommentDTO, Model model) throws Exception {
		List<FeedCommentDTO> ar = feedService.getCommentList(feedCommentDTO);
		model.addAttribute("commentList", ar);
		return "feed/commentList";
		
	}
	
	@PostMapping("deleteComment")
	public String setDeleteComment(FeedCommentDTO feedCommentDTO) throws Exception {
		  int result = feedService.setDeleteComment(feedCommentDTO);
		  long commentNum = feedCommentDTO.getCommentNum();
		  return "feed/commentList";
	}
	
	
	@PostMapping("updateComment")
	public String setUpdateComment(FeedCommentDTO feedCommentDTO) throws Exception {
		feedService.setUpdateComment(feedCommentDTO);
		return "feed/commentList";
	}
	
	
	@PostMapping("addCommentLikes")
	@ResponseBody
	public Map<String, Integer> addCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO, HttpSession session, Model model) throws Exception {

		// 현재 로그인한 계정의 아이디를 likesDTO에 담는다.
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		feedCommentLikesDTO.setId(memberDTO.getId());
		
		model.addAttribute("memberDTO", memberDTO);
		
		
		Map<String, Integer> resultCommentMap = new HashMap<String, Integer>();
		
		// 좋아요 테이블에 해당 ID를 가진 사람이 그 글에 좋아요를 누른적 있는지 체크한다.
		int check = feedService.checkCommentLikes(feedCommentLikesDTO);
		model.addAttribute("check", check);

		
		if (check == 0) {
			// check 결과값이 0 => 누른적 없으므로 좋아요 하나 추가
			resultCommentMap.put("result", feedService.addCommentLikes(feedCommentLikesDTO));
		} else {
			// check 결과값이 0이 아님 => 그 id로 해당 글을 좋아요 누른 적이 있으므로 하나 감소
			resultCommentMap.put("result", feedService.deleteCommentLikes(feedCommentLikesDTO));
		}

		// 해당 글에 눌린 좋아요 갯수가 몇 개인지 카운트
		resultCommentMap.put("count", feedService.countCommentLikes(feedCommentLikesDTO));
		model.addAttribute("resultMap", resultCommentMap);
		
		// 담은 값들은 JSON타입형태로 ajax로 넘어가게 된다.
		return resultCommentMap;
	}
	
	
	/* 공개 비공개 ----------------------------------------------- */
	
	// 개인 url
	@RequestMapping(value = "list/*", method = RequestMethod.GET)
	public String ListTest(FeedDTO feedDTO, HttpSession session, HttpServletRequest request, Model model, Pager pager) throws Exception {
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		StringBuffer userUrl1 = request.getRequestURL();
		String userUrl2 = userUrl1.toString();
		String[] userUrl3 = userUrl2.split("/");
		String userUrl4 = userUrl3[userUrl3.length-1];
		pager.setUrl(userUrl4);

				
		if(memberDTO != null) {
			// 로그인 o
			FeedDTO feedDTO2 = new FeedDTO();
			feedDTO2.setUrl(userUrl4);
			MemberDTO m = feedService.getUser(feedDTO2);
			
			///////////////////
			if(m==null) {
				return "feed/noMemberFound";
			}
			
			String urlId = m.getId().trim(); 
			String uId = memberDTO.getId().trim();
			
			FollowDTO followDTO = new FollowDTO();
			String urlString = request.getRequestURL().toString();
		    Pattern pattern = Pattern.compile("/feed/list/(\\w+)");
		    Matcher matcher = pattern.matcher(urlString);

		    if (matcher.find()) {
		        String username = matcher.group(1);
		        System.out.println("Username: " + username);

		        // 추출한 username 값을 followDTO의 toUser 속성에 설정
		        followDTO.setToUser(username);
		    }
			//팔로우 여부 체크
		    followDTO.setFromUser(memberDTO.getNickName());
			int followStatus = feedService.checkFollow(followDTO, session);
			memberDTO=(MemberDTO)session.getAttribute("member");
			followDTO.setFromUser(memberDTO.getNickName());
			System.out.println("id :" + followDTO.getFromUser());
			model.addAttribute("followStatus", followStatus);
			session.setAttribute("follow", followDTO);
			
			if(urlId.equals(uId)) {
				List<FeedDTO> li = feedService.getList2(pager);
				model.addAttribute("list", li);
			}else{
				
				int publics = m.getPublics();
				if(publics == 1) {
					// 공개 계정
					String urlNickname = m.getNickName();
					String uNickname = memberDTO.getNickName();
					
					IgnoreDTO ignoreDTO = new IgnoreDTO();
					ignoreDTO.setIgnoring(urlNickname);
					ignoreDTO.setIgnored(uNickname);
					
					ignoreDTO = feedService.confirmIgnore(ignoreDTO);
					
					if(ignoreDTO == null) {
						// 차단x
						ConfirmFollowDTO confirmFollowDTO = new ConfirmFollowDTO();
						confirmFollowDTO.setFromUser(memberDTO.getNickName());
						confirmFollowDTO.setToUser(m.getNickName());
						confirmFollowDTO = feedService.confirmFollow(confirmFollowDTO);
						
						if(confirmFollowDTO != null) {
							System.out.println("팔로우 중");
							List<FeedDTO> li = feedService.getFeedListF(m.getId());
							model.addAttribute("list", li);
						}else {
							System.out.println("팔로우 안하는 중");
							List<FeedDTO> li = feedService.getFeedListUnF(m.getId());
							model.addAttribute("list", li);
						}
						
					}else {
						// 차단o
						List<FeedDTO> li = null;
					}
					
				}else {
					// publics가 0인 사람은 전체 비공개 계정
					// 아무것도 보여주지 않아야 됨
					List<FeedDTO> li = null;
				}
			}
			
		}else {
			// 로그인 x
			FeedDTO feedDTO2 = new FeedDTO();
			feedDTO2.setUrl(userUrl4);
			MemberDTO m = feedService.getUser(feedDTO2);
			
			/////////////////
			if(m==null) {
				return "feed/noMemberFound";
			}
			
			if(m.getPublics() == 1) {
				// publics가 1인 사람은 전체 공개 계정
				// 전체 게시글 중 publics가 0(전체공개)인 게시글만 불러오자
				List<FeedDTO> li = feedService.getFeedList(pager);
				model.addAttribute("list", li);
			}else {
				// publics가 0인 사람은 전체 비공개 계정
				// 아무것도 보여주지 않아야 됨
				List<FeedDTO> li = null;
			}
		}
		//url만 따기
				
		pager = feedService.getPage(pager);
		model.addAttribute("pager", pager);	
		
		return "feed/list";
		
	}

}
