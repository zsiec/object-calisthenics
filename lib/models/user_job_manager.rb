class UserJobManager
  def initialize options={}
    @jobseeker = options.try :[], :jobseeker
    @jobs = {applied_jobs: [], saved_jobs: []}
    raise 'The user job manager is invalid' unless valid?
  end

  def apply_to(job)
    @jobs[:applied_jobs].push job
  end

  def applied_jobs
    @jobs[:applied_jobs]
  end

  def save(job)
    @jobs[:saved_jobs].push job
  end

  def saved_jobs
    @jobs[:saved_jobs]
  end

  private

  def valid?
    return true if @jobseeker.is_a?(Jobseeker)
  end
end
