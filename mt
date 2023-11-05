Labsheet 1-b

import java.io.*;
import java.util.*;
class Student {
	int rollno;
	String name;
	float fees;
	String branch;
	int year;
	int sem;
	int age;
    static String clg;
public Student(int rollno,String name,float fees,String branch,int year,int sem,int age) {
    	this.rollno = rollno;
    	this.name = name;
    	this.fees = fees;
    	this.branch = branch;
    	this.year = year;
    	this.sem = sem;
    	this.age = age;
    	clg="PU";
    }
    @Override
    public String toString() {
    	return rollno + " "+ name + " " + fees + " " + branch + " " + year + sem + " " + age + " " + clg + "\n";
    }
}
class AgeComparator implements Comparator { 
	public int compare(Object o1, Object o2) { 
		Student s1=(Student)o1; 
		Student s2=(Student)o2; 
		if(s1.age==s2.age) 
			return 0; 
		else if(s1.age>s2.age) 
			return 1; 
		else
			return -1; 
	} 
} 
class NameComparator implements Comparator{
	public int compare(Object o1, Object o2) { 
		Student s1=(Student)o1; 
		Student s2=(Student)o2; 
		return	s1.name.compareTo(s2.name); 
} 
} 
class FeesComparator implements Comparator { 
	public int compare(Object o1,Object o2) { 
		Student s1=(Student)o1; 
		Student s2=(Student)o2; 
		if(s1.fees==s2.fees) 
			return 0; 
		else if(s1.fees>s2.fees) 
			return 1; 
		else
			return -1; 
	} 
} 

public class Temp1 {
                   public static void main(String[] args) {
		// TODO Auto-generated method stub
		ArrayList sl=new ArrayList(); 
		sl.add(new Student(1,"Shiva",10000.00f,"cse",1,1,18)); 
		sl.add(new Student(2,"Venky",15000.00f,"ise",1,2,20)); 
		sl.add(new Student(3,"Jesus",17000.00f,"ece",1,1,19)); 
		sl.add(new Student(3,"Alla",12000.00f,"eee",1,1,19)); 
		sl.add(new Student(3,"Budha",11000.00f,"mech",1,1,21));
		System.out.println("Sorting by Name"); 
		System.out.println("_______________"); 
		Collections.sort(sl,new NameComparator()); 
		Iterator itr=sl.iterator(); 
		while(itr.hasNext()){ 
			Student st=(Student)itr.next(); 
			System.out.println(st.rollno+" "+st.name+" "+ st.fees+ " " + st.branch+ " " + st.year + " " + st.sem + " " + st.age + " " + Student.clg); 
		} 
		System.out.println("Sorting by age"); 
		System.out.println("______________"); 
		Collections.sort(sl,new AgeComparator()); 
		Iterator itr2=sl.iterator(); 
		while(itr2.hasNext()){ 
			Student st=(Student)itr2.next(); 
		System.out.println(st.rollno+" "+st.name+" "+ st.fees+ " " + st.branch+ " " + st.year + " " + st.sem + " " + st.age + " " + Student.clg); 
		} 
		System.out.println("Sorting by fees"); 
		System.out.println("______________"); 
		Collections.sort(sl,new FeesComparator()); 
		Iterator itr1=sl.iterator(); 
		while(itr1.hasNext()){ 
			Student st=(Student)itr1.next(); 
		System.out.println(st.rollno+" "+st.name+" "+ st.fees+ " " + st.branch+ " " + st.year + " " + st.sem + " " + st.age + " " + Student.clg); 

	}
	}
}
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

labsheet 3 - servlet

Problem statement : Servlet with database
Insert.html
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form action="./InsertData" method="post">
<table> 
<tr><td>Enter Roll No:</td> 
<td><input type="text" name="rollno"/></td>
</tr>
<tr><td>Enter Name:</td> 
<td><input type="text" name="name"/></td>
</tr>
<tr><td>Enter Section:</td> 
<td><select name="section"> 
<option>A</option> 
<option>B</option> 
<option>C</option> 
<option>D</option>
</select> 
</td>
</tr>
<tr><td>Enter Subjet1 Mark:</td> 
<td><input type="text" name="sub1"/></td>
</tr>
<tr><td>Enter Subject2 Mark:</td> 
<td><input type="text" name="sub2"/></td>
</tr>
<tr><td>Enter Subjet3 Mark:</td> 
<td><input type="text" name="sub3"/></td>
</tr> 
<tr><td>Enter Subject4 Mark:</td> 
<td><input type="text" name="sub4"/></td>
</tr>
<tr><td>Enter Subject5 Mark:</td> 
<td><input type="text" name="sub5"/></td>
</tr>
<tr><td>Enter Subject6 Mark:</td> 
<td><input type="text" name="sub6"/></td>
</tr>
<tr><td>Enter Lab1 Mark:</td> 
<td><input type="text" name="lab1"/></td>
</tr>
<tr><td>Enter Lab2 Mark:</td> 
<td><input type="text" name="lab2"/></td>
</tr>
<tr><td><input type="submit"/></td></tr>
</table>
</form>
</body>
</html>

InsertData.java
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
try{ 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/god?characterEncoding=latin1","root","admin123"); 
PreparedStatement st = con.prepareStatement("insert into mark values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
st.setInt(1, Integer.valueOf(request.getParameter("rollno")));
st.setString(2, request.getParameter("name"));
st.setString(3, request.getParameter("section"));
st.setInt(4, Integer.valueOf(request.getParameter("sub1")));
st.setInt(5, Integer.valueOf(request.getParameter("sub2")));
st.setInt(6, Integer.valueOf(request.getParameter("sub3")));
st.setInt(7, Integer.valueOf(request.getParameter("sub4")));
st.setInt(8, Integer.valueOf(request.getParameter("sub5")));
st.setInt(9, Integer.valueOf(request.getParameter("sub6")));
st.setInt(10, Integer.valueOf(request.getParameter("lab1")));
st.setInt(11, Integer.valueOf(request.getParameter("lab2")));
st.executeUpdate();
st.close();
con.close(); 
PrintWriter out = response.getWriter();
out.println("<html><body><b>Successfully Inserted"
+ "</b></body></html>");
}catch(Exception e){ System.out.println(e);} 
}
}

Search.html
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="./DispData"> 
Enter your Roll No:<input type="text" name="rollno"/><br/> 
<input type="submit" value="search"/> 
</form> 
</body>
</html>

DispData.java
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
response.setContentType("text/html"); 
PrintWriter out = response.getWriter(); 
try{ 
String rno=request.getParameter("rollno"); 
int rn=Integer.valueOf(rno); 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/god?characterEncoding=latin1","root","admin123"); 
PreparedStatement ps=con.prepareStatement("select * from mark where rollno=?"); 
ps.setInt(1,rn); 
out.print("<table width=50% border=1>"); 
out.print("<caption>Result:</caption>"); 
ResultSet rs=ps.executeQuery(); 
/* Printing column names */ 
ResultSetMetaData rsmd=rs.getMetaData(); 
int total=rsmd.getColumnCount(); 
out.print("<tr>"); 
for(int i=1;i<=total;i++) 
{ 
out.print("<th>"+rsmd.getColumnName(i)+"</th>"); 
} 
out.print("<th>Status</th></tr>"); 
/* Printing result */ 
while(rs.next()) 
{ 
out.print("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+ "</td><td>"+rs.getString(3)+ rs.getInt(4)+"</td><td>" + rs.getInt(5)+"</td><td>" + rs.getInt(6)+"</td><td>"+ rs.getInt(7)+"</td><td>" + rs.getInt(8)+"</td><td>"+ rs.getInt(9)+"</td><td>"+ rs.getInt(10)+"</td><td>"+rs.getInt(11)+"</td><td>"); 
if(rs.getInt(4)>=40 && rs.getInt(5)>=40 && rs.getInt(6)>=40 && rs.getInt(7)>=40 && rs.getInt(8)>=40 && rs.getInt(9)>=40 && rs.getInt(10)>=40 && rs.getInt(11)>=40) 
out.print("<td>Pass</td>"+"</td></tr>");
else
out.print("<td>Fail</td>"+"</td></tr>");
} 
out.print("</table>"); 
}catch (Exception e2) {e2.printStackTrace();} 
finally{out.close();} 
} 
}

___________________________________________________________________________________________________________________________________________________________________________________________________________

Lab Sheet4
Problem Statement : MVC design pattern
AIM:
To demonstrate the web development by using MVC design pattern.  
ALGORITHM

Step 1 :  Create a LoginBean class acting as a model which defines the business logic of the system and also represents the state of the application.
Step 2: Create index.jsp will be a view class which can accept the user login credentials.
Step 3: Create ControllerServlet.java Class which acts as a controller is like an interface between Model and View. It receives the user requests from the view layer and processes them, including the necessary validations. The requests are then sent to model for data processing. Once they are processed, the data is again sent back to the controller and then displayed on the view. 
Step 4: Create login-success.jsp and login-error.jsp  pages  represents the output of the application or the user interface. It displays the data fetched from the model layer by the controller and presents the data to the user whenever asked for. It receives all the information it needs from the controller.
 PROGRAM:
index.jsp(View)
<form action="ControllerServlet" method="post"> 
Name:<input type="text" name="name"><br> 
Password:<input type="password" name="password"><br> 
<input type="submit" value="login"> 
</form> 
LoginBean.java(Model)
package com.pu;
import java.lang.*;
public class LoginBean {
private String name,password; 
public String getName() { 
return name; 
} 
public void setName(String name) { 
this.name = name; 
} 
public String getPassword() { 
return password; 
} 
public void setPassword(String password) { 
this.password = password; 
} 
public boolean validate(){ 
if(password.equals("admin")){ 
return true; 
} 
else{ 
return false; 
} 
} 
}
login-success.jsp(view)
<%@page import="com.pu.LoginBean"%> 
<p>You are successfully logged in!</p> 
<% 
LoginBean bean=(LoginBean)request.getAttribute("bean"); 
out.print("Welcome, "+bean.getName()); 
%>
login-error.jsp(View)
<p>Sorry! username or password error</p> 
<%@ include file="index.jsp" %> 
ControllerServlet.java(Controller)

response.setContentType("text/html");
PrintWriter out=response.getWriter();
String name=request.getParameter("name");
String password=request.getParameter("password");
LoginBean bean=new LoginBean();
bean.setName(name);
bean.setPassword(password);
request.setAttribute("bean",bean);
boolean status=bean.validate();
if(status){
RequestDispatcher rd=request.getRequestDispatcher("login-success.jsp");
rd.forward(request,response);
}
else{
RequestDispatcher rd=request.getRequestDispatcher("login-error.jsp");
rd.forward(request,response);
}

RESULT:
     Thus the dynamic web pages were developed and demonstrated  by using MVC design pattern.
