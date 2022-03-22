<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="./dash-board">
        <div class="sidebar-brand-icon rotate-n-15">
            <img style="width: 100%" src="https://cdn-icons.flaticon.com/png/512/3672/premium/3672591.png?token=exp=1647801724~hmac=0d2eb5e47d9c83620f02f2bee3d77436">
        </div>
        <div class="sidebar-brand-text mx-3">MusicPlayer - ADMIN</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="./dash-board">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Interface
    </div>

    <!-- Nav Item - Pages Collapse Menu -->

    <!-- Nav Item - Utilities Collapse Menu -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
           aria-expanded="true" aria-controls="collapseUtilities">
            <i class="fas fa-fw fa-wrench"></i>
            <span>Utilities</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
             data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item" href="./add-music">Add Music</a>
                <a class="collapse-item" href="./add-playlist">Add Playlist</a>
                <a class="collapse-item" href="./update-song">Update Music</a>
                <a class="collapse-item" href="./update-playlist">Update Playlist</a>
                <a class="collapse-item" href="./add-song-playlist">Update Songs Playlist</a>
            </div>
        </div>
    </li>


    <!-- Nav Item - Tables -->
    <li class="nav-item">
        <a class="nav-link" href="./all-song">
            <i class="fas fa-fw fa-table"></i>
            <span>All Songs</span></a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="./all-playlist">
            <i class="fas fa-fw fa-table"></i>
            <span>All Playlist</span>
        </a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>