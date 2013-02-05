require 'spec_helper'

describe UserJobManager do
 it 'should raise an exception if no jobseeker is specified when initializing' do
    expect { Jobseeker.new }.to raise_error
  end
end
