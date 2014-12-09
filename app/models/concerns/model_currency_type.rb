require 'active_support/concern'

module ModelCurrencyType
  extend ActiveSupport::Concern

  included do
    def currency_type_name=(s)
      return write_attribute :currency_type_id, s if s.nil?
      return write_attribute :currency_type_id, 1 if s == 'USD'
      return write_attribute :currency_type_id, 2 if s == 'GBP'
      return write_attribute :currency_type_id, 3 if s == 'EUR'
    end

    def currency_type_symbol
      return '$' if currency_type_id == 1
      return '£' if currency_type_id == 2
      return '€' if currency_type_id == 3
    end

    def currency_type_name
      return 'USD' if currency_type_id == 1
      return 'GBP' if currency_type_id == 2
      return 'EUR' if currency_type_id == 3
    end
  end

  module ClassMethods
  end
end
