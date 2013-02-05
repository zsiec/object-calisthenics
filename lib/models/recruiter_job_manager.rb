class RecruiterJobManager < UserJobManager
  def post_job name
    job = Job.new(name: name)
    @jobs.push RecruiterPostedJob.new job_params(job)
  end

  def posted_jobs
    job_list RecruiterPostedJob
  end

  private

  def valid?
    return true if @user.is_a?(Recruiter)
  end
end
