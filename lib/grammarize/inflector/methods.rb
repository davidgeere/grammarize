require 'grammarize/inflections'

module Grammarize
  extend self

  module Inflector

    def subjectize(word, person=:first, locale = :en)
      apply_pronouns("i", word, person, locale)
    end

    def objectize(word, person=:first, locale = :en)
      apply_pronouns("me", word, person, locale)
    end

    def possessivize(word, person=:first, locale = :en)
      apply_pronouns("my", word, person, locale)
    end

    def ownerize(word, person=:first, locale = :en)
      apply_pronouns("mine", word, person, locale)
    end

    def adultize(word, locale = :en)
      apply_familiar("woman", word, locale)
    end

    def childize(word, locale = :en)
      apply_familiar("boy", word, locale)
    end

    def casualize(word, locale = :en)
      apply_familiar("guy", word, locale)
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

      ["male", "female", "neutral"][gender_index(word, locale)]

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
      apply_inflections(0, word, inflections(locale).genders)
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
      apply_inflections(1, word, inflections(locale).genders)
    end

    # Returns the neutral form of the word in the string.
    #
    # If passed an optional +locale+ parameter, the word will be
    # pluralized using rules defined for that language. By default,
    # this parameter is set to <tt>:en</tt>.
    #
    #   neutralize('waitress')             # => "waitron"
    def neutralize(word, locale = :en)
      apply_inflections(2, word, inflections(locale).genders)
    end

    def apply_pronouns(indicator, word, person=:first, locale = :en)

      index = gender_index(word, locale)

      owner = apply_inflections([:first, :second, :third].index(person), indicator, inflections(locale).persons)

      apply_inflections(index, owner, inflections(locale).genders)

    end

    def apply_familiar(indicator, word, locale = :en)

      index = gender_index(word, locale)

      apply_inflections(index, indicator, inflections(locale).genders)

    end

    # Applies inflection rules for +singularize+ and +pluralize+.
    #
    #  apply_inflections('female', inflections.males)    # => "male"
    #  apply_inflections('male', inflections.females) # => "female"
    def apply_inflections(index, word, matrix)

      result = word.to_s.dup

      matrix.each do |row|
        next unless row.include?(word)

        unless row[index].blank?
          result = row[index]
          break
        end
      end

      result

    end

    def gender_index(word, locale = :en)

      genders = inflections(locale).genders

      index = determine_gender(word, genders)

    end

    def determine_gender(word, matrix)

      index = 0

      matrix.each do |row|
        if row.include?(word)
          index = row.index(word)
          break
        end
      end

      index

    end
  end
end
