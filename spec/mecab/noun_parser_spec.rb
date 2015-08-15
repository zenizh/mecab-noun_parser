require 'spec_helper'

describe MeCab::NounParser do
  let(:nouns)  { parser.parse.nouns }

  before do
    parser << 'Rubyは、手軽なオブジェクト指向プログラミングを実現するための種々の機能を持つオブジェクト指向スクリプト言語です。本格的なオブジェクト指向言語であるSmalltalk、EiffelやC++などでは大げさに思われるような領域でのオブジェクト指向プログラミングを支援することを目的としています。もちろん通常の手続き型のプログラミングも可能です。'
    parser << 'Rubyはテキスト処理関係の能力などに優れ、Perlと同じくらい強力です。さらにシンプルな文法と、例外処理やイテレータなどの機構によって、より分かりやすいプログラミングが出来ます。'
    parser << 'まあ、簡単にいえばPerlのような手軽さで「楽しく」オブジェクト指向しようという言語です。どうぞ使ってみてください。'
    parser << 'Rubyはまつもと ゆきひろが個人で開発しているフリーソフトウェアです。'
  end

  context 'default usage' do
    let(:parser) { MeCab::NounParser.new }

    it 'should be sort' do
      expect(nouns.first[:noun]).to eq 'Ruby'
      expect(nouns.first[:count]).to eq 3
    end

    it 'should be count' do
      count = nouns.find { |noun| noun[:noun] == 'オブジェクト指向プログラミング' }.count
      expect(count).to eq 2
    end
  end

  context 'except some words' do
    let(:parser) { MeCab::NounParser.new(except: ['Ruby', 'Smalltalk']) }

    it 'should not be include' do
      expect(nouns.first[:noun]).not_to eq 'Ruby'
    end
  end
end
