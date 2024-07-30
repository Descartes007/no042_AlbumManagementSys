
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.PageManager"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>

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


function clearNoNum(obj){
     //先把非数字的都替换掉，除了数字和.
     obj.value = obj.value.replace(/[^\d.]/g,"");
     //必须保证第一个为数字而不是.
     obj.value = obj.value.replace(/^\./g,"");
     //保证只有出现一个.而没有多个.
     obj.value = obj.value.replace(/\.{2,}/g,".");
     //保证.只出现一次，而不能出现两次以上
     obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
   } 

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
  <form  action="photoscx.jsp"  name="f1" method="post"  >
    <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="main_table_frame">
  <tr>
    <td height="136"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#F7F7F7" class="main_desk_table">
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
                 
                  <td colspan=8   align="left" class="main_matter_td" height='30'>&nbsp;&nbsp;&nbsp;
<% 
String puname = request.getParameter("uname")==null?"":request.getParameter("uname"); 
String startuname = request.getParameter("startuname")==null?"":request.getParameter("startuname"); 
String enduname = request.getParameter("enduname")==null?"":request.getParameter("enduname"); 
String pptype = request.getParameter("ptype")==null?"":request.getParameter("ptype"); 
String startptype = request.getParameter("startptype")==null?"":request.getParameter("startptype"); 
String endptype = request.getParameter("endptype")==null?"":request.getParameter("endptype"); 
String pphoname = request.getParameter("phoname")==null?"":request.getParameter("phoname"); 
String startphoname = request.getParameter("startphoname")==null?"":request.getParameter("startphoname"); 
String endphoname = request.getParameter("endphoname")==null?"":request.getParameter("endphoname"); 
   %>

<%
 HashMap mmm = new HashMap();%> 

&nbsp;&nbsp;
 
所属相册 
&nbsp;:&nbsp; 
<%=Info.getselect("ptype","ptypes","ptname","uname='"+uname+"'")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

&nbsp;&nbsp;
图片名称 
&nbsp;:&nbsp; 
<input type=text class='textBox'  size=20 name='phoname' />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type=submit class='' value='查询信息' />
 &nbsp;&nbsp;
<input type=button   class='' value='添加信息' onclick="window.location.replace('photostj.jsp')" /> 
&nbsp;&nbsp;</td>
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
            <td align="center" class="main_title_td_center2">所属相册</td>
<td align="center" class="main_title_td_center2">图片名称</td>
<td align="center" class="main_title_td_center2">图片介绍</td>
<td align="center" class="main_title_td_center2">背景音乐</td>
<td align="center" class="main_title_td_center2">图片文件</td>
<td align="center" class="main_title_td_center2">发布时间</td>
<td align="center" class="main_title_td_center2">操作</td>
          </tr>
        
        
    
           <% 
new CommDAO().delete(request,"photos"); 
if(request.getParameter("unameid1")!=null){ 
 new CommDAO().commOper("update photos set uname ='' where id="+request.getParameter("unameid1"));  
} 
if(request.getParameter("unameid2")!=null){ 
 new CommDAO().commOper("update photos set uname ='' where id="+request.getParameter("unameid2"));  
} 
String sql = "select * from photos where 1=1 " ;
 if(!puname.equals("")){ 
 sql+= " and uname like'%"+puname+"%' " ;
 }  
 if(!startuname.equals("")){  
 mmm.put("startuname",startuname) ;
 sql+= " and uname >'"+startuname+"' " ;
 }  
 if(!enduname.equals("")){  
 mmm.put("enduname",enduname) ;
 sql+= " and uname <'"+Info.getDay(enduname,1)+"' " ;
 }  
 if(!pptype.equals("")){ 
 sql+= " and ptype like'%"+pptype+"%' " ;
 }  
 if(!startptype.equals("")){  
 mmm.put("startptype",startptype) ;
 sql+= " and ptype >'"+startptype+"' " ;
 }  
 if(!endptype.equals("")){  
 mmm.put("endptype",endptype) ;
 sql+= " and ptype <'"+Info.getDay(endptype,1)+"' " ;
 }  
 if(!pphoname.equals("")){ 
 sql+= " and phoname like'%"+pphoname+"%' " ;
 }  
 if(!startphoname.equals("")){  
 mmm.put("startphoname",startphoname) ;
 sql+= " and phoname >'"+startphoname+"' " ;
 }  
 if(!endphoname.equals("")){  
 mmm.put("endphoname",endphoname) ;
 sql+= " and phoname <'"+Info.getDay(endphoname,1)+"' " ;
 }  
  sql +="  and (1!=1 " ; 
  sql +="  or  uname like'%"+Info.getUser(request).get("uname")+"%') " ;
  sql +=" and filename like'%2014%' and length(filename)=22 order by id desc ";
String url = "photoscx.jsp?1=1&uname="+puname+"&ptype="+pptype+"&phoname="+pphoname+""; 
ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
for(HashMap map:list){ %>
<tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">

            <td align="center" valign="middle" class="main_matter_td"><%=map.get("ptype")%></td>
            <td align="center" valign="middle" class="main_matter_td"><%=map.get("phoname")%></td>
            <td align="center" valign="middle" class="main_matter_td"><%=map.get("pcontent")%></td>
            <td align="center" valign="middle" class="main_matter_td"><%=map.get("bgmusic")%></td>
            <td align="center" valign="middle" class="main_matter_td"><img src="/photoalbum/upfile/<%=map.get("filename")%>" height=65 /></td>
            <td align="center" valign="middle" class="main_matter_td"><%=map.get("savetime")%></td>
            <td align="center" valign="middle" class="main_matter_td">
<a href="photosxg.jsp?id=<%=map.get("id")%>">修改</a>
&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;

<a onclick="return confirm('确定要删除这条记录吗?')" href="photoscx.jsp?scid=<%=map.get("id")%>">删除</a>
</td>
</tr>
<%}%>
         
         
              
          
          
          <tr 
              onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'" 
              onmouseout="this.style.backgroundColor=currentcolor">
            <td colspan=8 height="15"  align="center" valign="middle" class="main_matter_td">${page.info}</td>
          </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
 <script language=javascript src='/photoalbum/js/ajax.js'></script>
<% 
mmm.put("uname",puname); 
mmm.put("ptype",pptype); 
mmm.put("phoname",pphoname); 
%>
<%=Info.tform(mmm)%> 
<script language=javascript >  
 
</script>  
<%=Info.tform(mmm)%> 
<script language=javascript src='/photoalbum/js/My97DatePicker/WdatePicker.js'></script>
<script language=javascript src='/photoalbum/js/popup.js'></script>
<script language=javascript> 
function update(no){ 
pop('photosxg.jsp?id='+no,'信息修改',550,'100%') 
}
</script> 
<script language=javascript> 
function add(){ 
pop('photostj.jsp','信息添加',550,'100%') 
}
</script> 
<%@page import="util.Info"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="util.PageManager"%> 
<%@page import="dao.CommDAO"%> 
