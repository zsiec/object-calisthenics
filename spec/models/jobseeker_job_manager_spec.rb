require 'spec_helper'

describe JobseekerJobManager do
 it 'should raise an exception if no jobseeker is specified when initializing' do
    expect { Jobseeker.new }.to raise_error
  end
end
