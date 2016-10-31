class Ranking
  class ThreeOfAKind < Ranking
    def valid?
      !! three_of_a_kind_group
    end

    def triple_value
      three_of_a_kind_group.last.first.index
    end

    def beats_same_ranking?(other_ranking)
      triple_value > other_ranking.triple_value
    end

    private

    def three_of_a_kind_group
      @three_of_a_kind_group ||= grouped_by_value.detect do |grouping, cards|
        cards.length == 3
      end
    end
  end
end
