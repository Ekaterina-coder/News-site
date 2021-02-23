# frozen_string_literal: true

require 'news-api'

class NewsApiHelper
  include Interactor

  def call
    init_api
    context.res = get_headers(context.country, context.category)
  end

  private

  def init_api
    news_api_key = Rails.application.credentials.news_api!
    @api = News.new(news_api_key)
  end

  def get_headers(country, category)
    @api.get_top_headlines(country: country, category: category)
  end
end
