class UserSerializer < ActiveModel::Serializer
  root false

  attributes :id, :email, :tasks

  def tasks
    object.tasks.map{ |task| TaskSerializer.new(task) }
  end
end