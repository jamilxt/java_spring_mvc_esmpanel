<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <%--<meta charset="ISO-8859-1">--%>
    <%--<title></title>--%>
    <%--<link rel="stylesheet"--%>
    <%--      href="${ pageContext.request.contextPath }/css/bootstrap.min.css"/>--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.css"/>--%>
    <%--<link rel="stylesheet"--%>
    <%--      href="${ pageContext.request.contextPath }/css/main.css"/>--%>

    <%--<link rel="stylesheet"--%>
    <%--      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>--%>

    <%--<script--%>
    <%--        src="https://code.jquery.com/jquery-3.4.1.min.js"--%>
    <%--        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="--%>
    <%--        crossorigin="anonymous"></script>--%>

    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.js"></script>--%>

    <%--<script--%>
    <%--        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"--%>
    <%--        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"--%>
    <%--        crossorigin="anonymous"></script>--%>
    <%--<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>--%>


    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content=""/>
    <meta name="author" content=""/>

    <title>${ pageTitle }</title>

    <!-- Custom fonts for this template-->
    <link
            href="${ pageContext.request.contextPath }/vendor/fontawesome-free/css/all.css"
            rel="stylesheet"
            type="text/css"
    />

    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="${ pageContext.request.contextPath }/css/sb-admin-2.min.css" rel="stylesheet"/>
    <link href="${ pageContext.request.contextPath }/css/style.css" rel="stylesheet"/>
</head>
<sec:authorize access="!isAuthenticated()">
<body class="bg-gradient-primary">
</sec:authorize>

<sec:authorize access="isAuthenticated()">
<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <!-- Sidebar -->
    <ul
            class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
            id="accordionSidebar"
    >
        <!-- Sidebar - Brand -->
        <a
                class="sidebar-brand d-flex align-items-center justify-content-center"
                href="/"
        >
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-laugh-wink"></i>
            </div>
            <div class="sidebar-brand-text mx-3">ESMPanel <sup>v1</sup></div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0"/>

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
            <a class="nav-link" href="/">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a
            >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider"/>

        <!-- Heading -->
        <div class="sidebar-heading">Employee</div>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="${ pageContext.request.contextPath }/employee">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Employee List</span></a
            >
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${ pageContext.request.contextPath }/salary-sheet">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Salary Sheet</span></a
            >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider"/>

        <!-- Heading -->
        <div class="sidebar-heading">Settings</div>

        <!-- Nav Item - Tables -->
        <li class="nav-item">
            <a class="nav-link" href="${ pageContext.request.contextPath }/settings">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Global</span></a
            >
        </li>

        <li class="nav-item">
            <a class="nav-link" href="${ pageContext.request.contextPath }/settings/bank-details">
                <i class="fas fa-fw fa-wrench"></i>
                <span>Bank Details</span></a
            >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block"/>

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
            <!-- Topbar -->
            <nav
                    class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
            >
                <!-- Sidebar Toggle (Topbar) -->
                <button
                        id="sidebarToggleTop"
                        class="btn btn-link d-md-none rounded-circle mr-3"
                >
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                    <%--<form--%>
                    <%--        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"--%>
                    <%-->--%>
                    <%--    <div class="input-group">--%>
                    <%--        <input--%>
                    <%--                type="text"--%>
                    <%--                class="form-control bg-light border-0 small"--%>
                    <%--                placeholder="Search for..."--%>
                    <%--                aria-label="Search"--%>
                    <%--                aria-describedby="basic-addon2"--%>
                    <%--        />--%>
                    <%--        <div class="input-group-append">--%>
                    <%--            <button class="btn btn-primary" type="button">--%>
                    <%--                <i class="fas fa-search fa-sm"></i>--%>
                    <%--            </button>--%>
                    <%--        </div>--%>
                    <%--    </div>--%>
                    <%--</form>--%>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="searchDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                        >
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div
                                class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown"
                        >
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input
                                            type="text"
                                            class="form-control bg-light border-0 small"
                                            placeholder="Search for..."
                                            aria-label="Search"
                                            aria-describedby="basic-addon2"
                                    />
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>

                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="userDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                        >
                  <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                  >
                      <b><sec:authentication property="principal.username"/></b>
                    <small class="badge-info pl-2 pr-2"><sec:authorize access="hasRole('ADMIN')">(ADMIN)</sec:authorize>
                    <sec:authorize
                            access="hasRole('EMPLOYEE')">(EMPLOYEE)</sec:authorize> </small><br>
                        Balance: <b class="text-success">${balance}</b>
                  </span>
                            <img
                                    class="img-profile rounded-circle"
                                    src="${ pageContext.request.contextPath }/images/${authUser.propic}"
                            />
                        </a>
                        <!-- Dropdown - User Information -->
                        <div
                                class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown"
                        >
                                <%--<a class="dropdown-item" href="#">--%>
                                <%--    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>--%>
                                <%--    Settings--%>
                                <%--</a>--%>

                                <%--<div class="dropdown-divider"></div>--%>
                            <a
                                    class="dropdown-item"
                                    href="#"
                                    data-toggle="modal"
                                    data-target="#logoutModal"
                            >
                                <i
                                        class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"
                                ></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- End of Topbar -->
            </sec:authorize>
            <%--<sec:authorize access="isAuthenticated()">--%>
            <%--<nav class="navbar navbar-expand navbar-light bg-white border-bottom">--%>
            <%--    <div class="container">--%>

            <%--        <a class="navbar-brand pl-3 font-weight-bold text-secondary" href="${pageContext.request.contextPath }/">instagram_clone</a>--%>

            <%--        <input type="text" id="search_data" placeholder="Search" autocomplete="off"--%>
            <%--               class="form-control w-25 shadow-none"/>--%>

            <%--        <ul class="navbar-nav">--%>

            <%--            <li class="nav-item ml-3">--%>
            <%--                    &lt;%&ndash;                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/">&ndash;%&gt;--%>
            <%--                    &lt;%&ndash;                <button type="button" class="btn btn-outline-danger" data-toggle="modal"&ndash;%&gt;--%>
            <%--                    &lt;%&ndash;                        data-target="#imageUpload">&ndash;%&gt;--%>
            <%--                    &lt;%&ndash;                    <i class="fa fa-1x fa-plus text-muted nav-item"></i>&ndash;%&gt;--%>
            <%--                    &lt;%&ndash;                </button>&ndash;%&gt;--%>

            <%--                <a href="/post/add" class="btn btn-outline-success">Post Images</a>--%>
            <%--                    &lt;%&ndash;                </a>&ndash;%&gt;--%>
            <%--            </li>--%>

            <%--            <!-- Modal -->--%>
            <%--            <div class="modal fade" id="imageUpload" tabindex="-1" role="dialog"--%>
            <%--                 aria-labelledby="exampleModalCenterTitle" aria-hidden="true">--%>
            <%--                <div class="modal-dialog modal-dialog-centered" role="document">--%>
            <%--                    <div class="modal-content">--%>
            <%--                        <div class="modal-header">--%>
            <%--                            <h5 class="modal-title" id="exampleModalLongTitle">Post New Image</h5>--%>
            <%--                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
            <%--                                <span aria-hidden="true">&times;</span>--%>
            <%--                            </button>--%>
            <%--                        </div>--%>
            <%--                        <div class="modal-body">--%>
            <%--                                &lt;%&ndash;                            <p><input type="file" accept="image/*" name="image" id="file" onchange="loadFile(event)"&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                                      style="display: none;"></p>&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                            <p>&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                                <label for="file" style="cursor: pointer;">&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                                    <img id="output" class="card-img"/>&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                                </label>&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                            </p>&ndash;%&gt;--%>

            <%--                                &lt;%&ndash;                            <script>&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                                var loadFile = function (event) {&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                                    var image = document.getElementById('output');&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                                    image.src = URL.createObjectURL(event.target.files[0]);&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                                };&ndash;%&gt;--%>
            <%--                                &lt;%&ndash;                            </script>&ndash;%&gt;--%>
            <%--                        </div>--%>
            <%--                    </div>--%>
            <%--                </div>--%>
            <%--            </div>--%>

            <%--            <li class="nav-item ml-3">--%>
            <%--                <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/">--%>
            <%--                    <i class="fa fa-1x fa-home text-muted nav-item"></i>--%>
            <%--                </a>--%>
            <%--            </li>--%>

            <%--            <li class="nav-item ml-3">--%>

            <%--                <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/explore">--%>
            <%--                    <i class="fa fa-1x fa-compass text-muted nav-item"></i>--%>
            <%--                </a>--%>
            <%--            </li>--%>

            <%--            <li class="nav-item ml-3">--%>

            <%--                <div class="dropdown">--%>
            <%--                    <a class="btn btn-outline-danger" href="#" role="button" id="dropdownMenuLink"--%>
            <%--                       data-toggle="dropdown"--%>
            <%--                       aria-haspopup="true" aria-expanded="false">--%>
            <%--                        <i class="fa fa-1x fa-heart-o text-muted nav-item"></i>--%>
            <%--                    </a>--%>

            <%--                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">--%>


            <%--                    </div>--%>
            <%--                </div>--%>

            <%--                    &lt;%&ndash;                <a href="${pageContext.request.contextPath}">&ndash;%&gt;--%>
            <%--                    &lt;%&ndash;                    <i class="fa fa-2x fa-heart-o text-muted nav-item"></i>&ndash;%&gt;--%>
            <%--                    &lt;%&ndash;                </a>&ndash;%&gt;--%>
            <%--            </li>--%>

            <%--            <li class="nav-item ml-3">--%>

            <%--                <a href="${pageContext.request.contextPath}/<sec:authentication property="principal.username"/>"--%>
            <%--                   class="btn btn-outline-light">--%>
            <%--                    <img src="${pageContext.request.contextPath}/images/${authUser.propic}"--%>
            <%--                         class="rounded-circle border border-light align-middle "--%>
            <%--                         width="26px" height="26px">--%>
            <%--                </a>--%>
            <%--            </li>--%>
            <%--        </ul>--%>

            <%--    </div>--%>
            <%--</nav>--%>
            <%--</sec:authorize>--%>
