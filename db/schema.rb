Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:users) do
      primary_key :id
      column :email, "text", :null=>false
      column :first_name, "text"
      column :last_name, "text"
      column :password_digest, "text", :null=>false
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
    end
    
    create_table(:user_tokens) do
      primary_key :id
      foreign_key :user_id, :users, :key=>[:id]
      column :token, "text", :null=>false
      column :refresh_token, "text", :null=>false
      column :expired_at, "timestamp without time zone", :null=>false
      column :created_at, "timestamp without time zone", :null=>false
      column :updated_at, "timestamp without time zone", :null=>false
      
      index [:user_id]
    end
  end
end
              Sequel.migration do
                change do
                  self << "SET search_path TO \"$user\", public"
                  self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181015021811_create_users.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20181015035612_create_user_tokens.rb')"
                end
              end
