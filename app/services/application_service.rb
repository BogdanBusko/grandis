class ApplicationService
  def call
    raise ImplementMe
  end

  def self.call(*args, &block)
    new(*args, &block).call
  end
end
