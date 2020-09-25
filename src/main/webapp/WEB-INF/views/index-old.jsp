<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- GLOBAL HEADER -->
<jsp:include page="common/header.jsp"/>


<div id="load_data"></div>
<div id="load_data_message"></div>

<noscript>
    $(document).ready(function () {

    var limit = 1;
    var start = 0;
    var action = 'inactive';

    function lazzy_loader(limit) {
    var output = '';
    for (var count = 0; count < limit; count++) {
    output += '
    <%--    <div class="post_data">';--%>
    <%--        output += '<p><span class="content-placeholder" style="width:100%; height: 30px;">&nbsp;</span></p>';--%>
    <%--        output += '<p><span class="content-placeholder" style="width:100%; height: 100px;">&nbsp;</span></p>';--%>
    <%--        output += '--%>
    <%--    </div>--%>
    ';
    }
    $('#load_data_message').html(output);
    }

    lazzy_loader(limit);

    function load_data(limit, start) {
    $.ajax({
    url: "/api/v1/post/comments",
    method: "GET",
    data: {limit: limit, start: start, postId: 5, page: start},
    cache: false,
    success: function (data) {
    if (data === '') {
    $('#load_data_message').html('<h3>No More Result Found</h3>');
    action = 'active';
    } else {
    console.log(data);
    $('#load_data').append(data);
    $('#load_data_message').html("");
    action = 'inactive';
    }
    }
    })
    }

    if (action === 'inactive') {
    action = 'active';
    load_data(limit, start);
    }

    $(window).scroll(function () {
    if ($(window).scrollTop() + $(window).height() > $("#load_data").height() && action === 'inactive') {
    lazzy_loader(limit);
    action = 'active';
    start = start + limit;
    setTimeout(function () {
    load_data(limit, start);
    }, 1000);
    }
    });

    });
</noscript>

<%--<div class="row card-body pb-0">--%>
<%--    <div class="col-1 mr-3">--%>
<%--        <a href="/${comment.username}" class="font-weight-bold text-dark">--%>
<%--            <img src="/images/${comment.propic}" class="rounded-circle border border-light align-middle" width="30px"--%>
<%--                 height="30px">--%>
<%--        </a>--%>
<%--    </div>--%>
<%--    <div class="col">--%>
<%--        <a href="/${comment.username}" class="font-weight-bold text-dark"> ${comment.username}</a>--%>
<%--        ${comment.commentText}--%>
<%--        <h6 class="small text-muted mt-2">${comment.created_at}</h6>--%>
<%--    </div>--%>
<%--</div>--%>

<script>
pageCounter = 0;
postId = 5;
haveMore = false;
loadComments(postId, pageCounter);

function loadComments (postId, page) {
  $.getJSON("/api/v1/post/comments?postId=" + postId + "&page=" + page, function (data) {
    var comment_data = '';
    $.each(data, function (key, value) {
      comment_data += '<div class="row card-body pb-0">';
      comment_data += '<div class="col-1 mr-3">';
      comment_data += '<a href="/' + value.username + '" class="font-weight-bold text-dark">';
      comment_data += '<img src="/images/' + value.propic + '" class="rounded-circle border border-light align-middle" width="30px" height="30px">';
      comment_data += '</a></div>';
      comment_data += '<div class="col">';
      comment_data += '<a href="/' + value.username + '" class="font-weight-bold text-dark">' + value.username + '</a>';
      comment_data += value.commentText;
      comment_data += '<h6 class="small text-muted mt-2">' + value.created_at + '</h6>';
      comment_data += '</div></div>';
    });

    $('#load_comments').append(comment_data);
    if (data.length > 9) {
      haveMore = true;
    } else {
      haveMore = false;
    }
  });

  pageCounter = pageCounter + 1;
}

$(window).scroll(function () {
  if ($(window).scrollTop() + $(window).height() >= $('#load_data').height()) {
    //Your code here
    if (haveMore) {
      loadComments(postId, pageCounter);
    } else {
      $('#load_data_message').html('<h3>End of comments</h3>');
    }
  }
});

</script>

<!-- MAIN CONTENT OF THE PAGE -->
<div class="container  mt-4">


    <div class="row">

        <div class="col-8">

            <%-- POST 1 --%>
            <div class="card border-danger">
                <div class="card-body p-0">

                    <div class="p-3">
                        <a href="${pageContext.request.contextPath}/<sec:authentication property="principal.username" />"
                           class="font-weight-bold text-dark">
                            <img src="${pageContext.request.contextPath}/images/${authUser.propic}"
                                 class="rounded-circle border border-light align-middle mr-2"
                                 width="30px" height="30px">
                        </a>
                        <a href="${pageContext.request.contextPath}/<sec:authentication property="principal.username" />"
                           class="font-weight-bold text-dark">
                            ${authUser.username}
                        </a>

                        <!-- Post Options -->
                        <div class="modal fade" id="post_1_options" tabindex="-1" role="dialog"
                             aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="list-group text-center" style="font-size: 16px">
                                        <a href="/accounts/edit"
                                           class="list-group-item list-group-item-action text-danger font-weight-bold">
                                            Report Inappropriate
                                        </a>
                                        <a href="/accounts/edit"
                                           class="list-group-item list-group-item-action text-danger font-weight-bold">
                                            Unfollow
                                        </a>
                                        <a href="/accounts/edit" class="list-group-item list-group-item-action">
                                            Go to post
                                        </a>
                                        <a href="/logout" class="list-group-item list-group-item-action">
                                            Share
                                        </a>
                                        <a href="/logout" class="list-group-item list-group-item-action">
                                            Copy Link
                                        </a>
                                        <a href="/logout" class="list-group-item list-group-item-action">
                                            Share
                                        </a>
                                        <button class="list-group-item list-group-item-action" data-dismiss="modal">
                                            Cancel
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <button type="button" class="btn btn-outline-light float-right" data-toggle="modal"
                                data-target="#post_1_options">
                            <i class="fa fa-1x fa-ellipsis-h text-muted nav-item"></i>
                        </button>


                    </div>


                    <%--                    <img src="/images/course_cover.jpg" width="" class="w-100 card-img"/>--%>
                    <div id="post_1_carouselExampleIndicators" class="carousel slide" data-ride="false"
                         data-wrap="false">
                        <ol class="carousel-indicators text-primary">
                            <li data-target="#post_1_carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#post_1_carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#post_1_carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner" style="height: 400px">
                            <div class="carousel-item active">
                                <img class="d-block w-100 h-100" src="/images/course_cover.jpg" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100  h-100" src="/images/img1.jpg" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100  h-100" src="/images/img2.jpg" alt="Third slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#post_1_carouselExampleIndicators" role="button"
                           data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#post_1_carouselExampleIndicators" role="button"
                           data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                    <div class="p-3">

                        <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/">
                            <%--                            <i class="fa fa-1x fa-heart text-muted nav-item"></i>--%>
                            <i class="fa fa-1x fa-heart text-danger nav-item"></i> <span class="text-dark ml-1">1</span>
                        </a>

                        <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/">
                            <i class="fa fa-1x fa-comment text-muted nav-item"></i>
                        </a>

                        <a class="btn btn-outline-light" href="${pageContext.request.contextPath}/">
                            <i class="fa fa-1x fa-share text-muted nav-item"></i>
                        </a>

                        <a class="btn btn-outline-light float-right" href="${pageContext.request.contextPath}/">
                            <i class="fa fa-1x fa-bookmark text-muted nav-item"></i>
                            <%--                            <i class="fa fa-1x fa-bookmark text-primary nav-item"></i>--%>
                        </a>

                    </div>

                    <div class="pl-3 pr-3 ">

                        <div>
                            <a href="${pageContext.request.contextPath}/<sec:authentication property="principal.username" />"
                               class="font-weight-bold text-dark">
                                ${authUser.username}
                            </a> This is a caption
                        </div>

                        <div id="post_1_comments">

                            <div>
                                <a href="jamilxt"
                                   class="font-weight-bold text-dark">
                                    jamilxt
                                </a> comment 1
                            </div>

                            <div>
                                <a href="jamilxt"
                                   class="font-weight-bold text-dark">
                                    jamilxt
                                </a> comment 1
                            </div>


                            <%--                            <a class="btn btn-outline-light float-right" href="${pageContext.request.contextPath}/">--%>
                            <%--                                <i class="fa fa-sm fa-heart text-muted nav-item"></i>--%>
                            <%--                            </a>--%>
                        </div>

                        <div class="text-muted text-uppercase mt-1 mb-2 small">
                            4 DAYS AGO
                        </div>
                    </div>

                    <div class=""></div>

                </div>

                <div class="card-footer bg-white">

                    <div class="row">
                        <div class="col-10">
                        <textarea placeholder="Add a comment" class="form-text form-control border-0 small pl-0"
                                  rows="1"></textarea>
                        </div>
                        <div class="col-2">
                            <input type="submit" value="Post" class="btn btn-light text-center w-100">
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="col-4">

            <div class="">
                <a href="${pageContext.request.contextPath}/<sec:authentication property="principal.username" />"
                   class="font-weight-bold text-dark">
                    <img src="${pageContext.request.contextPath}/images/${authUser.propic}"
                         class="rounded-circle border border-light align-middle mr-2"
                         width="50px" height="50px">
                </a>
                <a href="${pageContext.request.contextPath}/<sec:authentication property="principal.username" />"
                   class="font-weight-bold">
                    ${authUser.username}
                </a>

            </div>

            <div class="card mt-3 border-danger">
                <div class="card-body">

                    <h6 class="font-weight-bold text-muted small">Stories</h6>

                </div>
            </div>

            <div class="card mt-3 border-danger">
                <div class="card-body">

                    <h6 class="font-weight-bold text-muted small">Suggestions For You</h6>

                </div>
            </div>

            <div class="text-muted mt-3">
                <span class="small"> © 2020 INSTAGRAM-CLONE FROM JAMILXT</span>
            </div>

        </div>

    </div>

</div>


<!-- GLOBAL FOOTER -->
<jsp:include page="common/footer.jsp"/>