class Contact < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  belongs_to :user

  def friendly_updated_at
    friendly_updated_at = updated_at.strftime("%B %e, %Y, %k:%M:%S")
  end

  def full_name
    full_name = first_name + " " + last_name
  end

  def japenese_phone_number
    japenese_number = "+81-" + phone_number
  end
end
