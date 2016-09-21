//change the <tr> background color when mouseover 
//-----start
function tableFix() {
	var v = document.getElementsByTagName("tr");
	for (var i = 0; i < v.length; i++) {
		v[i].onmouseover = ClassNames;
		v[i].onmouseout = ClassNames;
		 
		v[i].altClassName = v[i].className + " hover";
		 
	}
}
function ClassNames() {
	var n = this.className;
	this.className = this.altClassName;
	this.altClassName = n;
}
//-------end
//检查密码一致性
function CheckPassword(obj1,obj2,num){ //检查密码输入，obj1是密码检测对象1,obj2是密码检测对象2,num是合法密码位数
var Pass1=document.getElementById(obj1).value;
var Pass2=document.getElementById(obj2).value;
if(Pass1.length<num||Pass2.length<num){
	alert("密码必须大于"+num+"位");
	document.getElementById(obj1).focus();
	return false;
}else if(Pass1!=Pass2){
	alert("两次密码输入不一致！"); 
	document.getElementById(obj1).focus();
	return false;
}else{
	
	document.forms[0].Survey_isPassword.value=Pass1;
	return true;
}
	

}
//~~
 

function SwitchHidden(obj){
if (document.getElementById(obj).style.display=="none")
document.getElementById(obj).style.display="block";
else
document.getElementById(obj).style.display="none";
}

function AddIPAddress(){


	var IPStart, IPEnd, i, ipLimitKind;
	var kind=document.getElementsByName("Survey_ipLimitKind");
	for(i=0;i<kind.length;i++){
		if(kind[i].checked==true){
			ipLimitKind=kind[i].value;
		}
	}
		IPStart = document.getElementById("ipSta1").value + "."
				+ document.getElementById("ipSta2").value + "."
				+ document.getElementById("ipSta3").value + "."
				+ document.getElementById("ipSta4").value;
		IPEnd = document.getElementById("ipEnd1").value + "."
				+ document.getElementById("ipEnd2").value + "."
				+ document.getElementById("ipEnd3").value + "."
				+ document.getElementById("ipEnd4").value;
		var IPValue=ipLimitKind+":"+IPStart+"---"+IPEnd;
		selectedNum = document.getElementById('Survey_ipList').options.length;
		for (i = 0; i <= selectedNum - 1; i++) { //检查重复添加
			if (document.getElementById('Survey_ipList').options[i].value == IPValue) {
				alert("请IP范围已经存在,请不要重复添加");
				return false;
			}
		}
	 
		document.getElementById('Survey_ipList').options[selectedNum] = document
				.createElement("option");
		document.getElementById('Survey_ipList').options[selectedNum].text = IPValue;
		document.getElementById('Survey_ipList').options[selectedNum].value = IPValue;
		document.getElementById("ipSta1").value = "";
		document.getElementById("ipSta2").value = "";
		document.getElementById("ipSta3").value = "";
		document.getElementById("ipSta4").value = "";
		document.getElementById("ipEnd1").value = "";
		document.getElementById("ipEnd2").value = "";
		document.getElementById("ipEnd3").value = "";
		document.getElementById("ipEnd4").value = "";
	}
function DellSelected() { //删除选中的IP范围段
		var flag = 0;
		var len = document.getElementById('Survey_ipList').options.length;
		for (i = 0; i < len; i++) {
			if (document.getElementById('Survey_ipList').options[i].selected) {
				flag = 1;
				break;
			}
		}
		if (flag == 0) {
			alert("请选择需要删除的IP范围段");
			return false;
		}
		var index = document.getElementById('Survey_ipList').selectedIndex;
		while (index != -1) {
			document.getElementById('Survey_ipList').options[index] = null;

			index = document.getElementById('Survey_ipList').selectedIndex;
		}
		return false;
	}
function DellAll() { //删除所有的IP范围段
		var len = document.getElementById('Survey_ipList').options.length;
		for (i = 0; i < len; i++) {
			document.getElementById('Survey_ipList').options[0] = null;
		}
	}

function CheckForm() {

		if (document.getElementById('Survey_name').value == "") {
			alert("请输入问卷名称");
			return false;
		} else if (document.getElementById('Survey_author').value == "") {
			alert("请输入问卷发起人(单位)");
			//alert(document.getElementById('Survey_isPassword').value);
			return false;
		} else {
			var obj = document.getElementById("Survey_ipList");
			var ipRange = document.getElementById("Survey_ipRange");
			for ( var i = 0; i < obj.options.length; i++) {
				var ipvalue = obj.options[i].value;
				if (ipRange.value == "")//第一个分号处理
					document.getElementById("Survey_ipRange").value = ipvalue;
				else
					document.getElementById("Survey_ipRange").value = document.getElementById("Survey_ipRange").value + ";" + ipvalue;
			}

			return true;
		}
		
	}
 
 
function mask(obj,kind){
obj.value=obj.value.replace(/[^\d]/g,'');
key1=event.keyCode;
if (key1==37 || key1==39)
{ obj.blur();
nextip=parseInt(obj.name.substr(5,1));
nextip=key1==37?nextip-1:nextip+1;
nextip=nextip>=5?1:nextip;
nextip=nextip<=0?4:nextip;
eval("var ip=document.getElementById('ip"+kind+""+nextip+"');");
eval("ip.focus();");
} 
if(obj.value.length>=3) 
if(parseInt(obj.value)>=256 || parseInt(obj.value)<=0)
{
alert(parseInt(obj.value)+"IP地址错误！");
obj.value="";
obj.focus();
return false;
}
else 
{ obj.blur();
nextip=parseInt(obj.name.substr(5,1))+1;
nextip=nextip>=5?1:nextip;
nextip=nextip<=0?4:nextip;
eval("var ip=document.getElementById('ip"+kind+""+nextip+"');");
eval("ip.focus();");
}
}
function mask_c(obj){
clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''));
}

 
function preview() {
	bdhtml = window.document.body.innerHTML;
	sprnstr = "<!--startprint-->";
	eprnstr = "<!--endprint-->";
	prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
	prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
	window.document.body.innerHTML = prnhtml;
	window.print();
	window.document.body.innerHTML = bdhtml;
}
function CheckString(str, Min, Max, msg) {
	if (str.length > Max || str.length < Min) {
		alert(msg);
		return false;
	} else {
		return true;
	}
}
function setQueryString(sKey,sValue,sUrl,bNoRandomSeed,bNoAnchor){
	if(sUrl==null){
		sUrl=window.location.href;
	}
	var sAnchorName="";
	var pos=sUrl.indexOf("#");
	if(pos!=-1){
		sAnchorName=sUrl.substring(pos+1);
		sUrl=sUrl.substring(0,pos);
	}
	sKey=(sKey==null?"":sKey);
	var sRet="";
	var sTemp=sUrl.replace(/\?/g,"&");
	var aParam=sTemp.split("&");
	var bFound=false;
	sRet+=aParam[0]+"?";
	for(var i=1;i<aParam.length;i++){
		if(aParam[i].substring(0,sKey.length+1).toUpperCase()==(sKey+"=").toUpperCase()){
			if(sValue!=null){
				sRet+=(sRet.substring(sRet.length-1)=="?"?"":"&")+sKey+"="+sValue;
			}
			bFound=true;
		}
		else{
			if(aParam[i].indexOf("=")!=-1){
				sRet+=(sRet.substring(sRet.length-1)=="?"?"":"&")+aParam[i];
			}
		}
	}
	if(!bFound&&sKey!=""&&sValue!=null){
		sRet+=(sRet.substring(sRet.length-1)=="?"?"":"&")+sKey+"="+sValue;
	}
	if(!bNoRandomSeed){
		var sRandom=""+Math.random();
		sRandom=sRandom.substring(5,10);
		sRet+=(sRet.substring(sRet.length-1)=="?"?"":"&")+sRandom+(!bNoAnchor?(sAnchorName==""?"":"#"+sAnchorName):"");
	}
	return sRet;
}

function getQueryString(sKey,sDefault,sUrl){
	if(sUrl==null){
		sUrl=window.location.href;
	}
	var sTemp=sUrl.replace("?","&").toUpperCase();
	var pos1=sTemp.indexOf("&"+sKey.toUpperCase()+"=");
	if(pos1==-1){
		return sDefault;
	}
	var pos2=sTemp.indexOf("&",pos1+sKey.length+2);
	if(pos2==-1){
		pos2=sTemp.indexOf("#",pos1+sKey.length+2);
		if(pos2==-1){
			pos2=sTemp.length;
		}
	}
	var sRet=sUrl.substring(pos1+sKey.length+2,pos2);
	if(sRet==""){
		sRet=sDefault;
	}
	return sRet;
}

function SwitchHidden(obj){
	if (document.getElementById(obj).style.display=="none")
	document.getElementById(obj).style.display="block";
	else
	document.getElementById(obj).style.display="none";
}