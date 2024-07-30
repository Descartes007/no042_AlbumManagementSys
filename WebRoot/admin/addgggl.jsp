
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>信息管理</title>
<style type="text/css">
<!--
body {
	margin: 0px;
}
-->
</style>
<link href="/photoalbum/admin/global.css" rel="stylesheet" type="text/css" />
<SCRIPT language=javascript>
<!--
function window.onload() { 

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+400; return;}}} 

}

//-->
</script>

</head>

<body>
<%
 String type = request.getParameter("type");
 %>
  <form action="/photoalbum/photoalbum?ac=addgggl" name="f1"  method="post">
  

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame">
  <tr>
    <td height="60"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7" class="main_desk_table">
      <tr>
        <td width="8%" height="6"></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" 
            cellspacing="0" rules="all" style="WIDTH: 100%; BORDER-COLLAPSE: collapse">
                <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                  <td width="418" align="center" class="main_matter_td">公告标题</td>
                  <td width="915" align="left" class="main_matter_td">
                  <input name="title" type="text"  class="textBox" size="80" /></td>
                  
                </tr>
               
                
             
                
                <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                 
                  <td colspan="2" align="left" class="main_matter_td">
                <%=Info.fck(220,"") %>
                 </td>
                </tr>
              
				
				 <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                  <td height="33" colspan="5" align="center" class="main_matter_td">
                     
					 
					 
					 
			       <input type="submit"   name="Submit" value="提交信息" /> 
			       &nbsp;&nbsp;&nbsp;
			       <input type="reset"  name="Submit2" onclick="popclose();" value="关闭窗口" />
			       
			       <script language=javascript>
			       function addcl()
			       {
			       pop("photoalbumg/admin/addcl.jsp","添加车辆",400,300);
			       }
			       
			       function check()
			       {
			       if(f1.fangno.value=="")
			       {
			       alert("请输入房号");
			       return;
			       }
			       if(f1.fangdj.value=="")
			       {
			       alert("请输入单价");
			       return;
			       }
			       if(isNaN(f1.fangdj.value))
			       {
			       alert("单价请输入数字");
			       return;
			       }
			       f1.submit();
			       }
			       
			       var frames = parent.document.getElementsByTagName("iframe");
for(var i=0;i<frames.length;i++){ 
var alliframe = parent.document.getElementsByTagName("iframe")[i];  
if(alliframe.name=="ifr_popup0")
alliframe.style.height=document.body.scrollHeight-1; 
} 
			       </script>			       </td>
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
<script language="javascript" src="/photoalbum/js/popup.js"></script>

<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 <script language=javascript>
 alert("操作成功");
  parent.location= parent.location;
 </script>
 <%
 }
  %>