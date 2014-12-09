require 'active_support/concern'

module ModelCountry
  extend ActiveSupport::Concern

  included do 
    def country_name=(s)
      return write_attribute :country_id, s if s.nil?
    end

    def country_name
      return self.country_id
    end
  end

  module ClassMethods
  end
end
