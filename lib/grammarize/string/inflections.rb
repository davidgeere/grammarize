require 'grammarize/inflector/methods'

class String

  def subjectivize(person=:first, locale = :en)
    Grammarize::Inflector.subjectivize(self, person, locale)
  end

  def objectivize(person=:first, locale = :en)
    Grammarize::Inflector.objectivize(self, person, locale)
  end

  def possessivize(person=:first, locale = :en)
    Grammarize::Inflector.possessivize(self, person, locale)
  end

  def determinerize(person=:first, locale = :en)
    Grammarize::Inflector.determinerize(self, person, locale)
  end

  def adultize(locale = :en)
    Grammarize::Inflector.adultize(self, locale)
  end

  def childize(locale = :en)
    Grammarize::Inflector.childize(self, locale)
  end

  def casualize(locale = :en)
    Grammarize::Inflector.casualize(self, locale)
  end

  def familize(relationship, locale = :en)
    Grammarize::Inflector.familize(self, relationship, locale)
  end

  def genderize(locale = :en)
    Grammarize::Inflector.genderize(self, locale)
  end

  def maleize(locale = :en)
    Grammarize::Inflector.maleize(self, locale)
  end

  def femaleize(locale = :en)
    Grammarize::Inflector.femaleize(self, locale)
  end

  def neutralize(locale = :en)
    Grammarize::Inflector.neutralize(self, locale)
  end

end
