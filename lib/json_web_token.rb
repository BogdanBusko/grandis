class JsonWebToken
  class << self
    # TODO: Move to credentials
    SECRET_PASSWORD = '123456'

    def encode(payload)
      JWT.encode(payload, SECRET_PASSWORD, 'HS256')
    end

    def decode(token)
      JWT.decode(token, SECRET_PASSWORD, true, { algorithm: 'HS256' }).first.symbolize_keys
    end
  end
end
