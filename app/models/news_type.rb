# frozen_string_literal: true

class NewsType < ApplicationRecord
  has_many :news_items

  DEFAULT_TYPE = 'general'

  class << self
    def default_type
      find_by(type_name: DEFAULT_TYPE)
    end
  end
end
