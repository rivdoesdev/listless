class DashboardController < ApplicationController
  def index
    lists = List.all
    render locals: {
      lists: lists
    }
  end
end
