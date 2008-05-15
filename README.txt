= taglob

== DESCRIPTION:

tags + Dir.glob = Dir.taglob

http://github.com/scudco/taglob/tree/master

== FEATURES/PROBLEMS:

* easily select tagged Ruby files

== SYNOPSIS:


Taglob is great. Check this out.
Imagine a bunch of files that look like
  #tags: zomg,buttz,foo,important
  class Lol
    def lulz
      puts "here are your lulz, sir"
    end
  end

And then you are like dang I wish I could glob these files based on the 
tags I setup! What am I doing with my life???
Taglob! (like Tada! but more like its unsophisticated country cousin(in name only(parentheses)))
  Dir.taglob("**/*.rb","foo","lol")
That will totally give you back all the files tagged with 'foo' and 'lol' in an array of strings representing the paths of those files.
It is really just glob with some extra stuff thrown in.
Totally small, totally useless, totally taglob.

  require 'rubygems'
  require 'taglob'
  
  Dir.taglob('**/*.rb','foo','bar','buttz').each {|file| puts "#{file} was tagged with foo or bar or buttz!"}

== INSTALL:

* sudo gem install taglob

== LICENSE:

(The MIT License)

Copyright (c) 2008 Adam Anderson

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
