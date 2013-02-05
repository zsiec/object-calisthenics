class UserJobs
  def initialize
    @user_jobs = []
  end

  def add_job job
    @user_jobs.push job
  end
  
  def search_all filters
    run_filters_and_return @user_jobs, filters
  end

  def search_subset jobs, filters={}
    subset = @user_jobs.select {|user_job| jobs.include? user_job.job }
    run_filters_and_return subset, filters
  end

  private

  def run_filters_and_return user_jobs, filters
    user_jobs = filter_user_jobs user_jobs, filters
    return_by_type user_jobs, filters[:return_type]
  end

  def return_by_type user_job_subset, return_type
    return user_job_subset unless return_type 
    user_job_subset.map {|applied_job| applied_job.send(return_type)}
  end

  def filter_user_jobs user_jobs, filters
    user_jobs = run_filter(user_jobs, :created_on_filter, filters[:created_on]) if filters[:created_on]
    user_jobs = run_filter(user_jobs, :job_filter, filters[:job]) if filters[:job]
    user_jobs = run_filter(user_jobs, :user_filter, filters[:user]) if filters[:user]
    user_jobs
  end

  def run_filter user_jobs, type, item
    user_jobs.select {|user_job| send(type, user_job, item)}
  end

  def user_filter user_job, user; user_job.belongs_to?(user) end
  def created_on_filter user_job, day; user_job.created_on?(day) end
  def job_filter user_job, job; user_job.for_job?(job) end
end
