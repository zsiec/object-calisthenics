require 'spec_helper'

describe User do
  it 'should raise an exception if no name is specified when creating a user' do
    expect { User.new }.to raise_error
  end
end
