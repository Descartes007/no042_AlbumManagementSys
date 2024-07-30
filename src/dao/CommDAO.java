package dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Info;

public class CommDAO {
	public static String dbname = "";
	public static String dbtype = "";

	Connection conn = null;

	public CommDAO() {
//		if(conn==null) {			
//			conn = this.getConn();
//		}
	}

	// 该方法返回一个table 用于流动图片
	public String DynamicImage(String categoryid, int cut, int width, int height) {

		StringBuffer imgStr = new StringBuffer();
		StringBuffer thePics1 = new StringBuffer();
		StringBuffer theLinks1 = new StringBuffer();
		StringBuffer theTexts1 = new StringBuffer();

		imgStr.append(
				"<div id=picViwer1  style='background-color: #ffffff' align=center></div><SCRIPT src='/fbasite/js/dynamicImage.js' type=text/javascript></SCRIPT>\n<script language=JavaScript>\n");
		thePics1.append("var thePics1=\n'");
		theLinks1.append("var theLinks1='");
		theTexts1.append("var theTexts1='");

		List<HashMap> co = this.select("select * from hbnews   order by id desc", 1, 6);
		int i = co.size();

		int j = 0;
		for (HashMap b : co) {
			j++;
			int id = Integer.parseInt(b.get("id").toString());
			String title = b.get("biaot").toString();

			String url = "/fbasite/upfile/" + b.get("filename");

			String purl = "/fbasite/newxiang.jsp?id=" + b.get("id");

			if (j != i) {
				thePics1.append(url.replaceAll("\n", "") + "|");
				theLinks1.append(purl + "|");
				theTexts1.append(title + "|");
			}
			if (j == i) {
				thePics1.append(url.replaceAll("\n", ""));
				theLinks1.append("xiang.jsp?id=" + b.get("id"));
				theTexts1.append(title);
			}

		}
		thePics1.append("';");

		theLinks1.append("';");
		theTexts1.append("';");
		imgStr.append(thePics1 + "\n");
		imgStr.append(theLinks1 + "\n");
		imgStr.append(theTexts1 + "\n");
		imgStr.append("\n setPic(thePics1,theLinks1,theTexts1," + width + "," + height + ",'picViwer1');</script>");
		return imgStr.toString();
	}

	private static Properties config = null;

	static {
		try {

			config = new Properties();
			// InputStream in = config.getClass().getResourceAsStream("dbconnection.properties");

			// InputStream in = CommDAO.class.getClassLoader().getResourceAsStream("dbconnection.properties");

			// config.load(in);
			// System.out.println(config.get("dburl"));
			// in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public HashMap getmap(String id, String table) {
		List<HashMap> list = new ArrayList();
		try {
			conn = this.getConn();
			Statement st = conn.createStatement();
			conn = this.getConn();
			System.out.println("select * from " + table + " where id=" + id);
			ResultSet rs = st.executeQuery("select * from " + table + " where id=" + id);
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				HashMap map = new HashMap();
				int i = rsmd.getColumnCount();
				for (int j = 1; j <= i; j++) {
					if (!rsmd.getColumnName(j).equals("ID")) {
						String str = rs.getString(j) == null ? "" : rs.getString(j);
						if (str.equals("null"))
							str = "";
						map.put(rsmd.getColumnName(j), str);
					} else
						map.put("id", rs.getString(j));
				}
				list.add(map);
			}
			rs.close();
			st.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list.get(0);
	}

	public String insert(HttpServletRequest request, HttpServletResponse response, String tablename, HashMap extmap,
			boolean alert, boolean reflush) {
		extmap.put("savetime", Info.getDateStr());
		if (request.getParameter("f") != null) {
			HashMap typemap = new HashMap();
			ArrayList<String> collist = new ArrayList();
			String sql = "insert into " + tablename + "(";

			Connection conn = this.getConn();
			try {
				conn = this.getConn();
				Statement st = conn.createStatement();
				conn = this.getConn();
				ResultSet rs = st.executeQuery("select * from " + tablename);
				ResultSetMetaData rsmd = rs.getMetaData();
				int i = rsmd.getColumnCount();

				for (int j = 1; j <= i; j++) {
					if (rsmd.getColumnName(j).equals("id"))
						continue;
					typemap.put(rsmd.getColumnName(j) + "---", rsmd.getColumnTypeName(j));
					collist.add(rsmd.getColumnName(j));
					sql += rsmd.getColumnName(j) + ",";
				}
				sql = sql.substring(0, sql.length() - 1);

				sql += ") values(";
				rs.close();
				st.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			Enumeration enumeration = request.getParameterNames();
			String names = ",";
			while (enumeration.hasMoreElements()) {
				names += enumeration.nextElement().toString() + ",";
			}
			try {
				conn = this.getConn();
				Statement st = conn.createStatement();
				conn = this.getConn();
				for (String str : collist) {
					if (names.indexOf("," + str + ",") > -1) {
						String[] values = request.getParameterValues(str);
						String value = "";
						for (String vstr : values) {
							if (vstr == null)
								vstr = "";
							if (vstr.equals("null"))
								vstr = "";
							if (vstr.trim().equals(""))
								continue;

							if (request.getParameter(vstr) != null && !"".equals(request.getParameter(vstr))
									&& request.getParameter("dk-" + str + "-value") != null) {
								String dkv = request.getParameter(vstr);
								String dknamevalue = request.getParameter("dk-" + str + "-value");
								vstr += " - " + dknamevalue + ":" + dkv;
							}

							value += vstr + " ~ ";

						}
						if (value == null)
							value = "";
						if (value.equals("null"))
							value = "";
						if (value.length() > 0)
							value = value.substring(0, value.length() - 3);

						if (typemap.get(str + "---").equals("int")) {
							sql += (value.equals("") ? -10 : value) + ",";
						} else {
							sql += "'" + (value.equals("null") ? "" : value) + "',";
						}
					} else {
						if (typemap.get(str + "---").equals("int")) {
							sql += (extmap.get(str) == null ? "" : extmap.get(str)) + ",";
						} else {
							sql += "'" + (extmap.get(str) == null ? "" : extmap.get(str)) + "',";
						}
					}
				}

				sql = sql.substring(0, sql.length() - 1) + ")";
				System.out.println(sql);
				this.commOper(sql);

				st.close();
				conn.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			String str = "";
			if (!reflush)
				str += "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"> \n";
			str += "<script language=javascript>\n";
			if (alert) {
				str += "alert('操作成功');\n";
			}
			if (reflush) {
				str += "parent.location=parent.location;\n";
			} else {
				str += "window.location=String(window.location).replace(new RegExp('f=f', 'g'), '');";
			}
			str += "</script>";

			PrintWriter wrt = null;
			try {
				wrt = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			wrt.write(str);
		}

		return "";
	}

	public void delete(HttpServletRequest request, String tablename) {
		int i = 0;
		try {
			String did = request.getParameter("did");
			if (did == null)
				did = request.getParameter("scid");
			if (did != null) {
				if (did.length() > 0) {
					conn = this.getConn();
					Statement st = conn.createStatement();
					conn = this.getConn();
					st.execute("delete from " + tablename + " where id=" + did);
					st.close();
					conn.close();
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getCols(String table) {
		String str = "";
		Connection conn = this.getConn();
		try {
			conn = this.getConn();
			Statement st = conn.createStatement();
			conn = this.getConn();
			ResultSet rs = st.executeQuery("select * from " + table);
			ResultSetMetaData rsmd = rs.getMetaData();

			int i = rsmd.getColumnCount();
			for (int j = 2; j <= i; j++) {
				str += rsmd.getColumnName(j) + ",";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		str = str.substring(0, str.length() - 1);

		return str;
	}

	public String update(HttpServletRequest request, HttpServletResponse response, String tablename, HashMap extmap,
			boolean alert, boolean reflush) {
		if (request.getParameter("f") != null) {
			Enumeration enumeration = request.getParameterNames();
			String names = ",";
			while (enumeration.hasMoreElements()) {
				names += enumeration.nextElement().toString() + ",";
			}
			HashMap typemap = new HashMap();
			ArrayList<String> collist = new ArrayList();
			String sql = "update " + tablename + " set ";
			Connection conn = this.getConn();
			try {
				conn = this.getConn();
				Statement st = conn.createStatement();
				conn = this.getConn();
				ResultSet rs = st.executeQuery("select * from " + tablename);
				ResultSetMetaData rsmd = rs.getMetaData();
				int i = rsmd.getColumnCount();
				System.out.println(i);
				for (int j = 1; j <= i; j++) {
					if (rsmd.getColumnName(j).equals("id"))
						continue;
					typemap.put(rsmd.getColumnName(j) + "---", rsmd.getColumnTypeName(j));
					collist.add(rsmd.getColumnName(j));
					if (names.indexOf("," + rsmd.getColumnName(j) + ",") > -1) {

						String[] values = request.getParameterValues(rsmd.getColumnName(j));
						String value = "";
						for (String vstr : values) {
							if (vstr == null)
								vstr = "";
							if (vstr.equals("null"))
								vstr = "";
							if (vstr.trim().equals(""))
								continue;

							if (request.getParameter(vstr) != null && !"".equals(request.getParameter(vstr))
									&& request.getParameter("dk-" + rsmd.getColumnName(j) + "-value") != null) {
								String dkv = request.getParameter(vstr);
								String dknamevalue = request.getParameter("dk-" + rsmd.getColumnName(j) + "-value");
								vstr += " - " + dknamevalue + ":" + dkv;
							}

							value += vstr + " ~ ";
						}
						if (value == null)
							value = "";
						if (value.equals("null"))
							value = "";
						if (value.length() > 0)
							value = value.substring(0, value.length() - 3);

						if (rsmd.getColumnTypeName(j).equals("int")) {
							sql += rsmd.getColumnName(j) + "=" + value + ",";
						} else {
							sql += rsmd.getColumnName(j) + "='" + value + "',";
						}
					} else {
						if (extmap.get(rsmd.getColumnName(j)) != null) {
							if (rsmd.getColumnTypeName(j).equals("int")) {
								sql += rsmd.getColumnName(j) + "=" + extmap.get(rsmd.getColumnName(j)) + ",";
							} else {
								sql += rsmd.getColumnName(j) + "='" + extmap.get(rsmd.getColumnName(j)) + "',";
							}
						}
					}
				}
				sql = sql.substring(0, sql.length() - 1);
				sql += " where id=" + request.getParameter("id");
				System.out.println(sql);
				Statement st1 = conn.createStatement();
				st1.execute(sql);
				st1.close();
				rs.close();
				st.close();
				conn.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			String str = "";
			if (!reflush)
				str += "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n";
			str += "<script language=javascript>\n";
			if (alert) {
				str += "alert('操作成功');\n";
			}
			if (reflush) {
				str += "parent.location=parent.location;\n";
			} else {
				str += "window.location=String(window.location).replace(new RegExp('f=f', 'g'), '');";
			}

			str += "</script>\n";

			PrintWriter wrt = null;
			try {
				// request.get
				wrt = response.getWriter();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			wrt.write(str);
		}
		return "";
	}

	public Connection getConn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/photoalbum?useUnicode=true&characterEncoding=utf8", "root", "root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	public int getInt(String sql) {
		int i = 0;
		try {
			conn = this.getConn();
			Statement st = conn.createStatement();
			conn = this.getConn();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				i = rs.getInt(1);
			}
			st.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public double getDouble(String sql) {
		double i = 0;
		try {
			conn = this.getConn();
			Statement st = conn.createStatement();
			conn = this.getConn();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				i = rs.getDouble(1);

			}
			st.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public void commOper(String sql) {
		try {
			conn = this.getConn();
			Statement st = conn.createStatement();
			conn = this.getConn();
			st.execute(sql);
			st.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void commOperSqls(ArrayList<String> sql) {
		try {
			conn.setAutoCommit(false);
			for (int i = 0; i < sql.size(); i++) {
				conn = this.getConn();
				Statement st = conn.createStatement();
				conn = this.getConn();
				System.out.println(sql.get(i));
				st.execute(sql.get(i));
				st.close();
				conn.close();
			}
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public List<HashMap> select(String sql) {
		System.out.println(sql);
		List<HashMap> list = new ArrayList();
		try {
			conn = this.getConn();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				HashMap map = new HashMap();
				int i = rsmd.getColumnCount();
				System.out.println("-------:" + i);
				for (int j = 1; j <= i; j++) {
					if (!rsmd.getColumnName(j).equals("ID")) {
						String str = rs.getString(j) == null ? "" : rs.getString(j);
						if (str.equals("null"))
							str = "";
						map.put(rsmd.getColumnName(j), str);
					} else
						map.put("id", rs.getString(j));
				}
				list.add(map);
			}
			rs.close();
			st.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block

			if (sql.equals("show tables"))
				list = select("select table_name from   INFORMATION_SCHEMA.tables");
			else
				e.printStackTrace();
		}
		return list;
	}

	public List<List> selectforlist(String sql) {
		List<List> list = new ArrayList();
		try {
			conn = this.getConn();
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();

			while (rs.next()) {
				List<String> list2 = new ArrayList();
				int i = rsmd.getColumnCount();
				for (int j = 1; j <= i; j++) {
					if (!rsmd.getColumnName(j).equals("ID")) {
						String str = rs.getString(j) == null ? "" : rs.getString(j);
						if (str.equals("null"))
							str = "";
						list2.add(str);
					} else
						list2.add(rs.getString(j));
				}
				list.add(list2);
			}
			rs.close();
			st.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 执行一条查询sql,以 List<hashmap> 的形式返回查询的记录，记录条数，和从第几条开始，由参数决定，主要用于翻页
	 * pageno 页码 rowsize 每页的条数
	 */
	public List<HashMap> select(String sql, int pageno, int rowsize) {
		List<HashMap> list = new ArrayList<HashMap>();
		List<HashMap> mlist = new ArrayList<HashMap>();
		try {
			list = this.select(sql);
			int min = (pageno - 1) * rowsize;
			int max = pageno * rowsize;

			for (int i = 0; i < list.size(); i++) {

				if (!(i < min || i > (max - 1))) {
					mlist.add(list.get(i));
				}
			}
		} catch (RuntimeException re) {
			re.printStackTrace();
			throw re;
		}

		return mlist;
	}

	public static void main(String[] args) {
	}
}
