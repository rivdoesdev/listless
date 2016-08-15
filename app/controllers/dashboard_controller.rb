class DashboardController < ApplicationController
  def index
    render locals: {
      dashboard: dashboard
    }
  end
end
