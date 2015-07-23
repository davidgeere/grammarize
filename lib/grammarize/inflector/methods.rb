require 'grammarize/inflections'

module Grammarize
  extend self

  module Inflector

    def subjectize(gender, person=1)

      case person
      when 1
        subject = "i"
      when 2
        subject = "you"
      when 3
        case gender.downcase
        when "male"
          "he"
        when "female"
          "she"
        else
          "it"
        end
      end

    end

    def objectize(gender, person=1)

      case person
      when 1
        subject = "me"
      when 2
        subject = "you"
      when 3
        case gender.downcase
        when "male"
          "him"
        when "female"
          "her"
        else
          "it"
        end
      end

    end

    def possessivize(gender, person=1)

      case person
      when 1
        subject = "my"
      when 2
        subject = "your"
      when 3
        case gender.downcase
        when "male"
          "his"
        when "female"
          "her"
        else
          "its"
        end
      end

    end

    def ownerize(gender, person=1)

      case person
      when 1
        subject = "mine"
      when 2
        subject = "yours"
      when 3
        case gender.downcase
        when "male"
          "his"
        when "female"
          "hers"
        else
          "theirs"
        end
      end

    end

    def adultize(gender)
      case gender.downcase
      when "male"
        "man"
      when "female"
        "woman"
      else
        "it"
      end
    end

    def childize(gender)
      case gender.downcase
      when "male"
        "boy"
      when "female"
        "girl"
      else
        "it"
      end
    end

    def casualize(gender)
      case gender.downcase
      when "male"
        "guy"
      when "female"
        "girl"
      else
        "it"
      end
    end

    # Returns the gender of the word in the string.
    #
    # If passed an optional +locale+ parameter, the word will be
    # pluralized using rules defined for that language. By default,
    # this parameter is set to <tt>:en</tt>.
    #
    #   genderize('waitress')   # => "female"
    #   genderize('waiter')     # => "male"
    #   genderize('waitron')    # => "neutra"
    def genderize(word, locale = :en)

      return "male" if determine_gender(word, inflections(locale).males)
      return "female" if determine_gender(word, inflections(locale).females)
      return "neutra" if determine_gender(word, inflections(locale).neutrals)

    end

    # Returns the male form of the word in the string.
    #
    # If passed an optional +locale+ parameter, the word will be
    # pluralized using rules defined for that language. By default,
    # this parameter is set to <tt>:en</tt>.
    #
    #   maleize('female')             # => "male"
    #   maleize('chica', :es)         # => "chico"
    def maleize(word, locale = :en)
      apply_inflections(:male, word, locale)
    end

    # Returns the female form of the word in the string.
    #
    # If passed an optional +locale+ parameter, the word will be
    # pluralized using rules defined for that language. By default,
    # this parameter is set to <tt>:en</tt>.
    #
    #   femaleize('male')             # => "female"
    #   femaleize('chico', :es)       # => "chica"
    def femaleize(word, locale = :en)
      apply_inflections(:female, word, locale)
    end

    # Returns the neutral form of the word in the string.
    #
    # If passed an optional +locale+ parameter, the word will be
    # pluralized using rules defined for that language. By default,
    # this parameter is set to <tt>:en</tt>.
    #
    #   neutralize('waitress')             # => "waitron"
    def neutralize(word, locale = :en)
      apply_inflections(:neutra, word, locale)
    end

    # Applies inflection rules for +singularize+ and +pluralize+.
    #
    #  apply_inflections('female', inflections.males)    # => "male"
    #  apply_inflections('male', inflections.females) # => "female"
    def apply_inflections(gender, word, locale = :en)

      result = word.to_s.dup

      genders = inflections(locale).genders

      index = [:male, :female, :neutra].index(gender)

      genders.each do |row|
        next unless row.include?(word)

        unless row[index].blank?
          result = row[index]
          break
        end
      end

      result

    end

    def get_genders
      inflections(:en).genders
    end

    def determine_gender(word, rules)

      rules.each do |(rule, replacement)|
        if rule == word.downcase
          return true
        end
      end

      return false

    end
  end
end
