package com.Doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AppointmentDAO;
import com.db.DbConnect;

@WebServlet("/appointmentStatus")
public class StatusServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String Status=req.getParameter("status");
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		AppointmentDAO dao=new AppointmentDAO(DbConnect.getConn());
		boolean f=dao.updateStatus(Status,id);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("sucMsg","added successfully");
			resp.sendRedirect("Doctor/Patient.jsp");
		}else
		{
			session.setAttribute("faiMsg","Something Wrong");
			resp.sendRedirect("Doctor/Patient.jsp");
		}
	}
	}


