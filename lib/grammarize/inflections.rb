require 'grammarize/inflector/inflections'

Grammarize::Inflector.inflections(:en) do |inflect|

  inflect.gender "male", "female", "person"
  inflect.gender "guy", "girl", "person"
  inflect.gender "boy", "girl", "child"
  inflect.gender "man", "woman", "child"
  inflect.gender "son", "daughter", "child"
  inflect.gender "father", "mother", "parent"
  inflect.gender "father-in-law", "mother-in-law", "parent-in-law"
  inflect.gender "grandfather", "grandmother", "grandparent"
  inflect.gender "brother", "sister", "sibling"
  inflect.gender "brother-in-law", "sister-in-law", "sibling-in-law"
  inflect.gender "stepbrother", "stepsister", "stepsibling"
  inflect.gender "uncle", "aunt", "parent sibling"
  inflect.gender "nephew", "niece", "sibling child"
  inflect.gender "husband", "wife", "spouse"
  inflect.gender "sir", "madam", "you"
  inflect.gender "waiter", "waitress", "waitron"
  inflect.gender "steward", "stewardess", "server"
  inflect.gender "policeman", "policewoman", "police officer"
  inflect.gender "aviator", "aviatrix", "pilot"
  inflect.gender "barman", "barmaid", "bar tender"
  inflect.gender "businessman", "businesswoman", "business person"
  inflect.gender "priest", "priestess", "minister"
  inflect.gender "cowboy", "cowgirl", "cowhand"
  inflect.gender "king", "queen", "monarch"
  inflect.gender "nobleman", "noblewoman", "noble"
  inflect.gender "lord", "lady", "noble"
  inflect.gender "duke", "duchess", "noble"
  inflect.gender "prince", "princess", "noble"
  inflect.gender "horseman", "horsewoman", "horse rider"
  inflect.gender "godfather", "godmother", "godparent"
  inflect.gender "grandson", "granddaughter", "grandchild"
  inflect.gender "boyfriend", "girlfriend", "partner"
  inflect.gender "fiancée", "fiancé", "betrothed"

  #Possessive Adjectives

  inflect.gender "my", "my"
  inflect.gender "your", "your"
  inflect.gender "his", "her", "its"

  inflect.person "my", "you", "his"

  #Possessive Pronouns

  inflect.gender "mine", "mine"
  inflect.gender "yours", "yours"
  inflect.gender "his", "hers", "its"

  inflect.person "mine", "yours", "hers"

  #Personal Pronouns

  #Subject

  inflect.gender "i", "i"
  inflect.gender "you", "you"
  inflect.gender "he", "she", "it"

  inflect.person "i", "you", "she"

  #Object

  inflect.gender "me", "me"
  inflect.gender "you", "you"
  inflect.gender "him", "her", "it"

  inflect.person "me", "you", "her"

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
