require 'spec_helper'
require 'timecop'

describe LaddersSearch do
  context 'search jobseekers applications by date' do
    before do
      @jobseeker1 = Jobseeker.new(name: 'Sammy Seeker1')
      @jobseeker2 = Jobseeker.new(name: 'Sammy Seeker2')
      @jobseeker3 = Jobseeker.new(name: 'Sammy Seeker3')
      @jobseeker4 = Jobseeker.new(name: 'Sammy Seeker4')
      @recruiter = Recruiter.new(name: 'Randy Recruiter')

      @job = @recruiter.post_job('A new job', 'ATS')

      @jobseeker1.apply_to(@job)
      @jobseeker3.apply_to(@job)
      Timecop.freeze(Date.today + 30) do
        @jobseeker2.apply_to(@job)
        @jobseeker4.apply_to(@job)
      end
    end

    it 'should return jobseekers who applied for jobs on a specific date' do
      searcher = LaddersSearch.new
      jobseekers = searcher.jobseekers_applied_on_date(Date.today + 30)
      jobseekers.length.should == 2
      jobseekers.should include @jobseeker2
      jobseekers.should include @jobseeker4
    end
  end
end
