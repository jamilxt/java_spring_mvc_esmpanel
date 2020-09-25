package com.jamilxt.esmpanel.controllers;

import com.jamilxt.esmpanel.dtos.CommentDto;
import com.jamilxt.esmpanel.model.Post;
import com.jamilxt.esmpanel.model.User;
import com.jamilxt.esmpanel.request.CommentRequest;
import com.jamilxt.esmpanel.request.PostRequest;
import com.jamilxt.esmpanel.service.BaseService;
import com.jamilxt.esmpanel.service.PostService;
import com.jamilxt.esmpanel.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1")
public class RestPostController extends BaseService {
    final PostService postService;
    final UserService userService;

    public RestPostController(PostService postService, UserService userService) {
        this.postService = postService;
        this.userService = userService;
    }

    @PostMapping("/post/comments/add")
    public ResponseEntity<?> addNewComment(@RequestParam(name = "postId") long postId, @RequestParam(name = "commentText") String commentText) {

        Post post = postService.singlePost(postId).get();
//        User user = (User) userService.loadUserByUsername("jamilxt");
        CommentRequest commentRequest = postService.addComment(new CommentDto(commentText, post, getLoggedInUser()));
        commentRequest.setTotalComments(postService.totalCommentsOfPost(post));
//        CommentRequest commentRequest = postService.addComment(new CommentDto(commentText, post, user));

        return new ResponseEntity<>(commentRequest, HttpStatus.OK);

    }

    @GetMapping("/post/comments")
    public List<CommentRequest> getCommentsByPost(@RequestParam(name = "postId") long postId, @RequestParam(value = "page") Optional<Integer> page,
                                                  @RequestParam(value = "sortBy") Optional<String> sortBy) {

        Post post = postService.singlePost(postId).get();
        return postService.getCommentByPost(post, page, sortBy);

    }

    @GetMapping("/posts")
    public List<PostRequest> getPostsByUser(@RequestParam(name = "username") String username, @RequestParam(value = "page") Optional<Integer> page,
                                            @RequestParam(value = "sortBy") Optional<String> sortBy) {
        User user = (User) userService.loadUserByUsername(username);
        return postService.getPostByUserRest(user, page, sortBy);
    }
}
