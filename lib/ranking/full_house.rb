class Ranking
  class FullHouse < Ranking
    def valid?
      three_of_a_kind_group && pair_group
    end

    def beats_same_ranking?(other_ranking)
      if top_card_value > other_ranking.top_card_value
        true
      elsif top_card_value == other_ranking.top_card_value
        pair_value > other_ranking.pair_value
      else
        false
      end
    end

    def top_card_value
      three_of_a_kind_group.last.first.index
    end

    def pair_value
      pair_group.last.first.index
    end

    private

    def three_of_a_kind_group
      @three_of_a_kind_group ||= grouped_by_value.detect do |grouping, cards|
        cards.length == 3
      end
    end

    def pair_group
      @pair_group ||= grouped_by_value.detect do |grouping, cards|
        cards.length == 2
      end
    end
  end
end
