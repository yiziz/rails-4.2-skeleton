class AccessToken < ActiveRecord::Base
  include ModelSerializer
  
  self.primary_key = 'access_token_id'
  
  belongs_to :user

  before_create :generate_access_token

  def expires_in
    expires_at - Time.now
  end

private
  
  def generate_access_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end
