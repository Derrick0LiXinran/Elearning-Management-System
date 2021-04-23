class CreditCardInfo < ApplicationRecord
  belongs_to :student_info
  validates :name, presence: true
  validates :expiration_date, format: { with: /\A\d{2}\/\d{2}\z/, message: 'format must be MM/YY' }
  validates :card_number, length: { is: 16 }, format: { with: /\A[0-9]*\z/, message: 'only allows numbers' }
  validates :cvv, length: { is: 3 }, format: { with: /\A[0-9]*\z/, message: 'only allows numbers' }
end
