<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/header.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    *{
    margin: 0;
    font-family: "Times New Roman", Times, serif;
}
.navbar01{
    background: linear-gradient(to right, #000, #460E6D);
    color: white;
}
.navbar-menu01{
    position: relative;
    list-style-type: none;
    display: flex;
    justify-content: space-between;
}
img{
    display: block;
    width: 70px;
    height: auto;
    transform: scale(1.5);
    transform-origin: center;
    padding:  0 auto;
}
.personal a{
    margin-left: 30px;
}
.navbar-menu01 li:not(.logo){
    z-index: 1;
    position: relative;
    margin: 25px 45px;
}
.navbar-menu01 li a{
    color: white;
    text-decoration: none;
}
.navbar-menu01 li{
    z-index: 1;
}

.icon a{
    color: white;
}

/* Dropdown Button */
.dropbtn {
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    margin-top: 10px;
    display: none;
    position: absolute;
    background: linear-gradient(45deg, #0c0c0c,#262527);
    min-width: 210px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
    background-color: #ffffff;
    color: #27112e;
    font-weight: bold;

}

/* Show the dropdown menu on hover */
.dropdown:active .dropdown-content,
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: transparent;
}
span{
    position: absolute;
    top: 0;
    left: 0;
    width: 200px;
    height: 100%;
    background: linear-gradient(45deg, #0c0c0c,#262527);
    border-radius: 8px;
    transition: .5s;
}
.navbar-menu01 li:nth-child(1):hover~span{
    left: 0;
}
.navbar-menu01 li:nth-child(2):hover~span{
    left: 385px;
    width: 210px;
    ;
}

.navbar-menu01 li:nth-child(4):hover~span{
    left: 970px;
    width: 200px;
}
</style>
<div class="navbar01">
    <ul class="navbar-menu01">
        <li><a href ="#">TRANG CHỦ</a></li>
        <li class="dropdown">
            <a href="#" class="dropbtn">PHÂN LOẠI</a>
            <div class="dropdown-content">
                <a href="#">Laptop</a>
                <a href="#">Máy tính bảng</a>
                <a href="">Màn hình</a>
                <a href="">PC</a>
            </div>
        </li>
        <li class="logo">
            <a href=""><img src="http://localhost:9999/LaptopHubWeb/images/logo/logo.png" alt="logo"/></a>
        </li>
        <li><a href="#">VỀ CHÚNG TÔI</a></li>
        <li class="personal">
            <a href="#"><i class="fas fa-bell"></i></a>
            <a href="#"><i class="fas fa-shopping-cart"></i></a>
            <a href="#"><i class="fas fa-user"></i></a>
        </li>
        <span></span>
    </ul>
</div>