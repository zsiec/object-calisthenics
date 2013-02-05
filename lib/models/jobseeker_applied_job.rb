class JobseekerAppliedJob < JobseekerJob
  def initialize options
    @resume = options.try(:[], :resume)
    super options
    APPLIED_JOBS.add_applied_job self
  end

  def belongs_to? jobseeker
    @user == jobseeker
  end

  private

  def valid?
    return false unless @user.is_a?(Jobseeker) && @job.is_a?(Job)
    return false if @job.needs_resume? && !@resume.is_a?(Resume)
    true
  end
end
