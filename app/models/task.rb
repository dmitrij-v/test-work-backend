class Task < ApplicationRecord
  belongs_to :user

  serialize :enterings

  def self.solve strings
    enterings = []
    current_index = 0
    work_string = strings[:substring].dup

    until work_string.empty? do
      current = work_string.slice!(0)
      current_index = strings[:string].index(current, current_index) || -1
      enterings << current_index

      break if current_index == -1
    end

    status = !enterings.include?(-1)

    { status: status, enterings: enterings }
  end
end
