<https://docs.ruby-lang.org/en/master/Psych.html#method-c-load_file>

Finding this was fairly straightforward.  YAML is part of the standard library, but needs to be loaded in.  So my hunch was that it's a module or class.  As a result, it should be easy to find in the Ruby docs main directory and it is (a module).  However `::load_file` was not a listed method.  Reading the `YAML` doc explains that `YAML` is an alias for `Psych`, so that's the next doc to look up.  Sure enough, `::load_file` can be easily found on this page.
