use JobNex;
CREATE TABLE resume_analyzer (
    analysis_id INT PRIMARY KEY auto_increment,
    resume_text longtext,
    jd_text longtext not null,
    match_score DECIMAL(5,2),
    matched_skills TEXT,
    missing_skills TEXT,
    suggestions TEXT,
    related_jobs TEXT,
    learning_paths TEXT,
    resume_tips TEXT not null,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    apply_count INT DEFAULT 0,
    per_company INT DEFAULT 0,
    job_location VARCHAR(255),
    apply_platform VARCHAR(100),
    response_status VARCHAR(100),
    applied_company_det TEXT,
    interview_suggestions TEXT,
    experience_level VARCHAR(50)
);

select*from resume_analyzer;