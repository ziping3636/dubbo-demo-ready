package com.wangziping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.wangziping.dao.ArticleService;
import com.wangziping.domain.Article;
import com.wangziping.domain.Condition;

@Controller
public class ArticleController {

	@Autowired
	private ArticleService articleService;

	@RequestMapping("selects")
	public String selects(Model model, @RequestParam(defaultValue = "1") int pageNum,
			@RequestParam(defaultValue = "10") int pageSize, Condition con) {
		PageInfo<Article> selects = articleService.selects(pageNum, pageSize, con);
		model.addAttribute("con", con);
		model.addAttribute("info", selects);
		return "list";
	}
}
