# https://www.rubydoc.info/stdlib/core/Exception
class Exceptions
  class Error < ::StandardError
  end

  class DpsCalculationError < Error
    def full_message
      "DPS could not be calculated with the values given."
    end
  end

  class FrobError < Error
  end

end