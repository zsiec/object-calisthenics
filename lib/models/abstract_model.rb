class AbstractModel
  def initialize options={}
    options.each { |key,val| instance_variable_set("@#{key}",val) }
    validate
  end

  private

  def valid?; true end

  def validate
    throw InvalidObjectException unless valid?
  end
end
