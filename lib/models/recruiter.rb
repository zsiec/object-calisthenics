class Recruiter < User
  def initialize(options={})
    @recruiter_job_manager = RecruiterJobManager.new user: self
    super options
  end

  def post_job name, type
    @recruiter_job_manager.post_job name, JobType.new(type)
  end

  def posted_jobs
    @recruiter_job_manager.posted_jobs
  end
end
