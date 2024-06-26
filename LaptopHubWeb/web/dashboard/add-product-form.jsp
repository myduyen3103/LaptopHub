<%-- 
    Document   : add-product-form
    Created on : Jun 25, 2024, 9:11:48 PM
    Author     : admin
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

            .img-fluid {
                max-height: 300px;
                width: auto;
            }

            .img-thumbnail {
                height: 50px;
                width: 50px;
            }

            .btn-block {
                margin-top: 10px;
            }
            .container01{
                background-color: #ffffff;
                width: 100%;
                min-width: 450px;
                position: relative;
                margin:  50px auto;
                padding: 50px 20px;
                border-radius: 7px;
                box-shadow: 0 20px 35px rgba(0,0,0,0.05);
            }
            input[type="file"]{
                display: none;
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
            .container01 p{
                text-align: center;
                margin: 20px 0 30px 0;
            }
            #images{
                width: 30%;
                position: relative;
                margin: auto;
                display: flex;
                justify-content: space-evenly;
                gap: 20px;
                flex-wrap: wrap;
            }
            figure{
                width: 45%;
            }
            img{
                width: 70%;
            }
            figcaption{
                text-align: center;
                font-size: 1.9vmin;
                margin-top: 0.9vmin;
            }

        </style>
    </head>

    <body>
        <%@include file="../includes/header.jsp" %>
        <form action="../ProductManagement">
            <input type="hidden" name="command" value="ADD" />
            <div class="container mt-5" >
                <h2 class="mb-4" style="padding-left: 50px; padding-top: 50px">Thêm sản phẩm</h2>
                <div class="row">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header">
                                Thông tin chung
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="form-group">
                                        <label for="productName">Tên sản phẩm</label>
                                        <input type="text" class="form-control" id="productName" placeholder="Nhập tên sản phẩm" name="productName">
                                    </div>
                                    <div class="form-group">
                                        <label for="productDescription">Mô tả sản phẩm</label>
                                        <textarea class="form-control" id="productDescription" rows="3" placeholder="Nhập mô tả" name="description"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Phân loại</label>
                                        <div class="card mb-4">

                                            <div class="card-body">
                                                    <div class="form-group">
                                                        <select class="form-control" name="category">
                                                            <option>Chọn phân loại</option>
                                                            <option >Máy tính bảng</option>
                                                            <option >Laptop</option>
                                                            <option >PC</option>
                                                            <option >Màn hình</option>
                                                        </select>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Nhà sản xuất</label>
                                        <div class="card mb-4">
                                            <div class="card-body">
                                                
                                                    <div class="form-group">
                                                        <select class="form-control" name = "supplier">
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
                                        </div>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                Giá cả và Số lượng
                            </div>
                            <div class="card-body">
                                <form>
                                    <div class="form-group">
                                        <label for="basePricing">Giá tiền/chiếc</label>
                                        <input type="number" class="form-control" id="basePricing" placeholder="Enter base price" name = "unitPrice">
                                    </div>
                                    <div class="form-group">
                                        <label for="stock">Số lượng</label>
                                        <input type="number" class="form-control" id="stock" placeholder="Enter stock quantity" name = "quantity">
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="card-header">
                            Ảnh sản phẩm
                        </div>

                        <div class="container01">
                            <form action="../ProductManagement" method="post" enctype="multipart/form-data">
                            <input type="file" id="file-input" accept="image/png, image/jpeg" onchange="preview()" multiple="multiple" name = "imageUrl">
                            <label for="file-input" class="label">
                                <i class="fas fa-upload"></i> &nbsp; Chọn ảnh
                            </label>
                            <p id="num-of-files">No Files Chosen</p>
                            <div id="images"></div>
                            <input class="label" type="submit" name="submit" value="Tải ảnh lên">
                            </form>
                        </div>
                        <input type="submit" class="btn btn-primary btn-block" value="Thêm sản phẩm"></input>
                        <a href="../ProductManagement" type="button" class="btn btn-secondary btn-block">Quay trở lại trang quản trị</a>
                    </div>
                </div>
            </div>

            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <script>
                                let fileInput = document.getElementById("file-input");
                                let imageContainer = document.getElementById("images");
                                let numOfFiles = document.getElementById("num-of-files");

                                function preview() {
                                    imageContainer.innerHTML = "";
                                    numOfFiles.textContent = `${fileInput.files.length} Files Selected`;

                                    for (i of fileInput.files) {
                                        let reader = new FileReader();
                                        let figure = document.createElement("figure");
                                        let figCap = document.createElement("figcaption");
                                        figCap.innerText = i.name;
                                        figure.appendChild(figCap);
                                        reader.onload = () => {
                                            let img = document.createElement("img");
                                            img.setAttribute("src", reader.result);
                                            figure.insertBefore(img, figCap);
                                        }
                                        imageContainer.appendChild(figure);
                                        reader.readAsDataURL(i);
                                    }
                                }
            </script>
        </form>

        <%@include file="../includes/footer.jsp" %>
    </body>
</html>
