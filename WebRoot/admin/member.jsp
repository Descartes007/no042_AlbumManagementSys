
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.PageManager"%>
<%@page import="dao.CommDAO"%>
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
<link href="/photoalbum/admin/global.css" rel="stylesheet"
	type="text/css" />
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
	String suc = (String) request.getAttribute("suc");
	if (suc != null) {
%>
<script language=javascript>
 alert("操作成功");
 </script>
<%
	}
%>
</head>

<body>

	<form action="/photoalbum/admin/member.jsp?f=f" name="f1" method="post">

		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			bgcolor="#FFFFFF" class="main_table_frame">
			<tr>
				<td height="97">




					<table width="100%" border="0" cellpadding="0" cellspacing="0"
						bgcolor="#F7F7F7" class="main_desk_table">
						<tr>
							<td width="8%" height="6"></td>
						</tr>
						<tr>
							<td><table width="100%" border="0" cellpadding="0"
									cellspacing="0" bgcolor="#F7F7F7">
									<tr>
										<td width="118" class="main_title_td_center">相关信息</td>
										<td align="right" class="main_title_td_bg">&nbsp;</td>

									</tr>
								</table>
								<table width="100%" border="0" cellspacing="0" rules="all"
									style="WIDTH: 100%; BORDER-COLLAPSE: collapse">
									<tr
										onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'"
										onmouseout="this.style.backgroundColor=currentcolor">
										<td width="235" align="center" class="main_matter_td">关键字</td>
										<td width="1012" align="left" class="main_matter_td"><input
											name="key" type="text" class="textBox" size="35" /></td>
									</tr>


									<tr
										onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'"
										onmouseout="this.style.backgroundColor=currentcolor">
										<td height="33" colspan="4" align="center"
											class="main_matter_td"><input type="button"
											onclick="f1.submit();" name="Submit" value="查询顾客名字" /> <script
												language=javascript>
			       function addcl()
			       {
			       pop("/photoalbum/admin/addcl.jsp","添加订单",500,287);
			       }
			       </script> &nbsp;&nbsp;&nbsp; <input type="button" onclick="add();"
											name="Submit2" value="添加顾客名字" /></td>
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
					<table width="100%" border="0" cellspacing="0"
						style="WIDTH: 100%; BORDER-COLLAPSE: collapse">
						<tr
							onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'"
							onmouseout="this.style.backgroundColor=currentcolor">
							<td width="147" align="center" class="main_title_td_center2">用户名</td>
							<td width="137" align="center" class="main_title_td_center2">密码</td>
							<td width="135" align="center" class="main_title_td_center2">性别</td>
							<td width="135" align="center" class="main_title_td_center2">联系方式</td>
							<td width="125" align="center" class="main_title_td_center2">身份证号</td>
							<td width="217" align="center" class="main_title_td_center2">地址</td>
							<td width="103" align="center" class="main_title_td_center2">级别</td>
							<td width="75" align="center" class="main_title_td_center2">积分</td>
							<td width="76" align="center" class="main_title_td_center2">修改</td>
							<td width="81" align="center" class="main_title_td_center2">删除</td>
						</tr>


						<%
							CommDAO dao = new CommDAO();
							String f = request.getParameter("f");
							String key = request.getParameter("key");
							if (key == null)
								key = "";
							if (f == null)
								key = Info.getUTFStr(key);
							String did = request.getParameter("did");
							if (did != null) {
								dao.commOper("delete from members where id=" + did);
							}
							String url = "/photoalbum/admin/member.jsp?1=1";
							String sql = "select * from members where upass is not null ";

							if (!key.equals("")) {
								url += "&key=" + key;
								sql += " and (uname like'%" + key + "%' or sex like'%" + key + "%' or linkphone like'%" + key
										+ "%' or sfid like'%" + key + "%' or addrs like'%" + key + "%' ) ";
							}

							sql += " order by id desc ";

							PageManager pageManager = PageManager.getPage(url, 10, request);
							pageManager.doList(sql);

							PageManager bean = (PageManager) request.getAttribute("page");
							ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
							for (HashMap m : nlist) {
						%>


						<tr
							onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'"
							onmouseout="this.style.backgroundColor=currentcolor">
							<td width="147" align="center" valign="middle"
								class="main_matter_td"><%=m.get("uname")%></td>
							<td width="137" align="center" valign="middle"
								class="main_matter_td"><%=m.get("upass")%></td>
							<td width="135" align="center" valign="middle"
								class="main_matter_td"><%=m.get("sex")%></td>
							<td width="135" align="center" valign="middle"
								class="main_matter_td"><%=m.get("linkphone")%></td>
							<td align="center" valign="middle" class="main_matter_td"><%=m.get("sfid")%></td>
							<td align="center" valign="middle" class="main_matter_td"><%=m.get("addrs")%></td>
							<%-- <td align="center" valign="middle" class="main_matter_td"><%=level%></td> --%>
							<td align="center" valign="middle" class="main_matter_td">2</td>
							<%-- <td align="center" valign="middle" class="main_matter_td"><%=jifen%></td> --%>
							<td align="center" valign="middle" class="main_matter_td">8</td>
							<td align="center" valign="middle" class="main_matter_td"><a
								href="javascript:update('<%=m.get("id")%>')">修改</a></td>
							<td width="81" align="center" class="main_matter_td"><a
								href="/photoalbum/admin/member.jsp?did=<%=m.get("id")%>">删除</a></td>
						</tr>
						<%
							}
						%>

						<script language=javascript>
                 function add() 
                 {
                  pop("/photoalbum/admin/addmember.jsp","添加顾客名字",500,212);
                 }
                 
                 function update(no) 
                 {
                  pop("/photoalbum/admin/updatemember.jsp?id="+no,"修改顾客名字",500,212);
                 }
                 </script>


						<tr
							onmouseover="currentcolor=this.style.backgroundColor;this.style.backgroundColor='#f0f7ff'"
							onmouseout="this.style.backgroundColor=currentcolor">
							<td height="30" colspan="10" align="center" valign="middle"
								class="main_matter_td"><label></label>${page.info }</td>
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
	dao.close();
%>


