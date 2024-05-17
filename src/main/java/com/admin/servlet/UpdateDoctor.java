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
import com.entity.Doctor;
@WebServlet("/editDoctor")
public class UpdateDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fullname=req.getParameter("fullname");
		String DOB=req.getParameter("dob");
		String qualification=req.getParameter("qualification");
		String spec=req.getParameter("spec");
		String email=req.getParameter("email");
		String mobno=req.getParameter("mobno");
		String password=req.getParameter("password");
		int id=Integer.parseInt(req.getParameter("Id"));
		
		DoctorDAO dao=new DoctorDAO(DbConnect.getConn());
		boolean f=dao.updateDoctor(new Doctor(id,fullname,DOB,qualification,spec,email,mobno,password));
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("sucMsg","added successfully");
			resp.sendRedirect("admin/DoctorEdit.jsp");
		}else
		{
			session.setAttribute("faiMsg","Something Wrong");
			resp.sendRedirect("admin/DoctorEdit.jsp");
		}
	}

}
