package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.DoctorDAO;
import com.db.DbConnect;

@WebServlet("/deleteDoctor")
public class deleteDoctor extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
		int id=Integer.parseInt(req.getParameter("Id"));
		
		
		DoctorDAO dao=new DoctorDAO(DbConnect.getConn());
		boolean f=dao.deleteDoctorById(id);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("sucMsg","deleted successfully");
			resp.sendRedirect("admin/DoctorEdit.jsp");
		}else
		{
			session.setAttribute("faiMsg","Something Wrong");
			resp.sendRedirect("admin/DoctorEdit.jsp");
		}
	}
	}


