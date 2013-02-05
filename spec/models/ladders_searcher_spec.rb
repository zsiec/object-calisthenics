require 'spec_helper'
require 'timecop'

describe LaddersSearcher do
  context 'TheLadders can search all applications' do
    before do
      @jobseeker1 = Jobseeker.new(name: 'Sammy Seeker1')
      @jobseeker2 = Jobseeker.new(name: 'Sammy Seeker2')
      @jobseeker3 = Jobseeker.new(name: 'Sammy Seeker3')
      @jobseeker4 = Jobseeker.new(name: 'Sammy Seeker4')
      @recruiter1 = Recruiter.new(name: 'Randy Recruiter1')
      @recruiter2 = Recruiter.new(name: 'Randy Recruiter2')

      @job1 = @recruiter1.post_job('A new job', 'ATS')
      @job2 = @recruiter2.post_job('Another new job', 'ATS')

      @jobseeker1.apply_to(@job1)
      @jobseeker1.apply_to(@job1)
      @jobseeker3.apply_to(@job2)
      @jobseeker3.apply_to(@job2)
      Timecop.freeze(Date.today + 30) do
        @jobseeker2.apply_to(@job1)
        @jobseeker4.apply_to(@job1)
      end

      @searcher = LaddersSearcher.new
    end

    it 'should return jobseekers who applied for jobs on a specific date' do
      jobseekers = @searcher.jobseekers_applied_on_date(Date.today + 30)
      jobseekers.length.should == 2
      jobseekers.should include @jobseeker2
      jobseekers.should include @jobseeker4
    end

    it 'should return the number of applications by job' do
      @searcher.applications_by_job(@job1).length.should == 4
      @searcher.applications_by_job(@job2).length.should == 2
    end

    it 'should return the number of applications by recruiter' do
      @searcher.applications_by_recruiter(@recruiter1).length.should == 4
      @searcher.applications_by_recruiter(@recruiter2).length.should == 2
    end
  end
end
