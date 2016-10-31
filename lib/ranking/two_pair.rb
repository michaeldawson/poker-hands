class Ranking
  class TwoPair < Ranking
    def valid?
      pairs.length == 2
    end

    def top_pair_value
      Card::VALUES.index(pairs.last)
    end

    def second_pair_value
      Card::VALUES.index(pairs.first)
    end

    def beats_same_ranking?(other_ranking)
      if top_pair_value > other_ranking.top_pair_value
        true
      elsif top_pair_value == other_ranking.top_pair_value
        second_pair_value > other_ranking.second_pair_value
      else
        false
      end
    end

    private

    def pairs
      grouped_values.select { |grouping, cards| cards.length == 2 }.keys.sort_by { |card_value| Card::VALUES.index(card_value) }
    end
  end
end
