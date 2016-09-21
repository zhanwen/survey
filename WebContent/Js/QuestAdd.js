function SubQuestion(){
    if(document.forms[0].qHead.value.length===0){
	alert("请输入完整的问题内容");
	document.forms[0].qhead.focus();
	return false;
	}else{	
	var Answers=document.getElementsByName("Answer");
	var Answer=Answers[0].value;
	var Answer_2=document.forms[0].Answer; 
	var result=0; 
	//验证
	for(var i=0;i<Answers.length;i=i+1){
		 
		if(Answers[i].value.indexOf('&$$&')!=-1){
			
			alert("选项不能包含系统保留字符串 '&$$&'");
	        return false;
		}
		
	}
	
	//拼接
	for(var i=1;i<Answer_2.length;i=i+1){
	var Answer_g=document.forms[0].Answer[i].value;
	//alert(Answer);
	//alert(Answer.indexOf('&$$&'));

	if(Answer==='' || Answer_g===''){
		alert("请输入完整所有的问题选项");
        return false;
		}

	Answer=Answer+"&$$&"+Answer_g;
	result=result+","+0;
	}
	
	var type=document.forms[0].Answer.type;
	//alert(type);
	if(type!==null&&type=="textarea"){
		result=0;
	}
	document.forms[0].qBody.value=Answer;
	document.forms[0].qResult.value=result;
	return true;
	}
}
function MoreAnswer(type){
	
	switch(type){
	case "DX":
	case "FX":
		var ul=document.getElementById("ulAnswer");
		var inputTitle=document.createElement("input");
		if(type=="DX"){
			inputTitle.setAttribute("type", "radio");
		}else{
			inputTitle.setAttribute("type", "checkbox");
		}
		var input=document.createElement("input");
		var li=document.createElement("li");
		input.setAttribute("id","Answer");
		li.appendChild(inputTitle);
		li.appendChild(input);
		ul.appendChild(li);
		break;
	case "DXJK":
	case "FXJK":
		var ul=document.getElementById("ulAnswer");
		var li=document.getElementById("ulAnswer").lastChild;
		if (li!=null) ul.removeChild(li);
		var inputTitle=document.createElement("input");
		var inputTitle2=document.createElement("input");
		if(type=="DXJK"){
			inputTitle.setAttribute("type", "radio");
			
			inputTitle2.setAttribute("type", "radio");
			 
		}else if(type=="FXJK"){
			inputTitle.setAttribute("type", "checkbox");
			 
			inputTitle2.setAttribute("type", "checkbox");
			 
		}
		var input=document.createElement("input");
		var input2=document.createElement("input");
		var input3=document.createElement("input");
		var li=document.createElement("li");
		var li2=document.createElement("li");
		input.setAttribute("id","Answer");
		input2.setAttribute("id","Answer");
		input3.setAttribute("id","Answer_2");
		input3.setAttribute("readOnly",true);
		input3.setAttribute("value","用户在此框输入自定义文本");
		li.appendChild(inputTitle);
		li.appendChild(input);
		li2.appendChild(inputTitle2);
		li2.appendChild(input2);
		li2.appendChild(input3);
		ul.appendChild(li);
		ul.appendChild(li2);
		break;
	}
	
}



function LessAnswer(type){
	switch(type){
	case "DX":
	case "FX":
		var ul=document.getElementById("ulAnswer");
		var li=ul.lastChild;
		if (ul.firstChild==li){
			alert("最后一个选项不能删除");
			}
		else {
			ul.removeChild(li);	
			}
		break;
	case "DXJK":
	case "FXJK":
		var ul=document.getElementById("ulAnswer");
		var li=ul.lastChild;
		if (ul.firstChild==li){
			alert("最后一个选项不能删除");
			return;
			}
		else {
			ul.removeChild(li);	
			}
		var li=ul.lastChild;
		if (ul.firstChild==li){
			alert("最后一个选项不能删除");
			return;
			}
		else {
			ul.removeChild(li);	
			}
		var input=document.createElement("input");
		var input2=document.createElement("input");
		var input3=document.createElement("input");
		var li=document.createElement("li");
		if(type=="DXJK"){
			 
			input3.setAttribute("type", "radio");
		}else if(type=="FXJK"){
			 
			input3.setAttribute("type", "checkbox");
		}
		
		input.setAttribute("id","Answer");
		input2.setAttribute("id","Answer_2");
		input2.setAttribute("readOnly",true);
		input2.setAttribute("value","用户在此框输入自定义文本");
		li.appendChild(input3);
		li.appendChild(input);
		li.appendChild(input2);
		ul.appendChild(li);
		
	}
}

  



