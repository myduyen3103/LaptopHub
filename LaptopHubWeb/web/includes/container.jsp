<%-- 
    Document   : container
    Created on : Jun 19, 2024, 10:04:46 PM
    Author     : myduyen
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!-- Created by CodingLab |www.youtube.com/CodingLabYT-->

<link rel="stylesheet" href="../css/container-admin.css">
<!-- Boxicons CDN Link -->
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<aside class="sidebar">
    <div class="logo-details">
        <i class='bx bx-laptop' ></i>
        <div class="logo_name">LaptopHub</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
        <li>
            <i class='bx bx-search' ></i>
            <input type="text" placeholder="Search...">
            <span class="tooltip">Tìm kiếm</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-dock-top'></i>
                <span class="links_name">Trang chủ</span>
            </a>
            <span class="tooltip">Trang chủ</span>
        </li>

        <li>
            <a href="#">
                <i class='bx bx-grid-alt'></i>
                <span class="links_name">Tổng quan</span>
            </a>
            <span class="tooltip">Tổng quan</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-user' ></i>
                <span class="links_name">Tài khoản</span>
            </a>
            <span class="tooltip">Tài khoản</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bxl-product-hunt' ></i>
                <span class="links_name">Sản phẩm</span>
            </a>
            <span class="tooltip">Sản phẩm</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-pie-chart-alt-2' ></i>
                <span class="links_name">Top bán chạy</span>
            </a>
            <span class="tooltip">Top bán chạy</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-folder' ></i>
                <span class="links_name">Nhà cung cấp</span>
            </a>
            <span class="tooltip">Nhà cung cấp</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-cart-alt' ></i>
                <span class="links_name">Đơn hàng</span>
            </a>
            <span class="tooltip">Đơn hàng</span>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-wallet' ></i>
                <span class="links_name">Doanh thu</span>
            </a>
            <span class="tooltip">Doanh thu</span>
        </li>


        <li class="profile">
            <div class="profile-details">
                <img src="${avatar}" alt="profileImg">
                <div class="name_job">
                    <div class="name">${name}</div>
                    <div class="job">${balance}</div>
                </div>
            </div>
            <i class='bx bx-log-out' id="log_out" ></i>
        </li>
    </ul>


<script>
    let sidebar = document.querySelector(".sidebar");
    let closeBtn = document.querySelector("#btn");
    let searchBtn = document.querySelector(".bx-search");

    closeBtn.addEventListener("click", () => {
        sidebar.classList.toggle("open");
        menuBtnChange();//calling the function(optional)
    });

    searchBtn.addEventListener("click", () => { // Sidebar open when you click on the search iocn
        sidebar.classList.toggle("open");
        menuBtnChange(); //calling the function(optional)
    });

    // following are the code to change sidebar button(optional)
    function menuBtnChange() {
        if (sidebar.classList.contains("open")) {
            closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
        } else {
            closeBtn.classList.replace("bx-menu-alt-right", "bx-menu");//replacing the iocns class
        }
    }
</script>
</aside>