class UserJob
  def initialize(options)
    @user       = options.try :[], :user
    @job        = options.try :[], :job
    @created_on = Date.today #OMG bad. dont. 3? whaaaa?
    raise 'The user job is invalid' unless valid?
  end

  def job
    @job #also getter
  end

  def user
    @user #agh!
  end

  def belongs_to? user
    @user == user
  end

  def for_job? job
    @job == job
  end

  def created_on? day
    @created_on == day
  end

  private

  def valid?
    return true if @user.is_a?(User) && @job.is_a?(Job)
  end
end
