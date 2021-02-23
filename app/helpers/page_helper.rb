# frozen_string_literal: true

module PageHelper
  def usd_rate
    ExchangeRate.call(val: 1, from: 'USD', to: 'RUB').res * 100
  end

  def eur_rate
    ExchangeRate.call(val: 1, from: 'EUR', to: 'RUB').res * 100
  end
end
