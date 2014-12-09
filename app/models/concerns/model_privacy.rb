require 'active_support/concern'

module ModelPrivacy
  extend ActiveSupport::Concern

  def public!
    self.privacy_id = 1
  end

  def private!
    self.privacy_id = 2
  end

  def public?
    self.privacy_id == 1
  end

  def private?
    self.privacy_id == 2
  end

  included do 
    def privacy_name=(s)
      return write_attribute :privacy_id, s if s.nil?
      return write_attribute :privacy_id, 1 if s.downcase == 'public'
      return write_attribute :privacy_id, 2 if s.downcase == 'private'
    end

    def privacy_name
      return 'public' if self.public?
      return 'private' if self.private?
    end
  end

  module ClassMethods
  end
end
