class Transaction < ApplicationRecord
  belongs_to :conta
  belongs_to :usuario
end
