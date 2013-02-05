require 'spec_helper'

describe Recruiter do
  context 'Posting jobs' do
    before do
      @recruiter = Recruiter.new(name: 'Thomas')
    end

    it 'should allow recruiters to post jobs' do
      @recruiter.posted_jobs.length.should == 0
      @recruiter.post_job('Most awesome job ever')
      @recruiter.posted_jobs.length.should == 1
    end
  end
end
