<%@page import="com.Item"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
//Save--------------------------------- 
if (request.getParameter("itemCode") != null) 
{  
	Item itemObj = new Item();  
	String stsMsg = ""; 

	
	//Insert Item---------------
	if (request.getParameter("hidItemIDSave") == "")   
	{   
		stsMsg = itemObj.insertItem(request.getParameter("itemCode"),      
				request.getParameter("itemName"),    
				request.getParameter("itemPrice"),        
				request.getParameter("itemDesc"));
		
	}  else//Update----------------------  
	{   
		stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),     
				request.getParameter("itemCode"),     
				request.getParameter("itemName"),        
				request.getParameter("itemPrice"),     
				request.getParameter("itemDesc"));  
	}  
	session.setAttribute("statusMsg", stsMsg); 
}

//Delete----------------------------- 
if (request.getParameter("hidItemIDDelete") != null) 
{  
	Item itemObj = new Item();  
	String stsMsg =                 
			itemObj.deleteItem(request.getParameter("hidItemIDDelete"));  session.setAttribute("statusMsg", stsMsg); 
			
} 
		

	
%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script> 
<script src="Components/items.js"></script> 
</head>
<body>

<div class="container">   
	<div class="row">    
		<div class="col"> 

			<h1>Items Management</h1>
			  
			<form id="formItem" name="formItem" method="post" action="items.jsp">
			   
				Item code: 
				<input id="itemCode" name="itemCode" type="text"  class="form-control"><br>
				   
				Item name: 
				<input id="itemName" name="itemName" type="text"  class="form-control"><br>
				    
				Item price: 
				<input id="itemPrice" name="itemPrice" type="text"  class="form-control"><br>
				    
				Item description: <input name="itemDesc" type="text"  class="form-control"><br>    
				<input id="itemDesc" name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
				
				<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
				  
			</form>  
	<div class="alert alert-success">  
		<% 
			out.print(session.getAttribute("statusMsg"));
		%> 
	</div> 
	<br>  
	<%   
		Item itemObj = new Item();   
		out.print(itemObj.readItems());  
	%>
		</div>   
	</div>  
</div>   

</body>
</html>