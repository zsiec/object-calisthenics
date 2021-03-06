class Job < AbstractModel
  def display_name
    @name
  end

  def requires_resume?
    @type.requires_resume?
  end

  private

  def valid?
    return true if @name && @type.is_a?(JobType)
  end
end
