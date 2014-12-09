require 'active_support/concern'

module ModelRewardType
  extend ActiveSupport::Concern

  included do
    def reward_type_name=(s)
      return write_attribute :reward_type_id, s if s.nil?
      return write_attribute :reward_type_id, 1 if s.downcase == 'cash'
      return write_attribute :reward_type_id, 2 if s.downcase == 'gift_certificate'
      return write_attribute :reward_type_id, 3 if s.downcase == 'raffle'
      return write_attribute :reward_type_id, 4 if s.downcase == 'class_credit'
      return write_attribute :reward_type_id, 5 if s.downcase == 'volunteer'
      return write_attribute :reward_type_id, 6 if s.downcase == 'other'
    end

    def reward_type_name
      return 'cash' if reward_type_id == 1
      return 'gift_certificate' if reward_type_id == 2
      return 'raffle' if reward_type_id == 3
      return 'class_credit' if reward_type_id == 4
      return 'volunteer' if reward_type_id == 5
      return 'other' if reward_type_id == 6
    end
  end

  module ClassMethods
  end
end
