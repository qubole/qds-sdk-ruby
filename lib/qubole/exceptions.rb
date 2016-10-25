module Qubole
  class HttpException < StandardError
    attr :body
    def initialize(object)
      @body = object.body
      super(object.message)
    end
  end
end
