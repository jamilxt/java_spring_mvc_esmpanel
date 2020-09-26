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
            <h6 class="m-0 font-weight-bold text-primary">Employee List
                <a href="${ pageContext.request.contextPath }/employee/add"
                   class="btn btn-primary btn-icon-split float-right">
                    <span class="icon text-white-50">
                      <i class="fas fa-plus"></i>
                    </span>
                    <span class="text">Register New Employee</span>
                </a></h6>
        </div>
        <div class="card-body">


            <div class="table-responsive">


                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Grade</th>
                        <th>Salary</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${ users }" var="user">
                        <tr>
                            <td>${ user.id }</td>
                            <td>${ user.username }</td>
                            <td>${ user.grade }</td>
                            <td>${ user.salary }</td>
                            <td>
                                <button class="btn btn-success btn-icon-split" data-toggle="modal"
                                        data-target="#payModalCenter${ user.id }">
                                    <span class="icon text-white-50"><i class="fas fa-dollar-sign"></i></span>
                                    <span class="text">Pay</span>
                                </button>

                                <!-- Modal -->
                                <div class="modal fade text-center" id="payModalCenter${ user.id }" tabindex="-1"
                                     role="dialog"
                                     aria-labelledby="payModalCenterTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="payModalCenterTitle">Pay Salary to
                                                    <b>${user.username}</b></h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <h1 class="font-weight-bold ">${ user.salary }<sup
                                                        class="small"><small>BDT</small></sup></h1>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-success w-100">Confirm</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </td>
                            <td>
                                <button class="btn btn-primary btn-icon-split" data-toggle="modal"
                                        data-target="#detailModalScrollable${ user.id }">
                                    <span class="icon text-white-50"><i class="fas fa-info-circle"></i></span>
                                    <span class="text">Details</span>
                                </button>

                                <!-- Modal -->
                                <div class="modal fade" id="detailModalScrollable${ user.id }" tabindex="-1"
                                     role="dialog"
                                     aria-labelledby="detailModalScrollableTitle" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-scrollable  modal-lg" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="detailModalScrollableTitle">
                                                    <b>${user.username}</b>'s Details</h5>
                                                <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary w-100"
                                                        data-dismiss="modal">
                                                    Close
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
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