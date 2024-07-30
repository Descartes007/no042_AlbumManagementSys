<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0028)http://csir461.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>电子相册管理系统</TITLE>
<LINK rel=stylesheet type=text/css 
href="photoalbum_files/css.css">
<%
if(request.getParameter("f")!=null)session.invalidate();
if(request.getParameter("t")!=null)session.invalidate();
 %>

<STYLE type=text/css>
.STYLE1 {
	COLOR: #d77745
}
</STYLE>

<META name=GENERATOR content="MSHTML 8.00.6001.19222"></HEAD>
<BODY>


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
                                align=left><STRONG>网站简介</STRONG></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD>
                              <TABLE class=mt border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD align=left vAlign=top><SPAN 
                                class=ls>
                                
                                
                                <%
                                CommDAO dao = new CommDAO();
                                HashMap jjmap = dao.select("select * from mixinfo where infotype='网站简介'").get(0);
                                out.print( Info.subStr(Info.filterStrIgnoreCase(jjmap.get("content").toString(),"<",">"),350 )  );
                                 %>
                                
                                
                                
                                </SPAN>
                                  <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                    <TBODY>
                                      <TR>
                                        <TD>                                          </TD></TR></TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                        <TABLE class=mt border=0 cellSpacing=0 cellPadding=0 
                        width="96%">
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=left>
                                <TBODY>
                                <TR>
                                <TD height=24 background=photoalbum_files/112bg.gif 
                                width=320 align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=660 align=left>
                                <TBODY>
                                <TR>
                                <TD class=ls height=24 vAlign=bottom width=582 
                                align=left><STRONG>&nbsp;站内动态</STRONG></TD>
                                <TD class=ls vAlign=bottom width=78 
                                align=right><A 
                                href="http://csir461.com/tsnews2.jsp?classid=81"> 
                                 </A>&nbsp;&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD vAlign=top>
                              <TABLE class=mt border=0 cellSpacing=0 
                              cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD vAlign=top align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%" align=center>
                                <TBODY>
                                <TR>
                                <TD width="28%">
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=167>
                                <TBODY>
                                <TR>
                                <TD width=167>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                <TBODY>
                                <TR>
                                <TD align="center">
                               <img src="upfile/<%=dao.select("select * from mixinfo where infotype='站内动态' order by id desc").get(0).get("filename") %>" height="110" >
                                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
                                <TD vAlign=center width="72%" align=left>
                                <TABLE class=sy border=0 cellSpacing=0 
                                cellPadding=0 width="100%" align=center>
                                <TBODY>
                                <TR>
                                <TD height=28 align=left>
                                <STYLE type=text/css>BODY {
	FONT-FAMILY: 宋体; FONT-SIZE: 12px
}
TD {
	FONT-FAMILY: 宋体; FONT-SIZE: 12px
}
TH {
	FONT-FAMILY: 宋体; FONT-SIZE: 12px
}
BODY {
	MARGIN: 0px
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	TEXT-DECORATION: none
}
A:hover {
	TEXT-DECORATION: none
}
A:active {
	TEXT-DECORATION: none
}
</STYLE>

                                <TABLE id=standard border=0 cellSpacing=0 
                                cellPadding=0 width="100%">
                                <TBODY>
                                
                                <%
                                for(HashMap m:dao.select("select * from mixinfo where infotype='站内动态' order by id desc")){
                                 %>
                                <TR>
                                <TD class=xh height=24 vAlign=center 
                                align=left>·
                                <A href="xiang.jsp?id=<%=m.get("id") %>" target=_self>
                                    <%=Info.subStr(m.get("title").toString(),30)  %></A> 
                                    
                                    <%=m.get("savetime") %>
                                </TD></TR>
                                <%} %>
                                
                                
                                
                                </TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                        <TABLE border=0 cellSpacing=0 cellPadding=0 width=220>
                          <TBODY>
                          <TR>
                            <TD height=4></TD></TR></TBODY></TABLE>
                        <TABLE class=mt border=0 cellSpacing=0 cellPadding=0 
                        width="96%">
                          <TBODY>
                          <TR>
                            <TD>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%" align=left>
                                <TBODY>
                                <TR>
                                <TD height=24 background=photoalbum_files/112bg.gif 
                                width=320 align=left>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width=660 align=left>
                                <TBODY>
                                <TR>
                                <TD class=ls height=24 vAlign=bottom width=582 
                                align=left><STRONG>&nbsp;最新会员</STRONG></TD>
                                <TD class=ls vAlign=bottom width=78 
                                align=right><A 
                                href="http://csir461.com/newscenter.jsp?classid=63"></A>&nbsp;&nbsp;</TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
                          <TR>
                            <TD vAlign=top>
                              <TABLE border=0 cellSpacing=0 cellPadding=0 
                              width="100%">
                                <TBODY>
                                <TR>
                                <TD vAlign=top align=left>
                                <TABLE class=mt border=0 cellSpacing=0 
                                cellPadding=0 width="100%">
                                <TBODY>
                                <TR>
                                <TD vAlign=top width="72%" align=left><SPAN 
                                class=ls>
                                <STYLE type=text/css>BODY {
	FONT-FAMILY: 宋体; FONT-SIZE: 12px
}
TD {
	FONT-FAMILY: 宋体; FONT-SIZE: 12px
}
TH {
	FONT-FAMILY: 宋体; FONT-SIZE: 12px
}
BODY {
	MARGIN: 0px
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	TEXT-DECORATION: none
}
A:hover {
	TEXT-DECORATION: none
}
A:active {
	TEXT-DECORATION: none
}
</STYLE>

                                <TABLE id=standard border=0 cellSpacing=0 
                                cellPadding=0 width="100%">
                                <TBODY>
                               



                                <%
                                for(HashMap m:dao.select("select * from members where ispub='是' order by id desc")){
                                 %>
                                <TR>
                                <TD class=xh height=24 vAlign=center 
                                align=left>·
                                <A href="grzy.jsp?zyuname=<%=m.get("uname") %>" target=_self>
                                    <%=Info.subStr(m.get("uname").toString(),30)  %>
                                    <%=m.get("tname") %> 
                                    <%=m.get("gxqm") %>
                                    </A> 
                                    
                                    
                                </TD></TR>
                                <%} %>
                                
                                
                               
                               
                               
                               </TBODY></TABLE></SPAN></TD>
                                <TD vAlign=center width="28%" align=middle>
                                <TABLE border=0 cellSpacing=0 cellPadding=0 
                                width="100%">
                                <TBODY>
                                <TR>
                                <TD>
                                <img src="upfile/<%=dao.select("select * from members where ispub='是' order by id desc").get(0).get("filename") %>" height="110" >
                                </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
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
alert("用户名或密码错误");
<%}%>

</script>