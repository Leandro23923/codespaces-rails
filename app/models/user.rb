class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true
  validate :email_domain_must_be_gmail

  private

  def email_domain_must_be_gmail
    return if email.blank? # Permite que el campo esté vacío

    unless email.ends_with?('@gmail.com')
      errors.add(:email, 'debe tener el dominio @gmail.com')
    end
  end
end
