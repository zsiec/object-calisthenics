class Job
  def initialize(options={})
    @name = options.try(:[], :name)
    @type = options.try(:[], :type)
    raise 'The job is not valid' unless valid?
  end

  def needs_resume?
    @type.requires_resume?
  end

  private

  def valid?
    return true if @name && @type.is_a?(JobType)
  end
end
