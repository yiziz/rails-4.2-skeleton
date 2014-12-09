require 'active_support/concern'

module ModelIdName
  extend ActiveSupport::Concern

  included do 
  end

  module ClassMethods
    def id_to_name(id)
      self.id_hash[id]
    end

    def name_to_id(name)
      self.name_hash[name]
    end
  end
end
