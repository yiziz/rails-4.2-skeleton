require 'active_support/concern'

module ModelDateFormat
  extend ActiveSupport::Concern

  def to_time_zone(time, zone)
    return time.in_time_zone(zone) if zone
    return time
  end

  def abbr_date(date)
    date and date.strftime('%b %d')
  end

  def abbr_time(date)
    date and date.strftime('%I %M %p')
  end

  def start_date(zone = self.timezone)
    abbr_date(self.to_time_zone(self.start, zone))
  end

  def end_date(zone = self.timezone)
    abbr_date(self.to_time_zone(self.end, zone))
  end

  def start_time(zone = self.timezone)
    abbr_time(self.to_time_zone(self.end, zone))
  end

  def end_time(zone = self.timezone)
    abbr_time(self.to_time_zone(self.end, zone))
  end

  included do
  end

  module ClassMethods
  end
end
