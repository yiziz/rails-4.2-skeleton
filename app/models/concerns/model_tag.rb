require 'active_support/concern'

module ModelTag
  extend ActiveSupport::Concern

  def online!
    self.tag_id = 1
  end

  def in_person!
    self.tag_id = 2
  end

  def online?
    self.tag_id == 1
  end

  def in_person?
    self.tag_id == 2
  end

  included do 
    def tag_name=(s)
      return write_attribute :tag_id, s if s.nil?
      return write_attribute :tag_id, 1 if s.downcase == 'online'
      return write_attribute :tag_id, 2 if s.downcase == 'in_person'
    end

    def tag_name
      return 'online' if tag_id == 1
      return 'in_person' if tag_id == 2
    end
  end

  module ClassMethods
  end
end
