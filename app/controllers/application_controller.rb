class ApplicationController < ActionController::Base
  before_action :authenticate

  protect_from_forgery with: :exception

  private

  def authenticate
    return unless Rails.env.production?

    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end
end
