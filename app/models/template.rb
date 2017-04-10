class Template < ApplicationRecord
  def to_param
    title.parameterize
  end

  def replace_words
  original = template(story)
  to_replace = words_to_replace(story)

  # new_list = get_input(to_replace)
  {original: original, replace: to_replace}
  # zipped = new_list.zip(to_replace)
  # insert_string(zipped, original, string)
end


#replace, original, story
def final_story(replacer, indexed)
  result = story.clone
  replacer.each_with_index do |replace, index|
    if indexed[index].include?(':')
      temp = replace[1].split(':').first
      result.sub!(indexed[index], replace[0])
      result.gsub!("((#{temp}))", replace[0])
    else
      result.sub!(indexed[index], replace[0])
    end
  end
  result
end

private

# Small functions that work to remove the parens
# and leave the enclosed string intact
def remove_parens(str)
  str.gsub(/[()]/, '')
end

def words_to_replace(str)
  template(str).map do |s|
    remove_parens(s)
  end
end

def template(string)
  string.scan(/\(\(.*?\)\)/m)
end

# def self.get_input(to_transform)
#   temp = ''
#   filled_out = to_transform.map do |x|
#     temp = x.split(':').first if x.include?(':')
#     if x.eql?(temp)
#       temp
#     else
#       puts "We need #{x.tr("\n", ' ')}: "
#       gets.chomp
#     end
#   end
#   filled_out
# end

end
