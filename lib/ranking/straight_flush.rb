class Ranking
  class StraightFlush < Ranking
    def valid?
      all_same_suit? && all_consecutive?
    end

    def beats_same_ranking?(other_ranking)
      top_card_value > other_ranking.top_card_value
    end

    def top_card_value
      cards.last.index
    end
  end
end
