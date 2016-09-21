<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=utf-8">

<STYLE type=text/css>
A:link {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:active {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:visited {
	FONT-SIZE: 12px; COLOR: #666666; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A:hover {
	FONT-SIZE: 12px; COLOR: #f29422; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:link {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:active {
	FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:visited {
	FONT-SIZE: 12px; COLOR: #ffffff; LINE-HEIGHT: 20px; TEXT-DECORATION: none
}
A.blue:hover {
	FONT-SIZE: 12px; COLOR: #73a2d6; LINE-HEIGHT: 20px; TEXT-DECORATION: underline
}
</STYLE>
<SCRIPT language=JavaScript>
				nereidFadeObjects = new Object();
				nereidFadeTimers = new Object();
				function nereidFade(object, destOp, rate, delta){
				if (!document.all)
				return
					if (object != "[object]"){ 
						setTimeout("nereidFade("+object+","+destOp+","+rate+","+delta+")",0);
						return;
					}
					clearTimeout(nereidFadeTimers[object.sourceIndex]);
					diff = destOp-object.filters.alpha.opacity;
					direction = 1;
					if (object.filters.alpha.opacity > destOp){
						direction = -1;
					}
					delta=Math.min(direction*diff,delta);
					object.filters.alpha.opacity+=direction*delta;
					if (object.filters.alpha.opacity != destOp){
						nereidFadeObjects[object.sourceIndex]=object;
						nereidFadeTimers[object.sourceIndex]=setTimeout("nereidFade(nereidFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
					}
				}
				</SCRIPT>
</HEAD>
<BODY leftMargin=0 topMargin=0 scroll=no marginheight="0" marginwidth="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgColor=#3a6592 style="color:#FFFFFF; font-size:12px;">
  <tr>
    <td height="28" width="214"><a href="" target="_blank"><IMG src="images/Title.gif" border="0"></a></td>
    <td width="68" nowrap="nowrap">&nbsp;</td>
    <td width="326">&nbsp;</td>
    <td width="21">&nbsp;</td>
    <td width="*" align="right" nowrap="nowrap">
	  [<A class=blue href="javascript:parent.location.href='../logout.jsp'" onClick="return confirm('确定要退出吗？');">安全退出</A>]
	  &nbsp;&nbsp;
	</td>
  </tr>
</table>
<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 background=images/topnav_bg.jpg>
  <TR>
    <TD width="160" height=35>&nbsp;</TD>
	<TD valign="bottom" width="95">
	  <a href="SysConfig.jsp" target="right" title="网站配置"><img src="images/button1.gif" border="0"></a>
	</TD>
	<TD valign="bottom" width="95">
	  <a href="SurveyAdd.jsp" target="right" title="问卷添加"><img src="images/button2.gif" border="0"></a>
	</TD>
	<TD valign="bottom" width="95">
	  <a href="SurveyAdmin.jsp" target="right" title="问卷管理"><img src="images/button3.gif" border="0"></a>
	</TD>

	<TD valign="bottom" width="95">
	  <a href="SurveyStatis.jsp" target="right" title="问卷统计"><img src="images/button5.gif" border="0"></a>
	</TD>
	<TD valign="bottom" width="95">
	  <a href="FriendLinkAdmin.jsp" target="right" title="链接管理"><img src="images/button9.gif" border="0"></a>
	</TD>
	<TD valign="bottom" width="*">
	  <a href="admin_main.jsp" target="right" title="显示桌面"><img src="images/button8.gif" border="0"></a>
	</TD>		
  </TR></TABLE>
</BODY></HTML>

