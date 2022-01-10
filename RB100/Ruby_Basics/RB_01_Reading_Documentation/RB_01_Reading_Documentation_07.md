## String Class
#### Let's move on now to the documentation you will use most often; the core API section on Classes and Modules. All of these are listed under **Classes** on the Core API page.

> Don't worry too much about the term class. For now, think of classes as data types: numbers, character strings, arrays, hashes, etc.

Locate and open the class documentation for the `String` class.
___
#### Solution
<http://ruby-doc.org/core-#.#.#/String.html>
___
#### Solution, LS
<http://ruby-doc.org/core-#.#.#/String.html>
#### Discussion
To get to this page, go to the Core API page of [ruby-docs.org](ruby-docs.org), and locate the Classes section. You can apply a filter to this list by just typing into the text box next to the header: if you type "str", for example, the list collapses into just a handful of classes/methods, of which one is our desired `String` class. Clicking on String opens the `String` class documentation.

In later exercises, we will see the important parts of this page. For now, the main part of each page contains descriptions for all methods associated with the class or module you are viewing. They are also listed on the left under the **Methods** header.

There are two main types of methods: instance methods, which you will use most often, and class methods, which will become more important later. For now, you are mostly interested in the instance methods.

On the left-hand side, instance methods are identified with a `#`, e.g., `#size`, while class methods and module methods are identified with a `::`, e.g., `::new`. This is merely a documentation convention; the `#` and `::` are not part of the method names, nor are they used to refer to methods in your programs.

You will often see the `#` and `::` notation in ruby documentation, not just on the ruby-doc.org website. In particular, we use it here at Launch School. You will also see this notation prefixed by a class or module name; for instance, you may see `String#size` or `Array#size`, `Range::new` or `Hash::new`. This notation simply means that the named method is a member of the specified class or module.
___
#### Notes
