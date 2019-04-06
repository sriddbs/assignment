class SeasonSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :created_at

  has_many :episodes

  def episodes
    object.episodes.order('number')
  end
end
