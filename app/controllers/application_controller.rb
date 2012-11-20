class ApplicationController < ActionController::Base
  protect_from_forgery
  # Check authorization with Cancan for all controllers
  # check_authorization
end
