class Jobseeker < User
  def initialize(options={})
    @jobseeker_job_manager = JobseekerJobManager.new user: self
    @resume = options.try(:[], :resume)
    super options
  end

  def apply_to(job)
    @jobseeker_job_manager.apply_to(job, @resume)
  end

  def applied_jobs
    @jobseeker_job_manager.applied_jobs
  end
  
  def save(job)
    @jobseeker_job_manager.save(job)
  end

  def saved_jobs
    @jobseeker_job_manager.saved_jobs
  end
end
