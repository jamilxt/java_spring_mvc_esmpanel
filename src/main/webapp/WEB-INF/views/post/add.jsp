<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<!-- MAIN CONTENT OF THE PAGE -->
<div class="container">

    <h3 class="mt-3 mb-3">${ pageTitle }
        <a href="${pageContext.request.contextPath }/post/show-all"
           class="btn btn-primary float-right">Post List</a>
    </h3>

    <form:form action="${pageContext.request.contextPath }/post/add"
               modelAttribute="post"
               enctype="multipart/form-data">

        <div class="form-group">
            <label>Profile Picture</label> <br>
            <input type="file" name="files" required multiple/>
        </div>

        <div class="form-group">
            <label>Caption</label>
            <form:input path="caption" class="form-control" required="required"/>
        </div>


        <input type="submit" name="submit" value="Add"
               class="btn btn-primary btn-lg btn-block mt-5" id="btnSubmit">
    </form:form>

</div>


<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>
