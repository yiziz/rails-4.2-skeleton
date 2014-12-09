class Status < ActiveRecord::Base
  include ModelSerializer
  include ModelIdName

  self.table_name = 'statuses'
  self.primary_key = 'status_id'

  def self.id_hash
    {
      0 => 'inactive',
      1 => 'active'
    }
  end

  def self.name_hash
    {
      'inactive' => 0,
      'active' => 1
    }
  end
end
