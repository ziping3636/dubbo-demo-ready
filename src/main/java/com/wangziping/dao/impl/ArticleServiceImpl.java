package com.wangziping.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangziping.dao.ArticleService;
import com.wangziping.domain.Article;
import com.wangziping.domain.Condition;
import com.wangziping.mapper.ArticleMapper;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleMapper articleMapper;

	public PageInfo<Article> selects(int pageNum, int pageSize, Condition con) {
		PageHelper.startPage(pageNum, pageSize);

		List<Article> selects = articleMapper.selects(con);
		return new PageInfo<Article>(selects);
	}
}
