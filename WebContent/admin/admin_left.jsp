<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<SCRIPT language=javascript>
var itemp;
var tobj="";
itemp="";
function leftBgOver(obj){//菜单
	obj.style.background="url(images/left_bg02.gif) center no-repeat";
	//obj.style.position="center";
	//obj.style.repeat="no-repeat":
}

function leftBgOut(obj,sty){
	//alert( (sty)?"url(" + sty + ")":"");
if (tobj!="")
{
sty="images/left_bg01.gif";
obj.style.background= (sty)?"url(" + sty + ")":"E";
}
else 
{
obj.style.background= (sty)?"url(" + sty + ")":"";
}
}
</script>
	<script language="javascript">
function collapse(objid)
{
	var obj = document.getElementById(objid);
	collapseAll();
	obj.style.display = '';
}
function collapseAll()
{
	for (var i=1; i<8; i++)
	{
		var obj = document.getElementById('g_' + i.toString());
		if (obj) obj.style.display = 'none';
	}
}
function expandAll()
{
	for (var i=1; i<8; i++)
	{
		var obj = document.getElementById('g_' + i.toString());
		if (obj) obj.style.display = '';
	}
}
</script>
	<link href="images/Style.css" rel="stylesheet" type="text/css">
	<style rel="stylesheet" type="text/css">
body {
	margin: 0px 5px;
}

img {
	border: none;
}

.menuall {
	text-align: center;
	width: 149px;
	background: #ffffff;
}

.menuall div {
	margin: 0px 0 5px 10px;
	text-align: left;
}
</style>
</head>
<body>
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
	<table border="0" cellpadding="0" cellspacing="0" class="menuall">
		<tr>
			<td>
				<img src="images/left_top.gif" alt="" />
			</td>
		</tr>
		<tr>
			<td>
				<a href="javascript:expandAll()" target="_self"><img
						src="images/extand.gif" alt="展开菜单"
						onMouseOver=nereidFade(this,100,10,5)
						style="FILTER: alpha(opacity = 50)"
						onMouseOut=nereidFade(this,50,10,5) />
				</a>&nbsp;
				<a href="javascript:collapseAll()" target="_self"><img
						src="images/collapse.gif" alt="收拢菜单"
						onMouseOver=nereidFade(this,100,10,5)
						style="FILTER: alpha(opacity = 50)"
						onMouseOut=nereidFade(this,50,10,5) />
				</a>
			</td>
		</tr>
		<tr>
			<td onClick="collapse('g_1')" style="cursor: hand;">
				<img src="images/menu_a.gif" border="0" />
			</td>
		</tr>
		<tr>
			<td id="g_1">
				<table width="100%" align="center" cellpadding="0" cellspacing="0"
					bgcolor="#FFFFFF">
					<tbody>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='SysConfig.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											网站信息配置
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='SurveyAdmin.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											问卷管理
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='FriendLinkAdmin.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											友情链接管理
										</td>
									</tr>
								</table>
							</td>
						</tr>
					
						<tr>
							<td height="5"></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td onClick="collapse('g_2')" style="cursor: hand;">
				<img src="images/menu_b.gif" border="0" />
			</td>
		</tr>
		<tr>
			<td id="g_2">
				<table width="100%" align="center" cellpadding="0" cellspacing="0"
					bgcolor="#FFFFFF">
					<tbody>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='SurveyAdd.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											问卷添加
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='SurveyAdmin.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											问卷设计
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='SurveyAudi.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											问卷审核
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='SurveyStatis.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											问卷统计
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="5"></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	 
		<tr>
			<td onClick="collapse('g_5')" style="cursor: hand;">
				<img src="images/menu_c.gif" border="0" />
			</td>
		</tr>
		<tr>
			<td id="g_5">
				<table width="100%" align="center" cellpadding="0" cellspacing="0"
					bgcolor="#FFFFFF">
					<tbody>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='AdminAdd.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											管理员添加
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='AdminList.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											管理员管理
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='AdminModify.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											修改密码
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="5"></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td onClick="collapse('g_6')" style="cursor: hand;">
				<img src="images/menu_d.gif" border="0" />
			</td>
		</tr>
		<tr>
			<td id="g_6">
				<table width="100%" align="center" cellpadding="0" cellspacing="0"
					bgcolor="#FFFFFF">
					<tbody>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='FriendLinkAdd.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											友情链接添加
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="30" align="center" background="images/left_bg01.gif"
								style="cursor: hand"
								onclick="javascript:parent.right.location.href='FriendLinkAdmin.jsp';"
								onMouseOver="leftBgOver(this);"
								onMouseOut="leftBgOut(this,'images/left_bg01.gif');">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="50">
											&nbsp;
										</td>
										<td>
											友情链接管理
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td height="5"></td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</table>
	<script>
collapseAll();
collapse('g_1')
</script>