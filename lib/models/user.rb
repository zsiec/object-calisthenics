require 'active_support/core_ext/object/try'

class User
  def initialize(options={})
    @name = options.try :[], :name
    raise 'The user is not valid' unless valid?
  end

  def display_value
    @name
  end

  private

  def valid?
    return true if @name
  end
end
