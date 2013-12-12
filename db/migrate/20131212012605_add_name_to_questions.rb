class AddNameToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :name, :string,  default: ''
  end
end
