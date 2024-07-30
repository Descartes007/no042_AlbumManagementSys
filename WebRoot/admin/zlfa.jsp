
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
 String type = request.getParameter("type");
 %>
  <form action="/photoalbum/admin/zlfa.jsp?f=f" name="f1"  method="post">
    <%

 String hql = "select * from mixinfo where infotype='用户文章' ";
        String url = "/photoalbum/admin/zlfa.jsp?1=1";
         String key = request.getParameter("key")==null?"":request.getParameter("key");
         String f = request.getParameter("f");
         if(f==null)
         {
         key = Info.getUTFStr(key);
         }
         
         if(!key.equals(""))
         {
         hql+=" and (title like'%"+key+"%' or content like'%"+key+"%' )";
         url+="&key="+key;
         }
         hql+=" order by id desc";
 %>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame">
  <tr>
    <td height="154"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7" class="main_desk_table">
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
                  <td width="150" align="center" class="main_matter_td">关键字</td>
                  <td width="" align="left" height="30" class="main_matter_td">
                  <input name="key" type="text"  class="textBox" size="45" /> 
                  
                   &nbsp;&nbsp; 
                  
			       <input type="button" onclick="f1.submit();" name="Submit" value="查询信息" />
			       
			      
			       
			       &nbsp;&nbsp; 
			       
			       <input type="button" onclick="add();" name="Submit2" value="添加信息" />
                  
                  </td>
                </tr>
              
				 
            </table></td>
      </tr>
    </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="6" colspan="2"></td>
          </tr>
          <tr>
            <td width="118" class="main_title_td_center">信息列表</td>
            <td class="main_title_td_bg">&nbsp;</td>
          </tr>
        </table>
      <table width="100%" border="0" 
            cellspacing="0" style="WIDTH: 100%; BORDER-COLLAPSE: collapse">
          <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
            <td width="" align="center" class="main_title_td_center2">标题</td>
            <td width="" align="center" class="main_title_td_center2">发布时间</td>
             <td width="" align="center" class="main_title_td_center2">作者</td>
            <td width="" align="center" class="main_title_td_center2">修改</td>
            <td width="" align="center" class="main_title_td_center2">删除</td>
          </tr>
        
        
        <%
        CommDAO dao = new CommDAO();
      String did = request.getParameter("did");
      if(did!=null)
      {
      dao.commOper("delete from mixinfo where id="+did);
      }
    
         
        PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(hql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    
       for(HashMap m:nlist)
       {
      
         %>
        
          <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
            <td width="" align="center" valign="middle" class="main_matter_td"><%=m.get("title") %></td>
            <td width="" align="center" valign="middle" class="main_matter_td"><%=m.get("savetime") %></td>
            <td width="" align="center" valign="middle" class="main_matter_td"><%=m.get("author") %></td>
            
            <td align="center" valign="middle" class="main_matter_td"><a href="javascript:update('<%=m.get("id") %>')">修改</a></td>
            <td width="" align="center" class="main_matter_td">
            <a href="zlfa.jsp?did=<%=m.get("id") %>">删除</a>            </td>
          </tr>
          <%
           } %>
           
            <script language=javascript>
			       function add()
			       {
			       pop("/photoalbum/admin/addzlfa.jsp","添加信息",700,'100%');
			       }
			       
			        function update(no)
			       {
			       pop("/photoalbum/admin/updatezlfa.jsp?id="+no,"修改信息",700,355);
			       }
			       </script>
          
             <script language=javascript>
                 function shouli(no) 
                 {
                  pop("/photoalbum/admin/shouli.jsp?id="+no,"受理订单",500,188)
                 }
                 </script>
          
          
          <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
            <td height="30" colspan="8" align="center" valign="middle" class="main_matter_td">${page.info }</td>
          </tr>
          
          
         
          
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
<script language="javascript" src="/photoalbum/js/popup.js"></script>
<%dao.close(); %>
