# frozen_string_literal: true

class UserController < ApplicationController
  def update_preferences
    User.find_by(email: current_user.email).update(preference: params[:pref])
    respond_to { |format| format.js }
  end
end
