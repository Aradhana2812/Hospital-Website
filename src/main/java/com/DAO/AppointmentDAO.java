package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Appointment;
import com.entity.Doctor;

public class AppointmentDAO {
 private Connection conn;

public AppointmentDAO(Connection conn) {
	super();
	this.conn = conn;
}

public boolean addAppointment(Appointment ap) {
	boolean f=false;
	
	try {
		String sql="insert into appointment (user_id,fullname,gender,age,appoint_date,email,phno,diseases,doctor_id,address,status) values(?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, ap.getUserId());
		ps.setString(2, ap.getFullname());
		ps.setString(3, ap.getGender());
		ps.setString(4, ap.getAge());
		ps.setString(5, ap.getAppoinDate());
		ps.setString(6, ap.getEmail());
		ps.setString(7, ap.getPhNo() );
		ps.setString(8, ap.getDiseases());
		ps.setInt(9, ap.getDoctorId());
		ps.setString(10, ap.getAddress());
		ps.setString(11, ap.getStatus());
		int x=ps.executeUpdate();
		if(x==1) {
			f=true;
		}
		
		
	}catch(Exception e) {
		System.out.println(e);
	}
	return f;
}
public List <Appointment> getAllAppointment(){
	List<Appointment> list=new ArrayList<>();
	 Appointment d=null;
	 try {
		 String sql="select * from Appointment";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 
		ResultSet rs= ps.executeQuery();
		
		while(rs.next()) {
			d=new Appointment();
			d.setId(rs.getInt(1));
			d.setUserId(rs.getInt(2));
			d.setFullname(rs.getString(3));
			d.setGender(rs.getString(4));
			d.setAge(rs.getString(5));
			d.setAppoinDate(rs.getString(6));
			d.setEmail(rs.getString(7));
			d.setPhNo(rs.getString(8));
			d.setDiseases(rs.getString(9));	
			d.setDoctorId(rs.getInt(10));
			d.setAddress(rs.getString(11));	 
			d.setStatus(rs.getString(12));	 
			list.add(d);
		}	 
			 
			 
			 
			 
	 }catch(Exception e) {
		 System.out.println(e);
	 } 
	 return list;
}

//by user id
public List<Appointment> getAppointmentById(int id){
	List<Appointment> list=new ArrayList<>();
	 Appointment d=null;
	 try {
		 String sql="select * from Appointment where user_id=?";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 ps.setInt(1, id);
		 
		ResultSet rs= ps.executeQuery();
		
		while(rs.next()) {
						d=new Appointment();
						d.setId(rs.getInt(1));
						d.setUserId(rs.getInt(2));
						d.setFullname(rs.getString(3));
						d.setGender(rs.getString(4));
						d.setAge(rs.getString(5));
						d.setAppoinDate(rs.getString(6));
						d.setEmail(rs.getString(7));
						d.setPhNo(rs.getString(8));
						d.setDiseases(rs.getString(9));	
						d.setDoctorId(rs.getInt(10));
						d.setAddress(rs.getString(11));	 
						d.setStatus(rs.getString(12));	 
						list.add(d);
					}	 
						 
						 
						 
						 
				 }catch(Exception e) {
					 System.out.println(e);
				 }
	 return list;
				 
			}


//by doctor id
public List <Appointment> getAppointmentByDoctorId(int id){
	List<Appointment> list=new ArrayList<>();
	 Appointment d=null;
	 try {
		 String sql="select * from Appointment where doctor_id=?";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 ps.setInt(1, id);
		ResultSet rs= ps.executeQuery();
		
		while(rs.next()) {
			d=new Appointment();
			d.setId(rs.getInt(1));
			d.setUserId(rs.getInt(2));
			d.setFullname(rs.getString(3));
			d.setGender(rs.getString(4));
			d.setAge(rs.getString(5));
			d.setAppoinDate(rs.getString(6));
			d.setEmail(rs.getString(7));
			d.setPhNo(rs.getString(8));
			d.setDiseases(rs.getString(9));	
			d.setDoctorId(rs.getInt(10));
			d.setAddress(rs.getString(11));	 
			d.setStatus(rs.getString(12));	 
			list.add(d);
		}	 
			 
			 
			 
			 
	 }catch(Exception e) {
		 System.out.println(e);
	 } 
	 return list;
}


//by appointment id
public Appointment getAppointmentId(int id){

	 Appointment d=null;
	 try {
		 String sql="select * from Appointment where id=?";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 ps.setInt(1, id);
		 
		ResultSet rs= ps.executeQuery();
		
		while(rs.next()) {
						d=new Appointment();
						d.setId(rs.getInt(1));
						d.setUserId(rs.getInt(2));
						d.setFullname(rs.getString(3));
						d.setGender(rs.getString(4));
						d.setAge(rs.getString(5));
						d.setAppoinDate(rs.getString(6));
						d.setEmail(rs.getString(7));
						d.setPhNo(rs.getString(8));
						d.setDiseases(rs.getString(9));	
						d.setDoctorId(rs.getInt(10));
						d.setAddress(rs.getString(11));	 
						d.setStatus(rs.getString(12));	 
						
					}	 
						 
						 
						 
						 
				 }catch(Exception e) {
					 System.out.println(e);
				 }
	 return d;
				 
			}

public boolean updateStatus(String Status,int id){
	 
	 boolean f=false;
	 try {
		 String sql="update Appointment  set status=? where id=?";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 ps.setString(1, Status);
		 ps.setInt(2, id);
		 
		 
		int x= ps.executeUpdate();
		 if(x==1) {
			 f=true;
		 }
		 
	 }catch(Exception e ) {
		 System.out.println(e);
	 }
	 
	 return f;
}

public boolean updateAppointment(String status, int id, String name, String age, String date,String diseases) {
	boolean f=false;
	 try {
		 String sql="update Appointment  set status=?,fullname=? ,age=?  ,appoint_date=? ,diseases=? where id=?";
		 PreparedStatement ps=conn.prepareStatement(sql);
		 ps.setString(1, status);
		 ps.setString(2, name);
		 ps.setString(3, age);
		 ps.setString(4, date);
		 ps.setString(5, diseases);
		 ps.setInt(6, id);
		 
		 
		int x= ps.executeUpdate();
		 if(x==1) {
			 f=true;
		 }
		 
	 }catch(Exception e ) {
		 System.out.println(e);
	 }
	 
	 return f;
}
public boolean deleteAppointmentById(int id){
	 
	 boolean f=false;
	 try {
		 String sql="delete  from Appointment where id=?";
		 PreparedStatement ps=conn.prepareStatement(sql);

		 ps.setInt(1, id);
		 
		 
		int x= ps.executeUpdate();
		 if(x==1) {
			 f=true;
		 }
		 
	 }catch(Exception e ) {
		 System.out.println(e);
	 }
	 
	 return f;
}



}


