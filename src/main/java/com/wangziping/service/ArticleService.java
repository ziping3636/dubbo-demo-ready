package com.wangziping.service;

import com.github.pagehelper.PageInfo;
import com.wangziping.domain.Article;
import com.wangziping.domain.Condition;

public interface ArticleService {

	PageInfo<Article> selects(int pageNum, int pageSize, Condition con);

}
