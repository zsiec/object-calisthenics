class UserJobManager
  def initialize options={}
    @user = options.try :[], :user
    @jobs = []
    raise 'The job manager is invalid' unless valid?
  end

  private

  def job_list(klass)
    @jobs.select {|job| job.is_a?(klass)}.map(&:job)
  end

  def job_params(job)
    { user: @user, job: job }
  end

  def valid?
    return true if @user.is_a?(User)
  end
end
