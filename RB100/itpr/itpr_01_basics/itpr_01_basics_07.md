What does the following error message tell you?

```
SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
  from /usr/local/rvm/rubies/ruby-2.5.3/bin/irb:16:in `<main>'
```

##### MY SOLUTION
The user is inputting via irb.
The error occurs on line 2.
There's a syntax error where an argument seems to be closed with the wrong character.  A parathesise seems to be used instead of a squiggly bracket.
This could be from a hash, an ```if```/```else``` statement, and ... those are the only two cases I can think of that use a squiggly bracket.
Check for the character in line 2, adjust the syntax, and run the script to see if the error is resolved.
