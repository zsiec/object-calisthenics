class JobseekerJobManager < UserJobManager
  def apply_to(job, resume=nil)
    @jobs.push JobseekerAppliedJob.new(job_params(job).merge(resume: resume))
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

  def valid?
    return true if @user.is_a?(Jobseeker)
  end
end
