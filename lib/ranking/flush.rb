class Ranking
  class Flush < Ranking
    def valid?
      all_same_suit?
    end

    def top_card_value
      cards.last.index
    end

    def beats_same_ranking?(other_ranking)
      top_card_value > other_ranking.top_card_value
    end
  end
end
