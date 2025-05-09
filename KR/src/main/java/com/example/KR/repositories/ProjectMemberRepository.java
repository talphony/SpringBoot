package com.example.KR.repositories;

import com.example.KR.models.Project;
import com.example.KR.models.ProjectMember;
import com.example.KR.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;



public interface ProjectMemberRepository
        extends JpaRepository<ProjectMember, ProjectMember.ProjectMemberId> {

    List<ProjectMember> findByProject(Project project);
    List<ProjectMember> findByUser(User user);
    List<ProjectMember> findByProjectAndUser(Project project, User user);
    boolean existsByProjectAndUser(Project project, User user);


    @Modifying
    @Query
    void deleteByProjectAndUser(@Param("project") Project project, @Param("user") User user);

}