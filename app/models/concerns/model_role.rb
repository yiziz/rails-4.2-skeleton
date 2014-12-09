require 'active_support/concern'

module ModelRole
  extend ActiveSupport::Concern

  def researcher!
    self.role_id = 2
  end

  def researcher?
    self.role_id == 2
  end

  def user!
    self.role_id = 1
  end

  def user?
    self.role_id == 1
  end

  included do 
    def role_name=(s)
      return write_attribute :role_id, s if s.nil?
      return write_attribute :role_id, 1 if s.downcase == 'user'
      return write_attribute :role_id, 2 if s.downcase == 'researcher'
    end

    def role_name
      return 'user' if user?
      return 'researcher' if researcher?
    end
  end

  module ClassMethods
  end
end
