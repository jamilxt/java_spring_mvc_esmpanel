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
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Name</th>
                        <th>Position</th>
                        <th>Office</th>
                        <th>Age</th>
                        <th>Start date</th>
                        <th>Salary</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <tr>
                        <td>Tiger Nixon</td>
                        <td>System Architect</td>
                        <td>Edinburgh</td>
                        <td>61</td>
                        <td>2011/04/25</td>
                        <td>$320,800</td>
                    </tr>
                    <tr>
                        <td>Garrett Winters</td>
                        <td>Accountant</td>
                        <td>Tokyo</td>
                        <td>63</td>
                        <td>2011/07/25</td>
                        <td>$170,750</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<%--<!-- MAIN CONTENT OF THE PAGE -->--%>
<%--<div class="container">--%>

<%--    <h3 class="mt-3 mb-3">${ pageTitle }--%>
<%--        <a href="${pageContext.request.contextPath }/employee/add"--%>
<%--           class="btn btn-primary float-right">Add Employee</a>--%>
<%--    </h3>--%>

<%--    <table class="table table-bordered">--%>
<%--        <thead class="thead-light">--%>
<%--        <tr>--%>
<%--            <th>ID</th>--%>
<%--            <th>Profile Picture</th>--%>
<%--            <th>Username</th>--%>
<%--            <th>Role</th>--%>
<%--            <th>Action</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <c:forEach items="${ users }" var="user">--%>
<%--            <tr>--%>
<%--                <th>${ user.id } </th>--%>
<%--                <th>--%>
<%--                    <img class="img-responsive" width="60px"--%>
<%--                         src="${pageContext.request.contextPath }/images/${user.propic}">--%>
<%--                </th>--%>
<%--                <th>${ user.username }</th>--%>
<%--                <th>--%>
<%--                    <c:forEach items="${user.authorities}" var="authority">--%>
<%--                        <div>${authority.authority}</div>--%>
<%--                    </c:forEach>--%>
<%--                </th>--%>
<%--                    &lt;%&ndash;                <th>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <a href="edit?userId=${ user.id }"&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                       class="btn btn-success">Change Password</a> <br><br>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                    <a href="edit?userId=${ user.id }"&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                       class="btn btn-warning">Change Role</a><br><br>&ndash;%&gt;--%>


<%--                    &lt;%&ndash;                    <a href="delete?userId=${ user.id }"&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                       class="btn btn-danger" onclick="return confirm('Are you sure?');">Delete</a>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;                </th>&ndash;%&gt;--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>
<%--    </table>--%>

<%--</div>--%>

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>