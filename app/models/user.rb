class User < ApplicationRecord
  # Validaciones para asegurarse de que los campos no estén vacíos y sean únicos
  validates :email, presence: true
  validates :name, presence: true
  validates :email, uniqueness: true
  
  # Validación personalizada para verificar el dominio del email
  validate :email_domain_must_be_gmail

  private

  # Método que implementa la validación personalizada
  def email_domain_must_be_gmail
    return if email.blank? # Permite que el campo esté vacío

    unless email.ends_with?('@gmail.com')
      errors.add(:email, 'debe tener el dominio @gmail.com')
    end
  end
end