<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- HEADER -->
<jsp:include page="../common/header.jsp"/>

<!-- MAIN CONTENT OF THE PAGE -->
<div class="container mt-4">

    <%--    ${postId}--%>

    <div class="card">
        <div class="card-body p-0">
            <div class="row">

                <div class="col-8 pr-0">
                    <div id="post_1_carouselExampleIndicators" class="carousel slide" data-ride="false"
                         data-wrap="false">
                        <c:if test="${fn:length(singlePost.images) > 1}">

                            <ol class="carousel-indicators text-primary">
                                <li data-target="#post_1_carouselExampleIndicators" data-slide-to="0"
                                    class="active"></li>

                                <c:if test="${fn:length(singlePost.images) > 1}">
                                    <c:forEach items="${singlePost.images}" begin="1" var="image" varStatus="loop">
                                        <li data-target="#post_1_carouselExampleIndicators"
                                            data-slide-to="${loop.index}"></li>
                                    </c:forEach>
                                </c:if>
                            </ol>
                        </c:if>

                        <div class="carousel-inner" style="height: 400px;">
                            <div class="carousel-item active">
                                <img class="d-block w-100 h-100" src="/images/${singlePost.images[0]}"
                                     alt="First slide">
                            </div>
                            <c:if test="${fn:length(singlePost.images) > 1}">
                                <c:forEach items="${singlePost.images}" begin="1" var="image">
                                    <div class="carousel-item">
                                        <img class="d-block w-100  h-100" src="/images/${image}" alt="Second slide">
                                    </div>
                                </c:forEach>
                                <%--                                <div class="carousel-item">--%>
                                <%--                                    <img class="d-block w-100  h-100" src="/images/img2.jpg" alt="Third slide">--%>
                                <%--                                </div>--%>
                            </c:if>
                        </div>
                        <c:if test="${fn:length(singlePost.images) > 1}">

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
                        </c:if>
                    </div>

                    <div class="card-footer bg-white">

                        <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/">
                            <i class="fa fa-1x fa-share text-muted nav-item"></i>
                        </a>

                        <a class="btn ml-3 btn-outline-danger" href="${pageContext.request.contextPath}/">
                            <i class="fa fa-1x fa-bookmark text-muted nav-item"></i>
                            <%--                            <i class="fa fa-1x fa-bookmark text-primary nav-item"></i>--%>
                        </a>

                        <a class="btn btn-light disabled float-right ml-3 " href="">
                            <i class="fa fa-1x fa-comment text-muted nav-item"></i> <span
                                id="totalCommentCounter">${totalComments}</span>
                        </a>

                        <a class="btn btn-outline-danger float-right" href="${pageContext.request.contextPath}/">
                            <i class="fa fa-1x fa-heart text-muted nav-item"></i>
                            <%--                            <i class="fa fa-1x fa-heart text-danger nav-item"></i>--%>
                            <span class="text-dark ml-1">0</span>
                        </a>

                    </div>
                </div>
                <div class="col-4 m-0 pl-0 border-left">
                    <div class="card-header bg-white pr-0">
                        <a href="/${singlePost.user.username}"
                           class="font-weight-bold text-dark">
                            <img src="/images/${singlePost.user.propic}"
                                 class="rounded-circle border border-light align-middle mr-3"
                                 width="30px" height="30px">
                        </a>
                        <a href="/${singlePost.user.username}"
                           class="font-weight-bold text-dark">
                            ${singlePost.user.username}
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

                        <button type="button" class="btn btn-outline-danger float-right" data-toggle="modal"
                                data-target="#post_1_options">
                            <i class="fa fa-1x fa-ellipsis-h text-muted nav-item"></i>
                        </button>
                    </div>

                    <div class="addScroll" id="comment_section">

                        <%-- Caption --%>
                        <div class="row card-body pb-0">
                            <div class="col-1 mr-3">
                                <a href="/${singlePost.user.username}"
                                   class="font-weight-bold text-dark">
                                    <img src="/images/${singlePost.user.propic}"
                                         class="rounded-circle border border-light align-middle"
                                         width="30px" height="30px">
                                </a>
                            </div>
                            <div class="col">
                                <a href="/${singlePost.user.username}"
                                   class="font-weight-bold text-dark">
                                    ${singlePost.user.username}
                                </a> <span id="captionText">${singlePost.caption}</span>
                                <h6 class="small text-muted mt-2">${postedAt}</h6>
                            </div>
                        </div>

                        <%-- Comments --%>
                        <%--                        <c:forEach items="${comments}" var="comment">--%>

                        <%--                            <div class="row card-body pb-0">--%>

                        <%--                                <div class="col-1 mr-3">--%>
                        <%--                                    <a href="/${comment.username}"--%>
                        <%--                                       class="font-weight-bold text-dark">--%>
                        <%--                                        <img src="/images/${comment.propic}"--%>
                        <%--                                             class="rounded-circle border border-light align-middle"--%>
                        <%--                                             width="30px" height="30px">--%>
                        <%--                                    </a>--%>
                        <%--                                </div>--%>
                        <%--                                <div class="col">--%>
                        <%--                                    <a href="/${comment.username}"--%>
                        <%--                                       class="font-weight-bold text-dark">--%>
                        <%--                                            ${comment.username}--%>
                        <%--                                    </a> ${comment.commentText}--%>
                        <%--                                    <h6 class="small text-muted mt-2">${comment.created_at}</h6>--%>
                        <%--                                </div>--%>

                        <%--                            </div>--%>

                        <%--                        </c:forEach>--%>

                        <c:if test="${totalComments > 10}">
                            <div id="load_data_message" class="text-center mt-3">
                                <button class="btn btn-outline-light" id="loadMore"><i
                                        class="fa fa-1x fa-plus-square text-muted nav-item"></i>
                                </button>
                            </div>
                        </c:if>

                        <div id="load_comments" class="pb-3"></div>


                    </div>

                    <%--  Add Comment --%>
                    <div class="card-footer bg-white">
                        <div class="row">
                            <div class="col-9">
                                <input placeholder="Add a comment" class="form-text form-control border-0 small pl-0"
                                       type="text" id="commentText">
                            </div>
                            <div class="col-3">
                                <input type="submit" value="Post" class="btn btn-secondary text-center" id="postComment"
                                       disabled>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="card card-body border border-danger  mt-5">
        <h6 class="text-secondary font-weight-bold">More posts from <a href="/jamilxt">jamilxt</a></h6>

        <div class="row">
            <div class="col-4"> gallery from profile page
            </div>
        </div>
    </div>

</div>

<script>
    pageCounter = 0;
    postId = ${singlePost.postId};
    haveMore = false;
    loadComments(postId, pageCounter);

    function loadComments(postId, page) {
        $.getJSON("/api/v1/post/comments?postId=" + postId + "&page=" + page, function (data) {
            var comment_data = '';
            $.each(data.reverse(), function (key, value) { // reverse array for last comment
                comment_data += '<div class="row card-body pb-0 commentDiv" id="commentId' + value.commentId + '">';
                comment_data += '<div class="col-1 mr-3">';
                comment_data += '<a href="/' + value.username + '" class="font-weight-bold text-dark">';
                comment_data += '<img src="/images/' + value.propic + '" class="rounded-circle border border-light align-middle float-left" width="30px" height="30px">';
                comment_data += '</a></div>';
                comment_data += '<div class="col">';
                comment_data += '<a href="/' + value.username + '" class="font-weight-bold text-dark">' + value.username + '</a>';
                comment_data += ' ' + value.commentText + ' ';
                comment_data += '<h6 class="small text-muted mt-2">' + value.created_at + '</h6>';
                comment_data += '</div></div>';
            });

            $('#load_comments').prepend(comment_data);
            if (data.length > 9) {
                haveMore = true;
            } else {
                haveMore = false;
            }
        });

        pageCounter = pageCounter + 1;
    }

    $('#loadMore').on('click', function () {
        if (haveMore) {
            loadComments(postId, pageCounter);
            $('.commentDiv').fadeIn();
        } else {
            $('#load_data_message').html('<div class="card-header small text-center">End of comments</div>');
        }
    });


    // $('#comment_section').on('scroll', function () {
    //     let div = $(this).get(0);
    //     if (div.scrollTop + div.clientHeight >= div.scrollHeight) {
    //         if (haveMore) {
    //             loadComments(postId, pageCounter);
    //         } else {
    //             $('#load_data_message').html('<div class="card-header small text-center">End of comments</div>');
    //         }
    //     }
    // });

    // gotoBottomOfCommentSection();

    function gotoBottomOfCommentSection() {
        var scroll = $('#comment_section');
        scroll.animate({scrollTop: scroll.height() + 600}, 1500);
    }

    $('#postComment').on('click', function () {
        addComment();
    });


    var cmntText = $('#commentText');

    function addComment() {
        $.post("/api/v1/post/comments/add", {
            postId: ${singlePost.postId},
            commentText: cmntText.val(),
        }, function (data, status) {
            cmntText.val('');
            console.log(data + ' ' + status);
            var last_comment = '';

            last_comment += '<div class="row card-body pb-0 bg-light" id="commentId' + data.commentId + '">';
            last_comment += '<div class="col-1 mr-3">';
            last_comment += '<a href="/' + data.username + '" class="font-weight-bold text-dark">';
            last_comment += '<img src="/images/' + data.propic + '" class="rounded-circle border border-light align-middle float-left" width="30px" height="30px">';
            last_comment += '</a></div>';
            last_comment += '<div class="col">';
            last_comment += '<a href="/' + data.username + '" class="font-weight-bold text-dark">' + data.username + '</a>';
            last_comment += ' ' + data.commentText + ' ';
            last_comment += '<h6 class="small text-muted mt-2">' + data.created_at + '</h6>';
            last_comment += '</div></div>';

            $('#load_comments').append(last_comment);
            $('#totalCommentCounter').html(data.totalComments);
            var cmntId = "#commentId" + data.commentId;
            $(cmntId).removeClass('bg-light', 3000).fadeIn();
            gotoBottomOfCommentSection();
        });
    }

    cmntText.on('keyup', function () {
        var buttonDisabled = cmntText.val().trim() === '';
        $('#postComment').prop('disabled', buttonDisabled);
    });

    cmntText.on('keypress', function (e) {
        if (cmntText.val().trim().length > 0) {
            if (e.which === 13) {
                addComment();
            }
        }
    });


    var caption = $('#captionText');
    var captionValue = caption.text();
    console.log(captionValue);
    var captionRegex = captionValue.replace(/#(\S*)/g, '<a href="/explore/tags/$1">#$1</a>');
    captionRegex = captionRegex.replace(/@(\S*)/g, '<a href="/$1">@$1</a>');
    caption.html(captionRegex);

    console.log(captionRegex);


</script>


<!-- FOOTER -->
<jsp:include page="../common/footer.jsp"/>