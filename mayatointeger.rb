module MayaToInteger
  def maya_to_integer(number)
    result = ""
    @converter ||= Converter.new
    @converter.verify(number)
    @converter.convert(number)
  end
end

class Converter

  def convert(number)

    return integer_number
  end

  def verify(number)

  end
end
