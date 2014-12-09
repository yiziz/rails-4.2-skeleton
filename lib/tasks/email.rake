namespace :email do
  namespace :deliver do
    task :all => :environment do
      # ActiveRecord::Base.transcation do
      Email.where(sent: false, status_id: 1).where('send_on < ? or send_on IS NULL', DateTime.now).each do |email|
        email.deliver!
      end
    end
  end
end
