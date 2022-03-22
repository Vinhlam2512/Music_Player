
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./header.jsp" %>
<style>
    #dataTable tr td{
        white-space: nowrap; overflow: hidden !important; text-overflow: ellipsis;
    }
    #dataTable tr button{
        background-color: transparent;
        border: none;
    }
    .modal-body ul{
        padding-left: 0;
    }
    .modal-body ul li{
        word-wrap: normal;
        text-align: center;
        list-style: none;
        cursor: pointer;
        font-size: 20px;
        padding: 10px 0 ;
        margin-bottom: 10px;
    }
    .modal-body ul li:hover{
        color: #fff;
        background-color: #456bd9;
    }
</style>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@include file="./sideBar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <%@include file="./topBar.jsp" %>

                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">All Songs</h1>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Songs</h6>
                        </div>
                        <div style="padding: 0.75rem 1.25rem">
                            <label>Search Songs:<input oninput="searchSong(this)" style="width: 400px;" type="text" class="form-control form-control-sm"></label>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <tr class="text-center">
                                        <th style=" width: 5%">ID</th>
                                        <th style=" width: 25%">Name</th>
                                        <th style=" width: 25%">Singer</th>
                                        <th style=" width: 15%">Image</th>
                                        <th style=" width: 5%">Song</th>
                                        <th style=" width: 15%">Options</th>
                                        <th style=" width: 10%">Playlist</th>
                                    </tr>
                                    <c:forEach items="${list}" var="l">
                                        <tr class="text-center">
                                            <td>${l.getId()}</td>
                                            <td>${l.getName()}</td>
                                            <td>${l.getSinger()}</td>
                                            <td><img src="${l.getImage()}" style="width: 100px; height: 100px"></td>
                                            <td><button onclick="preview(this.getAttribute('data-src'))" data-src="${l.getLink()}">Preview</button>
                                            </td>
                                            <th><button onclick="update(${l.getId()})">Update</button><button onclick="isConfirm(${l.getId()})">Delete</button></th>
                                            <th>
                                                <button onclick="addSong('insert', ${l.getId()})" data-bs-toggle="modal" data-bs-target="#exampleModal">Add</button>
                                                <button onclick="addSong('delete', ${l.getId()})" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete</button>
                                            </th>
                                        </tr>
                                    </c:forEach>
                                    <audio src=""></audio>
                                </table>
                            </div>
                            <nav aria-label="Page navigation example" id="paginaton">
                                <ul class="pagination">
                                    <c:forEach begin="1" end="${pageNumber}" var="i">
                                        <li class="page-item"><a class="page-link" href="all-song?index=${i}" style="${i == index ? "background-color: red" : ""}">${i}</a></li>
                                        </c:forEach>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Playlist</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <ul>
                            <c:forEach items="${playlist}" var="pl">
                                <li data-id = ${pl.getId()}>
                                    <span>${pl.getName()}</span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Page Wrapper -->
        <script>
            function addSong(type, idSong) {
                var li = document.querySelectorAll('.modal-body ul li');
                for (let i = 0; i < li.length; i++) {
                    li[i].onclick = function () {
                        $.ajax({
                            type: 'POST',
                            url: "./update-song-playlist",
                            data: {
                                idSong: idSong,
                                idPlaylist: li[i].getAttribute('data-id'),
                                type: type,
                            },
                            success: function (resultData) {
                                alert("Update SuccessFul");
                            }
                        })
                    }
                }
            }

        </script>

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->


        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
                integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
                integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>
        <script>
            var audio = document.querySelector('audio');
            function preview(src) {
                console.log('Preview');
                audio.setAttribute('src', src);
                audio.play();
                setTimeout(function () {
                    audio.pause();
                }, 20000);
            }
        </script>
        <script>
            function searchSong(e) {
                $.ajax({
                    type: 'GET',
                    url: "./searchAjax",
                    data: {
                        id: 1,
                        search: e.value,
                    },
                    success: function (resultData) {
                        if (e.value != '') {
                            $('#dataTable').html(resultData);
                            $('#paginaton').css('display', 'none');
                        } else {
                            $('#dataTable').html(`<tr class="text-center">
                                            <th style=" width: 5%">ID</th>
                                        <th style=" width: 25%">Name</th>
                                        <th style=" width: 25%">Singer</th>
                                        <th style=" width: 15%">Image</th>
                                        <th style=" width: 5%">Song</th>
                                        <th style=" width: 15%">Options</th>
                                        <th style=" width: 10%">Playlist</th>
                                        </tr>
            <c:forEach items="${list}" var="l">
                                            <tr class="text-center">
                                                <td>${l.getId()}</td>
                                                <td>${l.getName()}</td>
                                                <td>${l.getSinger()}</td>
                                                <td><img src="${l.getImage()}" style="width: 100px; height: 100px"></td>
                                                <td><button onclick="preview(this.getAttribute('data-src'))" data-src="${l.getLink()}">Preview</button>
                                                </td>
                                                <th><button onclick="update(${l.getId()})">Update</button><button onclick="isConfirm(${l.getId()})">Delete</button></th>
                                                <th><button>Add</button></th>
                                            </tr>
            </c:forEach>
                                        <audio src=""></audio>`);
                            $('#paginaton').css('display', 'block');
                        }
                        console.log("search Complete");
                    }
                });
            }
        </script>
        <<script>
            function update(id) {
                window.location.href = './update-song?id=' + id;
            }
        </script>
        <script>
            function isConfirm(id) {
                var check = confirm("Do you want to delete?");
                if (check === true) {
                    window.location.href = "./delete-song?id=" + id;
                }
            }
        </script>

</body>

</html>