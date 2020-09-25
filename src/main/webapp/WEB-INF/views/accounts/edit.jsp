<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<style>
    .nav-pills .nav-link {
        border-radius: 0;
        color: #a0a0a0;
    }

    .nav-pills .nav-link.active {
        color: black;
        border-left: 2px solid;
        background: none;
    }
</style>

<!-- MAIN CONTENT OF THE PAGE -->
<div class="container mt-4 card card-body">

    <%--    <h3 class="mt-3 mb-3">${ pageTitle }</h3>--%>

    <div class="row">
        <div class="col-3 border-right">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link " id="v-pills-edit-profile-tab" data-toggle="pill" href="#v-pills-home"
                   role="tab"
                   aria-controls="v-pills-home" aria-selected="true">Edit Profile</a>
                <a class="nav-link active" id="v-pills-change-password-tab" data-toggle="pill" href="#v-pills-profile"
                   role="tab"
                   aria-controls="v-pills-profile" aria-selected="false">Change Password</a></div>
        </div>
        <div class="col-9">
            <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade " id="v-pills-home" role="tabpanel"
                     aria-labelledby="v-pills-home-tab">...
                </div>
                <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">

                    <h3 class="mb-3">Password</h3>
                    <form:form action="${pageContext.request.contextPath }/change_password">
                        <div class="form-group">
                            <label>Old Password</label>
                            <input name="password" class="form-control" type="password"/>
                        </div>
                        <div class="form-group">
                            <label>New Password</label>
                            <input name="new_password" class="form-control" type="password"/>
                        </div>
                        <div class="form-group">
                            <label>Confirm New Password</label>
                            <input path="confirm_new_password" class="form-control" type="password"/>
                        </div>

                        <input type="submit" name="submit" value="Change Password"
                               class="btn btn-primary btn-lg btn-block">
                    </form:form>

                </div>
                <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                    ...
                </div>
                <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                    ...
                </div>
            </div>
        </div>
    </div>

</div>

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>