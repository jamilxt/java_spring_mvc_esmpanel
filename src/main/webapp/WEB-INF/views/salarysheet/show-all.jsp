<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<!-- Begin Page Content -->
<div class="container-fluid">


    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Salary Sheet</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Paid Date</th>
                        <th>Amount</th>
                        <sec:authorize access="hasRole('ADMIN')">
                            <th>To</th>
                        </sec:authorize>
                    </tr>
                    </thead>
                    <tbody>
                    <sec:authorize access="hasRole('ADMIN')">
                        <c:forEach items="${ salarysheets }" var="salarysheet">
                            <tr>
                                <td>${ salarysheet.id }</td>
                                <td>${ salarysheet.payDate }</td>
                                <td>${ salarysheet.amount }</td>
                                <td>${ salarysheet.username }</td>
                            </tr>
                        </c:forEach>
                    </sec:authorize>
                    <sec:authorize access="hasRole('EMPLOYEE')">
                        <c:forEach items="${ salarysheetsMy }" var="salarysheetMy">
                            <tr>
                                <td>${ salarysheetMy.id }</td>
                                <td>${ salarysheetMy.payDate }</td>
                                <td>${ salarysheetMy.amount }</td>
                            </tr>
                        </c:forEach>
                    </sec:authorize>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>