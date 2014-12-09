require 'active_support/concern'

module ModelStatus
  extend ActiveSupport::Concern
  extend IdNameExt

  add_id_name_methods

  included do
  end

  module ClassMethods
  end
end
