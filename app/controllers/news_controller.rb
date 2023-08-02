class NewsController < ApplicationController
  def index
    @headlines = NewsApiClient.fetch_top_headlines
  end
end
