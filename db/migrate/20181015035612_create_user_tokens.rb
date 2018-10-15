Sequel.migration do
  change do

    create_table :user_tokens do
      primary_key :id
      foreign_key :user_id, :users, index: true
      String :token, null: false
      String :refresh_token, null: false
      DateTime :expired_at, null: false
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

  end
end
