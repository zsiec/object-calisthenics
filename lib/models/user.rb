class User < AbstractModel
  def display_value
    @name
  end

  private

  def valid?
    return true if @name
  end
end
