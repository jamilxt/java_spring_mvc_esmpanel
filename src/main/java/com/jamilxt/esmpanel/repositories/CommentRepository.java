package com.jamilxt.esmpanel.repositories;

import com.jamilxt.esmpanel.model.Comment;
import com.jamilxt.esmpanel.model.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    int countCommentsByPost(Post post);

    Page<Comment> findByPost(Post post, Pageable pageable);

}
