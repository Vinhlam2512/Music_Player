<%-- 
    Document   : allSongPlayList
    Created on : Mar 10, 2022, 9:59:21 PM
    Author     : VINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nhạc Cá Nhân</title>
        <script src="https://kit.fontawesome.com/b758da46dd.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="../../assets/css/base.css" rel="stylesheet" type="text/css"/>
        <link href="../../assets/css/allSongPlayList.css" rel="stylesheet" type="text/css"/>
        <link href="../basePersonal.css" rel="stylesheet" type="text/css"/>

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
                                    <a class="nav-link " href="${isLogin ? "../tong-quan" : "./login/login"}">Cá Nhân</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " href="../../kham-pha">Khám Phá</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../../zing-chart">ZingChart</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" href="../../play-list">Play List</a>
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
                                    <a href="../logout" class="log-out ${isLogin ? "" : "none"}">Đăng Xuất</a>
                                    <a href="../login/login" class="log-in ${!isLogin ? "" : "none"}">Đăng Nhập</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="content">
                <div class="content-playlist">
                    <div class="container">
                        <div class="content_playlist">
                            <div class="content_playlist-left">
                                <div class="playlist_image">
                                    <img style="border-radius: 10px;"
                                         src="${playlist.getLink()}" alt="">
                                </div>
                            </div>
                            <div class="content_song-right ms-4">
                                <div class="playlist_title text">
                                    <h1 >${playlist.getName()}</h1>
                                </div>
                                <div class="d-flex flex-row align-items-center">
                                    <button style="${isLogin ? "" : "display:none"}">
                                        <svg id="unliked"
                                             onclick="updatePlaylist('insert',${playlist.getId()})" style="height: 35px;width: 40px; display: none"
                                             fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                             xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                        </path>
                                        </svg>
                                        <svg id="liked" 
                                             onclick="updatePlaylist('delete',${playlist.getId()})" id="Layer_1"
                                             style="height: 45px;width: 40px; " fill="ping" height="480pt"
                                             viewBox="0 0 512 512" width="480pt" xmlns="http://www.w3.org/2000/svg"
                                             data-name="Layer 1">
                                        <path
                                            d="m449.28 121.43a115.2 115.2 0 0 0 -137.89-35.75c-21.18 9.14-40.07 24.55-55.39 45-15.32-20.5-34.21-35.91-55.39-45a115.2 115.2 0 0 0 -137.89 35.75c-16.5 21.62-25.22 48.64-25.22 78.13 0 42.44 25.31 89 75.22 138.44 40.67 40.27 88.73 73.25 113.75 89.32a54.78 54.78 0 0 0 59.06 0c25-16.07 73.08-49.05 113.75-89.32 49.91-49.42 75.22-96 75.22-138.44 0-29.49-8.72-56.51-25.22-78.13z"
                                            fill="#f9595f" />
                                        </svg>
                                    </button>

                                    <div class="play-all text" style="margin: 20px;" id="play-ran">
                                        <div class="d-flex rounded-pill">
                                            <svg fill="white" id="Layer_1" height="512" viewBox="0 0 512 512" width="512"
                                                 xmlns="http://www.w3.org/2000/svg" data-name="Layer 1">
                                            <path
                                                d="m468.8 235.007-401.359-231.73a24.2 24.2 0 0 0 -12.087-3.285h-.07a24.247 24.247 0 0 0 -12.094 3.287 24 24 0 0 0 -12.11 20.992v463.456a24.186 24.186 0 0 0 36.36 20.994l401.36-231.731a24.238 24.238 0 0 0 0-41.983z"
                                                fill-rule="evenodd" />
                                            </svg>
                                            <span>Phát Tất Cả</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between mb-3 mt-5"
                             style="border-bottom: 1px solid hsla(0,0%,100%,0.05); padding-bottom: 20px">
                            <span style="width: 10%;" class="text">
                                BÀI HÁT
                            </span>
                        </div>
                        <div class="list mt-3" id="list">
                            <c:forEach items="${listSong}" var="l">
                                <div class="chart_content-song">
                                    <div class="content_song" data-id="${l.getId()}" onclick="heartTrigger(${l.getId()})">
                                        <div class="left d-flex justify-content-center align-items-center">
                                            <div class="song_image">
                                                <a href="#">
                                                    <img style="height: 100%; width: 100%"
                                                         src="${l.getImage()}" alt="">
                                                </a>
                                                <div class="modal-play">
                                                    <svg fill="white" height="512" viewBox="0 0 128 128" width="512"
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
                                                    <span>${l.getName()}</span>
                                                </div>
                                                <div class="song_des-singer">
                                                    <span>${l.getSinger()}</span>
                                                </div>
                                            </div>
                                            <audio
                                                src="${l.getLink()}"></audio>
                                        </div>
                                        <div class="song_content">
                                            <span>
                                                ${l.getName()} (Single)
                                            </span>
                                        </div>

                                    </div>
                                    <style>
                                        .right button {
                                            padding: 0 10px;
                                        }
                                    </style>
                                    <div class="right me-3 position-relative" style=" display: flex; width: 10%">
                                        <button id='' style="${isLogin ? "" : "display:none"}" >
                                            <svg onclick="updateSong('insert', ${l.getId()})" class="unliked" id="unliked" data-id="${l.getId()}"  style="height: 38px; width: 38px; ${listIdFavorSong.contains(l.getId()) ? "display: none" : ""}"
                                                 fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                            <svg onclick="updateSong('delete', ${l.getId()})" class="liked" id="liked" data-id="${l.getId()}" style="height: 38px; width: 38px;${listIdFavorSong.contains(l.getId()) ? " " : "display: none"}"
                                                 fill="ping" height="480pt" viewBox="0 0 512 512" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg" data-name="Layer 1">
                                            <path
                                                d="m449.28 121.43a115.2 115.2 0 0 0 -137.89-35.75c-21.18 9.14-40.07 24.55-55.39 45-15.32-20.5-34.21-35.91-55.39-45a115.2 115.2 0 0 0 -137.89 35.75c-16.5 21.62-25.22 48.64-25.22 78.13 0 42.44 25.31 89 75.22 138.44 40.67 40.27 88.73 73.25 113.75 89.32a54.78 54.78 0 0 0 59.06 0c25-16.07 73.08-49.05 113.75-89.32 49.91-49.42 75.22-96 75.22-138.44 0-29.49-8.72-56.51-25.22-78.13z"
                                                fill="#f9595f"></path>
                                            </svg>
                                        </button>
                                        <button>
                                            <svg onclick="deleteS('delete', ${l.getId()})" style="height: 38px; width: 38px; fill: white" id="light"  enable-background="new 0 0 24 24" height="512" viewBox="0 0 24 24" width="512"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <g>
                                            <path
                                                d="m12 24c-6.617 0-12-5.383-12-12s5.383-12 12-12 12 5.383 12 12-5.383 12-12 12zm0-23c-6.065 0-11 4.935-11 11s4.935 11 11 11 11-4.935 11-11-4.935-11-11-11z" />
                                            </g>
                                            <g>
                                            <path
                                                d="m8.111 16.389c-.128 0-.256-.049-.354-.146-.195-.195-.195-.512 0-.707l7.778-7.778c.195-.195.512-.195.707 0s.195.512 0 .707l-7.778 7.778c-.097.097-.225.146-.353.146z" />
                                            </g>
                                            <g>
                                            <path
                                                d="m15.889 16.389c-.128 0-.256-.049-.354-.146l-7.778-7.779c-.195-.195-.195-.512 0-.707s.512-.195.707 0l7.778 7.778c.195.195.195.512 0 .707-.097.098-.225.147-.353.147z" />
                                            </g>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="../../footer.jsp" %>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
            integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
    crossorigin="anonymous"></script>
    <script src="../../assets/js/app.js" type="text/javascript"></script>
    <script src="../../assets/js/like.js" type="text/javascript"></script>
    <script src="../../assets/js/modal.js" type="text/javascript"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
                                                var likeBtn = document.querySelector('.like-playing');
                                                var unlikeBtn = document.querySelector('.unlike-playing');
                                                function updateSong(type, idSong) {
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: "../../update-song",
                                                        data: {
                                                            idSong: idSong,
                                                            idUser: ${idUser},
                                                            type: type
                                                        },
                                                        success: function (resultData) {
                                                            if (type === 'insert') {
                                                                likeBtn.style.display = 'block';
                                                                unlikeBtn.style.display = 'none';

                                                            } else {
                                                                likeBtn.style.display = 'none';
                                                                unlikeBtn.style.display = 'block';
                                                            }
                                                            console.log("update Complete");
                                                        }
                                                    })
                                                }
    </script>
    <script>
        function updatePlaylist(type, idPlaylist) {
            $.ajax({
                type: 'POST',
                url: "../../update-playlist",
                data: {
                    idPlaylist: idPlaylist,
                    idUser: ${idUser},
                    type: type
                },
                success: function (resultData) {
                    console.log("Update Playlist Complete");
                }
            })
        }
    </script>
    <script>
        var arr = ${listIdFavorSong};
        function heartTrigger(id) {
            console.log(arr.includes(id));
            if (arr.includes(id)) {
                likeBtn.style.display = 'block';
                unlikeBtn.style.display = 'none';
            } else {
                likeBtn.style.display = 'none';
                unlikeBtn.style.display = 'block';
            }
        }
    </script>
    <script>
        function trigger(type, id) {
            console.log($('.liked[data-id=' + id + ']'))
            if (type === 'unlike') {
                $('.unliked[data-id=' + id + ']').css('display', 'none')
                $('.liked[data-id=' + id + ']').css('display', 'block')
            } else {
                $('.unliked[data-id=' + id + ']').css('display', 'block')
                $('.liked[data-id=' + id + ']').css('display', 'none')
            }
        }
    </script>
    <script>
        function deleteS(type, idSong) {
            $.ajax({
                type: 'POST',
                url: "../../update-song-playlist",
                data: {
                    idSong: idSong,
                    idPlaylist: ${idPlaylist},
                    type: type
                },
                success: function (resultData) {
                    location.reload();
                    console.log("update Complete");
                }
            })
        }
    </script>
</html>