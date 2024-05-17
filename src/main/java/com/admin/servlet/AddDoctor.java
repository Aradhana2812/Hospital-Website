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
@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullname =req.getParameter("fullname");
			String dob=req.getParameter("dob");
			String qualification=req.getParameter("qualification");
			String spec=req.getParameter("spec");
			String email=req.getParameter("email");
			String mobno=req.getParameter("mobno");
			String password=req.getParameter("password");
			
			DoctorDAO dao=new DoctorDAO(DbConnect.getConn());
			Doctor d=new Doctor(fullname,dob,qualification,spec,email,mobno,password);
			boolean f=dao.registerDoctor(d);
			HttpSession session=req.getSession();
			
			
			if(f) {
				session.setAttribute("sucMsg", "Successfully added");
				resp.sendRedirect("admin/doctor.jsp");
			}else {

				session.setAttribute("faiMsg","Invalid email or password");
				resp.sendRedirect("admin/doctor.jsp");
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}

}
