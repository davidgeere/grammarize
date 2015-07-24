#Grammarize

Grammarize is a simple Rails gem for adding grammar inflector methods to string.

##Example

Let's assume you have a model that holds a attribute for gender. In your case it returns "guy" and "girl". You want to be able to use your models in text in a natural way. Below is a typical way you would see it done.

```
@john = User.find(1)
@susan = User.find(2)
```

```
@sentence = "#{@john.name} said to #{@susan.name}, #{john.gender == "guy" ? "he" : "she"} likes #{susan.gender == "guy" ? "his" : "her"} dress."
```

I am being a little extreme in my example but I think for the sake of user experience and delight getting this stuff right is critical.

> John said to Susan, he likes her dress.

**Using Grammarize**
```
@sentence = "#{@john.name} said to #{@susan.name}, #{john.gender.subjectivize(:third)} likes #{susan.gender.objectivize(:third)} dress."
```

> John said to Susan, **he** likes **her** dress.

In the exmaple you see John is the personal pronoun subject and Susan is the personal pronoun object, you will notice I also passed in a 3 into both subjectize and objectize which indicates we are speaking in the 3rd person.

Here are a few more examples

**First Person Subject**
```
@sentence = "#{@susan.gender.subjectivize} like coffee."
```

> **I** like coffee.

**First Person Object**
```
@sentence = "#{@susan.name} helped #{@john.gender.objectivize}"
```

> Susan helped **me**.


##Documentation

There are no documents yet sorry! However I will do more examples and flesh out the documentation as I work on it more.

###API

**Subjectize**
This results in personal pronouns (i, you, he, she, it) as a subject, with allowance for 1st, 2nd and 3rd person.
```
subjectivize(person=:first, locale = :en)
```

Usage:
```
"woman".subjectivize # i
"woman".subjectivize :first # i
"woman".subjectivize :second # you
"woman".subjectivize :third # she
```

**Objectivize**
This results in personal pronouns (me, you, him, her, it) as an object, with allowance for 1st, 2nd and 3rd person.
```
objectivize(person=:first, locale = :en)
```

Usage:
```
"woman".objectivize # me
"woman".objectivize :first # me
"woman".objectivize :second # you
"woman".objectivize :third # her
```

**Possessivize**
This results in possessive pronouns (mine, yours, his, hers, its), with allowance for 1st, 2nd and 3rd person.
```
possessivize(person=:first, locale = :en)
```

Usage:
```
"woman".possessivize # mine
"woman".possessivize :first # mine
"woman".possessivize :second # yours
"woman".possessivize :third # hers
```

**Determinerize**
This results in possessive adjectives (my, your, his, her, its), with allowance for 1st, 2nd and 3rd person.
```
determinerize(person=:first, locale = :en)
```

Usage:
```
"woman".determinerize # my
"woman".determinerize :first # my
"woman".determinerize :second # your
"woman".determinerize :third # her

```

**Adultize**
This results in man, woman and person.
```
adultize(locale = :en)
```

Usage:
```
"girl".adultize # woman
```

**Childize**
This results in boy, girl and child.
```
childize(locale = :en)
```

Usage:
```
"woman".childize # girl

```

**Casualize**
This results in guy, girl and person.
```
casualize(locale = :en)
```

Usage:
```
"woman".casualize # girl
```

**Genderize**
This results in male, female and neutral.
```
genderize(locale = :en)
```

Usage:
```
"woman".genderize # female
```

**Maleize**
Turns whatever you give it into the male form - assume the inflector has it stored
```
maleize(locale = :en)
```

Usage:
```
"woman".maleize # man
```

**Femaleize**
Turns whatever you give it into the female form - assume the inflector has it stored
```
femaleize(locale = :en)
```

Usage:
```
"man".femaleize # woman
```

**Neutralize**
Turns whatever you give it into the neutral form - assume the inflector has it stored
```
neutralize(locale = :en)
```

Usage:
```
"woman".neutralize # person
```

**Familize**
This allows your to get the name based on the familial relationship such as :child, :parent, :grandparent etc.
```
familize(relationship, locale = :en)
```

Usage:
```
"woman".familize :parent # mother
"woman".familize :grandparent # grandmother
"woman".familize :child # daughter
"woman".familize :grandchild # granddaughter
```

###Configuration
Not much to do other than just bundling the gem, however if you want to extend the inflections create an initializer file in your config called grammarize.rb and add your inflections

```
# config/initializers/grammarize.rb

Grammarize::Inflector.inflections(:en) do |inflect|
  # male, female, neutra
  inflect.gender "bull", "cow", "cattle"

  # first, second, third person
  inflect.person "i", "you", "hers"
end
```

*you will notice that you can sort of use your own locale with the exception that for now it only really support english given that in the methods I hard coded the indicators in the apply_pronouns and apply_familiar which will be updated soon to be configurable.

##Tests

Nope no tests either.

##Contributing

Yes please! I would really like to make it much better so any grammar police need apply.

##Credits

Developed by [Mitchell Geere](https://github.com/MitchellGeere)

##Legal

Copyright &copy; 2015 [Daybear, Inc.](http://www.daybear.com)
Standard [MIT-License](https://github.com/Daybear/grammarize/blob/master/MIT-LICENSE.md)
