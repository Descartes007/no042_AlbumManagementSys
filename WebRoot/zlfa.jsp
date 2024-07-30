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
                  CommDAO dao = new CommDAO();
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
                                align=left><STRONG>用户相册</STRONG></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
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
                              
                               int i=0; 
                               String url = "zlfa.jsp?1=1"; 
                               String sql = "select * from albums where isgk in('','不限') order by id ";
                               if(session.getAttribute("utype")!=null)
                                sql = "select * from albums where isgk in('会员','不限') order by id ";
                               
							   ArrayList<HashMap> list = PageManager.getPages(url,5, sql, request ); 
                                for(HashMap hym:list){ 
                              
                                i++;
                                 %>
                                <TD height=129 
                                align=center vAlign=center  >
                                 
                                 <a href="photos.jsp?id=<%=hym.get("id") %>">
                                 <%
                                 if(hym.get("filename").toString().startsWith("2014")){
                                  %>
                                <img src="upfile/<%=hym.get("filename")%>"   border="0" height="88" />
                                <%}else{ %>
                                <img src="upfile/<%=hym.get("filename")%>"   border="0" height="88" />
                                <%} %>
                                </a>
                                
                                <br />
                                 <table><tr><td height="3"></td></tr></table>
                                <%=hym.get("cname")%>(<%=hym.get("uname")%>)
                                </TD>
                               <%
                               if(i%4==0)out.print("</tr><tr>");
                               } %>
                                </TR>
                                
                                      <TR>
                                <TD class=xh height=40 vAlign=center 
                                align=center colspan="4">
                                ${page.info }
                                </TD></TR>
                                      
                                      </TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                      
                      
                      
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
