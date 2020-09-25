package com.jamilxt.esmpanel.repositories;

import com.jamilxt.esmpanel.model.Authority;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface AuthorityRepository extends JpaRepository<Authority, Long> {
    Authority findByAuthority(String authority);
}
