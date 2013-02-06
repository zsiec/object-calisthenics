class UserJobManager < AbstractModel
  def initialize options={}
    @jobs = []
    super options
  end

  private

  def job_list klass
    @jobs.select {|job| job.is_a?(klass) }.map(&:job)
  end

  def job_params job
    { user: @user, job: job }
  end
end
