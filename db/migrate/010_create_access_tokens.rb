class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens, primary_key: 'access_token_id' do |t|
      t.belongs_to :user, index: true
      t.string :token, limit: 60
      t.timestamp :expires_at

      t.index :token

      t.timestamps
    end
  end
end
