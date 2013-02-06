class JobseekerAppliedJob < JobseekerJob
  def initialize options
    APPLIED_JOBS.add_job self
    super options
  end

  private

  def valid?
    return false unless @user.is_a?(Jobseeker) && @job.is_a?(Job)
    return false if @job.requires_resume? && !@resume.is_a?(Resume)
    true
  end
end
