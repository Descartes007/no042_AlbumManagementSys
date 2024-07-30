<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.Info"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0028)http://csir461.com/index.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>电子相册管理系统</TITLE>
<LINK rel=stylesheet type=text/css href="photoalbum_files/css.css">


<STYLE type=text/css>
.STYLE1 {
	COLOR: #d77745
}
</STYLE>

<META name=GENERATOR content="MSHTML 8.00.6001.19222">
</HEAD>
<BODY>


	<LINK rel=stylesheet type=text/css href="photoalbum_files/css.css">
	<STYLE type=text/css>
BODY {
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



	<TABLE class=bk border=0 cellSpacing=0 cellPadding=0 width=950
		align=center>
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
																	<TABLE border=0 cellSpacing=0 cellPadding=0 width="96%">
																		<TBODY>
																			<TR>
																				<TD>
																					<TABLE border=0 cellSpacing=0 cellPadding=0
																						width="100%" align=left>
																						<TBODY>
																							<TR>
																								<TD height=24
																									background=photoalbum_files/112bg.gif width=320
																									align=left>
																									<TABLE border=0 cellSpacing=0 cellPadding=0
																										width=200 align=left>
																										<TBODY>
																											<TR>
																												<TD width=8 align=left>&nbsp;</TD>
																												<TD class=ls height=24 vAlign=bottom
																													width=174 align=left><STRONG>网站简介</STRONG></TD>
																											</TR>
																										</TBODY>
																									</TABLE>
																								</TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																				</TD>
																			</TR>
																			<TR>
																				<TD>
																					<TABLE class=mt border=0 cellSpacing=0
																						cellPadding=0 width="100%">
																						<TBODY>
																							<TR>
																								<TD align=left vAlign=top><SPAN class=ls>


																										<%
																											CommDAO dao = new CommDAO();
																											HashMap jjmap = dao.select("select * from mixinfo where infotype='网站简介'").get(0);
																											out.print(jjmap.get("content").toString());
																										%>



																								</SPAN>
																									<TABLE border=0 cellSpacing=0 cellPadding=0
																										width="100%">
																										<TBODY>
																											<TR>
																												<TD></TD>
																											</TR>
																										</TBODY>
																									</TABLE></TD>
																							</TR>
																						</TBODY>
																					</TABLE>
																				</TD>
																			</TR>
																		</TBODY>
																	</TABLE>
																</TD>
															</TR>
														</TBODY>
													</TABLE>
												</TD>





												<jsp:include page="left.jsp"></jsp:include>






											</TR>
										</TBODY>
									</TABLE>
								</TD>
							</TR>
						</TBODY>
					</TABLE>
					<TABLE border=0 cellSpacing=0 cellPadding=0 width=950>
						<TBODY>
							<TR>
								<TD>&nbsp;</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>




	<jsp:include page="foot.jsp"></jsp:include>



</BODY>
</HTML>
