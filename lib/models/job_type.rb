class JobType
  def initialize type
    @type = type
    raise 'Invalid job type' unless valid?
  end

  def requires_resume?
    %w(Jreq).include? @type
  end

  private

  def valid?
    return true if %w(ATS Jreq).include?(@type)
  end
end
