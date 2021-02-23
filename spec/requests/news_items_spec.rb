# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'NewsItems', type: :request do
  describe 'GET /news_items' do
    it 'should redirect because user not authenticated' do
      get news_items_path
      expect(response).to have_http_status(302)
    end

    it 'should open login page' do
      get user_session_path
      expect(response).to have_http_status(200)
    end
  end
end
