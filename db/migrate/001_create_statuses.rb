class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses, primary_key: 'status_id' do |t|
      t.string :name, limit: 10
      t.string :description, limit: 30
      t.timestamps

      t.index :name
    end
  end
end
