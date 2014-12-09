require 'active_support/concern'

module ModelGender
  extend ActiveSupport::Concern
 
  included do 
    def gender_name=(s)
      return write_attribute :gender_id, s if s.nil?
      return write_attribute :gender_id, 1 if s.downcase == 'male'
      return write_attribute :gender_id, 2 if s.downcase == 'female'
      return write_attribute :gender_id, 3 if s.downcase == 'other'
    end

    def gender_name
      return 'male' if gender_id == 1
      return 'female' if gender_id == 2
      return 'other' if gender_id == 3
    end
  end

  def male?
    self.gender_id == 1
  end

  def female?
    self.gender_id == 2
  end

  def other?
    self.gender_id == 3
  end

  module ClassMethods
  end
end
