Sequel.migration do
  change do

    create_table :users do
      primary_key :id
      String :email
      String :first_name
      String :last_name
    end

  end
end
