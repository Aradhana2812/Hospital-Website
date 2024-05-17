package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAO {
	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public boolean userRegister(User u) {
		 boolean f=false;
		 
		 try {
			 
			 String sql="insert into user_dtls(fullName,password,email) values(?,?,?)";
			 PreparedStatement ps=conn.prepareStatement(sql);
			 ps.setString(1, u.getName());
			 ps.setString(2, u.getPassword());
			 ps.setString(3, u.getEmail());
			 
			int i= ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		 }catch(Exception e)
		 {System.out.println(e);}
		 
		 
		 
		 return f;
	}
	
	public User Login(String em,String psw) {
		User u=null;
		try {
			String sql="select * from user_dtls where  password=? && email=? ";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, psw);
			ps.setString(2, em);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setEmail(rs.getString(4));
			}
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return u;
	}
	

}
