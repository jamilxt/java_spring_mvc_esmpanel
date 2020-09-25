<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<!-- MAIN CONTENT OF THE PAGE -->
<div class="container">

    <h3 class="mt-3 mb-3">${ pageTitle }
        <a href="${pageContext.request.contextPath }/post/add"
           class="btn btn-primary float-right">Add Post</a>
    </h3>

    <table class="table table-bordered text-center">
        <thead class="thead-light">
        <tr>
            <th>ID</th>
            <th>Photo</th>
            <th>Caption</th>
            <th>User</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ posts.content }" var="post">
            <tr>
                <th>${ post.postId } </th>
                <th>
                        ${fn:length(post.images)}
                    <img class="img-responsive" width="200px"
                         src="${pageContext.request.contextPath }/images/${post.images[0]}">
                </th>
                <th>${ post.caption }</th>
                <th>
                    <a href="${pageContext.request.contextPath }/${ post.user.username }">
                            ${ post.user.username }
                    </a>
                </th>
                <th>
                    <a href="/p/${ post.postId }"
                       class="btn btn-success">View</a>
                    <a href="edit?id=${ post.postId }"
                       class="btn btn-warning">Edit</a>
                    <a href="delete?id=${ post.postId }"
                       class="btn btn-danger" onclick="return confirm('Are you sure?');">Delete</a>
                </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <h6 class="text-muted text-right mb-3">Total Pages: ${posts.totalPages}</h6>

    <c:if test="${posts.totalElements > 0}">
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-end">
                <li class="page-item ${posts.first ? 'disabled' : ''}">
                    <a class="page-link" href="?page=${posts.number - 1}" tabindex="-1">Previous</a>
                </li>
                <c:forEach begin="${0}" end="${posts.totalPages - 1}" var="p">
                    <li class="page-item ${posts.number == p ? 'active' : ''}">
                        <a class="page-link" href=" ?page=${p}">${p+1}</a>
                    </li>
                </c:forEach>
                <li class="page-item ${posts.last ? 'disabled' : ''}">
                        <%--                    ${param.username}--%>
                    <a class="page-link"
                       href="?page=${posts.number + 1}${!empty param.username ? '&username='.concat(param.username) : ''}">Next</a>
                </li>
            </ul>
        </nav>
    </c:if>
</div>

<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>