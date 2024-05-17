package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.AppointmentDAO;
import com.db.DbConnect;
@WebServlet("/appointmentEdit")
public class EditAppointment extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String Status=req.getParameter("status");
		String name=req.getParameter("fullname");
		String age=req.getParameter("age");
		String date=req.getParameter("appointdate");
		String diseases=req.getParameter("diseases");
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		AppointmentDAO dao=new AppointmentDAO(DbConnect.getConn());
		boolean f=dao.updateAppointment(Status,id,name,age,date,diseases);
		HttpSession session=req.getSession();
		if(f) {
			session.setAttribute("sucMsg","added successfully");
			resp.sendRedirect("admin/view_appointment.jsp");
		}else
		{
			session.setAttribute("faiMsg","Something Wrong");
			resp.sendRedirect("admin/view_appointment.jsp");
		}
	}
}
