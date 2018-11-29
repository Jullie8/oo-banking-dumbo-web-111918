class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
    
    def valid?
        (receiver.valid? == true) && (sender.valid? == true) ? true : false
    end

  def execute_transaction
       if valid? && sender.balance >= amount && self.status == "pending"
          sender.balance -= amount
          receiver.balance += amount   
          self.status = "complete"
        else
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
      end    
  end
  
  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount  
      self.status= "reversed"

    end
  end


end

# if self.status != "complete" 
#             if sender.balance >= amount
#               
#             end    
#             else 
#               self.status = "rejected"
#               "Transaction rejected. Please check your account balance."
#  end