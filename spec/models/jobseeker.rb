require 'spec_helper'

describe Jobseeker do
  context 'Applying to a job' do
    before do 
      @job = Job.new
      @jobseeker = Jobseeker.new(name: 'Thomas')
    end

    it 'should allow a jobseeker to apply to a job' do
      @jobseeker.apply_to(@job)
      @jobseeker.applied_jobs.should include @job
    end

    it 'should allow a jobseeker to save a job' do
      @jobseeker.save(@job)
      @jobseeker.saved_jobs.should include @job
    end
  end
end
