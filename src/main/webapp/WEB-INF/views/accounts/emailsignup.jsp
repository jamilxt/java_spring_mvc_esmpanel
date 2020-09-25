<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<%-- if user is not logged in, redirect--%>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <meta http-equiv="Refresh" content="0; url=${pageContext.request.contextPath }">
</c:if>

<!-- MAIN CONTENT OF THE PAGE -->
<div class="container mt-5" style="max-width: 400px">
    <div class="card card-body">
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <h3 class="pt-3 text-center font-weight-bolder">instagram_clone</h3>
            <h6 class="text-center font-weight-bold pt-3 pb-3 text-muted">Sign up to see posts and videos from your
                friends.</h6>
            <c:if test="${error == 'true'}">
                <div class="alert alert-danger" role="alert" id="success-alert">Wrong username or
                    password
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath }/signup-processing"
                  method="POST">
                <div class="form-group">
                    <input
                            type="text" class="form-control"
                            placeholder="Email"
                            name="username">
                </div>
                <div class="form-group">
                    <input
                            type="text" class="form-control"
                            placeholder="Full Name"
                            name="fullname">
                </div>
                <div class="form-group">
                    <input
                            type="text" class="form-control"
                            placeholder="Username"
                            name="username">
                </div>
                <div class="form-group">
                    <input
                            type="password" class="form-control" id="exampleInputPassword1"
                            placeholder="Password" name="password">
                </div>
                <button type="submit"
                        class="btn btn-primary btn-sm btn-block">Sign up
                </button>

                <h6 class="text-muted text-center font-weight-bold mt-3">
                    By signing up, you agree to our <a href="/terms">Terms</a>, <a href="/data_policy">Data Policy</a>
                    and <a href="/cookie_policy">Cookies Policy</a>.
                </h6>
            </form>
        </c:if>
    </div>

    <div class="card card-body mt-3">
        <div class="card-text text-center">
            Have an account? <a href="${pageContext.request.contextPath }/accounts/login">Log In</a>
        </div>
    </div>
</div>

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>