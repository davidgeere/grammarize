require 'grammarize/inflector/inflections'

Grammarize::Inflector.inflections(:en) do |inflect|

  inflect.gender "male", "female", "they"
  inflect.gender "waiter", "waitress", "waitron"
  inflect.gender "sir", "madam", "you"
  inflect.gender "boy", "girl"

  #Possessive Adjectives

  inflect.gender "my", "my"
  inflect.gender "your", "your"
  inflect.gender "his", "her", "its"

  inflect.person "my", "you", "his"
  inflect.person "my", "you", "hers"
  inflect.person "my", "you", "its"

  #Possessive Pronouns

  inflect.gender "mine", "mine"
  inflect.gender "yours", "yours"
  inflect.gender "his", "hers"

  inflect.person "mine", "yours", "his"
  inflect.person "mine", "yours", "hers"

  #Personal Pronouns

  #Subject
  
  inflect.gender "i", "i"
  inflect.gender "you", "you"
  inflect.gender "he", "she", "it"

  inflect.person "i", "you", "he"
  inflect.person "i", "you", "she"
  inflect.person "i", "you", "it"

  #Object

  inflect.gender "me", "me"
  inflect.gender "you", "you"
  inflect.gender "him", "her", "it"

  inflect.person "me", "you", "him"
  inflect.person "me", "you", "her"
  inflect.person "me", "you", "it"

end

ActiveSupport::Inflector.inflections(:en) do |inflect|

  inflect.irregular "this", "these"
  inflect.irregular "that", "those"

  #Possessive Adjectives
  inflect.irregular "my", "our"

  inflect.irregular "your", "your"

  inflect.irregular "his", "their"
  inflect.irregular "her", "their"
  inflect.irregular "its", "their"

  inflect.irregular "whose", "whose"

  #Possessive Pronouns
  inflect.irregular "mine", "ours"

  inflect.irregular "yours", "yours"

  inflect.irregular "his", "theirs"
  inflect.irregular "hers", "theirs"

  #Personal Pronouns
  #Subject
  inflect.irregular "i", "we"
  inflect.irregular "you", "you"
  inflect.irregular "he", "they"
  inflect.irregular "she", "they"
  inflect.irregular "it", "they"

  #Object
  inflect.irregular "me", "us"
  inflect.irregular "you", "you"
  inflect.irregular "him", "them"
  inflect.irregular "her", "them"
  inflect.irregular "it", "them"

end
