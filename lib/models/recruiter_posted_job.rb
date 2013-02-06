class RecruiterPostedJob < UserJob
  def initialize options
    POSTED_JOBS.add_job self
    super options
  end

  private

  def valid?
    return true if @user.is_a?(Recruiter) && @job.is_a?(Job)
  end
end
