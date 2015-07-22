require 'grammarize/inflector/inflections'

Grammarize::Inflector.inflections(:en) do |inflect|

  inflect.role "male", "female", "they"
  inflect.role "waiter", "waitress", "waitron"
  inflect.role "sir", "madam", "you"
  inflect.role "boy", "girl"

  #Possessive Adjectives
  inflect.role "my", "my"
  inflect.role "your", "your"
  inflect.role "his", "her", "its"

  inflect.person "my", "you", "his"
  inflect.person "my", "you", "hers"
  inflect.person "my", "you", "its"

  #Possessive Pronouns
  inflect.role "mine", "mine"
  inflect.role "yours", "yours"
  inflect.role "his", "hers"

  inflect.person "mine", "yours", "his"
  inflect.person "mine", "yours", "hers"

  #Personal Pronouns

  #Subject
  inflect.role "i", "i"
  inflect.role "you", "you"
  inflect.role "he", "she", "it"

  inflect.person "i", "you", "he"
  inflect.person "i", "you", "she"
  inflect.person "i", "you", "it"

  #Object
  inflect.role "me", "me"
  inflect.role "you", "you"
  inflect.role "him", "her", "it"

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
