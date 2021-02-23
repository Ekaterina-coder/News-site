# frozen_string_literal: true

User.create email: 'admin@email.com', password: '12345678', password_confirmation: '12345678'
%w[business health entertainment general science sports technology].each { |t| NewsType.create(type_name: t) }
