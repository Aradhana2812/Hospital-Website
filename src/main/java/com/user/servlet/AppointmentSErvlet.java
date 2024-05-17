package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AppointmentDAO;
import com.db.DbConnect;
import com.entity.Appointment;
@WebServlet("/appointment")
public class AppointmentSErvlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userid=Integer.parseInt(req.getParameter("userid"));
		String fullname=req.getParameter("fullname");
		String gender=req.getParameter("gender");
		String age =req.getParameter("age");
		String appoint_date =req.getParameter("appointment");
		String email=req.getParameter("email");
		String phno=req.getParameter("mobno");
		String diseases=req.getParameter("dieseases");
		int doct_id=Integer.parseInt(req.getParameter("doct"));
		String address=req.getParameter("address");
		
		Appointment ap=new Appointment(userid,fullname,gender,age,appoint_date,email,phno,diseases,doct_id,address,"pending");
		AppointmentDAO dao=new AppointmentDAO(DbConnect.getConn());
		boolean f=dao.addAppointment(ap);
	    HttpSession session=req.getSession();
		 
	
			if(f) {
				session.setAttribute("sucMsg","added successfully");
				resp.sendRedirect("user_Appointment.jsp");
			}else
				session.setAttribute("faiMsg", "failed");
			resp.sendRedirect("user_login.jsp");
			
		}
		
	}


