class EpisodeSerializer < ActiveModel::Serializer
  attributes :id, :title, :plot, :number, :season_id
end
