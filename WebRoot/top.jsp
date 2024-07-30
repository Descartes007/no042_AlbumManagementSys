<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="util.Info"%>

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
      String t = request.getParameter("t");
      if(t!=null)session.removeAttribute("user");
       %>
      
      
      
      
      
      
      <form name="form1" method="post" action="/photoalbum/photoalbum?ac=mlogin">

      <TABLE class=mt border=0 cellSpacing=0 cellPadding=0 width=925 
      align=center>
        <TBODY>
        <TR>
          <TD>
            <TABLE border=0 cellSpacing=0 cellPadding=0 width=925>
              <TBODY>
              <TR>
                <TD width="164" height=55 align=center vAlign="middle" onclick="window.location.replace('/photoalbum')"><label>
                  <font face="华文行楷" style="font-size: 29px" color="orange">电子相册</font>
                </label></TD>
                <TD width="360" align=left vAlign=middle>
                
                <marquee scrollamount="2.5"> <font color="orange">欢迎光临电子相册网 , 本站能为您提供最新的相册管理服务 , 并为广大网友提供在线交流互动平台 , 本站衷心祝您生活愉快</font></marquee>                </TD>
                <TD width="23" align=left vAlign=middle>&nbsp;</TD>
              
              
              <%
              if(Info.getMUser(request)==null){
               %>
                <TD width="56" align=center vAlign=middle>
                  用户名:                  </TD>
                <TD width="79" align=center vAlign=middle><input type="text" name="uname" style="height:12px" id="textfield2" size="10"></TD>
                <TD width="56" align=center vAlign=middle>密码:</TD>
                <TD width="79" align=center vAlign=middle><input type="text" name="upass" style="height:12px"  id="textfield" size="10"></TD>
                <TD width="108" align=right vAlign=middle><input name="input" value="登录" style="border:1px" type="submit">
                  <input name="input" value="注册" onclick="window.location.replace('regedit.jsp')" style="border:1px" type="button"></TD>
                  <%}else{ %>
                  <TD width="322" align=center vAlign=middle>
                  欢迎你回来 <%=Info.getMUser(request).get("uname") %>
                  &nbsp;
                  <% 
                  if(request.getSession(). getAttribute("utype").equals("会员")){
                   %>
                  <a href="grzy.jsp?zyuname=<%=Info.getMUser(request).get("uname") %>">个人主页</a>
                   &nbsp;<%} %>
                    <a href="/photoalbum/admin/default.jsp" target="_blank">信息管理</a> 
                    &nbsp;
                     <SCRIPT language=javascript src="/photoalbum/js/popup.js"></SCRIPT>
                  <a href="index.jsp?t=t">退出</a>     
                  </TD>
                  <%} %>
                  
              </TR>
              <TR style="DISPLAY: none">
                <TD colspan="8" align=left vAlign=top></TD></TR>
              <TR>
                <TD colspan="8" align=middle vAlign=top background=photoalbum_files/cd.gif>
              <DIV class=menu style="width:100%" align="center"><A 
                  href="index.jsp"><strong>首页</strong></A><A 
                  href="wzjj.jsp"><strong>网站简介</strong></A><A 
                  href="ylzx.jsp"><strong>站内动态</strong></A><A 
                  href="zlfa.jsp"><strong>用户相册</strong></A><A 
                  href="wzgg.jsp"><strong>网站公告</strong></A>
                  
                  <A 
                  href="byfx.jsp"><strong>空间分享</strong></A>
                  
                  <A 
                  href="grzy.jsp?zyuname=<%=Info.getMUser(request)==null?null: Info.getMUser(request).get("uname")%>"><strong>个人主页</strong></A><A 
                  href="zxjl.jsp"><strong>在线交流</strong></A><A 
                  href="lxwm.jsp"><strong>联系我们</strong></A>              </DIV></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
                  
                  </form>
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  
                  <!--<table width="925" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" valign="top"><script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','925','height','30','src','zi','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','zi' ); //end AC code
</script><noscript><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="925" height="30">
      <param name="movie" value="zi.swf" />
      <param name="quality" value="high" />
      <embed src="zi.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="925" height="30"></embed>
    </object></noscript></td>
  </tr>
</table>-->
      <DIV style="TEXT-ALIGN: center; MARGIN-TOP: 10px" align="center">
      <IMG src="photoalbum_files/back.bmp" width=98% height=170>
      </DIV>
      
      
      
      
      
      
      
      
      
      
      
      
      </BODY></HTML>
