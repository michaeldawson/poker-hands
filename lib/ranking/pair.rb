class Ranking
  class Pair < Ranking
    def valid?
      !! pair_group
    end

    def pair_value
      pair_group.last.first.index
    end

    def top_kicker_value
      kickers.last.index
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
      @pair_group ||= grouped_by_value.detect do |value, group|
        group.length == 2
      end
    end

    def kickers
      @kickers ||= cards.reject { |card| card.value == pair_group.first }
    end
  end
end
