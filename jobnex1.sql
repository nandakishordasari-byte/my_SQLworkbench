create database JobNex;
CREATE TABLE jobnex1 (
    user_id INT PRIMARY KEY,
    resume_text TEXT,
    jd_text TEXT,
    match_score DECIMAL(5,2),
    matched_skills TEXT,
    missing_skills TEXT,
    suggestions TEXT,
    related_jobs TEXT,
    learning_paths TEXT,
    resume_tips TEXT,
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
select * from jobnex1;