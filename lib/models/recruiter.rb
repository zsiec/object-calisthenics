class Recruiter < User
  def initialize(options={})
    @recruiter_job_manager = RecruiterJobManager.new user: self
    super options
  end

  def post_job name, type
    @recruiter_job_manager.post_job name, JobType.new(type)
  end

  def jobseekers_applied_to_job job
    search_posted_jobs job: job, return_type: :user
  end

  def jobseekers_applied_on_date date
    search_posted_jobs created_on: date, return_type: :user
  end

  def jobseekers_applied_to_job_on_date job, date
    search_posted_jobs job: job, created_on: date, return_type: :user
  end

  def posted_jobs
    @recruiter_job_manager.posted_jobs
  end

  private

  def search_posted_jobs filters
    @recruiter_job_manager.search_posted_jobs filters
  end
end
