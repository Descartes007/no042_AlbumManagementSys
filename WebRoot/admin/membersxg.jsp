
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
 <%
HashMap user = Info.getUser(request);
String uname = user.get("uname").toString();
String utype = user.get("utype").toString();
String userid = user.get("id").toString();
 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin: 0px;
}
-->
</style>
<link href="../admin/global.css" rel="stylesheet" type="text/css" />
 
<SCRIPT language=javascript>
<!--
function window.onload() { 


if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight; return;}}} 

}

//-->
</script>

</head>

<% 
new CommDAO().delete(request,"members"); 
String id = userid; 
String erjitype = request.getParameter("erjitype"); 
String myztree = request.getParameter("myztree"); 
HashMap ext = new HashMap(); 
new CommDAO().update(request,response,"members",ext,true,false); 
HashMap mmm = new CommDAO().getmap(id,"members"); 
%>
<body>
  <form  action="membersxg.jsp?f=f&id=<%=mmm.get("id")%>"     name="f1" method="post"  onsubmit="return checkform()" >
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame">
  <tr>
    <td height="48"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7" class="main_desk_table">
      <tr>
        <td width="8%" height="6"></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7">
          <tr>
           <td width="118" class="main_title_td_center">相关信息</td>
                        <td align="right" class="main_title_td_bg">&nbsp;</td>
                        
              </tr>
        </table>
              <table width="100%" border="0" 
            cellspacing="0" rules="all" style="WIDTH: 100%; BORDER-COLLAPSE: collapse">
                <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">用户名</td>
                  <td width="84%" align="left" class="main_matter_td"><%=mmm.get("uname")%></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">性别</td>
                  <td width="84%" align="left" class="main_matter_td"><span id="sexdanx"><label><input type=radio name='sex' value='男' />&nbsp;男 </label>
<label><input type=radio name='sex' value='女' />&nbsp;女 </label>
</span></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">联系电话</td>
                  <td width="84%" align="left" class="main_matter_td"><input type=text  class='textBox' id='linkphone' name='linkphone' size=35 /><label id='clabellinkphone' /></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">身份证号</td>
                  <td width="84%" align="left" class="main_matter_td"><input type=text  class='textBox' id='sfid' name='sfid' size=35 /><label id='clabelsfid' /></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">联系地址</td>
                  <td width="84%" align="left" class="main_matter_td"><textarea  cols='35'   style='margin-top: 1px;margin-bottom: 1px'  class='textArea'   name='addrs'   ></textarea></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">姓名</td>
                  <td width="84%" align="left" class="main_matter_td"><input type=text  class='textBox' id='tname' name='tname' size=35 /><label id='clabeltname' /></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">公开个人信息</td>
                  <td width="84%" align="left" class="main_matter_td"><span id="ispubdanx"><label><input type=radio name='ispub' value='否' />&nbsp;否 </label>
<label><input type=radio name='ispub' value='是' />&nbsp;是 </label>
</span></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">个人签名</td>
                  <td width="84%" align="left" class="main_matter_td"><input type=text  class='textBox' id='gxqm' name='gxqm' size=35 /><label id='clabelgxqm' /></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">自我介绍</td>
                  <td width="84%" align="left" class="main_matter_td"><textarea  cols='35'   style='margin-top: 1px;margin-bottom: 1px'  class='textArea'   name='jbs'   ></textarea></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="16%" align="center" class="main_matter_td">相片</td>
                  <td width="84%" align="left" class="main_matter_td"><%=Info.getImgUpInfo(65)%></td>
                </tr>

				
				 <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td height="35" colspan="4" align="center" class="main_matter_td"><label>
                  <input type="submit" name="Submit" value="提交信息" />&nbsp;&nbsp;&nbsp;
                    <input type=button value='信息重置' onclick='getPvalue()' />
                  </label></td> 
                </tr>
            </table></td>
      </tr>
    </table>
      </td>
  </tr>
</table>
</form>
</body>
</html>
 
<script language=javascript src='/photoalbum/js/My97DatePicker/WdatePicker.js'></script> 
<script language=javascript src='/photoalbum/js/ajax.js'></script> 
<script language=javascript src='/photoalbum/js/popup.js'></script> 
<%@page import="util.Info"%> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
</script>  
<script language=javascript >  
 function checkform(){  
var linkphoneobj = document.getElementById("linkphone");  
if(linkphoneobj.value!=""){  
if(linkphoneobj.value.length>11||linkphoneobj.value.length<8||isNaN(linkphoneobj.value)){ 
document.getElementById("clabellinkphone").innerHTML="&nbsp;&nbsp;<font color=red>联系电话必须为8-11位数字</font>";  
return false;
}else{  
document.getElementById("clabellinkphone").innerHTML="";  
}  
}  
var sfidobj = document.getElementById("sfid");  
if(sfidobj.value!=""){  
var c = new RegExp();   
c = /^[A-Za-z0-9]+$/;   
if(!((sfidobj.value.length==15||sfidobj.value.length==18)&&c.test(sfidobj.value))){ 
document.getElementById("clabelsfid").innerHTML="&nbsp;&nbsp;<font color=red>身份证号为15或18位数字与字母组合</font>";  
return false;
}else{  
document.getElementById("clabelsfid").innerHTML="";  
}  
}  
var tnameobj = document.getElementById("tname");  
if(tnameobj.value==""){  
document.getElementById("clabeltname").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";  
return false;  
}else{ 
document.getElementById("clabeltname").innerHTML="  ";  
}  
return true;   
}   
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
