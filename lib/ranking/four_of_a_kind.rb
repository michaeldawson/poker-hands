require 'card'

class Ranking
  class FourOfAKind < Ranking
    def valid?
      !! four_of_a_kind_group
    end

    def top_card_value
      Card::VALUES.index(four_of_a_kind_group.first)
    end

    def beats_same_ranking?(other_ranking)
      top_card_value > other_ranking.top_card_value
    end

    private

    def four_of_a_kind_group
      @four_of_a_kind_group ||= grouped_values.detect do |grouping, cards|
        cards.length == 4
      end
    end
  end
end
