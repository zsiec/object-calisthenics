class JobseekerJobManager
  def initialize options={}
    @jobseeker = options.try :[], :jobseeker
    @jobs = []
    raise 'The jobseeker job manager is invalid' unless valid?
  end

  def apply_to(job)
    @jobs.push JobseekerAppliedJob.new(job_params(job))
  end

  def applied_jobs
    job_list JobseekerAppliedJob
  end

  def save(job)
    @jobs.push JobseekerSavedJob.new(job_params(job))
  end

  def saved_jobs
    job_list JobseekerSavedJob
  end

  private

  def job_list(klass)
    @jobs.select {|job| job.is_a?(klass)}.map(&:job)
  end

  def job_params(job)
    { jobseeker: @jobseeker, job: job }
  end

  def valid?
    return true if @jobseeker.is_a?(Jobseeker)
  end
end
