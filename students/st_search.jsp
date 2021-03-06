<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search record</title>
<!-- Bootstrap Core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <!-- MetisMenu CSS -->
        <link href="../css/metisMenu.min.css" rel="stylesheet">

        <!-- Timeline CSS -->
        <link href="../css/timeline.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/startmin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
        
         <!-- SBI Collect -->
        <link rel="stylesheet" href="../sbijava/css/style.css" type="text/css" />
        <link rel="stylesheet" href="../sbijava/css/sbi_collect.css" type="text/css" />

       <!-- copyright Collect -->
        <link href="../css/copyrightstyle.css" rel="stylesheet">

</head>
<body>
<%
	if((String)session.getAttribute("username")==null)
	{
		response.sendRedirect("index.jsp");
	}
	else
	{
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		response.setHeader("Pragma","no-cache");
		response.setDateHeader("Expires",0);

%>


<%
	}
%>
<div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                    <a class="navbar-brand"><i class="fa fa fa-university fa-fw"></i>  COLLEGE MANAGEMENT SYSTEM</a>
                </div>

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <ul class="nav navbar-nav navbar-left navbar-top-links">
                    <li><a href="http://www.impscet.net/"><i class="fa fa-home fa-fw"></i> Official Site</a></li>
                </ul>

                <ul class="nav navbar-right navbar-top-links">
                    
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-user-secret fa-fw"></i>Mr. <%=session.getAttribute("username")%><b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            
                            <li class="divider"></li>
                            <li><a href="../pages/logout.jsp"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- /.navbar-top-links -->

                <!-- /.panel-heading -->
                
                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            
                            <li>
                                <a href="adminpanel.jsp" class="active"><i style="font-size: 26px;" class="fa fa-user-secret fa-fw"></i>
                                <span style="font-size: 23px;font-weight: bold">Admin Panel</span>
                              <i style="font-size: 26px;" class="fa fa-user-secret fa-fw"></i></a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa fa-graduation-cap fa-fw"></i> STUDENTS SECTION<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="add_admission.jsp"><i class="fa fa fa-plus fa-fw"></i> ADD ADDMISSION</a>
                                    </li>
                                    <li>
                                        <a href="payment.jsp"><i class="fa fa fa-paypal fa-fw"></i> PAYMENT</a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa fa-search fa-fw"></i> SEARCH</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i class="fa fa fa-user-md fa-fw"></i> TEACHERS SECTION<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="cse.jsp"><i class="fa fa fa-users fa-fw"></i> C.S.E</a>
                                    </li>
                                    <li>
                                        <a href="ce.jsp"><i class="fa fa fa-users fa-fw"></i> C.E</a>
                                    </li>
                                    <li>
                                        <a href="ece.jsp"><i class="fa fa fa-users fa-fw"></i> E.C.E</a>
                                    </li>
                                    <li>
                                        <a href="ee.jsp"><i class="fa fa fa-users fa-fw"></i> E.E</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>                  
                            <li>
                                <a href="#"><i class="fa fa-users fa-fw"></i> MEMBER'S AREA<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="chairman_desk.jsp"><i class="fa fa fa-user-md fa-fw"></i> CHAIRMEN'S DESK</a>
                                    </li>
                                    <li>
                                        <a href="director_desk.jsp"><i class="fa fa fa-user-md fa-fw"></i> DIRECTOR'S DESK</a>
                                    </li>
                                    <li>
                                        <a href="principal_desk.jsp"><i class="fa fa fa-user-md fa-fw"></i> PRINCIPLE'S DESK</a>
                                    </li>
                                    <li>
                                        <a href="mngmnt_desk.jsp"><i class="fa fa fa-user-md fa-fw"></i> ADMINISTRATION</a>
                                    </li>
                                    
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            
                        </ul>
                    </div>
                </div>
                
            </nav>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Find Your Desired Candidate</h1>
	<form method="post">
		<h2>Search By :</h2>
		<select name="selopt">
			<option value="eid">ID</option>
			<option value="name">Name</option>
			<option value="dob">Date of Birth</option>
		</select>
		<input type="text" name="txt1">
		<input type="submit" name="btnsearch" value="Search">
	</form><br>
	           </div>
                    <!-- /.col-lg-12 -->
                </div>  
               
	<%
Connection con=null;
PreparedStatement stmt=null;
ResultSet rs=null;
try
{
// for MySQL Coonectivity
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cgt","root","");


}
catch(Exception ex)
{
out.println(ex.toString());
}

if("Search".equals(request.getParameter("btnsearch")))
{
	String opt=request.getParameter("selopt");
	String val=request.getParameter("txt1");
	String q="select * from add_reg where "+opt+" like '"+val+"%'";
//	out.println(q+"<br>");
	try
	{
stmt=con.prepareStatement(q);
		
		rs=stmt.executeQuery();
		%>
		                       <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Search Panel
                            </div>
		                       <div class="panel-body">
                                <div class="row">
			
		<%
		while(rs.next())
		{
			%>
			                      <form  role="form" id="frm" action="record_update.jsp" method="post" enctype="multipart/form-data">
			                               <div  class="form-group">
                                            <h3><input type="button" class="btn btn-default" onclick="window.print('')" value="Print"/>Edit The Details</h3>
                                            </div>
                                      <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>ID</label>
                                                <input  name="txteid" class="form-control" readonly value="<%=rs.getString(2)%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Father's Name *</label>
                                                <input name="txtfname" id="fname" class="form-control" readonly value="<%=rs.getString(5)%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Mother's Name *</label>
                                                <input name="txtmname" id="mname" class="form-control" readonly value="<%=rs.getString(6)%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Address *</label>
                                                <input name="txtaddr" id="addr" class="form-control"  readonly value="<%=rs.getString(9)%>">
                                            </div>
                                                                                                                                                                          
                                            <div class="form-group">
                                                <label>Gender *</label>
                                                <input name="txtgen" id="rdgen" class="form-control" readonly value="<%=rs.getString(10)%>">
                                            </div>
                                            <div class="form-group">
                                               <label>QUATA *</label><br>
                                                 <input name="txtquota" id="quota" class="form-control" readonly value="<%=rs.getString(12)%>" >
                                            </div>
                                            <div class="form-group">
                                            <label>STREAM *</label>
                                                <input name="txtstrm" id="strm" class="form-control" readonly value="<%=rs.getString(13)%>" >
                                                </div>
                                            <div class="form-group">
                                                <label>Date OF joining *</label>
                                                <input name="txtdoj" class="form-control" id="datej" readonly value="<%=rs.getString(16)%>" >
                                            </div>
                                            
                                        
                                    </div>
                                            <div class="col-lg-6">
                                        
                                            
                                            <div class="form-group">
                                                <label>Full Name *</label>
                                                <input name="txtname" id="sname" class="form-control" readonly value="<%=rs.getString(3)%>">
                                           
                                            </div>
                                            <div class="form-group">
                                                <label>Date OF Birth *</label>
                                                <input name="txtbob" class="form-control" id="dateb" readonly value="<%=rs.getString(4)%>" >
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>Mobile No. *</label>
                                                <input name="txtph" id="mob" class="form-control" readonly value="<%=rs.getString(7)%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Parrent's Mo. No. *</label>
                                                <input name="txtaltph" id="pmob" class="form-control" readonly value="<%=rs.getString(8)%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Religion *</label>
                                                <input name="txtreli" id="reli" class="form-control" readonly value="<%=rs.getString(11)%>" >
                                                
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>Email Id. *</label>
                                                <input name="txteml" id="email" class="form-control" readonly value="<%=rs.getString(15)%>">
                                            </div>
                                            <div class="form-group">
                                            <label >Batch *</label>
                                          <input name="txtbtch" id="btch" class="form-control" readonly value="<%=rs.getString(14)%>" >
                                                   </div>
                                            <div class="form-group">
                                                <label>File input *</label>
                                                <input name="txtfile" id="finput" type="file" readonly value="<%=rs.getString(17)%>">
                                            </div><br><br><br><br>
                                            </div>
                                         </form>
			<% 
		}
		%>
		</div>
		</div>
		</div>
		</div>
		</div>
		</div>
		<div class="col-lg-20">              
                      <footer id="footer-section">
                    <div class="container">
                    <div class="footer-socials-section">
                     <ul class="footer-socials">
                       <li><a href="https://facebook.com/OtakuAvengers" target="_blank"><i class="fa fa-facebook"></i><span>Facebook</span></a></li>
                       <li><a href="https://twitter.com/OtakuAvengers" target="_blank"><i class="fa fa-twitter"></i><span>Twitter</span></a></li>
                       <li><a href="https://plus.google.com/u/4/106858995303157332000" target="_blank"><i class="fa fa-google-plus"></i><span>Google +</span></a></li>
                       <li><a href="https://www.youtube.com/channel/UCKltO3_AkA-qh5ilcagzAQA" target="_blank"><i class="fa fa-youtube-play"></i><span>Youtube</span></a></li>
                       <li><a href="http://www.animezone.tk" target="_blank"><i class="fa fa-globe"></i><span>Web Site</span></a></li>
                       <li><a href="https://www.reddit.com/user/AnimeSarkar/" target="_blank"><i class="fa fa-reddit-alien" aria-hidden="true"></i><span>Reddit</span></a></li>
                       <li><a href="https://www.tumblr.com/blog/otakuavengers" target="_blank"><i class="fa fa-tumblr" aria-hidden="true"></i><span>Tumblr</span></a></li>
                    </ul>
                    </div>
                           <div class="footer-logo-copyright footer-not-logo">
                           <div class="footer-menu-wrap">
                              <ul id="menu-top-nav" class="footer-menu"><li id="menu-item-2967" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-2967"><a href="adminpanel.jsp">Home</a></li>
                              <li id="menu-item-34" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-34"><a href="#">Privacy Policy</a></li>
                              <li id="menu-item-35" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-35"><a href="#">Terms and Conditions</a></li>
                              <li id="menu-item-36" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-36"><a href="#">DMCA</a></li>
                              <li id="menu-item-2968" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-2968"><a href="#" onclick="window.open('contact.jsp','productservice','width=780, height=500, status=1, scrollbars=1, location=0')">Contact US</a></li>
                              </ul> 
                           </div>
                             <div id="footer-copyright">
                                <p>@2017-18 - Otaku Avengers. All Right Reserved. Designed and Developed by CGT Team</p>
                             </div>
                    <div class="go-to-top-parent"><a href="#" class="go-to-top"><span><i class="fa fa-angle-up"></i><br>Back To Top</span></a></div>
                         </div>
                   </div>

                
               </footer>   
                 </div>
		</div>
		<%
	 // executeUpdate() for  insert, update, delete
	 	con.close();
			
	}
	 catch(Exception ex)
		{
			out.println(ex.toString());
		}
}
%>

	 <!-- jQuery -->
<script src="../js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="../js/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="../js/startmin.js"></script>

<!-- Custom View JavaScript -->
<script src="../js/html5shiv.min.js"></script>
<script src="../js/respond.min.js"></script>
</body>
</html>

