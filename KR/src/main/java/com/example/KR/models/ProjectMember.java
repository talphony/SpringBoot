package com.example.KR.models;
import com.example.KR.models.enums.ProjectRole;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.time.LocalDateTime;


@Entity
@Table(name = "project_members")
@Data
@AllArgsConstructor
@NoArgsConstructor
@IdClass(ProjectMember.ProjectMemberId.class)
public class ProjectMember {

    @Id
    @ManyToOne
    @JoinColumn(name = "project_id")
    private Project project;

    @Id
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "ENUM('DEVELOPER', 'TESTER', 'MANAGER', 'ADMIN')")
    private ProjectRole role;

    private LocalDateTime joinedAt = LocalDateTime.now();

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ProjectMemberId implements Serializable {
        private long  project;
        private long  user;
    }
}


