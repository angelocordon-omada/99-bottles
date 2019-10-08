class Bottles
  attr_reader :num

  def verse (num)
    @num = num
    return no_more_bottles_left_verse if no_more_bottles_left
    one_bottle_left ? one_bottle_left_verse : default_verse
  end

  def verses (num1, num2)
     # num1.downto(num2).map {|num| verse(num) }.join("\n")
     (num2..num1).to_a.reverse.map { |num| verse(num) }.join("\n");
  end

  def song
    verses(99,0)
  end

  def default_verse
    <<~VERSE
      #{num} bottles of beer on the wall, #{num} bottles of beer.
      Take one down and pass it around, #{bottle_count} of beer on the wall.
    VERSE
  end

  def no_more_bottles_left_verse
    <<~VERSE
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    VERSE
  end

  def no_more_bottles_left
    num === 0
  end

  def one_bottle_left
    num === 1
  end

  def one_bottle_left_verse
    <<~VERSE
      #{num} bottle of beer on the wall, #{num} bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
    VERSE
  end

  def bottle_count
    left_count = num - 1
    inflected_bottles = left_count > 1 ? "bottles" : "bottle"

    "#{left_count} #{inflected_bottles}"
  end
end