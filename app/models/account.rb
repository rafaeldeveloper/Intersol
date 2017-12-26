class Account < ApplicationRecord
  belongs_to :agency
  validates :agency_id, presence: true
  validates :conta, presence: true
  validates :limite, presence: true





	def beginTransaction (tipo,valor)
		
		if tipo == "Deposito"
      self.increment!(:balance,valor)  
    end
    if tipo == "Saque"
     if self.balance < valor
        self.errors.add("Falha ao Criar Transação", "Saldo Não Disponivel")
        return false
     else   
        self.decrement!(:balance, valor)  
      end 
    end
   
   self.save
	end


end
