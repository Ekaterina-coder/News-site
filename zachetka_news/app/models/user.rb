# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :news_items

  after_initialize :default_values

  def username
    email.match(/[^@]+/).to_s
  end

  private

  def default_values
    self.is_admin = false
  end
end
