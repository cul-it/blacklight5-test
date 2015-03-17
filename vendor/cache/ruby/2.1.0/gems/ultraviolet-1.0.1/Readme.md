Ultraviolet is a html syntax highlighting library.<br/>
It uses [Textpow](https://github.com/grosser/textpow) to supports more than 60 programming languages.

# INSTALL

    gem install ultraviolet

Ruby 1.8: [Install onigumura](https://github.com/grosser/textpow#ruby-18)

# [Demo](http://grosser.github.com/ultraviolet)

# Usage

### Commandline interface

    uv -l syntax # Listing available syntaxes:
    uv -l themes # Listing available themes:
    uv lib/uv.rb # Letting to guess the parameters
    uv -s yaml -t espresso_libre syntax/ini.syntax Specifying a syntax and a theme

    # Output results to `index.html` and copy required files (/eg/ css):
    uv -c . syntax/ini.syntax > index.html

    # Producing output in latex and converting to pdf:
    uv -h -o latex lib/uv.rb > uv.tex
    pdflatex uv.tex

### Ruby interface

    # List of available syntaxes
    puts Uv.syntaxes.join( ", " )

    # Listing available themes
    puts Uv.themes.join( ", " )

    # Parsing a css string. Produce xhtml output, with line numbers using amy theme
    result = Uv.parse( text, "xhtml", "css", true, "amy")

    # Output copy required files for `xhtml` format to directory `site`
    Uv.copy_files "xhtml", "site"

### Examples
 - [Macaronic markup engine](http://mama.rubyforge.org)
 - [Radiograph rails plugin](http://agilewebdevelopment.com/plugins/radiograph)
 - [SimpleHighlight plugin for SimpleLog](http://www.daikini.com/past/2007/6/14/simplehighlight_syntax_highlighting_for_simplelog)

# TODO
 - less crazy Uv.parse interface -> options hash
 - replace them gallery example with some nice example code

# Maintainer info

### Updating demo

    cd _pages
    bundle exec ruby generate.rb
    bundle exec rackup

    open http://localhost:9292

### Updating theme files

Currently only XHTML is "officially" supported by ultraviolet, nevertheless,
experimental latex output support already exists and other output formats can
be included in the future. This is important because theme conversion is format
dependent. For xhmtl, the command is `theme2xhtmlrender` as shown in the
following example.

    theme2xhtmlrender Amy.tmTheme

For latex, the command `theme2latexrender` is used instead.

    theme2latexrender Amy.tmTheme

Authors
=======

Original author [Dizan Vasquez](https://github.com/dichodaemon).

### [Contributors](https://github.com/grosser/ultraviolet/contributors)
 - [Chris Hoffman](https://github.com/cehoffman)
 - [Spox](https://github.com/spox)
 - [Richard Ramsden](https://github.com/rramsden)
 - [Humza](https://github.com/secondplanet)
 - [Harry Brundage](https://github.com/hornairs)

[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://secure.travis-ci.org/grosser/ultraviolet.png)](http://travis-ci.org/grosser/ultraviolet)
