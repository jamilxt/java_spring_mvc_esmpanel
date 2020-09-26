<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Settings</h1>
    </div>

    <div class="row">

        <div class="col-lg-6">

            <!-- Collapsable Card Example -->
            <div class="card shadow mb-4">
                <!-- Card Header - Accordion -->
                <a href="#collapseCardExample2" class="d-block card-header py-3" data-toggle="collapse" role="button"
                   aria-expanded="true" aria-controls="collapseCardExample">
                    <h6 class="m-0 font-weight-bold text-primary">Bank Details</h6>
                </a>
                <!-- Basic Salary of the lowest Grade -->
                <div class="collapse show" id="collapseCardExample2">
                    <div class="card-body">

                        Fill out with proper information carefully <br><br>

                        <form:form action="${ pageContext.request.contextPath }/settings/bank"
                                   modelAttribute="bankAccount" method="post">

                            <form:input path="id" value="${bankAccount.id}" hidden="hidden"/>
                            <%--                            <form:input path="user" value="${bankAccount.user}" hidden="hidden"/>--%>
                            <div class="form-group">
                                <form:input path="bankName"
                                            type="text"
                                            placeholder="Bank Name"
                                            class="form-control form-control-user"
                                            value="${bankAccount.bankName}" required="required"/>
                            </div>

                            <div class="form-group">
                                <form:input path="branchName"
                                            type="text"
                                            placeholder="Branch Name"
                                            class="form-control form-control-user"
                                            value="${bankAccount.branchName}" required="required"/>
                            </div>

                            <div class="form-group">
                                <form:input path="accountName"
                                            type="text"
                                            placeholder="Account Name"
                                            class="form-control form-control-user"
                                            value="${bankAccount.accountName}" required="required"/>
                            </div>

                            <div class="form-group">
                                <form:input path="accountNumber"
                                            type="text"
                                            placeholder="Account Number"
                                            class="form-control form-control-user"
                                            value="${bankAccount.accountNumber}" required="required"/>
                            </div>

                            <div class="form-group">
                                <form:input path="accountType"
                                            type="text"
                                            placeholder="Account Type"
                                            class="form-control form-control-user"
                                            value="${bankAccount.accountType}" required="required"/>
                            </div>

                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Balance: </span>
                                </div>

                                <form:input path="currentBalance"
                                            type="number"
                                            placeholder="Account Balance"
                                            class="form-control form-control-user"
                                            value="${bankAccount.currentBalance}" required="required"
                                            readonly="true"/>
                                <sec:authorize access="hasRole('ADMIN')">
                                    <div class="input-group-append">
                                        <button class="btn btn-success" type="button" data-toggle="modal"
                                                data-target="#rechargeModalCenter">Recharge
                                        </button>
                                    </div>

                                    <!-- Modal -->
                                    <div class="modal fade text-center" id="rechargeModalCenter" tabindex="-1"
                                         role="dialog"
                                         aria-labelledby="rechargeModalCenterTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="rechargeModalCenterTitle">Recharge to
                                                        your <b>account</b></h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <h1 class="font-weight-bold ">
                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text">BDT: </span>
                                                            </div>
                                                            <input type="number" min="1" class="form-control"
                                                                   required="required" placeholder="Enter your amount">
                                                        </div>
                                                    </h1>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-success w-100">Recharge
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </sec:authorize>
                            </div>

                            <button type="submit"
                                    class="btn btn-primary btn-user btn-block">Update
                            </button>
                        </form:form>

                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
<!-- /.container-fluid -->

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>