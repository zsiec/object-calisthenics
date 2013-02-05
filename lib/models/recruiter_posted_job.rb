class RecruiterPostedJob < UserJob
  def initialize options
    super(options)
    POSTED_JOBS.add_job self
  end

  private

  def valid?
    return true if @user.is_a?(Recruiter) && @job.is_a?(Job)
  end
end
