class TaskSerializer < ActiveModel::Serializer
  root false

  attributes :id, :base_string,:substring, :status, :enterings

  def enterings
    object.status ? object.enterings : []
  end
end