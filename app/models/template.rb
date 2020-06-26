class Template < ApplicationRecord
    def to_param
        title.parameterize
    end

    def replace_words
        original = template(story)
        to_replace = words_to_replace(story)

        { original: original, replace: to_replace }
  end

    def final_story(replacer, indexed)
        # replacer should be new inputs zipped with replace
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
end
