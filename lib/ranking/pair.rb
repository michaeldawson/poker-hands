class Ranking
  class Pair < Ranking
    def valid?
      grouped_values.select { |grouping, cards| cards.length == 2 }.any?
    end

    def pair_value
      pair_card = pair_group.first
      Card::VALUES.index(pair_card)
    end

    def top_kicker_value
      top_kicker_card = kickers.sort_by { |value| Card::VALUES.index(value) }.last
      Card::VALUES.index(top_kicker_card)
    end

    def beats_same_ranking?(other_ranking)
      return true if pair_value > other_ranking.pair_value
      if pair_value == other_ranking.pair_value
        top_kicker_value > other_ranking.top_kicker_value
      else
        false
      end
    end

    private

    def pair_group
      @pair_group ||= grouped_values.detect do |grouping, cards|
        cards.length == 2
      end
    end

    def kickers
      @kickers ||= grouped_values.select { |grouping, cards| cards.one? }.keys
    end
  end
end
