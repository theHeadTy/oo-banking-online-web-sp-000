
class Transfer
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = Integer(amount)
    @status = 'pending'
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
      
  end

  def execute_transaction
    if (sender.balance >= amount && valid?)
      receiver.balance += amount
      sender.balace -= amount
      @status = 'complete'
    else
      puts "Transaction rejected. Please check your account balance."
      @status = 'rejected'
    end
  end

  def reverse_transfer
    sender.balance += amount
    receiver.balace -= amount
    @status = 'reversed'
  end
end