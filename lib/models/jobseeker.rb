class Jobseeker < User
  def initialize(options)
    @user_job_manager = UserJobManager.new jobseeker: self
    super options
  end

  def apply_to(job)
    @user_job_manager.apply_to(job)
  end

  def applied_jobs
    @user_job_manager.applied_jobs
  end
  
  def save(job)
    @user_job_manager.save(job)
  end

  def saved_jobs
    @user_job_manager.saved_jobs
  end
end
