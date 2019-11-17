module Concerns::Findable # class methods
  def find_by_name(name)  # class method
    self.all.detect {|instance| instance.name == name}
  end

  def find_or_create_by_name(name)
    variable = self.find_by_name(name)
    if variable
      return variable
    else
      self.create(name)
    end
end

end
