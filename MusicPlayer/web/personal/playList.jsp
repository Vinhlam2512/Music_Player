<%-- 
    Document   : top100
    Created on : Mar 3, 2022, 11:39:30 PM
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
        <title>MusicPlayer</title>
        <script src="https://kit.fontawesome.com/b758da46dd.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="stylesheet" href="../assets/css/base.css">
        <link rel="stylesheet" href="./basePersonal.css">
        <link href="../assets/css/overview.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <div class="app">
            <%@include file="./headerPersonal.jsp" %>
            <div class="content" style="padding-bottom: 100px">
                <div class="content_user">
                    <div class="content_user-avatar container">
                        <div class="d-flex justify-content-center">
                            <img src="https://s120-ava-talk.zadn.vn/4/c/1/8/0/120/e47d39fd528eb5c5938aa47e62c6a437.jpg"
                                 alt="">
                        </div>
                    </div>
                    <div class="content_user-title">
                        <p id="user-name" data-id="${id}">${fullName}</p>
                    </div>
                </div>
                <div class="content_options d-flex justify-content-center">
                    <ul class="d-flex rounded-pill ps-0 bg-white w-25 justify-content-around">
                        <li class="position-relative px-3 my-3 list-unstyled underline ">
                            <a href="./tong-quan" class="text-decoration-none ">
                                <p class="m-0">TỔNG QUAN</p>
                            </a>
                        </li>
                        <li class="position-relative px-3  my-3 list-unstyled underline">
                            <a href="./bai-hat" class="text-decoration-none">
                                <p class="m-0">BÀI HÁT</p>
                            </a>
                        </li>
                        <li class="position-relative px-3 my-3 list-unstyled underline">
                            <a href="./play-list" class="text-decoration-none active">
                                <p class="m-0">PLAYLIST</p>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="container">
                    <div class="playList">
                        <div class="playList_nav d-flex justify-content-between align-items-center">
                            <div class="playList_nav-title">
                                <span class="fs-2">Playlist Của Tôi</span>
                            </div>
                        </div>
                        <div class="row row-cols-5">
                            <div class="col playList-content  mb-5">
                                <div class="playList-create" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    <a href="" class="playList-create-btn">
                                        <svg style="height: 100%;width: 100%" fill="white" id="Layer_1"
                                             enable-background="new 0 0 64 64" height="512" viewBox="0 0 64 64"
                                             width="512" xmlns="http://www.w3.org/2000/svg">
                                        <g>
                                        <g>
                                        <g>
                                        <path
                                            d="m32.5 62c-1.1 0-2-.9-2-2v-55c0-1.1.9-2 2-2s2 .9 2 2v55c0 1.1-.9 2-2 2z" />
                                        </g>
                                        </g>
                                        </g>
                                        <g>
                                        <g>
                                        <g>
                                        <path
                                            d="m60 34.5h-55c-1.1 0-2-.9-2-2s.9-2 2-2h55c1.1 0 2 .9 2 2s-.9 2-2 2z" />
                                        </g>
                                        </g>
                                        </g>
                                        </svg>
                                    </a>
                                    <span>Tạo PlayList Mới</span>
                                </div>
                            </div>
                            <c:forEach items="${listPlaylistUser}" var="l">
                                <div class="col playList-content  mb-5">
                                    <div class="play-list-thumbnail">
                                        <a href="">
                                            <img src="${l.getLink()}" alt="">
                                        </a>
                                        <div class="play-list-modal">
                                            <a href="../personal/play-list/all-song?idPlaylist=${l.getId()}" style="height: 100%;width: 100%;display: flex;align-items: center;">
                                                <svg class="play-list-modal-play" fill="white" height="512"
                                                     viewBox="0 0 128 128" width="512" xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z">
                                                </path>
                                                <path
                                                    d="m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z">
                                                </path>
                                                </svg>
                                            </a>
                                            <button onclick="updatePlaylist('delete', ${l.getId()})"  style="height: 100%;width: 100%;display: flex;align-items: center;">
                                                <svg class="play-list-modal-play" fill="white" id="Layer_3" height="512"
                                                     viewBox="0 0 32 32" width="512" xmlns="http://www.w3.org/2000/svg"
                                                     data-name="Layer 3">
                                                <path
                                                    d="m17.414 16 6.293-6.293a1 1 0 0 0 -1.414-1.414l-6.293 6.293-6.293-6.293a1 1 0 0 0 -1.414 1.414l6.293 6.293-6.293 6.293a1 1 0 1 0 1.414 1.414l6.293-6.293 6.293 6.293a1 1 0 0 0 1.414-1.414z" />
                                                </svg>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="play-list-des">
                                        <div class="play-list-title">
                                            <a href="../personal/play-list/all-song?idPlaylist=${l.getId()}" class="text-decoration-none">
                                                <span>${l.getName()}</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <footer class="footer">
                    <div class="footer-text">
                        <p class="text-center mb-0">© 2022 Lâm Vinh. Project PRJ301</p>
                    </div>
                </footer>
            </div>
        </div>

    </body>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
    crossorigin="anonymous"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="./assets/js/app.js"></script>
     <script>
        function updatePlaylist(type, idPlaylist) {
            $.ajax({
                type: 'POST',
                url: "../update-playlist",
                data: {
                    idPlaylist: idPlaylist,
                    idUser: ${idUser},
                    type: type
                },
                success: function (resultData) {
                    location.reload();
                    console.log("Update Playlist Complete");
                }
            })
        }
    </script>
</html>