class JobseekerJob
  def initialize(options)
    @jobseeker  = options.try :[], :jobseeker
    @job        = options.try :[], :job
    @created_at = Time.now #OMG bad. dont. 3? whaaaa?
    raise 'The jobseeker applied job is invalid' unless valid?
  end

  def job
    @job #also getter
  end

  private

  def valid?
    return true if @jobseeker.is_a?(Jobseeker) && @job.is_a?(Job)
  end
end
