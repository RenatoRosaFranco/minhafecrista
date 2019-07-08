# frozen_string_literal: true

class Newsletter < ApplicationRecord
  self.table_name  = 'newsletters'
  self.primary_key = 'id'

  after_create :signup

  def signup
    set_token
    set_status(true)
    set_signup_date
    save!
  end

  def cancel
    remove_token
    set_status(false)
    save!
  end

  private

  def set_token
    self.token = SecureRandom.urlsafe_base64
  end

  def remove_token
    self.token = nil
  end

  def set_status(status = true)
    self.status = status
  end

  def set_signup_date(date = Date.today)
    self.signup_date = date
  end
end
