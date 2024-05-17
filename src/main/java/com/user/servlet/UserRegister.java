package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.db.DbConnect;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName=req.getParameter("fullName");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			HttpSession session= req.getSession();
			
			User u=new User(fullName,email,password);
			UserDAO dao=new UserDAO(DbConnect.getConn());
			Boolean f=dao.userRegister(u);
			
			if(f) {
				session.setAttribute("sucMsg", "Register Success");
				resp.sendRedirect("user_login.jsp");
			}else
				session.setAttribute("faiMsg", "failed");
			resp.sendRedirect("signup.jsp");
			
			
			
			
			
		}catch(Exception e)
		{System.out.println(e);}
	}

}
