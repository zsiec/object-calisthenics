require 'spec_helper'

describe Jobseeker do
  context 'Applying to a job' do
    before do 
      @job = Job.new(name: 'Awesome Job', type: JobType.new(type: 'ATS'))
      @jobseeker = Jobseeker.new(name: 'Thomas')
    end

    it 'should allow a jobseeker to apply to a job' do
      @jobseeker.apply_to(@job)
      @jobseeker.saved_jobs.length.should == 0
      @jobseeker.applied_jobs.length.should == 1
      @jobseeker.applied_jobs.should include @job
    end

    it 'should allow a jobseeker to save a job' do
      @jobseeker.save(@job)
      @jobseeker.applied_jobs.length.should == 0
      @jobseeker.saved_jobs.length.should == 1
      @jobseeker.saved_jobs.should include @job
    end

    it 'should not allow a jobseeker to apply to a jreq job without a resume' do
      @job = Job.new(name: 'Awesome Job', type: JobType.new(type: 'Jreq'))
      expect { @jobseeker.apply_to(@job) }.to raise_error
    end

    it 'should allow a jobseeker to apply to a jreq job with a resume' do
      @job = Job.new(name: 'Awesome Job', type: JobType.new(type: 'Jreq'))
      @jobseeker = Jobseeker.new(name: 'Thomas', resume: Resume.new)
      expect { @jobseeker.apply_to(@job) }.to_not raise_error
    end

    it 'should allow a jobseeker to apply to an ATS job without a resume' do
      expect { @jobseeker.apply_to(@job) }.to_not raise_error
    end
  end
end
