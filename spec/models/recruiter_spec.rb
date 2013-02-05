require 'spec_helper'
require 'timecop'

describe Recruiter do
  context 'Posting jobs' do
    before do
      @recruiter = Recruiter.new(name: 'Thomas')
    end

    it 'should allow recruiters to post jobs' do
      @recruiter.posted_jobs.length.should == 0
      @recruiter.post_job('Most awesome job ever', 'Jreq')
      @recruiter.posted_jobs.length.should == 1
    end
  end

  context 'Searching for jobs' do
    before do
      @jobseeker1 = Jobseeker.new(name: 'Sammy Seeker1')
      @jobseeker2 = Jobseeker.new(name: 'Sammy Seeker2')
      @jobseeker3 = Jobseeker.new(name: 'Sammy Seeker3')
      @jobseeker4 = Jobseeker.new(name: 'Sammy Seeker4')
      @recruiter = Recruiter.new(name: 'Randy Recruiter')

      @job1 = @recruiter.post_job('A new job', 'ATS')
      @job2 = @recruiter.post_job('Another new job', 'ATS')

      @jobseeker1.apply_to(@job1)
      @jobseeker3.apply_to(@job2)
      Timecop.freeze(Date.today + 30) do
        @jobseeker2.apply_to(@job1)
        @jobseeker4.apply_to(@job2)
      end
    end

    it 'should allow recruiters to search by job' do
      jobseekers = @recruiter.jobseekers_applied_to_job(@job1)
      jobseekers.length.should == 2
      jobseekers.should include @jobseeker1
      jobseekers.should include @jobseeker2
    end

    it 'should allow recruiters to search by date' do
      jobseekers = @recruiter.jobseekers_applied_on_date(Date.today + 30)
      jobseekers.length.should == 2
      jobseekers.should include @jobseeker2
      jobseekers.should include @jobseeker4
    end

    it 'should allow recruiters to search by date and job' do
      jobseekers = @recruiter.jobseekers_applied_to_job_on_date(@job2, Date.today + 30)
      jobseekers.length.should == 1
      jobseekers.should include @jobseeker4
    end

  end

  
end
