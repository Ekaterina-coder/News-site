# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :news_type
end
