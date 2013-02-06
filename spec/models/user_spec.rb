require 'spec_helper'

describe User do
  it 'should raise an exception if no name is specified when creating a user' do
    expect { User.new }.to raise_error
  end

  context '#display_name' do
    before do
      @user = User.new(name: 'Thomas')
    end

    it 'should return the name of the user' do
      @user.display_name.should == 'Thomas'
    end
  end
end
