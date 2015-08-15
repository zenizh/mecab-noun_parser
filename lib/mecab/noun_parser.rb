module MeCab
  class NounParser
    def initialize(**options)
      @except = options[:except] || []
      @nouns = {}
      @nouns.default = 0
      @text = []
    end

    def <<(text)
      @text << text
    end

    def parse
      @text.each do |text|
        node = mecab.parseToNode(text)
        noun = ''

        while node
          if node.feature.split(',')[0] == '名詞'
            unless @except.include?(node.surface)
              noun << node.surface
            end
          else
            unless noun.empty?
              @nouns[noun] += 1
              noun = ''
            end
          end

          node = node.next
        end
      end

      self
    end

    def nouns
      sorted_nouns.map { |noun| { noun: noun[0], count: noun[1] } }
    end

    private

    def mecab
      @mecab ||= MeCab::Tagger.new
    end

    def sorted_nouns
      @nouns.sort_by { |_, count| -count }
    end
  end
end
