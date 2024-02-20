class ApplicationController < ActionController::Base
  skip_forgery_protection

  #1 With Devise, this will force visitors to sign in before visiting any pages. SEARCH public/css/my_styles.css
  before_action :authenticate_user!
end
