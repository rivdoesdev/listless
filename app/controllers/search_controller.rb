class SearchController < ApplicationController
  def search
    lists = List.search(params[:query])
    users = User.search(params[:query])
    render template: 'shared/_search.html.erb', locals: { lists: lists, users: users }
  end
end
