
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>
<%@page import="dao.CommDAO"%>



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
<%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 <script language=javascript>
 alert("操作成功");
 </script>
 <%
 }
  %>
</head>

<body>
<%
CommDAO dao = new CommDAO();
 if(request.getParameter("f")!=null)
 {
 String content = request.getParameter("content");
 dao.commOper("update mixinfo set content='"+content+"' where infotype='联系我们'");
 }
 HashMap map = dao.select("select * from mixinfo where infotype='联系我们'").get(0);

 %>
  <form action="/photoalbum/admin/lxwm.jsp?f=f" name="f1"  method="post">


<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame">
  <tr>
    <td height="79"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7" class="main_desk_table">
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
                 
                  <td width="" align="left" class="main_matter_td">
                  <%=Info.fck(300,map.get("content").toString()) %></td>
                </tr>
              
				
				 <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                  <td height="33" colspan="4" align="center" class="main_matter_td">
                     
					 
					 
					 
			       <input type="button" onclick="f1.submit();" name="Submit" value="提交信息" />
			       
			      
			       
			       &nbsp;&nbsp;&nbsp;
			       
			       <input type="button" onclick="add();" name="Submit2" value="重新填写" /></td>
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
