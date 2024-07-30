
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
HashMap ext = new HashMap(); 
String tglparentid=request.getParameter("tglparentid")==null?"":request.getParameter("tglparentid"); 
ext.put("tglparentid",tglparentid); 
ext.put("uname",Info.getUser(request).get("uname")); 
new CommDAO().insert(request,response,"photos",ext,true,true); 
%>
<body>
  <form  action="webphotostj.jsp?f=f&tglparentid=<%=tglparentid%>"     name="f1" method="post"  onsubmit="return checkform()" >
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
                 
                  <td width="24%" align="center" class="main_matter_td">所属相册</td>
                  <td width="76%" align="left" class="main_matter_td"><%=Info.getselect("ptype","albums","cname~无名","uname='"+uname+"'")%> 
<label id='clabelptype' />
</td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="24%" align="center" class="main_matter_td">图片名称</td>
                  <td width="76%" align="left" class="main_matter_td"><input type=text   class='textBox' id='phoname' name='phoname' size=35 /><label id='clabelphoname' /></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="24%" align="center" class="main_matter_td">图片介绍</td>
                  <td width="76%" align="left" class="main_matter_td"><textarea  cols='35'  style='margin-top: 1px;margin-bottom: 1px'  class='textArea'  name='pcontent'  ></textarea></td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="24%" align="center" class="main_matter_td">背景音乐</td>
                  <td width="76%" align="left" class="main_matter_td"><%=Info.getselect("bgmusic","musics","mname~无名","uname='"+uname+"'")%> 
<label id='clabelbgmusic' />
</td>
                </tr>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td width="24%" align="center" class="main_matter_td">图片</td>
                  <td width="76%" align="left" class="main_matter_td">
                  
                  <input type=text   class='textBox' id='filename' name='filename' size=65 />
                  <br />
                  ( 注:请输入全路径，如 http://www.baidu.com/images/321233x898.jpg )
                  
                  
                  </td>
                </tr>

				
				 <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td height="35" colspan="4" align="center" class="main_matter_td"><label>
                  <input type="submit" name="Submit" value="提交信息" />&nbsp;&nbsp;&nbsp;
                    <input type=button value='返回上页' onclick='popclose();' />
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
<script language=javascript src='/photoalbum/js/popup.js'></script>
<script language=javascript src='/photoalbum/js/ajax.js'></script>
<%@page import="util.Info"%>
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
<script language=javascript >  
 
 function checkform(){  
var ptypeobj = document.getElementById("ptype");  
if(ptypeobj.value==""){  
document.getElementById("clabelptype").innerHTML="&nbsp;&nbsp;<font color=red>请输入所属相册</font>";  
return false;  
}else{
document.getElementById("clabelptype").innerHTML="  ";  
}  
  
var phonameobj = document.getElementById("phoname");  
if(phonameobj.value==""){  
document.getElementById("clabelphoname").innerHTML="&nbsp;&nbsp;<font color=red>请输入图片名称</font>";  
return false;  
}else{
document.getElementById("clabelphoname").innerHTML="  ";  
}  
  
return true;   
}   
var frames = parent.document.getElementsByTagName("iframe");
for(var i=0;i<frames.length;i++){ 
var alliframe = parent.document.getElementsByTagName("iframe")[i];  
if(alliframe.name=="ifr_popup0")
alliframe.style.height=document.body.scrollHeight+-1; 
} 
</script>  
