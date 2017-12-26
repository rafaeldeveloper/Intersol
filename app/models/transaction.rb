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
    if self.tipo == "Transferência"
      destinary = Account.find(self.recipient)
      account.increment!(:balance,self.valor)  
      destinary.decrement!(:balance,self.valor)
      destinary.save
    end    

    account.save
  end

end
