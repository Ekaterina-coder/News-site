# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'main page' do
  describe 'main page content' do
    it 'should check logo presence' do
      visit '/'
      expect(page).to have_content('News')
    end

    it 'should check presense of main inscription' do
      visit '/ru'
      expect(page).to have_content('Главная')
    end

    it 'should check presence of header elements' do
      visit '/ru'
      elems = %w[.news-header .container .news-content .exchange-rate-value]
      elems.each { |elem| expect(page).to have_css(elem) }
    end
  end

  describe 'some internationalization tests' do
    it 'should be translated into English' do
      visit '/us'
      sel1 = 'div.exchange-rate-value:nth-child(1)'
      sel2 = 'a.is-link:nth-child(2)'
      expect(page.find(sel1)).to have_content 'Exchange rate'
      expect(page.find(sel2)).to have_content 'My account'
    end

    it 'should be translated into Russian' do
      visit '/ru'
      sel1 = 'div.exchange-rate-value:nth-child(1)'
      sel2 = 'a.is-link:nth-child(2)'
      expect(page.find(sel1)).to have_content 'Курс валют'
      expect(page.find(sel2)).to have_content 'Личный кабинет'
    end
  end
end
