<%-- 
    Document   : productDetail
    Created on : Jun 27, 2024, 2:03:55 PM
    Author     : ADM
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/includes/header.jsp" %>
<%@page import= "laptophub.utils.MoneyUtils" %>  
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="./css/productDetail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body class="prd-body">
    <div class="container">
        <section class="general-info">
            <div class="left-side">
                <picture class="show-bar">               
                    <c:forEach var="img" items="${product.getImageList()}">
                        <c:if test="${img.description == 'Mặt trước'}">
                            <img class="mainImg" src="${img.getImageUrl()}" alt="${img.getDescription()}">
                        </c:if>
                    </c:forEach>
                </picture>
                <div class="small-image" >
                    <i class="fa-solid fa-angle-left fa-6x fa-fade" style="color: #6a3ebb;" id="backButton"></i>
                    <div class="image-container">
                        <div class="image">
                            <c:forEach var="img" items="${product.getImageList()}">      
                                <img class="subImg" src="${img.getImageUrl()}" alt="${img.getDescription()}" onmouseover="changeMainImage(event)" onmouseout="returnImage(event)" >
                            </c:forEach>
                        </div>
                    </div>
                    <i class="fa-solid fa-angle-right fa-6x fa-fade" style="color: #6a3ebb;" id="nextButton"></i>
                </div>
            </div>
            <div class="right-side">
                <div class="top-info">
                    <div class="prd-name">
                        <h3 class="name">${product.getProductName()}</h3>
                    </div>
                    <div class="evaluate">
                        <div class="starRate">
                            <c:if test="${product.getStarRating()==0}">
                                <i class="fa fa-star "></i>
                                <i class="fa fa-star "></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </c:if>
                            <c:if test="${product.getStarRating()==1}">
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star "></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </c:if>
                            <c:if test="${product.getStarRating()==2}">
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </c:if>
                            <c:if test="${product.getStarRating()==3}">
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                            </c:if>
                            <c:if test="${product.getStarRating()==4}">
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star"></i>
                            </c:if>
                            <c:if test="${product.getStarRating()==5}">
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                                <i class="fa fa-star checked"></i>
                            </c:if>
                        </div>
                        <div class="sold">
                            <p>Đã bán ${product.getQuantitySold()}</p>
                        </div>
                    </div>  
                    <hr>
                </div>
                
                <div class="mid-info">
                    <div class="price">
                        <p>Siêu ưu đãi: </p>
                            <h6 class="sale"> ${product.getPricePerUnit()}VND</h6>
                            <h4 class="price">${product.getPricePerUnitAfterDiscount()}VND</h4>
                    </div>
                </div>
                <div class="quantity">
                        <p>Số lượng: <i class="fa-solid fa-minus" onclick="decreaseQuantity()"></i><input type="text" name="quantityOrder" id="quantityInput" value="1"><i class="fa-solid fa-plus" onclick="increaseQuantity()"></i></p>
                    </div>
                <div class="buy-bar">
                    <input type="submit" value="Thêm Vào Giỏ Hàng" onclick="window.location.href='#'; return false;" class="button"/>
                    <input type="submit" value="Mua Ngay" onclick="window.location.href='#'; return false;" class="button"/>
                </div>
            </div>
        </section>
    </div>
                </br>
                <hr><!-- comment -->
                </br>             
    <div class="container">
        <div class="detail-info">
            <p>${product.getDescription()}</p>
        </div>
    </div>
        <script src="./js/productDetail.js">  
        </script>
</body>

<%@include file="/includes/footer.jsp" %>