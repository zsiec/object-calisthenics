require 'spec_helper'

describe Job do
  it 'should raise an exception if no name is specified when creating a job' do
    expect { Job.new }.to raise_error
  end

  context '#display_name' do
    before do
      @job = Job.new(name: 'Jobby Job', type: JobType.new(type: 'ATS'))
    end

    it 'should return the name of the user' do
      @job.display_name.should == 'Jobby Job'
    end
  end
end