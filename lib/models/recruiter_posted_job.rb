class RecruiterPostedJob < UserJob

  private

  def valid?
    return true if @user.is_a?(Recruiter) && @job.is_a?(Job)
  end
end
