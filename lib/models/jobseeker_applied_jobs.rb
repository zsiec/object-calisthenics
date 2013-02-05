class JobseekerAppliedJobs
  def initialize
    @applied_jobs = []
  end

  def add_applied_job applied_job
    @applied_jobs.push applied_job
  end
  
  def search_all filters
    run_filters_and_return @applied_jobs, filters
  end

  def search_subset jobs, filters
    subset = @applied_jobs.select {|applied_job| jobs.include? applied_job.job }
    run_filters_and_return subset, filters
  end

  def run_filters_and_return applied_jobs, filters
    applied_jobs = filter(applied_jobs, 'jobseeker_filter', filters[:jobseeker]) if filters[:jobseeker]
    applied_jobs = filter(applied_jobs, 'created_on_filter', filters[:created_on]) if filters[:created_on]
    applied_jobs = filter(applied_jobs, 'job_filter', filters[:job]) if filters[:job]
    return_by_type applied_jobs, filters.try(:[], :return_type)
  end

  private

  def return_by_type applied_job_subset, return_type
    applied_job_subset.map {|applied_job| applied_job.send(return_type)}
  end

  def filter applied_jobs, type, item
    applied_jobs.select {|applied_job| send(type, applied_job, item)}
  end

  def jobseeker_filter applied_job, jobseeker
    applied_job.belongs_to? jobseeker
  end

  def created_on_filter applied_job, day
    applied_job.created_on? day
  end

  def job_filter applied_job, job
    applied_job.for_job? job
  end
end
