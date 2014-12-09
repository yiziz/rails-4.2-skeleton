base_uri = ''
if Rails.env.production?
  base_uri = ''
  secret_key = ENV['firebase_secret']
elsif Rails.env.staging?
  base_uri = ''
end
#$firebase = Firebase::Client.new base_uri
