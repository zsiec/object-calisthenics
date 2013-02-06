class User < AbstractModel
  def display_name
    @name
  end

  private

  def valid?
    return true if @name
  end
end
