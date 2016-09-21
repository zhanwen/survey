package com.iWen.survey.dao;

import java.util.List;

import com.iWen.survey.dto.Link;
import com.iWen.survey.pager.PageListener;

public interface LinkDAO extends PageListener{
	boolean addLink(Link link);
	boolean updateLink(Link link);
	boolean delLink(Long linkId);
	List<Link> listAllLink();
	Link findLink(Long linkId);
}
