# Mecab::NounParser

[![Build Status](https://travis-ci.org/kami-zh/mecab-noun_parser.svg)](https://travis-ci.org/kami-zh/mecab-noun_parser)
[![Gem Version](https://badge.fury.io/rb/mecab-noun_parser.svg)](http://badge.fury.io/rb/mecab-noun_parser)

This gem is a noun parser for [MeCab](https://github.com/markburns/mecab) gem.
This counts the number of nouns, and arranging it in descending order.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mecab'
gem 'mecab-noun_parser'
```

And then execute:

    $ bundle

## Usage

Here's a simple example to use:

```ruby
require 'mecab'
require 'mecab-noun_parser'

parser = MeCab::NounParser.new

parser << 'Rubyは、手軽なオブジェクト指向プログラミングを実現するための種々の機能を持つオブジェクト指向スクリプト言語です。本格的なオブジェクト指向言語であるSmalltalk、EiffelやC++などでは大げさに思われるような領域でのオブジェクト指向プログラミングを支援することを目的としています。もちろん通常の手続き型のプログラミングも可能です。'
parser << 'Rubyはテキスト処理関係の能力などに優れ、Perlと同じくらい強力です。さらにシンプルな文法と、例外処理やイテレータなどの機構によって、より分かりやすいプログラミングが出来ます。'
parser << 'まあ、簡単にいえばPerlのような手軽さで「楽しく」オブジェクト指向しようという言語です。どうぞ使ってみてください。'
parser << 'Rubyはまつもと ゆきひろが個人で開発しているフリーソフトウェアです。'

p parser.parse.nouns
```

This results is as follows:

```ruby
[
  {:noun=>"Ruby", :count=>3},
  {:noun=>"オブジェクト指向プログラミング", :count=>2},
  {:noun=>"Perl", :count=>2},
    :
  {:noun=>"個人", :count=>1},
  {:noun=>"開発", :count=>1},
  {:noun=>"フリーソフトウェア", :count=>1}
]
```

### Except some words

If you don't want to include some words, you should initialize with `:except` option:

```ruby
parser = MeCab::NounParser.new(except: ['Smalltalk', 'Eiffel', ...])
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kami-zh/mecab-noun_parser.
