class UserJob
  def initialize(options)
    @user       = options.try :[], :user
    @job        = options.try :[], :job
    @created_at = Time.now #OMG bad. dont. 3? whaaaa?
    raise 'The user job is invalid' unless valid?
  end

  def job
    @job #also getter
  end

  private

  def valid?
    return true if @user.is_a?(User) && @job.is_a?(Job)
  end
end
