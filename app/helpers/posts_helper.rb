module PostsHelper
  def divide_content_in_two(content, part = 1)
    first_half = ''
    second_half = ''
    total_sentences = content.split('.').length
    half_way = (total_sentences / 2).round
    content.split('.').each_with_index do |s, i|
      if i <= half_way
        first_half = first_half + '.' + s
      else
        second_half = second_half + '.' + s
      end
    end
    if part == 1
      first_half
    else
      second_half
    end
  end

end
