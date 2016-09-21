package com.iWen.survey.pager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PageConfig
{
  HttpServletRequest request;
  HttpServletResponse response;
  HttpSession session;
  String Action;

  public String getAction()
  {
    return this.Action;
  }

  public void setAction(String action)
  {
    this.Action = action;
  }

  public HttpServletRequest getRequest()
  {
    return this.request;
  }

  public void setRequest(HttpServletRequest request)
  {
    this.request = request;
  }

  public HttpServletResponse getResponse()
  {
    return this.response;
  }

  public void setResponse(HttpServletResponse response)
  {
    this.response = response;
  }

  public HttpSession getSession()
  {
    return this.session;
  }

  public void setSession(HttpSession session)
  {
    this.session = session;
  }
}