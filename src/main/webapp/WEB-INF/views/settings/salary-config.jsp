<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                    <h6 class="m-0 font-weight-bold text-primary">Salary Configuration</h6>
                </a>
                <!-- Basic Salary of the lowest Grade -->
                <div class="collapse show" id="collapseCardExample2">
                    <div class="card-body">

                        Basic salary of the lowest grade <br><br>

                        <form:form action="${ pageContext.request.contextPath }/settings/salary"
                                   modelAttribute="setting" method="post">

                            <form:input path="id" value="${fieldId}" hidden="hidden"/>
                            <form:input path="attribute" value="${attributeName}" hidden="hidden"/>
                            <div class="form-group">
                                <form:input path="value"
                                            type="number"
                                            placeholder="Basic salary of the lowest grade"
                                            class="form-control form-control-user"
                                            value="${attributeValue}" required="required"/>
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