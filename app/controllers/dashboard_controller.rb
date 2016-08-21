class DashboardController < ApplicationController
  before_action :disable_nav

  def index
    lists = List.all
    render locals: {
      lists: lists
    }
  end
end
