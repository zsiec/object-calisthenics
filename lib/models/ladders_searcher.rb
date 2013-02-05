class LaddersSearcher
  def jobseekers_applied_on_date date
    APPLIED_JOBS.search_all created_on: date, return_type: :user
  end

  def applications_by_job job
    APPLIED_JOBS.search_all job: job
  end

  def applications_by_recruiter recruiter
    APPLIED_JOBS.search_subset POSTED_JOBS.search_all(user: recruiter, return_type: :job)
  end
end
