
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./header.jsp" %>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <%@include file="./sideBar.jsp" %>

        <div id="content-wrapper" class="d-flex flex-column">

            <div id="content">

                <%@include file="./topBar.jsp" %>
                <div class="container-fluid">
                    <h1 class="h3 mb-1 text-gray-800">Update Playlist</h1>
                    <p class="mb-4">You can update Playlist by id</p>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Update Playlist</h6>
                                </div>
                                <div class="card-body">
                                    <c:if test="${list.size() == 0}">
                                        <form action="update-playlist?id=${l.getId()}" method="GET">
                                            <label for="id">Input ID Playlist You Want To Update:</label>
                                            <input type="text" class="form-control" id="id" name="id" placeholder="Input id of Playlist" >
                                            <input type="submit" class="btn btn-primary" value="SEARCH">
                                        </form>
                                    </c:if>
                                    <c:forEach items="${list}" var="l">
                                        <form action="update-playlist?id=${l.getId()}" method="POST">
                                            <label for="name">Name of Playlist</label>
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Input name of playlist" value="${l.getName()}">
                                            <label for="image">Image</label>
                                            <input type="text" class="form-control" id="image" name="image" placeholder="Input link image:" value="${l.getLink()}">
                                            <br>
                                            <input type="submit" class="btn btn-primary" value="UPDATE">
                                        </form>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <!-- Second Column -->


                    </div>

                </div>

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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>