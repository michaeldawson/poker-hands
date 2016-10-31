class Ranking
  class TwoPair < Ranking
    def valid?
      pairs.length == 2
    end

    def top_pair_value
      pairs.last.index
    end

    def second_pair_value
      pairs.first.index
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
      @pairs ||= grouped_by_value.select { |grouping, cards| cards.length == 2 }.map{ |grouping, cards| cards.first }.sort_by(&:index)
    end
  end
end
