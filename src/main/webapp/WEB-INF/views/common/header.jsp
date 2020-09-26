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

        <sec:authorize access="hasRole('ADMIN')">
            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="${ pageContext.request.contextPath }/employee">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Employee List</span></a
                >
            </li>
        </sec:authorize>

        <li class="nav-item">
            <a class="nav-link" href="${ pageContext.request.contextPath }/salary-sheet">
                <i class="fas fa-fw fa-wrench"></i>
                <span><sec:authorize access="hasRole('EMPLOYEE')">My </sec:authorize>Salary Sheet</span></a
            >
        </li>

        <li class="nav-item">
            <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
               aria-controls="collapseTwo">
                <i class="fas fa-fw fa-cog"></i>
                <span>Settings</span>
            </a>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar"
                 style="">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Customize:</h6>
                    <a class="collapse-item" href="${ pageContext.request.contextPath }/settings/bank">Bank Details</a>

                    <sec:authorize access="hasRole('ADMIN')">
                        <a class="collapse-item" href="${ pageContext.request.contextPath }/settings/salary">Salary
                            Config</a>
                    </sec:authorize>
                </div>
            </div>
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
                    <small class="badge-info pl-2 pr-2"><sec:authorize access="hasRole('ADMIN')">ADMIN</sec:authorize>
                    <sec:authorize
                            access="hasRole('EMPLOYEE')">EMPLOYEE</sec:authorize> </small><br>
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
