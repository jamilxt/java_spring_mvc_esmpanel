<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<!-- MAIN CONTENT OF THE PAGE -->
<div class="container">

    <h3 class="mt-3 mb-3">${ pageTitle }
        <a href="${pageContext.request.contextPath }/user/add"
           class="btn btn-primary float-right">Add User</a>
    </h3>

    <table class="table table-bordered">
        <thead class="thead-light">
        <tr>
            <th>ID</th>
            <th>Profile Picture</th>
            <th>Username</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ users }" var="user">
            <tr>
                <th>${ user.id } </th>
                <th>
                    <img class="img-responsive" width="60px"
                         src="${pageContext.request.contextPath }/images/${user.propic}">
                </th>
                <th>${ user.username }</th>
                <th>
                    <c:forEach items="${user.authorities}" var="authority">
                        <div>${authority.authority}</div>
                    </c:forEach>
                </th>
                    <%--                <th>--%>
                    <%--                    <a href="edit?userId=${ user.id }"--%>
                    <%--                       class="btn btn-success">Change Password</a> <br><br>--%>
                    <%--                    <a href="edit?userId=${ user.id }"--%>
                    <%--                       class="btn btn-warning">Change Role</a><br><br>--%>


                    <%--                    <a href="delete?userId=${ user.id }"--%>
                    <%--                       class="btn btn-danger" onclick="return confirm('Are you sure?');">Delete</a>--%>
                    <%--                </th>--%>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>