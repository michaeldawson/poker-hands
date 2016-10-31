class Ranking
  class FullHouse < Ranking
    def valid?
      grouped_values.values.map(&:length).sort == [2, 3]
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
      Card::VALUES.index(three_of_a_kind_group.first)
    end

    def pair_value
      Card::VALUES.index(pair_group.first)
    end

    private

    def three_of_a_kind_group
      @three_of_a_kind_group ||= grouped_values.detect do |grouping, cards|
        cards.length == 3
      end
    end

    def pair_group
      @pair_group ||= grouped_values.detect do |grouping, cards|
        cards.length == 2
      end
    end
  end
end
