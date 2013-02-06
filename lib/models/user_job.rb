class UserJob < AbstractModel
  def initialize options
    @created_on = Date.today
    super options
  end

  def job
    @job #getter
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
end
