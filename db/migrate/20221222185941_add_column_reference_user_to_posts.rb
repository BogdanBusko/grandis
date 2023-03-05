class AddColumnReferenceUserToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, type: :uuid
  end
end
