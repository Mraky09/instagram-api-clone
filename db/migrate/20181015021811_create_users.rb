Sequel.migration do
  change do

    create_table :users do
      primary_key :id
      String :email, null: false
      String :first_name
      String :last_name
      String :password_digest, null: false
      DateTime :created_at, null: false
      DateTime :updated_at, null: false
    end

  end
end
