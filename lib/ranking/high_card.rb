class Ranking
  class HighCard < Ranking
    def valid?
      true
    end

    def beats_same_ranking?(other_ranking)
      top_card_value > other_ranking.top_card_value
    end

    def top_card_value
      top_card = values.sort_by {|value| Card::VALUES.index(value) }.last
      Card::VALUES.index(top_card)
    end
  end
end
