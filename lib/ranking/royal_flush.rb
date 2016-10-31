class Ranking
  class RoyalFlush < Ranking
    def valid?
      all_same_suit? && all_consecutive? && cards.map(&:value).include?('A')
    end
  end
end
