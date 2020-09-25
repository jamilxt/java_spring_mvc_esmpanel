<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<%-- if user is not logged in, redirect--%>
<%--<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
<%--    <meta http-equiv="Refresh" content="0; url=${pageContext.request.contextPath }">--%>
<%--</c:if>--%>
<body class="bg-gradient-primary">
<div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-6 d-none d-lg-block bg-login-image-my"></div>
                        <div class="col-lg-6">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                </div>
                                <form action="${pageContext.request.contextPath }/login-processing"
                                      method="POST" class="user">
                                    <div class="form-group">
                                        <input name="username"
                                               value="admin"
                                               type="text"
                                               class="form-control form-control-user"
                                               aria-describedby="emailHelp"
                                               placeholder="Username"
                                        />

                                    </div>
                                    <div class="form-group">
                                        <input
                                                type="password"
                                                class="form-control form-control-user"
                                                name="password" value="secret"
                                                placeholder="Password"
                                        />

                                    </div>
                                    <button type="submit"
                                            class="btn btn-primary btn-user btn-block">Log in
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>