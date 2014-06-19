module MayaToInteger
  def maya_to_integer(number)
    result = ""
    @converter ||= Converter.new
    @converter.convert(number)
  end
end

class Converter

  def convert(number)
    #### this method has for goal to convert maya numbers to integer ###
    # analyze of '-':
    # all 5 first '-' has a value of 5 for its floor
    # all first '-' after \n has a value of 5 for its floor
    # analyze of 'o':
    # all 'o' has a value of 1 for its floor
    # analyze of '<(((>':
    # all '<(((>' are ignored and has a value of zero by the way
    # analyze of '\n\n':
    # it had 1 to the floor counter to be able to calculate the real value of the floor

    result = 0
    bar_count = 0
    endl_count = 0
    floor = 0
    floor_value = 0
    number = number.reverse.split(//)

    number.each do |char|
      if char == "\n"
        bar_count = 0
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
