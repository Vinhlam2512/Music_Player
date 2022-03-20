
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./header.jsp" %>
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

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-1 text-gray-800">Add Song</h1>
                    <p class="mb-4">You can add Song via file in your computer or via link</p>
                    <div class="row">

                        <!-- First Column -->
                        <div class="col-lg-6">

                            <!-- Custom Text Color Utilities -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Add Song Via Link</h6>
                                </div>
                                <div class="card-body">
                                    <form action="add-music" method="POST">
                                        <label for="name">Name of Song</label>
                                        <input type="text" class="form-control" id="name" name="name" placeholder="Input name of songs:">
                                        <label for="singer">Singer</label>
                                        <input type="text" class="form-control" id="singer" name="singer" placeholder="Input name of singer:">
                                        <label for="type">Type: <select name="type">
                                                <c:forEach items="${list}" var="l">
                                                    <option value="${l.getId()}">${l.getName()}</option>
                                                </c:forEach>
                                            </select></label><br>
                                        <label for="image">Image</label>
                                        <input type="text" class="form-control" id="image" name="image" placeholder="Input link image:">
                                        <label for="link">Link audio</label>
                                        <input type="text" class="form-control" id="link" name="link" placeholder="Input link audio:">
                                        <input type="submit" class="btn btn-primary" value="ADD">
                                    </form>
                                </div>
                            </div>

                        </div>

                        <!-- Second Column -->
                        <div class="col-lg-6">

                            <!-- Background Gradient Utilities -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Add Song Via File
                                    </h6>
                                </div>
                                <div class="card-body">
                                    <form action="">
                                        <label for="name">Name of Song</label>
                                        <input disabled type="text" class="form-control" id="name" name="name"
                                               placeholder="Input name of songs:">
                                        <label for="singer">Singer</label>
                                        <input disabled type="text" class="form-control" id="singer" name="singer"
                                               placeholder="Input name of singer:">
                                        <label for="image">Image</label>
                                        <input disabled type="file" class="form-control" id="image" name="image"
                                               placeholder="Input link image:">
                                        <label for="link">Link audio</label>
                                        <input disabled type="file" class="form-control" id="link" name="link"
                                               placeholder="Input link audio:">
                                        <input disabled type="submit" class="btn btn-primary" value="ADD">
                                    </form>
                                </div>
                            </div>

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