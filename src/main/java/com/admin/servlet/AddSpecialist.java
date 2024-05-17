package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.SpecialistDAO;
import com.db.DbConnect;
import com.entity.User;
@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName=req.getParameter("specName");
		
		SpecialistDAO dao=new SpecialistDAO(DbConnect.getConn());
		boolean f=dao.addSpecialist(specName);
		HttpSession session= req.getSession();
		
		
		if(f) {
		session.setAttribute("sucMsg","added successfully");
		resp.sendRedirect("admin/index.jsp");
	}else
	{
		session.setAttribute("faiMsg","Something Wrong");
		resp.sendRedirect("admin_login.jsp");
	}
		
	}
	

}
