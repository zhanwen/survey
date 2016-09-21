// JavaScript Document

function collapse(I1){
		I1.style.display = 'none';
    }
	
function expand(I1){
		I1.style.display = 'block';
	}
	
function FirstIn(I1){
	//var first=document.getElementById("Question_item115");
	var des=document.getElementById("descript");
    var first=eval('document.getElementById("Question_item'+I1+'")');
	collapse(des);
	expand(first);
	}
	
function GetLast(I1,present){
    var pre=eval('document.getElementById("Question_item'+present+'")');
	var last=eval('document.getElementById("Question_item'+I1+'")');
	collapse(pre);
	expand(last);
	}
	
function GetNext(next,present){
	var pre=eval('document.getElementById("Question_item'+present+'")');
	var input=eval('document.getElementsByName("answer'+present+'")');
	var next=eval('document.getElementById("Question_item'+next+'")');
	var can_next=false;
    for (i=0;i<input.length;i++){//判断是否已经完成问卷
		if (input[i].type == 'text'){
			if 	(input[i].value!=''){
				can_next=true;
				} 	
			}
		else {
		    if (input[i].checked==true){
				can_next=true;
				}	
			}	
		}
    if (can_next==false){
		alert("请先完成本道题目！");
		return false;
		}
	collapse(pre);
	expand(next);
	}
	
function GetNext_jdtz(next,present){
	var pre=eval('document.getElementById("Question_item'+present+'")');
	var input=eval('document.getElementsByName("answer'+present+'")');
	var hidden=eval('document.getElementsByName("answer_jdtz'+present+'")');
	var can_next=false;
	var jd=false;
	var tz=false;
	var tz_target='';
    for (i=0;i<input.length;i++){//判断是否已经完成问卷
		if (input[i].type == 'text'){
			if 	(input[i].value!=''){
				can_next=true;
				} 	
			}
		else {
		    if (input[i].checked==true){
				can_next=true;
				}	
			}	
		}
    if (can_next==false){
		alert("请先完成本道题目！");
		return false;
		}
	for (i=0;i<input.length;i++){
			if (input[i].checked == true){
				 	
					if (hidden[i].value=='null'){
				 }
				 else if(hidden[i].value=='over'){
					  jd=true;
				 }
				 else{
					  var tz=true;
					  var tz_target=hidden[i].value;
					  //alert(tz_target);
				 }
			}
		}
	if (jd==true){
		alert("问卷结束，感谢您的参与！");
		location.href='Index.asp';
		}
	else if(tz==true){
		var target=eval('document.getElementById("Question_item'+tz_target+'")');
		collapse(pre);
		expand(target);
		}
	else{
		var next=eval('document.getElementById("Question_item'+next+'")');//正常跳转至下一题
		collapse(pre);
		expand(next);
		}
	}
	
function GetLast_jdtz(I1,present){
    var pre=eval('document.getElementById("Question_item'+present+'")');
	var last=eval('document.getElementById("Question_item'+I1+'")');
	collapse(pre);
	expand(last);
	
	}
function Reset(I1,I2){
	var des=document.getElementById("descript");
    var first=eval('document.getElementById("Question_item'+I1+'")');
    var last=eval('document.getElementById("Question_item'+I2+'")');
	collapse(des);
	expand(first);
	collapse(last);
	}

	