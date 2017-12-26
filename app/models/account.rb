class Account < ApplicationRecord
  belongs_to :agency
  validates :agency_id, presence: true
  validates :conta, presence: true
  validates :limite, presence: true





	def beginTransaction (tipo,valor,recipient)
		
		if tipo == "Deposito"
      self.increment!(:balance,valor)  
    end
    if tipo == "Saque"
     if self.balance.nil? || self.balance < valor 
        self.errors.add("Falha ao Criar Transação", "Saldo Não Disponivel")
        return false
     else   
        self.decrement!(:balance, valor)  
      end 
    end
    if tipo == "Transferência"
     if self.balance.nil? || self.balance < valor 
        self.errors.add("Falha ao Criar Transação", "Saldo Não Disponivel")
        return false
     else   
        destinary = Account.find(recipient)
        self.decrement!(:balance, valor)  
        destinary.increment!(:balance,valor)
        destinary.save
      end 
    end   

   self.save
	end


end
