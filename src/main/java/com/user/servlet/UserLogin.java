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
@WebServlet("/userLogin")
public class UserLogin extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		UserDAO ud=new UserDAO(DbConnect.getConn());
		 User user=ud.Login(email,password);
		 HttpSession session=req.getSession();
		 
		 if(user!=null) {
			 session.setAttribute("UserObj",user);
				resp.sendRedirect("index.jsp");
			}else
			{
				session.setAttribute("faiMsg","Invalid email or password");
				resp.sendRedirect("user_login.jsp");
			
		 }
		 
		 
		
	}

}
