

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nhạc Cá Nhân</title>
                <link rel="icon" type="image/x-icon" href="https://cdn-icons.flaticon.com/png/512/3672/premium/3672591.png?token=exp=1647801724~hmac=0d2eb5e47d9c83620f02f2bee3d77436">

        <script src="https://kit.fontawesome.com/b758da46dd.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="../assets/css/base.css">
        <link rel="stylesheet" href="./basePersonal.css">
        <link href="../assets/css/overview.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <div class="app">
            <%@include file="./headerPersonal.jsp" %>
            <div class="content">
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
                            <a href="./tong-quan" class="text-decoration-none">
                                <p class="m-0">TỔNG QUAN</p>
                            </a>
                        </li>
                        <li class="position-relative px-3  my-3 list-unstyled underline">
                            <a href="./bai-hat" class="text-decoration-none active">
                                <p class="m-0">BÀI HÁT</p>
                            </a>
                        </li>
                        <li class="position-relative px-3 my-3 list-unstyled underline">
                            <a href="./play-list" class="text-decoration-none">
                                <p class="m-0">PLAYLIST</p>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="container">
                    <div class="content_song-title">
                        <div class="content_song-left">
                            <span class="fs-2">Bài Hát</span>
                        </div>
                        <div class="content_song-right d-flex align-items-center">
                            <div class="play-all">
                                <div class="d-flex rounded-pill" id="play-ran">
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

                    <div class="list mt-3" id="list" style="height: auto">
                        <c:forEach items="${listFavorSong}" var="s">
                            <div class="chart_content-song">
                                <div class="content_song" data-id="${s.getId()}" onclick="heartTrigger(${s.getId()})">
                                    <div class="left d-flex justify-content-center align-items-center">
                                        <div class="song_image">
                                            <a href="#">
                                                <img style="height: 100%; width: 100%"
                                                     src="${s.getImage()}" alt="">
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
                                                <span>${s.getName()}</span>
                                            </div>
                                            <div class="song_des-singer">
                                                <span>${s.getSinger()}</span>
                                            </div>
                                        </div>
                                        <audio src="${s.getLink()}"></audio>
                                    </div>
                                    <div class="song_content">
                                        <span>
                                            ${s.getName()} (Single)
                                        </span>
                                    </div>
                                </div>
                                <style>
                                    .right button {
                                        padding: 0 10px;
                                    }
                                </style>
                                <div class="right me-3 position-relative" style="display: flex;width: 10%;">
                                    <button id=''>
                                        <svg onclick="updateSong('insert', ${s.getId()})" class="unliked" id="unliked" data-id="${s.getId()}"  style="height: 38px; width: 38px; ${listIdFavorSong.contains(s.getId()) ? "display: none" : ""}"
                                             fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                             xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                        </path>
                                        </svg>
                                        <svg onclick="updateSong('delete', ${s.getId()})" class="liked" id="liked" data-id="${s.getId()}" style="height: 38px; width: 38px;${listIdFavorSong.contains(s.getId()) ? " " : "display: none"}"
                                             fill="ping" height="480pt" viewBox="0 0 512 512" width="480pt"
                                             xmlns="http://www.w3.org/2000/svg" data-name="Layer 1">
                                        <path
                                            d="m449.28 121.43a115.2 115.2 0 0 0 -137.89-35.75c-21.18 9.14-40.07 24.55-55.39 45-15.32-20.5-34.21-35.91-55.39-45a115.2 115.2 0 0 0 -137.89 35.75c-16.5 21.62-25.22 48.64-25.22 78.13 0 42.44 25.31 89 75.22 138.44 40.67 40.27 88.73 73.25 113.75 89.32a54.78 54.78 0 0 0 59.06 0c25-16.07 73.08-49.05 113.75-89.32 49.91-49.42 75.22-96 75.22-138.44 0-29.49-8.72-56.51-25.22-78.13z"
                                            fill="#f9595f"></path>
                                        </svg>
                                    </button>
                                    <button onclick="addSong('insert', ${s.getId()})" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        <svg style="height: 35px;width: 40px;" fill="white" id="Layer_1"
                                             enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512"
                                             width="512" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="m418 256c0 5.523-4.477 10-10 10h-142v142c0 5.523-4.477 10-10 10s-10-4.477-10-10v-142h-142c-5.523 0-10-4.477-10-10s4.477-10 10-10h142v-142c0-5.523 4.477-10 10-10s10 4.477 10 10v142h142c5.523 0 10 4.477 10 10zm94 0c0 141.159-114.841 256-256 256s-256-114.841-256-256 114.841-256 256-256 256 114.841 256 256zm-20 0c0-130.131-105.87-236-236-236s-236 105.869-236 236 105.87 236 236 236 236-105.869 236-236z">
                                        </path>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="color: #333">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Playlist</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <ul>
                                <c:forEach items="${playlist}" var="pl">
                                    <li data-id = ${pl.getId()}>
                                        <span>${pl.getName()}</span>
                                    </li></c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            <%@include file="../footer.jsp" %>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="../assets/js/like.js" type="text/javascript"></script>
    <script src="../assets/js/app.js"></script>
    <script>
                                        var likeBtn = document.querySelector('.like-playing');
                                        var unlikeBtn = document.querySelector('.unlike-playing');
                                        function updateSong(type, idSong) {
                                            $.ajax({
                                                type: 'POST',
                                                url: "../update-song",
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
        var arr = ${listIdFavorSong};
        function heartTrigger(id) {
            if (arr.includes(id)) {
                console.log(arr.includes(id));
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
            if (type == 'unlike') {
                $('.unliked[data-id=' + id + ']').css('display', 'none')
                $('.liked[data-id=' + id + ']').css('display', 'block')
            } else {
                $('.unliked[data-id=' + id + ']').css('display', 'block')
                $('.liked[data-id=' + id + ']').css('display', 'none')
            }
        }
    </script>
</html>




