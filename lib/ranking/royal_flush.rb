class Ranking
  class RoyalFlush < Ranking
    def valid?
      all_same_suit? && all_consecutive? && values.include?('A')
    end
  end
end
