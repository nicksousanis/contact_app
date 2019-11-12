class Contact < ApplicationRecord
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
