
class Transfer
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    (sender.valid? && receiver.valid? && amount.is_a? Integer && status == 'open') ? true : false
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

    def reverse_transfer
      sender.balance += amount
      receiver.balace -= amount
    end
end