<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MusicPlayer</title>
        <script src="https://kit.fontawesome.com/b758da46dd.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/base.css">
        <link rel="stylesheet" href="./assets/css/discover.css">
    </head>

    <body>
        <div class="app">
            <div class="header">
                <nav class="navbar navbar-expand-lg ">
                    <div class="container-fluid">
                        <a class="navbar-brand" href="./kham-pha">
                            <svg class="header__logo" enable-background="new 0 0 512.024 512.024" height="512"
                                 viewBox="0 0 512.024 512.024" width="512" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink">
                            <linearGradient id="SVGID_1_" gradientUnits="userSpaceOnUse" x1="150.012" x2="150.012"
                                            y1="360.024" y2="0">
                            <stop offset="0" stop-color="#5558ff" />
                            <stop offset="1" stop-color="#00c0ff" />
                            </linearGradient>
                            <linearGradient id="SVGID_2_" gradientUnits="userSpaceOnUse" x1="392.012" x2="392.012"
                                            y1="512.024" y2="167.027">
                            <stop offset="0" stop-color="#addcff" />
                            <stop offset=".5028" stop-color="#eaf6ff" />
                            <stop offset="1" stop-color="#eaf6ff" />
                            </linearGradient>
                            <g>
                            <path
                                d="m293.772 2.851c-3.896-2.827-8.906-3.633-13.506-2.051l-180 60c-6.123 2.036-10.254 7.764-10.254 14.224v173.348c-8.862-5.169-19.025-8.348-30-8.348-33.076 0-60 26.909-60 60s26.924 60 60 60 60-26.909 60-60v-154.195l150-49.999v92.542c-8.862-5.169-19.025-8.348-30-8.348-33.076 0-60 26.909-60 60s26.924 60 60 60 60-26.909 60-60v-225c0-4.82-2.315-9.346-6.24-12.173z"
                                fill="url(#SVGID_1_)" />
                            <path
                                d="m505.566 169.69c-4.072-2.798-9.199-3.428-13.828-1.714l-120 45c-5.859 2.197-9.727 7.793-9.727 14.048v173.348c-8.862-5.169-19.025-8.348-30-8.348-33.076 0-60 26.909-60 60s26.924 60 60 60 60-26.909 60-60v-154.6l110.273-41.353c5.859-2.197 9.727-7.793 9.727-14.048v-60c.001-4.921-2.402-9.521-6.445-12.333z"
                                fill="url(#SVGID_2_)" />
                            </g>
                            </svg></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link " href="${isLogin ? "./personal/tong-quan" : "./login/login"}">Cá Nhân</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Khám Phá</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="./zing-chart">ZingChart</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="./play-list">Play List</a>
                                </li>
                            </ul>
                            <div class="d-flex">
                                <form class="d-flex" action="tim-kiem" method="GET">
                                    <input class="form-control me-2" type="search" name="search"
                                           placeholder="Nhập Tên ca sĩ, bài hát hoặc MV..." aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">Tìm Kiếm</button>
                                </form>
                                <a href="${isLogin ? "./personal/tong-quan" : "./login/login"}">
                                    <?xml version="1.0" encoding="iso-8859-1"?>
                                    <!-- Generator: Adobe Illustrator 19.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)  --><svg
                                        style="height: 40px; width: 40px; fill: #fff; margin-left: 12px;" version="1.1"
                                        id="Capa_1" xmlns="http://www.w3.org/2000/svg"
                                        xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 480 480"
                                        style="enable-background:new 0 0 480 480;" xml:space="preserve">
                                    <g>
                                    <g>
                                    <path
                                        d="M240,0C107.664,0,0,107.664,0,240c0,57.96,20.656,111.184,54.992,152.704c0.088,0.12,0.096,0.272,0.192,0.384			c24.792,29.896,55.928,52.816,90.624,67.624c0.4,0.168,0.792,0.352,1.192,0.52c2.808,1.184,5.648,2.28,8.496,3.352			c1.12,0.424,2.24,0.856,3.376,1.264c2.456,0.88,4.928,1.712,7.416,2.512c1.592,0.512,3.184,1.016,4.792,1.496			c2.2,0.656,4.408,1.288,6.632,1.888c1.952,0.528,3.92,1.016,5.888,1.488c1.992,0.48,3.992,0.96,6,1.384			c2.24,0.48,4.504,0.904,6.776,1.32c1.824,0.336,3.64,0.688,5.48,0.984c2.52,0.408,5.056,0.728,7.6,1.056			c1.64,0.208,3.272,0.448,4.92,0.624c2.88,0.304,5.784,0.52,8.696,0.72c1.352,0.096,2.696,0.24,4.056,0.312			c4.248,0.24,8.544,0.368,12.872,0.368s8.624-0.128,12.888-0.352c1.36-0.072,2.704-0.216,4.056-0.312			c2.912-0.208,5.816-0.416,8.696-0.72c1.648-0.176,3.28-0.416,4.92-0.624c2.544-0.328,5.08-0.648,7.6-1.056			c1.832-0.296,3.656-0.648,5.48-0.984c2.264-0.416,4.528-0.84,6.776-1.32c2.008-0.432,4-0.904,6-1.384			c1.968-0.48,3.936-0.968,5.888-1.488c2.224-0.592,4.432-1.232,6.632-1.888c1.608-0.48,3.2-0.984,4.792-1.496			c2.488-0.8,4.96-1.632,7.416-2.512c1.128-0.408,2.248-0.84,3.376-1.264c2.856-1.072,5.688-2.176,8.496-3.352			c0.4-0.168,0.792-0.352,1.192-0.52c34.688-14.808,65.832-37.728,90.624-67.624c0.096-0.112,0.104-0.272,0.192-0.384			C459.344,351.184,480,297.96,480,240C480,107.664,372.336,0,240,0z M337.256,441.76c-0.12,0.056-0.232,0.12-0.352,0.176			c-2.856,1.376-5.76,2.672-8.688,3.936c-0.664,0.28-1.32,0.568-1.984,0.848c-2.56,1.072-5.152,2.088-7.76,3.064			c-1.088,0.408-2.176,0.808-3.272,1.192c-2.312,0.824-4.632,1.616-6.976,2.368c-1.456,0.464-2.92,0.904-4.384,1.336			c-2.08,0.624-4.168,1.224-6.28,1.784c-1.776,0.472-3.568,0.904-5.36,1.328c-1.88,0.448-3.752,0.904-5.648,1.304			c-2.072,0.44-4.16,0.816-6.24,1.192c-1.688,0.312-3.368,0.64-5.072,0.912c-2.344,0.368-4.712,0.664-7.072,0.96			c-1.496,0.192-2.984,0.416-4.496,0.576c-2.696,0.288-5.416,0.472-8.128,0.664c-1.208,0.08-2.408,0.216-3.632,0.28			c-3.96,0.208-7.928,0.32-11.912,0.32s-7.952-0.112-11.904-0.32c-1.216-0.064-2.416-0.192-3.632-0.28			c-2.72-0.184-5.432-0.376-8.128-0.664c-1.512-0.16-3-0.384-4.496-0.576c-2.36-0.296-4.728-0.592-7.072-0.96			c-1.704-0.272-3.384-0.6-5.072-0.912c-2.088-0.376-4.176-0.76-6.24-1.192c-1.896-0.4-3.776-0.856-5.648-1.304			c-1.792-0.432-3.584-0.856-5.36-1.328c-2.104-0.56-4.2-1.168-6.28-1.784c-1.464-0.432-2.928-0.872-4.384-1.336			c-2.344-0.752-4.672-1.544-6.976-2.368c-1.096-0.392-2.184-0.792-3.272-1.192c-2.608-0.976-5.2-1.992-7.76-3.064			c-0.664-0.272-1.312-0.56-1.976-0.84c-2.928-1.256-5.832-2.56-8.696-3.936c-0.12-0.056-0.232-0.112-0.352-0.176			c-27.912-13.504-52.568-32.672-72.576-55.952c15.464-56.944,59.24-102.848,115.56-121.112c1.112,0.68,2.272,1.288,3.416,1.928			c0.672,0.376,1.336,0.776,2.016,1.136c2.384,1.264,4.8,2.448,7.272,3.512c1.896,0.832,3.856,1.536,5.808,2.256			c0.384,0.136,0.768,0.288,1.152,0.424c10.848,3.84,22.456,6.04,34.6,6.04s23.752-2.2,34.592-6.04			c0.384-0.136,0.768-0.288,1.152-0.424c1.952-0.72,3.912-1.424,5.808-2.256c2.472-1.064,4.888-2.248,7.272-3.512			c0.68-0.368,1.344-0.76,2.016-1.136c1.144-0.64,2.312-1.248,3.432-1.936c56.32,18.272,100.088,64.176,115.56,121.112			C389.824,409.08,365.168,428.248,337.256,441.76z M152,176c0-48.52,39.48-88,88-88s88,39.48,88,88			c0,30.864-16.008,58.024-40.128,73.736c-3.152,2.048-6.432,3.88-9.8,5.48c-0.4,0.192-0.792,0.392-1.192,0.576			c-23.168,10.536-50.592,10.536-73.76,0c-0.4-0.184-0.8-0.384-1.192-0.576c-3.376-1.6-6.648-3.432-9.8-5.48			C168.008,234.024,152,206.864,152,176z M421.832,370.584c-18.136-53.552-59.512-96.832-112.376-117.392			C330.6,234.144,344,206.64,344,176c0-57.344-46.656-104-104-104s-104,46.656-104,104c0,30.64,13.4,58.144,34.552,77.192			c-52.864,20.568-94.24,63.84-112.376,117.392C31.672,333.792,16,288.704,16,240C16,116.488,116.488,16,240,16s224,100.488,224,224			C464,288.704,448.328,333.792,421.832,370.584z" />
                                    </g>
                                    </g>

                                    </svg>
                                </a>
                                <div class="log">
                                    <a href="./logout" class="log-out ${isLogin ? "" : "none"}">Đăng Xuất</a>
                                    <a href="./login/login" class="log-in ${!isLogin ? "" : "none"}">Đăng Nhập</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="content">
                <div class="slider">
                    <div class="container">
                        <div class="row">
                            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0"
                                            class="active" aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                                            aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                                            aria-label="Slide 3"></button>
                                </div>
                                <div class="carousel-inner">
                                    <div class="carousel-item active" data-bs-interval="10000">
                                        <img src="	https://avatar-ex-swe.nixcdn.com/slideshow/2022/02/23/7/d/c/6/1645610775653_org.jpg"
                                             class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item" data-bs-interval="2000">
                                        <img src="https://avatar-ex-swe.nixcdn.com/slideshow/2022/02/21/3/c/8/f/1645429679323_org.jpg"
                                             class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="https://avatar-ex-swe.nixcdn.com/slideshow/2022/02/17/7/7/1/2/1645080594939_org.jpg"
                                             class="d-block w-100" alt="...">
                                    </div>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark"
                                        data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark"
                                        data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_music">
                    <p class="text-center fs-2" style="font-weight: 700;">Có thể bạn muốn nghe</p>
                    <div class="container">
                        <div class="row row-cols-xl-5 mt-5">
                            <c:forEach items="${list1}" var="s">
                                <div class="col content_song  mb-5" data-id="${s.getId()}">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="${s.getImage()}"
                                                 alt="">
                                        </a>
                                        <div class="song_modal">
                                            <svg class="song_modal-play" height="512" viewBox="0 0 128 128" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z">
                                            </path>
                                            <path
                                                d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z">
                                            </path>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="song_des">
                                        <div class="song_des-title">
                                            <a href="">
                                                <span>${s.getName()}</span>
                                            </a>
                                        </div>
                                        <div class="song_des-singer">
                                            <span>${s.getSinger()}</span>
                                        </div>
                                    </div>
                                    <audio src="${s.getLink()}"></audio>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="content_music">
                    <p class="text-center fs-2" style="font-weight: 700;">Nhạc Hay Mỗi Ngày</p>
                    <div class="container">
                        <div class="row row-cols-xl-5 mt-5">
                            <c:forEach items="${list2}" var="s" >
                                <div class="col content_song  mb-5" data-id="${s.getId()}">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="${s.getImage()}" alt="">
                                        </a>
                                        <div class="song_modal">
                                            <svg class="song_modal-play" height="512" viewBox="0 0 128 128" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z">
                                            </path>
                                            <path
                                                d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z">
                                            </path>
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="song_des">
                                        <div class="song_des-title">
                                            <a href="">
                                                <span>${s.getName()}</span>
                                            </a>
                                        </div>
                                        <div class="song_des-singer">
                                            <span>${s.getSinger()}</span>
                                        </div>
                                    </div>
                                    <audio src="${s.getLink()}"></audio>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="content_music">
                    <p class="text-center fs-2" style="font-weight: 700;">Top 100</p>
                    <div class="container">
                        <div class="row row-cols-xl-5 mt-5">
                            <c:forEach items="${playLists1}" var="pl1">
                                <div class="col content_song100  mb-5">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="${pl1.getLink()}" alt="">
                                        </a>
                                        <div class="song_modal">
                                            <svg class="song_modal-play" height="512" viewBox="0 0 128 128" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z" />
                                            <path
                                                d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z" />
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="song_des">
                                        <div class="song_des-title">
                                            <a href="">
                                                <span>${pl1.getName()}</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="content_music">
                        <p class="text-center fs-2" style="font-weight: 700;">Play List Nổi Bật</p>
                        <div class="container">
                            <div class="row row-cols-xl-5 mt-5">
                                <div class="col content_song-list  mb-5">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="https://photo-resize-zmp3.zadn.vn/w320_r1x1_webp/cover/b/c/e/5/bce5608f53f03a26db4c4e6e8372812b.jpg"
                                                 alt="">
                                        </a>
                                        <div class="song_modal">
                                            <svg class="song_modal-play" height="512" viewBox="0 0 128 128" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z" />
                                            <path
                                                d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z" />
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="song_des">
                                        <div class="song_des-title">
                                            <a href="">
                                                <span>V-Pop Tháng 3</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col content_song-list  mb-5">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="	https://photo-resize-zmp3.zadn.vn/w320_r1x1_webp/cover/b/6/0/5/b60587151852850f6ccaca47932eee50.jpg"
                                                 alt="">
                                        </a>
                                        <div class="song_modal">
                                            <svg class="song_modal-play" height="512" viewBox="0 0 128 128" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z" />
                                            <path
                                                d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z" />
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="song_des">
                                        <div class="song_des-title">
                                            <a href="">
                                                <span>US-UK Tháng 3</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col content_song-list  mb-5">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="	https://photo-resize-zmp3.zadn.vn/w320_r1x1_webp/cover/1/2/f/f/12ff46b19408e567c4d753dad7f3c20b.jpg"
                                                 alt="">
                                        </a>
                                        <div class="song_modal">
                                            <svg class="song_modal-play" height="512" viewBox="0 0 128 128" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z" />
                                            <path
                                                d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z" />
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="song_des">
                                        <div class="song_des-title">
                                            <a href="">
                                                <span>C-Pop Tháng 3</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col content_song-list  mb-5">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="https://photo-resize-zmp3.zadn.vn/w320_r1x1_webp/cover/d/1/6/0/d160b50784baf05665d0b25fbf39200e.jpg"
                                                 alt="">
                                        </a>
                                        <div class="song_modal">
                                            <svg class="song_modal-play" height="512" viewBox="0 0 128 128" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z" />
                                            <path
                                                d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z" />
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="song_des">
                                        <div class="song_des-title">
                                            <a href="">
                                                <span>Những Bài Hát Hay Nhất Của Ngô Kiến Huy</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col content_song-list  mb-5">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="https://photo-resize-zmp3.zadn.vn/w320_r1x1_webp/cover/5/b/2/9/5b29641d33e2f951d1be311669653e9f.jpg"
                                                 alt="">
                                        </a>
                                        <div class="song_modal">
                                            <svg class="song_modal-play" height="512" viewBox="0 0 128 128" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z" />
                                            <path
                                                d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z" />
                                            </svg>
                                        </div>
                                    </div>
                                    <div class="song_des">
                                        <div class="song_des-title">
                                            <a href="">
                                                <span>Top Hits V-Pop</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content_music">
                        <p class="text-center fs-2" style="font-weight: 700;">Bảng Xếp Hạng Tuần</p>
                        <div class="container">
                            <div class="row row-cols-xl-3 mt-5">
                                <div class="col content_chart  mb-5">
                                    <div class="song_image">
                                        <a class="rounded" href="./zing-chart?idType=1">
                                            <img src="https://zmp3-static.zadn.vn/skins/zmp3-v5.2/images/song-vn-2x.jpg" alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="col content_chart  mb-5">
                                    <div class="song_image">
                                        <a class="rounded" href="./zing-chart?idType=2">
                                            <img src="https://zmp3-static.zadn.vn/skins/zmp3-v5.2/images/web_song_usuk.jpg"
                                                 alt="">
                                        </a>
                                    </div>
                                </div>
                                <div class="col content_chart  mb-5">
                                    <div class="song_image">
                                        <a class="rounded" href="./zing-chart?idType=6">
                                            <img src="https://zmp3-static.zadn.vn/skins/zmp3-v5.2/images/web_song_kpop.jpg"
                                                 alt="">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="./footer.jsp" %>
            </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="./assets/js/app.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function updateSong(type, idSong) {
            $.ajax({
                type: 'POST',
                url: "./update-song",
                data: {
                    idSong: idSong,
                    idUser: ${idUser},
                    type: type
                },
                success: function (resultData) {
                    console.log("update Complete");
                }
            })
        }
    </script>
</html>