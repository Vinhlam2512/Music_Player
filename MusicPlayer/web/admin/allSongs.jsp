
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
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                                                                                   href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div style="padding: 0.75rem 1.25rem">
                            <label>Search:<input oninput="searchSong(this)" style="width: 400px;" type="text" class="form-control form-control-sm"></label>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <tr class="text-center">
                                        <th style=" width: 25%">Name</th>
                                        <th style=" width: 25%">Singer</th>
                                        <th style=" width: 15%">Image</th>
                                        <th style=" width: 5%">Song</th>
                                        <th style=" width: 25%">Options</th>
                                        <th style=" width: 5%"></th>
                                    </tr>
                                    <c:forEach items="${list}" var="l">
                                        <tr class="text-center">
                                            <td>${l.getName()}</td>
                                            <td>${l.getSinger()}</td>
                                            <td><img src="${l.getImage()}" style="width: 100px; height: 100px"></td>
                                            <td><button onclick="preview(this.getAttribute('data-src'))" data-src="${l.getLink()}">Preview</button>
                                            </td>
                                            <th><button onclick="update(${l.getId()})">Update</button><button onclick="isConfirm(${l.getId()})">Delete</button></th>
                                            <th><button>Add</button></th>
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

    </div>
    <!-- End of Page Wrapper -->

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
                    search: e.value,
                },
                success: function (resultData) {
                    if (e.value != '') {
                        $('#dataTable').html(resultData);
                        $('#paginaton').css('display', 'none');
                    } else {
                        $('#dataTable').html(`<tr class="text-center">
                                        <th style=" width: 25%">Name</th>
                                        <th style=" width: 25%">Singer</th>
                                        <th style=" width: 15%">Image</th>
                                        <th style=" width: 5%">Song</th>
                                        <th style=" width: 25%">Options</th>
                                        <th style=" width: 5%"></th>
                                    </tr>
        <c:forEach items="${list}" var="l">
                                        <tr class="text-center">
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