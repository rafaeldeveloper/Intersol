class Transaction < ApplicationRecord
  belongs_to :usuario
  validates :accounts_id, presence: true
  validates :valor, presence: true
  validates :tipo, presence: true
  validates :usuario_id, presence: true

end
