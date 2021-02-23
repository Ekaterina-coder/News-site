# frozen_string_literal: true

module ApplicationHelper
  def user_preferences
    [
      [t('account_page.news_type.business'), 'business'],
      [t('account_page.news_type.health'), 'health'],
      [t('account_page.news_type.entertainment'), 'entertainment'],
      [t('account_page.news_type.general'), 'general'],
      [t('account_page.news_type.science'), 'science'],
      [t('account_page.news_type.sports'), 'sports'],
      [t('account_page.news_type.technology'), 'technology']
    ]
  end
end
