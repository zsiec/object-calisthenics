class JobseekerJob < UserJob

  private

  def valid?
    return true if @user.is_a?(Jobseeker) && @job.is_a?(Job)
  end
end
