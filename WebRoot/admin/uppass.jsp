<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
 

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
<link href="/photoalbum/admin/global.css" rel="stylesheet" type="text/css" />
<SCRIPT language=javascript>
<!--
function window.onload() { 

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+150; return;}}} 

}

//-->
</script>
<script language="javascript" src="/webshop/theme/calendar/WdatePicker.js"></script>
</head>

<body>
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
  <%
  CommDAO dao = new CommDAO();
   HashMap u = (HashMap)Info.getUser(request);
  String id = (String)u.get("id");
  
   u = Info.getUser(request);
  /*  dao.close(); */
   %>
<form action="/photoalbum/photoalbum?ac=uppass&id=<%=id %>" name="f1" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame">
      <tr>
        <td>
				<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7" class="main_desk_table">
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
                          <td width="303" align="center" class="main_matter_td">用户名</td>
            <td width="1344" colspan="3" align="left" class="main_matter_td"><label> 
             <input name="uname"  class="textBox" type="text" value="<%=u.get("uname")%>" readonly="readonly"  id="textfield" size="20" /> 
             </label></td>
                        </tr>
                    
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">新密码</td>
                          <td width="1344" colspan="3" align="left" class="main_matter_td"><label>
                            <input name="pass"  class="textBox" type="password" id="textfield" size="20" />
                          </label></td>
                        </tr>
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td align="center" class="main_matter_td">再次输入新密码</td>
                          <td width="1344" colspan="3" align="left" class="main_matter_td"><input name="repass"  class="textBox" type="password" id="textfield2" size="20" /></td>
                        </tr>
                      
                      
                      
                        
                        
                        <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
                          <td colspan="4" align="center" class="main_matter_td"><label>
                            <input type="submit" name="button" class="btn" onmousedown="check();"  id="button" value="提交信息" />&nbsp;&nbsp;&nbsp;&nbsp;
                            <script language=javascript>
                            function check()
                            {
                           if(f1.pass.value=="")
                           {
                           alert("请输入新密码");
                           return;
                           }
                           if(f1.pass.value!=f1.repass.value)
                           {
                           alert("两次密码输入不一致");
                           return;
                           }
                            
                            
                            }
                            
                            </script>
                            <input type="reset" name="button" class="btn"  id="button" value="重新填写" />
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
