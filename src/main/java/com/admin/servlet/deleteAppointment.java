package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AppointmentDAO;
import com.DAO.DoctorDAO;
import com.db.DbConnect;
@WebServlet("/deleteAppointment")
public class deleteAppointment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		
		AppointmentDAO dao=new AppointmentDAO(DbConnect.getConn());
		boolean f=dao.deleteAppointmentById(id);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("sucMsg","deleted successfully");
			resp.sendRedirect("admin/view_appointment.jsp");
		}else
		{
			session.setAttribute("faiMsg","Something Wrong");
			resp.sendRedirect("admin/view_appointment.jsp");
		}
	}
	}


