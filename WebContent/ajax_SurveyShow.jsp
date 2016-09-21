<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.iWen.survey.dao.*" %>
<%@ page import="com.iWen.survey.dto.*" %>
<%
	ConfigDAO cdao=DAOFactory.getConfigDAO();
	Config cfg=cdao.findConfig();
	SurveyDAO sdao=DAOFactory.getSurveyDAO();
	Survey survey=sdao.findSurvey(Long.valueOf(request.getParameter("sid")));
	QuestionDAO qdao=DAOFactory.getQuestionDAO();
	List<Question>  qlist=qdao.listAllQuestion(Long.valueOf(request.getParameter("sid")));
	String to=request.getParameter("to");
	qlist:
	for(Question q:qlist){
	  	if(q.getQId()<Long.valueOf(to))
	  	continue;
		out.println("<li> "+q.getQHead() +" </li>");
		out.println("<ul type='1'>");
	 	 String [] body=q.getQBody().split("&\\$\\$&");
	 	 String[] sz_jdtz;
	 	 int Jdtz;
	 	switch(q.getQType().intValue()){
	 	case 1:
			 	sz_jdtz =q.getQJdtz().split("&");
			 		for(int i=0;i<body.length;i++){
			 			if("over".equals(sz_jdtz[i]))
			 				out.println("<li><input type='radio' name='answer"+q.getQId()+"' value='"+i+"' onclick='EndSurvey("+q.getQId()+")'>"+body[i]+"</li>");
			 			else if("null".equals(sz_jdtz[i])){
			 				out.println("<li><input type='radio' name='answer"+q.getQId()+"' value='"+i+"' onclick=showNext('qbox"+q.getQId()+"',"+(q.getQId()+1)+")>"+body[i]+"</li>");
			 			}else{
			 				out.println("<li><input type='radio' name='answer"+q.getQId()+"' value='"+i+"' onclick=jump('qbox"+q.getQId()+"',"+sz_jdtz[i]+")>"+body[i]+"</li>");
			 			}
			 		}
			 			out.println("</ul><br/>");
						out.println("<div id=qbox"+q.getQId()+"></div>");
					break qlist;// this is a 'single choice'  , it may have jump or break,so  stop generate list,wait for user's choice.
				 
		case 2: 
			 	for(int i=0;i<body.length;i++){
			 		out.println("<li><input type='checkbox' name='answer"+q.getQId()+"' value='"+i+"'>"+body[i]+"</li>");
			 	}
			 	out.println("</ul><br/>");
				break;
		case 3:
				 sz_jdtz =q.getQJdtz().split("&");
			 		for(int i=0;i<body.length;i++){
			 			if("over".equals(sz_jdtz[i]))
			 				out.print("<li><input type='radio' name='answer"+q.getQId()+"' value='"+i+"' onclick='EndSurvey("+q.getQId()+")'>"+body[i]+"</li>");
			 			else if("null".equals(sz_jdtz[i])){
			 				out.print("<li><input type='radio' name='answer"+q.getQId()+"' value='"+i+"' onclick=showNext('qbox"+q.getQId()+"',"+(q.getQId()+1)+")>"+body[i]+"</li>");
			 			}else{
			 				out.print("<li><input type='radio' name='answer"+q.getQId()+"' value='"+i+"' onclick=jump('qbox"+q.getQId()+"',"+sz_jdtz[i]+")>"+body[i]+"</li>");
			 			}
			 		}
			 		out.println("<input type=text name=txtanswer"+q.getQId()+">");
			 		out.println("</ul><br/>");
						out.println("<div id=qbox"+q.getQId()+"></div>");
					break qlist;
		case 4:
				for(int i=0;i<body.length;i++){
			 		out.println("<li><input type='checkbox' name='answer"+q.getQId()+"' value='"+i+"'>"+body[i]+"</li>");
			 	}
					out.println("<input type='text' name='txtanswer"+q.getQId()+"'>");
					out.println("</ul><br/>");
				break;
		case 5:
				 
				out.println("<textarea name='answer"+q.getQId()+"' rows=4 cols=40 onpropertychange='this.style.posHeight=this.scrollHeight'></textarea>");
				out.println("</ul><br/>");
				break;
		}

 } %>

 