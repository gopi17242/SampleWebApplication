<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.salesforcetojava.controller.*"%>
<%
System.out.println("session====================="+session.getAttribute("username"));
if(session.getAttribute("username") == null){

 response.sendRedirect("index.jsp");

}

String spageid=request.getParameter("page");  
spageid = "1";
int pageid=Integer.parseInt(spageid);  
int total=5;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}  

System.out.println("logs prints r working in console....!");
    TestSalesForce tsf = new TestSalesForce();
    tsf.getContactDetails();
    List<Contacts> contactsList = tsf.getContactsList();
 //   boolean isUserExisted = tsf.validateUser(username);
    
 /*   if (isUserExisted) {
        session.setAttribute("userid", username);
        response.sendRedirect("contacts.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    } */

//out.print("<center><h1>Page No: "+spageid+"</h1></center>");
out.print("<center><h1>Contact Details</h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b><a style='margin-left: 700px;' href='logout.jsp'>Logout</a></b></center>");
out.print("<center><table border='1' cellpadding='4' width='60%'>");
out.print("<tr><th>Id</th><th>Name</th><th>Email</th><th>Phone</th>");

for(Contacts e:contactsList){
	out.print("<tr><td>"+e.getId()+"</td><td>"+e.getName()+"</td><td>"+e.getEmail()+"</td><td>"+e.getPhone()+"</td></tr>");
}
out.print("</table><center>");
%>
<style>
body {
	color:#4c0775;
	background: darkgray;
	}
</style>

<a href="contacts.jsp?page=1">1</a>
<a href="contacts.jsp?page=2">2</a>
<a href="contacts.jsp?page=3">3</a>
