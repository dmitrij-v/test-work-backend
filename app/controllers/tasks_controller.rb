class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    status, enterings = Task.solve(task_params).values_at(:status, :enterings)
    task = current_user.tasks.create(
      base_string: task_params[:string],
      substring: task_params[:substring],
      status: status,
      enterings: enterings
    )

    render json: { result: TaskSerializer.new(task) }
  end

  def destroy
    task = current_user.tasks.find_by(id: params[:id])
    task.destroy if task
  end

  private

  def task_params
    params.permit(:string, :substring)
  end
end
