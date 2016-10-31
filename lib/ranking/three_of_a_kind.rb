class Ranking
  class ThreeOfAKind < Ranking
    def valid?
      !! three_of_a_kind_group
    end

    def triple_value
      Card::VALUES.index(three_of_a_kind_group.first)
    end

    def beats_same_ranking?(other_ranking)
      triple_value > other_ranking.triple_value
    end

    private

    def three_of_a_kind_group
      @three_of_a_kind_group ||= grouped_values.detect do |grouping, cards|
        cards.length == 3
      end
    end
  end
end
