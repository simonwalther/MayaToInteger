module MayaToInteger
  def maya_to_integer(number)
    result = ""
    @converter ||= Converter.new
    @converter.convert(number)
  end
end

class Converter

  def convert(number)
    result = 0
    bar_count = 0
    endl_count = 0
    floor = 0
    floor_value = 0
    number = number.reverse.split(//)

    number.each do |char|
      if char == "\n"
        endl_count += 1

        if endl_count == 2
          result += (floor_value*(20**floor))
          floor_value = 0
          floor += 1
          endl_count = 0
        end
      elsif char != "\n"
        endl_count = 0

        if char == "o"
          floor_value += 1
        elsif char == "-"
          if bar_count == 0
            bar_count += 1
            floor_value += 5
          elsif bar_count == 5
            bar_count = 0
          else
            bar_count += 1
          end
        end
      end
    end

    result += (floor_value*(20**floor))

    return result
  end
end
