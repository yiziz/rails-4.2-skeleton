require 'active_support/concern'

module ModelPreference
  extend ActiveSupport::Concern

  included do
    def preference_name=(s)
      return write_attribute :preference_id, s if s.nil?
      return write_attribute :preference_id, 1 if s == 'participant_new'
      return write_attribute :preference_id, 2 if s == 'participant_cancelled'
      return write_attribute :preference_id, 3 if s == 'participant_messaged'
      return write_attribute :preference_id, 4 if s == 'user_messaged'
      return write_attribute :preference_id, 5 if s == 'researcher_messaged'
    end

    def preference_name
      return 'participant_new' if preference_id == 1
      return 'participant_cancelled' if preference_id == 2
      return 'participant_messaged' if preference_id == 3
      return 'user_messaged' if preference_id == 4
      return 'researcher_messaged' if preference_id == 5
    end
  end

  module ClassMethods
  end
end
