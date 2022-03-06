

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Nhạc Cá Nhân</title>
        <script src="https://kit.fontawesome.com/b758da46dd.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
        <link rel="stylesheet" href="../assets/css/base.css">
        <link rel="stylesheet" href="./basePersonal.css">
        <link href="../assets/css/songs.css" rel="stylesheet" type="text/css"/>
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
                <div class="content_song">
                    <div class="container">
                        <div class="content_song-title">
                            <div class="content_song-left">
                                <span class="fs-2">Bài Hát</span>
                            </div>
                            <div class="content_song-right d-flex align-items-center">
                                <div class="play-all">
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
                        <div class="d-flex justify-content-between mb-3 mt-5"
                             style="border-bottom: 1px solid hsla(0,0%,100%,0.05); padding-bottom: 20px">
                            <span style="width: 10%;">
                                BÀI HÁT
                            </span>
                            <span>
                                CA SĨ
                            </span>
                            <span>
                            </span>
                        </div>
                        <div class="list mt-3" id="list">
                            <div class="list-item mb-3 mt-2">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item mb-3">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item mb-3">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item mb-3">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item mb-3">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item mb-3">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item mb-3">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item mb-3">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="list-item mb-3">
                                <div class="media">
                                    <div class="media-left d-flex align-items-center" style="width: 40%;">
                                        <div class="media-left-thumbnail" style="width: 120px;">
                                            <a href="">
                                                <img src="https://avatar-ex-swe.nixcdn.com/song/2022/02/10/2/a/7/7/1644475457323_500.jpg"
                                                     alt="">
                                            </a>
                                        </div>
                                        <div class="media-left-title">
                                            <span>Chạy Về Nơi Phía Anh</span>
                                        </div>
                                    </div>
                                    <div class="media-center">
                                        <div class="media-center-singer">
                                            <span>Khắc Việt</span>
                                        </div>
                                    </div>
                                    <div class="media-right">
                                        <button>
                                            <svg fill="white" height="480pt" viewBox="0 -20 480 480" width="480pt"
                                                 xmlns="http://www.w3.org/2000/svg">
                                            <path
                                                d="m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0">
                                            </path>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file="../footer.jsp" %>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <script src="./assets/js/app.js"></script>

</html>




