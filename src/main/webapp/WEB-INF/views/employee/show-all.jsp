<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Employee List</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
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
                            <td>${ user.id }</td>
                            <td><img class="img-responsive" width="60px"
                                     src="${pageContext.request.contextPath }/images/${user.propic}"></td>
                            <td>${ user.username }</td>
                            <td><c:forEach items="${user.authorities}" var="authority">
                                <div>${authority.authority}</div>
                            </c:forEach></td>
                            <td></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>