//form.js用于各表单提交前的验证和校验
//用于对管理员登入信息进行验证
function CheckAdminLogin()
{
  if (document.form1.adminname.value.length == 0) {
		alert("用户名没有填写!");
		document.form1.adminname.focus();
		document.form1.adminpass.value="";
        return false;
	}else if(document.form1.adminpass.value.length < 6) {
		alert("密码输入错误!");
        document.form1.adminpass.value="";
		document.form1.adminpass.focus();
        return false;
	}else if (document.form1.postcode.value == '') {
		alert ('请输入验证码！');
		document.form1.postcode.focus();
		
		return false;
    }
} 
//CheckAdminRegForm用于对管理员添加和修改的验证
function CheckAdminRegForm()
{
 if (document.form1.Admin_user.value.length == 0) {
		alert("用户名没有填写!");
		document.form1.Admin_user.focus();
		document.form1.Admin_pass.value="";
        document.form1.Admin_pass2.value="";
		return false;
	}
	    if (document.form1.Admin_pass.value.length < 6) {
		alert("密码过于简短,请输入6位以上密码!");
        document.form1.Admin_pass.value="";
        document.form1.Admin_pass2.value="";
		document.form1.Admin_pass.focus();
        return false;
	}
	    if (document.form1.Admin_pass.value != document.form1.Admin_pass2.value) {
		alert("前后两次输入的密码不一致!");
		document.form1.Admin_pass.value="";
        document.form1.Admin_pass2.value="";
		document.form1.Admin_pass.focus();
        return false;
	}
	    if (document.form1.Admin_email.value.length <=2) {
		alert("E-mail地址输入错误!");
		document.form1.Admin_pass.value="";
        document.form1.Admin_pass2.value="";
        return false;
	}
	return true;
} 

//CheckBoardWriteForm对公告内容的验证
function CheckBoardWriteForm()
{
if (document.form1.Board_title.value.length == 0) {
		alert("用户名没有填写!");
		document.form1.Board_title.focus();
		return false;
	}
	    if (document.form1.Board_text.value.length < 6) {
		alert("公告过于简短,请输入!");
		document.form1.Board_text.focus();
        return false;
	}
	return true;
} 

//CheckLinkAppForm用于对友情链接申请的验证
function CheckLinkAppForm()
{  
 if (document.form1.Link_url.value.length == 0) {
		alert("链接地址没有填写!");
		document.form1.Link_url.focus();//使光标停留在title上
		return false;
	}
	    if (document.form1.Link_name.value.length == 0) {
		alert("链接名称没有填写，谢谢配合！");
        return false;
	}
	return true;
}
//checkGB()用于对留言提交前的验证
function checkGB(){
 if (document.form1.GB_user.value.length == 0) {
		alert("留言者昵称必须填写!");
		document.form1.GB_user.focus();
		return false;
	}else if (document.form1.GB_content.value.length == 0) {
		alert("留言内容必须填写!，谢谢配合！");
		document.form1.GB_content.focus();
        return false;
	}else
	return true;
}