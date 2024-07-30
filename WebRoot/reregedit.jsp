<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>
<%@page import="util.PageManager"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0028)http://csir461.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>电子相册管理系统</TITLE>
<LINK rel=stylesheet type=text/css 
href="photoalbum_files/css1.css">


<STYLE type=text/css>
.STYLE1 {
	COLOR: #d77745
}
</STYLE>

<META name=GENERATOR content="MSHTML 8.00.6001.19222"></HEAD>
<BODY>
<%
 CommDAO dao = new CommDAO();
 HashMap umap = Info.getMUser(request);
  umap = dao.getmap(umap.get("id").toString(),"members");
 %>
  <form action="/photoalbum/photoalbum?ac=reregedit" name="f1" method="post">
<TABLE border=0 cellSpacing=0 cellPadding=0 
                          width="96%"><TBODY>
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
                                <TD width="25%" height=30 
                                align=center vAlign=center class=xh>用户名                                </TD>
                                <TD width="55%" height="30" 
                                align=left vAlign=center class=xh><label>
                                  <input type="text" name="uname" id="uname" readonly="readonly">
                                </label></TD>
                                <TD width="22%" rowspan="3" 
                                align=center vAlign=center class=xh><%=Info.getImgUpInfo(80) %></TD>
                                </TR>
                                
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>密码                                </TD>
                                <TD height=30 
                                align=left vAlign=center class=xh><input type="text" name="upass" id="upass"></TD>
                                 </TR>
                                
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>姓名                                </TD>
                                <TD height=30 
                                align=left vAlign=center class=xh><input type="text" name="tname" id="tname"></TD>
                                 </TR>
                                
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>性别                                </TD>
                                <TD height=30 colspan="2" 
                                align=left vAlign=center class=xh><label>
                                  <input name="sex" type="radio" id="radio" value="男" checked>
                                男</label>
                                  <input type="radio" name="sex" id="radio2" value="女">
                                  女</TD>
                                 </TR>
                                
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>联系方式                                </TD>
                                <TD height=30 colspan="2" 
                                align=left vAlign=center class=xh><input type="text" name="linkphone" id="linkphone"></TD>
                                 </TR>
                                
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>身份证号                                </TD>
                                <TD height=30 colspan="2" 
                                align=left vAlign=center class=xh><input name="sfid" type="text" id="sfid" size="30"></TD>
                                 </TR>
                                 
                                  <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>地址                                </TD>
                                <TD height=30 colspan="2" 
                                align=left vAlign=center class=xh><input name="addrs" type="text" id="addrs" size="40"></TD>
                                 </TR>
                                 
                                   <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>公开个人信息                             </TD>
                                <TD height=30 colspan="2" 
                                align=left vAlign=center class=xh><label>
                                  <input name="ispub" type="radio" id="radio3" value="否" checked> 
                                  否
</label>
                                  <input type="radio" name="ispub" id="radio4" value="是">
                                  是</TD>
                                 </TR>
                                
                                
                                  <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>个性签名</TD>
                                <TD height=30 colspan="2" 
                                align=left vAlign=center class=xh><input name="gxqm" type="text" id="gxqm" size="50"></TD>
                                 </TR>
                                 
                                 
                                 <TR>
                                <TD height=30 
                                align=center vAlign=center class=xh>自我介绍</TD>
                                <TD height=30 colspan="2" 
                                align=left vAlign=center class=xh><textarea name="jbs" style="margin-top: 2px;margin-bottom: 2px" type="text" id="jbs" rows="2" cols="40" ></textarea></TD>
                                 </TR>
                                 
                                
                                
                                 <TR>
                                <TD height=38 colspan="3" 
                                align=center vAlign=center class=xh><label>
                                  <input type="submit" name="button" id="button" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;
                                  <input type="reset" name="button2" id="button2" value="重置">
                                </label></TD></TR>
                                      </TBODY>
                                  </TABLE></TD>
                                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></form>

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
alert("修改成功");
parent.location=parent.location;
<%}%>
</script>
<%=Info.tform(umap)%>