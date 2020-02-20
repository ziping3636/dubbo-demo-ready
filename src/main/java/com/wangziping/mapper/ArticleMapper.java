package com.wangziping.mapper;

import java.util.List;

import com.wangziping.domain.Article;
import com.wangziping.domain.Condition;

public interface ArticleMapper {

	List<Article> selects(Condition con);

}
