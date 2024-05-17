package com.Doctor.servlet;

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
import com.entity.User;
@WebServlet("/doctorLogin")
public class LoginDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			HttpSession session= req.getSession();
			DoctorDAO dao=new DoctorDAO(DbConnect.getConn());
			Doctor doctor=dao.doctorLogin(email, password);
			
			if(doctor!=null) {
				session.setAttribute("doctObj", doctor);
				resp.sendRedirect("Doctor/index.jsp");
			}else
			{
				session.setAttribute("faiMsg","Invalid email or password");
				resp.sendRedirect("doctor_login.jsp");
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	}


