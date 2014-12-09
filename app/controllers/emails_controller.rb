class EmailsController < ApplicationController
  def initialize
    @host = Rails.application.routes.default_url_options[:host]
    @protocol = Rails.application.routes.default_url_options[:protocol]
    @host_url = "#{@protocol}#{@host}#"
    @email_host = 'Markedd.com'
    @login_url = "#{@host_url}/login"
  end
  def pundit_authorize
  end
end
