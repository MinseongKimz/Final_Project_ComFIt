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
		String u_id = req.getParameter("u_id");
		String u_profile = req.getFilesystemName("uploadFile");
		System.out.println(u_id);
		System.out.println(u_profile);
			
		
		request.setAttribute("u_profile", u_profile); 
		request.setAttribute("u_id", u_id);
		//response.sendRedirect("deliveryinsert.action");
		
		RequestDispatcher dis = request.getRequestDispatcher("changeprofile.action");
		dis.forward(request, response);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>