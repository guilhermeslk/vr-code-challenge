class BaseQueryObject
  # @!attribute [r] relation
  #   @return [ActiveRecord_Relation]
  attr_reader :relation

  def initialize(relation)
    @relation = relation
  end

  def perform
    relation.where(query)
  end

  def query
    raise NotImplementedError
  end
end
