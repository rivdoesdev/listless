class DashboardController < ApplicationController
  before_action :disable_nav

  def index
    if signed_in?
      lists = List.all
      render locals: {
        lists: lists
      }
    else
      render template: 'dashboard/public_index.html.erb'
    end
  end

  def about
    @disable_nav = false
  end
end
