<%-- 
    Document   : home
    Created on : Jun 16, 2024, 9:00:06 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%@include file="/include/header.jsp" %>
    <head>
        <!-- Font Awesome Icon Library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="./css/home.css">
        <style>
            .checked {
              color: orange;
            }
            
        </style>
    </head>
    <body>
        <div>
            <div class="search-bar">
                <div class="title">
                    <h1>Our New Product</h1>
                </div>
                <div class="search-content">
                    <div class="search-box fa-solid fa-magnifying-glass">
                        <input type="text" name="search" value="Search...">
                    </div>
                </div>
            </div>
            <div class="category">
                <div class="title">
                    <h2>Phân Loại</h2>
                </div>
                <div class="detail">
                    <c:forEach var="category" items="${categoryList}">
                        <div class="each-cate">
                            <div class="category-img">
                                <a href="#"><img src="${category.getImageCat()}" alt="${category.getDescription()}"></a>
                            </div>
                            <div class="name">
                                <a href="#"><h2>${category.getCategoryName()}</h2></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="top10-product">
                <div class="title">
                    <h2>Sản Phẩm Mới Nhất</h2>
                </div>
                <div class="detail-top-10">
                    <c:forEach var="product" items="${top10ProductList}">
                        <div class="each-product">
                            <div class="image">
                                <c:forEach var="img" items="${product.getImageList()}">
                                    <c:if test="${img.description == 'Mặt trước'}">
                                        <img src="${img.getImageUrl()}" alt="${img.getDescription()}">
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="name">
                                <h4>${product.getProductName()}</h4>
                            </div>
                            <div class="info">
                                <p>Siêu ưu đãi:</p> <p class="sale"> ${product.getUnitPrice()}VND</p>
                                <h4>${product.getUnitPrice()-product.getDiscountPrice()}VND</h4>
                                <a href="#"><p>Chi tiết sản phẩm >></p></a>
                            </div>
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
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
<%@include file="/include/footer.jsp" %>