class HomeController < ApplicationController
  def index
    @articles = Article.all.order("created_at DESC").limit(3)
  end
end
