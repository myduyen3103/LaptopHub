<%-- 
    Document   : login
    Created on : Jun 16, 2024, 9:00:15 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "laptophub.utils.CookieUtils" %>    

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8
        <link href="css/bootstrap.min.css">
        <title>Login form</title>
    </head>
    <jsp:include page="/include/header.jsp"/>
    <body>
            <%
              String username = CookieUtils.get("cookuser", request);
              String password = CookieUtils.get("cookpass", request);
              String rememberVal = CookieUtils.get("cookrem", request);
            %>
            
            <div class="row content--">
                <div class="col-md-4"> 
                    <img src="image/categories/cate-laptop.jpg" alt="alt"/>
                </div> 
                <div class="col-md-8">
                    <p class="h3">Đăng nhập</p>
                    <form action="LoginServlet" method="POST">
                        <%=request.getAttribute("msg")!=null?request.getAttribute("msg") : ""%>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="text" class="form-control" name="username" autocomplete="off" value="<%=username%>" aria-describedby="emailHelp"/>

                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1" >Password</label>
                            <input type="password" class="form-control" name="password" size="50" autocomplete="off" value="<%=password%>" />
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class name="remember" value="1"
                                   <%= "1".equals(rememberVal.trim()) ?"checked=\"checked\"" : ""%> />
                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div> 
            </div>
                           
            
       
    </body>
    <jsp:include page="/include/footer.jsp"/>
</html>
<style>
 .content-- img {
  height:  228px;
  width:  421px;
}
</style>

