package com.jamilxt.esmpanel.dtos;

import com.jamilxt.esmpanel.model.Post;
import com.jamilxt.esmpanel.model.User;

public class CommentDto {
    private String commentText;
    private Post post;
    private User user;

    public CommentDto(String commentText, Post post, User user) {
        this.commentText = commentText;
        this.post = post;
        this.user = user;
    }

    public String getCommentText() {
        return commentText;
    }

    public void setCommentText(String commentText) {
        this.commentText = commentText;
    }

    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
