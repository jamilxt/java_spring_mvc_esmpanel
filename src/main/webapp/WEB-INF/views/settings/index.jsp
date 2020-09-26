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

        <div class="col-lg-4">

            <!-- Collapsable Card Example -->
            <div class="card shadow mb-4">
                <!-- Card Header - Accordion -->
                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button"
                   aria-expanded="true" aria-controls="collapseCardExample">
                    <h6 class="m-0 font-weight-bold text-primary">Bank Details</h6>
                </a>
                <!-- Card Content - Collapse -->
                <div class="collapse show" id="collapseCardExample">
                    <div class="card-body">
                        This is a collapsable card example using Bootstrap's built in collapse functionality. <strong>Click
                        on the card header</strong> to see the card body collapse and expand!
                    </div>
                </div>
            </div>

        </div>

        <div class="col-lg-4">

            <!-- Collapsable Card Example -->
            <div class="card shadow mb-4">
                <!-- Card Header - Accordion -->
                <a href="#collapseCardExample2" class="d-block card-header py-3" data-toggle="collapse" role="button"
                   aria-expanded="true" aria-controls="collapseCardExample">
                    <h6 class="m-0 font-weight-bold text-primary">Salary Configuration</h6>
                </a>
                <!-- Card Content - Collapse -->
                <div class="collapse show" id="collapseCardExample2">
                    <div class="card-body">

                        Basic salary of the lowest grade

                        <form:form action="${ pageContext.request.contextPath }/settings"
                                   modelAttribute="setting" method="post">

                            <form:input path="id" value="${fieldId}" hidden="hidden"/>
                            <form:input path="attribute" value="${attributeName}" hidden="hidden"/>
                            <div class="form-group">
                                <form:input path="value"
                                            placeholder="Basic salary of the lowest grade"
                                            class="form-control form-control-user"
                                            value="${attributeValue}"/>
                            </div>

                            <button type="submit"
                                    class="btn btn-primary btn-user btn-block">Update
                            </button>
                        </form:form>

                        <%--<form action="${pageContext.request.contextPath }/settings"--%>
                        <%--      method="POST" class="user" modelAttribute="setting">--%>
                        <%--    <div class="form-group">--%>
                        <%--        <input name="lowest_grade_basic_salary"--%>
                        <%--               value="${lowest_grade_basic_salary}"--%>
                        <%--               type="number"--%>
                        <%--               class="form-control form-control-user"--%>
                        <%--               placeholder="Basic salary of the lowest grade"--%>
                        <%--               required/>--%>

                        <%--    </div>--%>
                        <%--    <button type="submit"--%>
                        <%--            class="btn btn-primary btn-user btn-block">Update--%>
                        <%--    </button>--%>
                        <%--</form>--%>

                    </div>
                </div>
            </div>

        </div>

    </div>

</div>
<!-- /.container-fluid -->

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>