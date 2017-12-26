class Transaction < ApplicationRecord
  belongs_to :usuario
  validates :accounts_id, presence: true
  validates :valor, presence: true
  validates :tipo, presence: true
  validates :usuario_id, presence: true

  def rollBack
    account = Account.find(self.accounts_id)
    if self.tipo == "Deposito"
      account.decrement!(:balance,self.valor)  
    end
    if self.tipo == "Saque"
      account.increment!(:balance,self.valor)  
    end    
    account.save
  end

end
