class Recruiter < User
  def initialize(options={})
    @recruiter_job_manager = RecruiterJobManager.new user: self
    super options
  end

  def post_job name
    @recruiter_job_manager.post_job name
  end

  def posted_jobs
    @recruiter_job_manager.posted_jobs
  end
end
