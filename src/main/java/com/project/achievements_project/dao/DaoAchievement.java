package com.project.achievements_project.dao;

import com.project.achievements_project.entity.Achievement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface DaoAchievement extends JpaRepository<Achievement, String> {
}
