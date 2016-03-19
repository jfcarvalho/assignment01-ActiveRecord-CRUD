json.extract! @todo_item, :id, :due_date, :title, :description, :completed, :{default, :false}, :created_at, :updated_at
