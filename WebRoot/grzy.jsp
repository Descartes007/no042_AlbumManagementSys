<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0028)http://csir461.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>电子相册管理系统</TITLE>
<LINK rel=stylesheet type=text/css 
href="photoalbum_files/css.css">


<STYLE type=text/css>
.STYLE1 {
	COLOR: #d77745
}
</STYLE>

<META name=GENERATOR content="MSHTML 8.00.6001.19222"></HEAD>
<BODY>
<%
 CommDAO dao = new CommDAO();
HashMap amap = (HashMap)session.getAttribute("admin");
String zyuname = request.getParameter("zyuname")==null?"":request.getParameter("zyuname");
if(amap!=null)
{
HashMap zm = dao.select("select * from members where uname='"+zyuname+"'").get(0);
session.setAttribute("user",zm);
}
 %>
<%
if(Info.getMUser(request)==null&&amap==null){
 %>
 <script type="text/javascript">
 alert("请先登录");
 window.location.replace("index.jsp");
 </script>
 <%}else{ %>

<LINK rel=stylesheet type=text/css href="photoalbum_files/css.css">
<STYLE type=text/css>BODY {
	MARGIN: 0px
}
BODY {
	FONT-FAMILY: 宋体
}
TD {
	FONT-FAMILY: 宋体
}
TH {
	FONT-FAMILY: 宋体
}
</STYLE>



<TABLE class=bk border=0 cellSpacing=0 cellPadding=0 width=950 align=center>
  <TBODY>
  <TR>
    <TD vAlign=top>
     
      <LINK rel=stylesheet type=text/css href="photoalbum_files/css.css">
     
      
      
      <jsp:include page="top.jsp"></jsp:include>
                  
                  
                  <%
                 
                  
                  HashMap umap = Info.getMUser(request);
                  HashMap zymap = new HashMap();
                  
                  boolean isself = false;
                  if(amap!=null)
                  {
                   umap = dao.select("select * from members where uname='"+zyuname+"'").get(0); 
                    isself = true; 
                  }else{
                  if(request.getParameter("zyuname")==null||"null".equals(request.getParameter("zyuname"))){
                  %>
                   <script type="text/javascript">
				 alert("请先登录");
				 window.location.replace("index.jsp");
				 </script>
                  <%
                  }
                  else if(request.getParameter("zyuname").equals(umap.get("uname").toString()))
                  {
                    umap = dao.getmap(umap.get("id").toString(),"members");
                  isself = true;
                  }else{
                   umap = dao.select("select * from members where uname='"+zyuname+"'").get(0);  
                  }
                  }
                   %>
                  
                  
                  
                  
                  
                  
                  
               
      
      
      
      
     
      
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=925 align=center>
        <TBODY>
        <TR>
          <TD vAlign=top>
            <TABLE class=mt border=0 cellSpacing=0 cellPadding=0 width=925>
              <TBODY>
              <TR>
                <TD vAlign=top width=693>
                  <TABLE border=0 cellSpacing=0 cellPadding=0 width="100%" 
                  align=left>
                    <TBODY>
                    <TR>
                      <TD vAlign=top align=middle>
                      
                       <form action="/photoalbum/photoalbum?ac=regedit" name="f1" method="post">
                      <TABLE border=0 cellSpacing=0 cellPadding=0 
                          width="96%"><TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=left>
                                <TBODY>
                                <TR>
                                <TD height=24 background=photoalbum_files/112bg.gif 
                                width=320 align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=200 align=left>
                                <TBODY>
                                <TR>
                                <TD width=8 align=left>&nbsp;</TD>
                                <TD class=ls height=24 vAlign=bottom width=174 
                                align=left><STRONG>个人基本信息</STRONG></TD>
                                
                                
                                
                                
                                </TR></TBODY></TABLE>
                                
                                <%
                                if(isself){
                                 %>
                                <div onClick="upjbxx();" align="right" style="vertical-align: middle;line-height: 27px;cursor: hand" ><font color="orange">[更新]</font></div>
                                <%}else{
                                if(dao.select("select * from friends where uname='"+Info.getUser(request).get("uname").toString()+"' and funame='"+zyuname+"'").size()==0){
                                 %>
                                <div  align="right" style="vertical-align: middle;line-height: 27px;cursor: hand" >
                                <a href="/photoalbum/photoalbum?ac=friends&uname=<%=Info.getUser(request).get("uname")%>&funame=<%=zyuname %>" >
                                <font color="orange">[加为好友]</font>
                                </a>
                                </div>
                                <%}} %>
                                
                                </TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>
                              <TABLE class=mt border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD align=left vAlign=top>
                                  <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                    <TBODY>
                                      
                                      
                                        <TR>
                                <TD width="16%" height=30 
                                align=center vAlign=center class=xh>个性签名                                </TD>
                                <TD height="30" colspan="4" 
                                align=left vAlign=center class=xh><%=umap.get("gxqm") %></TD>
                                </TR>
                                      
                                      
                                       
                                <TR>
                                <TD width="16%" height=30 
                                align=center vAlign=center class=xh>用户名                                </TD>
                                <TD width="26%" height="30" 
                                align=left vAlign=center class=xh><label>
                                  <%=umap.get("uname") %>
                                </label></TD>
                                <TD width="16%" 
                                align=center vAlign=center class=xh>性别 </TD>
                                <TD width="26%" 
                                align=left vAlign=center class=xh>
                                 <%=umap.get("sex") %></TD>
                                <TD width="16%" rowspan="3" 
                                align=center vAlign=center class=xh>
                                
                                
                                <img src="upfile/<%=umap.get("filename") %>" height="80" />
                                
                                
                                </TD>
                                </TR>
                                
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>公开信息 </TD>
                                <TD height=30 
                                align=left vAlign=center class=xh> <%=umap.get("ispub") %></TD>
                                 <TD height=30 
                                align=center vAlign=center class=xh>联系方式 </TD>
                                 <TD height=30 
                                align=left vAlign=center class=xh> <%=umap.get("linkphone") %></TD>
                                 </TR>
                                
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>姓名                                </TD>
                                <TD height=30 
                                align=left vAlign=center class=xh> <%=umap.get("tname") %></TD>
                                 <TD height=30 
                                align=center vAlign=center class=xh>身份证号 </TD>
                                 <TD height=30 
                                align=left vAlign=center class=xh> <%=umap.get("sfid") %></TD>
                                 </TR>
                                
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>地址 </TD>
                                <TD height=30 colspan="4" 
                                align=left vAlign=center class=xh><label>
                                   <%=umap.get("addrs") %>
                                </label></TD>
                                 </TR>
                                 
                                 
                                   <TR>
                                <TD width="16%" height=45 
                                align=center vAlign=center class=xh>自我介绍</TD>
                                <TD height="45" colspan="5" 
                                align=left vAlign=center class=xh><label>
                                  <%=umap.get("jbs") %>
                                </label></TD>
                                </TR>
                                 
                                      </TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                                
                                
                                
                                <%if(false){ %>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                          width="96%"><TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=left>
                                <TBODY>
                                <TR>
                                <TD height=24 background=photoalbum_files/112bg.gif 
                                width=320 align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=200 align=left>
                                <TBODY>
                                <TR>
                                <TD width=8 align=left>&nbsp;</TD>
                                <TD class=ls height=24 vAlign=bottom width=174 
                                align=left><STRONG>信息查询</STRONG></TD>
                                
                                
                                
                                
                                </TR></TBODY></TABLE>
                                
                                <%
                                if(false){
                                 %>
                                <div onClick="upjksj();" align="right" style="vertical-align: middle;line-height: 27px;cursor: hand" ><font color="orange"></font></div>
                                <%} %>
                                
                                </TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>
                              <TABLE class=mt border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD height="40" align=left vAlign=top>
                                  <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                    <TBODY>
                                 <%
                                if(false){
                                 %>
                                <TR>
                                <TD width="16%" height=40 
                                align=center vAlign=center class=xh>信息查询</TD>
                                <TD width="80%" height="40" 
                                align=left vAlign=center class=xh><label>
                                <input name="infotype" type="radio" id="radio" value="asdasd" checked>
                                adasdasd
                                <input type="radio" name="infotype" id="radio2" value="asdasd">
网友
&nbsp;&nbsp;
<input type="text" name="key" id="key">
&nbsp;&nbsp;                              
<input type="button" onClick="searchf();" name="button" id="button" value="查询">

&nbsp;&nbsp;

<a href="grwz.jsp">asdasd</a>

<script type="text/javascript">
function searchf()
{
var infotypevalue = "用户文章";
var radios = document.getElementsByName("infotype");
if(radios[0].checked )infotypevalue = "用户文章";
if(radios[1].checked )infotypevalue = "网友";
if(infotypevalue=="用户文章")
{
f1.action="/photoalbum/zlfa.jsp";
f1.submit();
}
if(infotypevalue=="网友")
{
f1.action="/photoalbum/byfx.jsp";
f1.submit();
}
}
</script>

                                </label></TD>
                                </TR>
                                
                                <%} %>
                                      </TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                                
                                <%}%>
                                
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                          width="96%"><TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=left>
                                <TBODY>
                                <TR>
                                <TD height=24 background=photoalbum_files/112bg.gif 
                                width=320 align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=200 align=left>
                                <TBODY>
                                <TR>
                                <TD width=8 align=left>&nbsp;</TD>
                                <TD class=ls height=24 vAlign=bottom width=174 
                                align=left><STRONG>我的相册</STRONG></TD>
                                
                                
                                
                                
                                </TR></TBODY></TABLE>
                                
                                
                                
                                
                                  <%
                                if(isself){
                                 %>
                                <div onClick="addphotos();" align="right" style="vertical-align: middle;line-height: 27px;cursor: hand" ><font color="orange"></font></div>
                                
                                 
                                
                                <%} %>
                                
                                 <script type="text/javascript">
                                
                                
                                function addphotos()
                                {
                                popheight = 760;
                                pop("photostj.jsp","信息添加",500,210);
                                }
                                function updatephotos(no)
                                { 
                                window.location.replace("photos.jsp?id="+no);
                                }
                                </script>
                                </TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>
                              <TABLE class=mt border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD align=left vAlign=top>
                                  <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                    <TBODY>
                                      
                                      
                                       
                                <TR>
                               <%
                               int i=0;
                               String sql = "select * from albums where  1!=1 ";
                               if(!isself)
                               { 
                                 sql = sql.replaceAll("1!=1"," uname='"+umap.get("uname")+"' ");
                                 String ids = "";
                                 for(HashMap m:dao.select("select * from albums where uname='"+umap.get("uname")+"'"))
                                 {
                                 String isgk = m.get("isgk").toString();
                                 if(isgk.equals("不限"))ids+=m.get("id")+",";
                                 if(isgk.equals("会员"))
                                 {
                                 if(session.getAttribute("utype")!=null)ids+=m.get("id")+",";
                                 }
                                 if(isgk.equals("好友"))
                                 {
                                 if(session.getAttribute("utype")!=null)
                                 {
                                 if(dao.getInt("select count(*) from friends where uname='"+zyuname+"' and funame='"+Info.getUser(request).get("uname")+"'") ==1
                                 &&dao.getInt("select count(*) from friends where funame='"+zyuname+"' and uname='"+Info.getUser(request).get("uname")+"'") ==1)
                                 {
                                 ids+=m.get("id")+","; 
                                 }
                                 }
                                 }
                                 }
                                 
                                 if(ids.length()>0)ids=ids.substring(0,ids.length()-1);
                                 
                                 sql+=" and id in("+ids+") ";
                               
                               }else{
                               sql = sql.replaceAll("1!=1","");
                               sql+="uname='"+zyuname+"'";
                               }
                               
                               sql+=" order by id ";
                                for(HashMap hym:dao.select(sql)){ 
                                String s = "";
                                
                                 s=" style='cursor:hand' onclick=\"updatephotos('"+hym.get("id")+"')\" ";
                                  
                                i++;
                                 %>
                                <TD height=129 
                                align=center vAlign=center  >
                                 
                                <img src="upfile/<%=hym.get("filename")%>" <%=s %> border="0" height="88" />
                                <br /> 
                                 <table><tr><td height="3"></td></tr></table>
                                <%=hym.get("cname")%>(<%=hym.get("ctype")%>)
                                </TD>
                               <%
                               if(i%4==0)out.print("</tr><tr>");
                               }%>
                                </TR>
                                      </TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                                
                                
                                
                                
                                
                                <%
                                if(isself){
                                 %> 
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                          width="96%"><TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=left>
                                <TBODY>
                                <TR>
                                <TD height=24 background=photoalbum_files/112bg.gif 
                                width=320 align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=200 align=left>
                                <TBODY>
                                <TR>
                                <TD width=8 align=left>&nbsp;</TD>
                                <TD class=ls height=24 vAlign=bottom width=174 
                                align=left><STRONG>我的关注</STRONG></TD>
                                
                                
                                
                                
                                </TR></TBODY></TABLE>
                                
                              
                                
                                
                               
                                
                                
                                </TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>
                              <TABLE class=mt border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD align=left vAlign=top>
                                  <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                    <TBODY>
                                      
                                     
                                <TR>
                               <%
                                for(HashMap hym:dao.select("select * from friends where uname='"+umap.get("uname")+"'")){
                                 HashMap m = dao.select("select * from members where uname='"+hym.get("funame")+"'").get(0);
                                 %>
                                <TD height=30 
                                align=center vAlign=center class=xh>
                                
                                <a href="grzy.jsp?zyuname=<%=m.get("uname")%>">
                                <img src="upfile/<%=m.get("filename")%>" border="0" height="60" />
                                <br />
                                <%=m.get("uname")%>
                                </a>
                                </TD>
                               <%} %>
                                </TR>
                                      </TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                                <%} %>
                                
                                
                                  <%
                                if(request.getParameter("me")!=null)
                                {
                                String content = request.getParameter("content");
                                String mtype = request.getParameter("mtype");
                                dao.commOper("insert into messages values(null,'"+request.getParameter("muname")+"','"+content+"','"+Info.getDateStr()+"','"+request.getParameter("zyuname")+"','"+mtype+"')");
                                }
                                 %>
                                
                                
                                <%
                                if(isself){
                                 %>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                          width="96%"><TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=left>
                                <TBODY>
                                <TR>
                                <TD height=24 background=photoalbum_files/112bg.gif 
                                width=320 align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=200 align=left>
                                <TBODY>
                                <TR>
                                <TD width=8 align=left>&nbsp;</TD>
                                <TD class=ls height=24 vAlign=bottom width=174 
                                align=left><STRONG>网友来信</STRONG></TD>
                                 
                                </TR></TBODY></TABLE>
                                
                                <%
                                if(isself){
                                 %>
                                <div onClick="upjbxx();" align="right" style="vertical-align: middle;line-height: 27px;cursor: hand" ></div>
                                <%}else{
                                if(dao.select("select * from friends where uname='"+umap.get("uname").toString()+"'  and funame='"+zyuname+"'").size()==0){
                                 %>
                                <div  align="right" style="vertical-align: middle;line-height: 27px;cursor: hand" ></div>
                                <%}} %>
                                 
                                </TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>
                              <TABLE class=mt border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD align=left vAlign=top>
                                  <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                    <TBODY>
                                      
                                 <%
                                 for(HashMap m:dao.select("select * from messages where zyuname='"+zyuname+"' and mtype='私信' ")){
                                  %>     
                                 <TR>
                                <TD  height=30 
                                align=left vAlign=center class=xh>
                                <%=m.get("author")+" : "+m.get("content")+"("+m.get("savetime")+")" %>                                </TD>
                                </TR>
                                <%} %>
                                      </TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                                <%} %>
                                
                                
                                
                                
                                
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                          width="96%"><TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=left>
                                <TBODY>
                                <TR>
                                <TD height=24 background=photoalbum_files/112bg.gif 
                                width=320 align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=200 align=left>
                                <TBODY>
                                <TR>
                                <TD width=8 align=left>&nbsp;</TD>
                                <TD class=ls height=24 vAlign=bottom width=174 
                                align=left><STRONG>留言信息</STRONG></TD>
                                
                                
                              
                                
                                </TR></TBODY></TABLE>
                                
                                <%
                                if(isself){
                                 %>
                                <div onClick="upjbxx();" align="right" style="vertical-align: middle;line-height: 27px;cursor: hand" ></div>
                                <%}else{
                                if(dao.select("select * from friends where uname='"+umap.get("uname").toString()+"'    and funame='"+zyuname+"'").size()==0){
                                 %>
                                <div  align="right" style="vertical-align: middle;line-height: 27px;cursor: hand" ></div>
                                <%}} %>
                               
                                </TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>
                              <TABLE class=mt border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD align=left vAlign=top>
                                  <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                    <TBODY>
                                      
                                 <%
                                 for(HashMap m:dao.select("select * from messages where zyuname='"+zyuname+"' and mtype='留言'")){
                                  %>     
                                 <TR>
                                <TD  height=30 
                                align=left vAlign=center class=xh>
                                <%=m.get("author")+" : "+m.get("content")+"("+m.get("savetime")+")" %>
                                </TD>
                                </TR>
                                <%} %>
                                
                                <TR>
                                <TD height=98 colspan="2" 
                                align=center vAlign=center class=xh><label>
                                  <textarea name="content" id="content" cols="45" rows="3"></textarea>
                                  
                                  <br /><br />
                                  <label><input type=radio name="mtype" value="留言" checked="checked" /> 留言 </label>
                                  <label><input type=radio name="mtype" value="私信"  /> 私信 </label>&nbsp;&nbsp;
                                  <input type="button" onClick="msub()" value="提交信息" />
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  
                                  <script type="text/javascript">
                                  function msub()
                                  {
                                  f1.action = "grzy.jsp?zyuname=<%=zyuname%>&muname=<%=Info.getUser(request).get("uname")%>&me=me";
                                  f1.submit();
                                  }
                                  </script>
                                  
                                </label></TD>
                                </TR>
                                      </TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                                
                                
                                
                      
                      
                       </form>
                      </TD>
                    </TR></TBODY></TABLE></TD>
                
                
               
                
                
                 <jsp:include page="left.jsp"></jsp:include>
                
                
                
                
                
                
                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
      <TABLE border=0 cellSpacing=0 cellPadding=0 width=950>
        <TBODY>
        <TR>
          <TD>&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>




 <jsp:include page="foot.jsp"></jsp:include>



</BODY></HTML>
<script language="javascript">
<%
if(request.getAttribute("error")!=null){
%>
alert("用户名已存在");
<%}%>
<%
if(request.getAttribute("suc")!=null){
%>
alert("添加成功");
<%}%>
</script>
  <SCRIPT language=javascript src="/photoalbum/js/popups.js"></SCRIPT>
  <%}%>
  
  <script type="text/javascript">
                                function upjbxx()
                                {
								  popheight = 330;
                                pop("reregedit.jsp","信息修改",580,375);
                                }
                                function upjksj()
                                {
								  popheight = 330;
                                pop("jksj.jsp","信息修改",500,310);
                                }
                                </script>