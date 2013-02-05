require 'spec_helper'

describe Job do
  it 'should raise an exception if no name is specified when creating a job' do
    expect { Job.new }.to raise_error
  end
end