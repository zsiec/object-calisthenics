class RecruiterJobManager < UserJobManager
  def post_job name, type
    job = create_job name, type
    @jobs.push RecruiterPostedJob.new job_params(job)
    job
  end

  def posted_jobs
    job_list RecruiterPostedJob
  end

  def search_posted_jobs filters
    APPLIED_JOBS.search_subset posted_jobs, filters
  end

  private

  def create_job name, type
    Job.new name: name, type: type
  end

  def valid?
    return true if @user.is_a?(Recruiter)
  end
end
