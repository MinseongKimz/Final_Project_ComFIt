<%@page import="com.sun.mail.iap.Response"%>
<%@page import="org.springframework.web.bind.annotation.ResponseBody"%>
<%@page import="com.test.mybatis.deliveryInsertDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* Write_ok.jsp */
	
	//System.out.println("jsp");
	
	// ① 주요 속성값들 준비 (multipart request 를 위한 속성값 준비)
	String root = "/";
	root = pageContext.getServletContext().getRealPath(root);
	
	String savePath = "C:\\Final_Project_ComFIt\\comfit\\WebContent\\images";
	//System.out.println(savePath);
	
	// 			                           "\\"
	
	
	
	//out.println(savePath + "<br>");
	String encType = "UTF-8";
	int maxFileSize = 5*1024*1024;
	
	
	// ② 경로상 디렉터리가 존재하지 않으면.. 만든다.
	File dir = new File(savePath);
	if (!dir.exists())
		dir.mkdirs();
	
	// ③ MultipartRequest 구성
	MultipartRequest req = null;
	
	try
	{
		// request, 파일저장경로, 파일최대크기, 인코딩방식, 중복파일명처리정책
		req = new MultipartRequest(request, savePath, maxFileSize
				                 , encType, new DefaultFileRenamePolicy());
		
		// ④ 구성된 MultipartRequest 로 부터 필요한 값 얻어내기
		String pd_title = req.getParameter("pd_title"); //
		String pd_name = req.getParameter("pd_name"); //
		String pd_as_remain = req.getParameter("pd_as_remain"); //
		String pd_hope_sdate = req.getParameter("pd_hope_sdate");
		String pd_hope_edate = req.getParameter("pd_hope_edate");
		String pd_hope_stime = req.getParameter("pd_hope_stime");
		String pd_hope_etime = req.getParameter("pd_hope_etime");
		String pd_hope_place = req.getParameter("pd_hope_place");
		String pd_maker_id = req.getParameter("pd_maker_id"); //
		String pd_hopeprice = req.getParameter("pd_hopeprice"); //
		String pd_as_id = req.getParameter("pd_as_id"); //
		String cf_price = req.getParameter("cf_price"); //
		String comments = req.getParameter("comments"); //
		String pd_hope_mgrs = req.getParameter("pd_hope_mgrs"); 
		String pd_photo = req.getFilesystemName("uploadFile");

		
		
		request.setAttribute("pd_title", pd_title);
		request.setAttribute("pd_name", pd_name);
		request.setAttribute("pd_as_remain", pd_as_remain);
		request.setAttribute("pd_hope_sdate", pd_hope_sdate);
		request.setAttribute("pd_hope_edate", pd_hope_edate);
		request.setAttribute("pd_hope_stime", pd_hope_stime);
		request.setAttribute("pd_hope_etime", pd_hope_etime);
		request.setAttribute("pd_hope_place", pd_hope_place);
		request.setAttribute("pd_maker_id", pd_maker_id);
		request.setAttribute("pd_as_id", pd_as_id);
		request.setAttribute("cf_price", cf_price);
		request.setAttribute("comments", comments);
		request.setAttribute("pd_hope_mgrs", pd_hope_mgrs);
		request.setAttribute("pd_photo", pd_photo);
		request.setAttribute("pd_hopeprice", pd_hopeprice);
		
		
		//response.sendRedirect("deliveryinsert.action");
		
		RequestDispatcher dis = request.getRequestDispatcher("directinsert.action");
		dis.forward(request, response);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
		
%>