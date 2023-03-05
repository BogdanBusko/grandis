# Added implementation of equality operator as default eq can compare objects
class User
  def ==(other)
    attributes == other.attributes
  end
end
