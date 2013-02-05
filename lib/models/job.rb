class Job
  def initialize(options={})
    @name = options.try(:[], :name)
    raise 'The job is not valid' unless valid?
  end

  private

  def valid?
    return true if @name
  end
end
