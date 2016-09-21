// JavaScript Document
function CheckPassword(obj1,obj2,num){ //检查密码输入，obj1是密码检测对象1,obj2是密码检测对象2,num是合法密码位数
var Pass1=document.getElementById(obj1).value;
var Pass2=document.getElementById(obj2).value;
if(Pass1.length<num||Pass2.length<num){
alert("密码必须大于"+num+"位");
document.getElementById(obj1).focus();
return false;
}else 
if(Pass1!=Pass2){
alert("两次密码输入不一致！");
Pass1.focus();
return false;
}


}
function SwitchHidden(obj){
if (document.getElementById(obj).style.display=="none")
document.getElementById(obj).style.display="block";
else
document.getElementById(obj).style.display="none";
}

function AddIPAddress(){
var IPStart,IPEnd,i;
IPStart=document.getElementById("ipSta1").value+"."+document.getElementById("ipSta2").value+"."+document.getElementById("ipSta3").value+"."+document.getElementById("ipSta4").value;
IPEnd=document.getElementById("ipEnd1").value+"."+document.getElementById("ipEnd2").value+"."+document.getElementById("ipEnd3").value+"."+document.getElementById("ipEnd4").value;
var IPValue=IPStart+"---"+IPEnd;
selectedNum = document.getElementById('Survey_ipList').options.length;
for(i=0;i<=selectedNum-1;i++){                                     //检查重复添加
if(document.getElementById('Survey_ipList').options[i].value==IPValue){
alert("请IP范围已经存在,请不要重复添加");
return false;
  }
}
document.getElementById('Survey_ipList').options[selectedNum]=document.createElement("option");
document.getElementById('Survey_ipList').options[selectedNum].text=IPValue;
document.getElementById('Survey_ipList').options[selectedNum].value=IPValue;
document.getElementById("ipSta1").value="";
document.getElementById("ipSta2").value="";
document.getElementById("ipSta3").value="";
document.getElementById("ipSta4").value="";
document.getElementById("ipEnd1").value="";
document.getElementById("ipEnd2").value="";
document.getElementById("ipEnd3").value="";
document.getElementById("ipEnd4").value="";
}
function DellSelected(){ //删除选中的IP范围段
	var flag = 0;
	var len = document.getElementById('Survey_ipList').options.length;
	for (i = 0; i < len; i++) {
		if(document.getElementById('Survey_ipList').options[i].selected){
		  flag = 1;
		  break;
		}
	}
	if (flag ==0){
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
function DellAll(){ //删除所有的IP范围段
	var len = document.getElementById('Survey_ipList').options.length;
		for (i = 0; i < len; i++) {
			document.getElementById('Survey_ipList').options[0] = null;			
		}
}

function CheckForm(){
    if(document.getElementById('Survey_name').value==""){
	alert("请输入问卷名称");
	return false;
	}else if(document.getElementById('Survey_author').value==""){
	alert("请输入问卷发起人(单位)");
	//alert(document.getElementById('Survey_isPassword').value);
	return false;
	}else{
	    var obj=document.getElementById("Survey_ipList");
		var ipStart=document.getElementById("Survey_ipStart");
		var ipEnd=document.getElementById("Survey_ipEnd");
		var ipStartValue="";
		var ipEndValue="";
		for(var i=0;i<obj.options.length;i++){
		   var ipvalue=obj.options[i].value;
		   ipvalue=ipvalue.split("---");
		   if(ipStartValue==""){
		       ipStartValue=ipvalue[0];
		   }else{
		       ipStartValue=ipStartValue+","+ipvalue[0];
		   }
		   if(ipEndValue==""){
		       ipEndValue=ipvalue[1];
		   }else{
		       ipEndValue=ipEndValue+","+ipvalue[1];
		   }
		  } 
    	ipStart.value=ipStartValue;
		ipEnd.value=ipEndValue;
		return true;
	}
}

function mask(obj,kind){
obj.value=obj.value.replace(/[^\d]/g,'')
key1=event.keyCode
if (key1==37 || key1==39)
{ obj.blur();
nextip=parseInt(obj.name.substr(5,1))
nextip=key1==37?nextip-1:nextip+1;
nextip=nextip>=5?1:nextip
nextip=nextip<=0?4:nextip
eval("var ip=document.getElementById('ip"+kind+""+nextip+"');")
eval("ip.focus();")
} 
if(obj.value.length>=3) 
if(parseInt(obj.value)>=256 || parseInt(obj.value)<=0)
{
alert(parseInt(obj.value)+"IP地址错误！")
obj.value=""
obj.focus()
return false;
}
else 
{ obj.blur();
nextip=parseInt(obj.name.substr(5,1))+1
nextip=nextip>=5?1:nextip
nextip=nextip<=0?4:nextip
eval("var ip=document.getElementById('ip"+kind+""+nextip+"');")
eval("ip.focus();")
}
}
function mask_c(obj){
clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))
}
