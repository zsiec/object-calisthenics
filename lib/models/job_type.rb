class JobType < AbstractModel
  def requires_resume?
    %w(Jreq).include? @type
  end

  private

  def valid?
    return true if %w(ATS Jreq).include?(@type)
  end
end
