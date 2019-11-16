
module Concerns

  module Findable
    def find_by_name(item_name)
      self.all.detect {|instance| instance.name == item_name}
    end

    def find_or_create_by_name(item_name)
      if !self.find_by_name(item_name)
        self.create(item_name)
      else
        self.find_by_name(item_name)
      end
    end
  end

end
