require 'grammarize/inflector/methods'

class String

  def subjectize(person=1)
    Grammarize::Inflector.subjectize(self, person)
  end

  def objectize(person=1)
    Grammarize::Inflector.objectize(self, person)
  end

  def possessivize(person=1)
    Grammarize::Inflector.possessivize(self, person)
  end

  def ownerize(person=1)
    Grammarize::Inflector.ownerize(self, person)
  end

  def adultize
    Grammarize::Inflector.adultize(self)
  end

  def childize
    Grammarize::Inflector.childize(self)
  end

  def casualize
    Grammarize::Inflector.casualize(self)
  end

  def genderize
    Grammarize::Inflector.genderize(self, :en)
  end

  def maleize
    Grammarize::Inflector.maleize(self, :en)
  end

  def femaleize
    Grammarize::Inflector.femaleize(self, :en)
  end

  def neutralize
    Grammarize::Inflector.neutralize(self, :en)
  end

end
