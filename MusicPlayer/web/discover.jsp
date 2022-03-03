<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MusicPlayer</title>
        <script src="https://kit.fontawesome.com/b758da46dd.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="./assets/css/base.css">
        <link rel="stylesheet" href="./assets/css/discover.css">
    </head>

    <body>
        <div class="app">
            <%@include file="./header.jsp" %>
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
                            <c:forEach items="${list}" var="s">
                                <div class="col content_song  mb-5">
                                    <div class="song_image">
                                        <a href="">
                                            <img src="${s.getImage()}"
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
                                                <span>${s.getName()}</span>
                                            </a>
                                        </div>
                                        <div class="song_des-singer">
                                            <span>${s.getSinger()}</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <div class="content_music">
                    <p class="text-center fs-2" style="font-weight: 700;">Nhạc Hay Mỗi Ngày</p>
                    <div class="container">
                        <div class="row row-cols-xl-5 mt-5">
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_music">
                    <p class="text-center fs-2" style="font-weight: 700;">Top 100</p>
                    <div class="container">
                        <div class="row row-cols-xl-5 mt-5">
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="content_music">
                    <p class="text-center fs-2" style="font-weight: 700;">Play List Nổi Bật</p>
                    <div class="container">
                        <div class="row row-cols-xl-5 mt-5">
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col content_song  mb-5">
                                <div class="song_image">
                                    <a href="">
                                        <img src="https://photo-resize-zmp3.zadn.vn/w240_r1x1_webp/cover/6/3/0/d/630d20b0a79917e1545b4e2ada081040.jpg"
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
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </a>
                                    </div>
                                    <div class="song_des-singer">
                                        <span>Khắc Việt</span>
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
                                    <a class="rounded" href="">
                                        <img src="https://zmp3-static.zadn.vn/skins/zmp3-v5.2/images/song-vn-2x.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col content_chart  mb-5">
                                <div class="song_image">
                                    <a class="rounded" href="">
                                        <img src="https://zmp3-static.zadn.vn/skins/zmp3-v5.2/images/web_song_usuk.jpg"
                                             alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col content_chart  mb-5">
                                <div class="song_image">
                                    <a class="rounded" href="">
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"

    crossorigin="anonymous"></script>

</html>