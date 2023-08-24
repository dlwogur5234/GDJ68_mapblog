package com.gdj68.mapblog.follow;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

@Controller
public class FollowController {
	
	@Autowired
	private FollowService followService;
	

}
