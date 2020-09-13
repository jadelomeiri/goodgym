class HomepageController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    if logged_in?
      redirect_to runs_path
    else
      render 'homepage/index'
    end
  end
end