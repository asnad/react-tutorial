class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # format :json, :html
end
