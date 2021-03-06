require_relative '../config/environment'
require_relative '../app/models/user.rb'
$index_user = 1
$index_todolist = 1
# Use Active Record Model methods to implement the following methods.
class Assignment
 
  #
  # Insert rows in DB
  
  def create_user(user_hash = {}) #ta certo!!
      obj = User.new(id: $index_user, username: user_hash[:username], password_digest: user_hash[:password_digest])
      $index_user = $index_user+1
      obj.save
      #obj.create(username: user_hash[:username], password_digest: user_hash[:password_digest])
      obj.id
      #return obj
      # accept a hash of user properties (`:username` and `:password_digest`) as an input parameter. Note these are 100% same as model class.
      # use the User Model class to create a new user in the DB
      # return an instance of the class with primary key (`id`), and dates (`created_at` and `updated_at`) assigned
  end

  def create_todolist(todolist_hash = {})
      obj = TodoList.new(id: $index_todolist, list_name: todolist_hash[:name], list_due_date: todolist_hash[:due_date])
      $index_todolist = $index_todolist + 1
      obj.save
      obj.id
      # accept a hash of todolist properties (`:name` and `:due_date`) as an input parameter. Note these are not 100% the same as Model class.
      # use the TodoList Model class to create a new user in the DB
      # return an instance of the class with primary key (`id`), and dates (`created_at` and `updated_at`) assigned
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
      obj = User.all.order(updated_at: :asc).limit(limit).offset(offset)
      # accept offset and limit input parameters

      # use the User Model class to find all Users, ordered by `updated_at` ascending, with specified row offset and row limit
      # return a collection of User instances that represent the specified rows
  end

  def find_alllists(offset, limit)
      obj = TodoList.all.order(list_due_date: :desc).limit(limit).offset(offset) # accept offset and limit input parameters
      # use the TodoList Model class to find all TodoLists, ordered by `list_due_date` descending, with specified row offset and row limit
      # return a collection of TodoList instances that represent the specified rows
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
      obj = User.where(:username => username)
      # accept a username input parameter
      # use the User Model class to find all Users with the supplied username. 
      # NOTE:  Username is not unique in the Users table, thus you can have many users with the same username.
      # return a collection of User instances that match the provided username  
  end 

  def find_todolist_byname(name)
    obj = TodoList.where(:list_name => name)
      # accept a name input parameter
      # use the TodoList Model class to find all TodoLists with the supplied list_name. 
      # NOTE: List name is not required to be unique, thus you can have many lists with the same list name.
      # return a collection of TodoList instances that match the provided name
  end     

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
      obj = User.find(id)
      # accept an id input parameter
      # use the User Model class to get the User associated with the `id` primary key
      # return the User instance that matches the provided id
  end

  def get_todolist_byid(id)
    obj = TodoList.find(id)
      # accept an id input parameter
      # use the TodoList Model class to get the TodoList associated with the `id` primary key
      # return the TodoList instance that matches the provided id
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
      obj = User.find(id)
      obj.password_digest = password_digest
      obj.save
      # accept an id and password_digest input parameters
      # use the User Model class to update the `password_digest` for the User associated with the id primary key
      # (no return is required)
  end

  def update_listname(id, name)
      obj = TodoList.find(id)
      obj.list_name = name
      obj.save
      # accept an id and name input parameters
      # use the TodoList Model class to update the `list_name` for the TodoList associated with id primary key 
      # (no return is required)
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
     User.delete(id)
      # accept an id input parameter
      # use the User Model class to remove the User associated with the `id` primary key from the database
      # (no return is required)
  end 

  def delete_todolist(id)
      TodoList.delete(id)
      # accept an id input parameter
      # use the TodoList Model class to remove the TodoList associated with the `id` primary key.
      # (no return is required)
  end
end
