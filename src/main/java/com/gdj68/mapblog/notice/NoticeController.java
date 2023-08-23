package com.gdj68.mapblog.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.gdj68.mapblog.util.Pager;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	public void getList(Pager pager , Model model) throws Exception{
		List<NoticeDTO>
	}
}
