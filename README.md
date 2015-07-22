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
@sentence = "#{@john.name} said to #{@susan.name}, #{john.gender.subjectize(3)} likes #{susan.gender.objectize(3)} dress."
```

> John said to Susan, **he** likes **her** dress.

In the exmaple you see John is the personal pronoun subject and Susan is the personal pronoun object, you will notice I also passed in a 3 into both subjectize and objectize which indicates we are speaking in the 3rd person. 

Here are a few more examples

**First Person Subject**
```
@sentence = "#{@susan.gender.subjectize} like coffee."
```

> **I** like coffee.

**First Person Object**
```
@sentence = "#{@susan.name} helped #{@john.gender.objectize}"
```

> Susan helped **me**.


##Documentation

There are no documents yet sorry! However I will do more examples and flesh out the documentation as I work on it more.

##Tests

Nope no tests either.

##Contributing

Yes please! I would really like to make it much better so any grammar police need apply. 

##Credits

Developed by [Mitchell Geere](https://github.com/MitchellGeere)

##Legal

Copyright &copy; 2015 [Daybear, Inc.](http://www.daybear.com)
Standard [MIT-License](https://github.com/Daybear/grammarize/blob/master/MIT-LICENSE.md)





