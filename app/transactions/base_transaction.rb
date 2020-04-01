class BaseTransaction
  include Dry::Transaction

  # will allow us to call the transaction
  # from our grape with a hash of arguments
  def self.call(*args, &block)
    new.call(*args, &block)
  end
end
