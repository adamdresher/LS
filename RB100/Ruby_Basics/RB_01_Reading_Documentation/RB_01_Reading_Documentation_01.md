## Where to Find Documentation
#### Where can you find the most complete Ruby documentation?
___
#### Solution
<https://docs.ruby-lang.org/en/>
___
#### Solution, LS
<https://docs.ruby-lang.org/en/>
#### Discussion
Until recently, <http://ruby-doc.org> was the primary source for Ruby docs, and most of our answers and course material use it. However, recently, things have changed and now <https://docs.ruby-lang.org/en/> is the preferred choice, so we encourage you to use it instead. However, don't worry if you find links to the older documentation in our material; the content is almost always identical.

The core API consists of all of the classes and modules that are available to your ruby programs without having to specifically require them in your program. This includes the Object, String, Array, and Hash classes, as well as the Kernel and Enumerable modules and many other classes and modules you will need often.

The standard library API consists of a number of classes and modules that are provided by your ruby distribution, but that need to be specifically imported into your program with require. This includes the Set, Date, JSON, and YAML classes, and the Singleton and Find modules. Most of these you won't encounter during your earliest days with ruby, but will become more familiar with time and experience.

There is no separate section that discusses the ruby language itself. Some of what people think of as "the language" are actually methods in the Kernel module or Object class, including loop, exit, fail, gets and require. The rest of the language, such as basic syntax, control methods (while, until, if, unless, case, break, next) operators, methods, and much more is tucked away in the core API documentation. Go to the core API documentation for your version of ruby and look near the top for the "New to ruby?" links. You will also find additional topics discussed in the links provided under the "Files" heading.

Note that the documentation effort is not complete; there are still a number of items that are not covered or are inadequately covered. However, it remains the most complete and up-to-date documentation available.
___
#### Notes
