# frozen_string_literal: true

class PageController < ApplicationController
  before_action :authenticate_user!, only: [:account]

  def home
    @news = NewsApiHelper.call(country: I18n.locale, category: user_pref).res
    @admin_news = NewsItem.where(news_type: NewsType.find_by(type_name: user_pref))
  end

  def account; end

  private

  def user_pref
    if current_user && !current_user.preference.nil?
      current_user.preference
    else
      NewsType.default_type&.type_name
    end
  end
end
