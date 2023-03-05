class ApplicationController < ActionController::Base
  include SessionsConcern
  include Pagy::Backend
end
