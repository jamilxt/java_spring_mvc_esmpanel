<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<!-- MAIN CONTENT OF THE PAGE -->
<div class="container">

    <h3 class="mt-3 mb-3">${ pageTitle }
        <a href="${pageContext.request.contextPath }/user/show-all"
           class="btn btn-primary float-right">User List</a>
    </h3>

    <form:form action="${pageContext.request.contextPath }/user/add"
               modelAttribute="user"
               enctype="multipart/form-data">
        <div class="form-group">
            <label>Username</label> <span id="Result" align="center"></span>
            <form:input path="username" class="form-control" id="username" required="required"></form:input>
        </div>
        <div class="form-group">
            <label>Password</label>
            <form:input path="password" class="form-control" type="password" id="password"
                        required="required"></form:input>
        </div>

        <div class="form-group">
            <label>Confirm Password</label>
            <form:input path="" class="form-control" type="password" id="confirm_password"
                        required="required"></form:input>
        </div>

        <div class="form-group">
            <label>Role</label>
            <form:select class="form-control" multiple="true" path="authorityNames">
                <form:options items="${authorities}" itemLabel="authority"
                              itemValue="authority"></form:options>
            </form:select>
        </div>

        <h5 class="mt-3 mb-3">Personal Information</h5>
        <div class="form-group">
            <label>Full Name</label>
            <form:input path="fullName" class="form-control" required="required"></form:input>
        </div>

        <div class="form-check">
            <label>Gender</label><br>
            <form:radiobuttons path="gender" items="${genders}"></form:radiobuttons>
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email" class="form-control" type="email" required="required"></form:input>
        </div>


        <div class="form-group">
            <label>Date of Birth</label>
            <input class="form-control" type="text" id="datepicker" required="required" name="dob_f"/>
        </div>

        <div class="form-group">
            <label>Profile Picture</label> <br>
            <input type="file" name="file"/>
        </div>

        <input type="submit" name="submit" value="Add"
               class="btn btn-primary btn-lg btn-block mt-5" id="btnSubmit" disabled="true">
    </form:form>

</div>

<script>
    var password = document.getElementById("password")
        , confirm_password = document.getElementById("confirm_password");

    function validatePassword() {
        if (password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Password doesn't match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;

</script>


<script type="text/javascript">
    $(document).ready(function () {
        $('#username').focusout(function () {
            $.get("/user/is_available", {
                username: $('#username').val()
            }, function (response) {
                $('#Result').fadeOut();
                setTimeout("finishAjax('Result', '" + escape(response) + "')", 400);
            });
            return false;
        });
    });

    function finishAjax(id, response) {
        $('#Result').hide();
        if (response === "true") {
            $('#btnSubmit').prop('disabled', false);
            response = "<span class='badge badge-success'>" + "Available" + "</div>";
        } else {
            $('#btnSubmit').prop('disabled', true);
            response = "<span class='badge badge-danger'>" + "Unavailable" + "</div>";
        }
        $('#' + id).html(unescape(response));
        $('#' + id).fadeIn();

    }
</script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(function () {
        $("#datepicker").datepicker({
            dateFormat: "yy-mm-dd"
        });
    });
</script>


<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>
