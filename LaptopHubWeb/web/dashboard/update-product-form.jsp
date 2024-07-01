<%-- 
    Document   : add-product-form
    Created on : Jun 25, 2024, 9:11:48 PM
    Author     : myduyen
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="icon" href="assets/img/kaiadmin/favicon.ico" type="image/x-icon"/> 
        <style>
            body {
                background-color: #f5f5f5;
            }
            .card-header {
                font-weight: bold;
                background-color: #fff;
                border-bottom: none;
            }

            .card-body {
                background-color: #fff;
            }

            .btn-outline-secondary {
                margin-right: 5px;
                margin-bottom: 5px;
            }
            .btn-block {
                margin-top: 10px;
            }
            .container01{
                background-color: #ffffff;
                width: 100%;
                min-width: 450px;
                position: relative;
                margin:  10px auto;
                padding: 0px 20px;
                border-radius: 7px;
                box-shadow: 0 20px 35px rgba(0,0,0,0.05);
            }

            .label{
                display: block;
                position: relative;
                background-color: #025bee;
                color: #ffffff;
                font-size: 18px;
                text-align: center;
                width: 300px;
                padding: 18px 0;
                margin: auto;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <%@include file="../includes/header.jsp" %>
        <form action="../ProductManagement" method="get" enctype="multipart/form-data">
            <input type="hidden" name="command" value="UPDATE">
            <input type="hidden" name="productId"
                   value="">
            <!--<input type="hidden" name="command" value="ADD" />-->
            <div class="container mt-5" >
                <h2 class="mb-4" style="padding-left: 50px; padding-top: 50px">Cập nhật sản phẩm mới</h2>
                <div class="row">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header">
                                Thông tin chung
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <input type="text" class="form-control" name="productName" value="${THE_PRODUCT.getProductName()}">
                                </div>
                                <div class="form-group">
                                    <label>Mô tả sản phẩm</label>
                                    <textarea class="form-control" rows="9" cols ="10" name="description" value="${THE_PRODUCT.getDescription()}"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>Phân loại</label>
                                    <div class="form-group">
                                        <select class="form-control" name="category" value="${THE_PRODUCT.getCategoryString()}">
                                            <option>Chọn phân loại</option>
                                            <option >Máy tính bảng</option>
                                            <option >Máy tính xách tay</option>
                                            <option >Máy tính để bàn - CPU</option>
                                            <option >Màn hình rời</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Nhà sản xuất</label>
                                    <div class="form-group">
                                        <select class="form-control" name = "supplier" value="${THE_PRODUCT.getSupplierString()}">
                                            <option>Chọn nhà sản xuất</option>
                                            <option>DELL</option>
                                            <option>ASUS</option>
                                            <option>APPLE</option>
                                            <option>ACER</option>
                                            <option>LENOVO</option>
                                            <option>HP</option>
                                            <option>SAMSUNG</option>
                                        </select>
                                    </div>
                                </div>


                                <div class="card mb-4">
                                    <div class="card-header">
                                        Giá cả và Số lượng
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Giá tiền/chiếc</label>
                                            <input type="number" class="form-control" name = "unitPrice" value="${THE_PRODUCT.getUnitPrice()}">
                                        </div>
                                        <div class="form-group">
                                            <label>Số lượng</label> 
                                            <input type="number" class="form-control" name = "quantity" value="${THE_PRODUCT.getQuantityPerUnit()}">
                                        </div>
                                        <div class="form-group">
                                            <label>Giảm giá</label>
                                            <select class="form-control" name = "isDiscount" value="${THE_PRODUCT.getIsDiscount()}">
                                                <option>Lựa chọn</option>
                                                <option>Có</option>
                                                <option>Không</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Phần trăm giảm giá</label>
                                            <input type="number" class="form-control" placeholder="Nhập phần trăm giảm" name = "discount" value="${THE_PRODUCT.getDiscount()}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        Trạng thái mở bán: <select class="form-control" name = "status" value="${THE_PRODUCT.getIsStatus()}">
                            <option>Chọn trạng thái</option>
                            <option>Đang bán</option>
                            <option>Ngừng kinh doanh</option>
                        </select>

                        

                        <div class="container01">
                            <div class="card-header">
                            Ảnh sản phẩm
                        </div>
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Hình ảnh</th>
                                        <th>Mô tả</th>
                                        <th>Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var= "image" items= "${THE_PRODUCT.getImageList()}" >
                                        <c:url var="deleteImage" value="ProductManagement">
                                            <c:param name="command" value="DELETE-IMAGE"></c:param>
                                            <c:param name="imageId" value="${image.getImageId()}"></c:param>
                                        </c:url>
                                        <tr>
                                            <td><img width="20px" height="20px" src="${image.getImageUrl()}" alt="alt"/></td>
                                            <td>${image.getDescription()}</td>
                                            <td><a href = "${deleteImage}">Xóa ảnh</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                            </table>
                            <br><br>
                            <input type="file" name="file" multiple>
                            <label>
                                <i class="fas fa-upload"></i> &nbsp; Thêm ảnh mới
                            </label>

                        </div>
                        <input type="submit" class="btn btn-primary btn-block" value="Thêm sản phẩm">
                        <a href="../ProductManagement" type="button" class="btn btn-secondary btn-block">Quay trở lại trang quản trị</a>
                    </div>
                </div>
            </div>

            <br><br>                    
        </form>

        
        <%@include file="../includes/footer.jsp" %>
    </body>

</html>
