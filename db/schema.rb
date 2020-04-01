Sequel.migration do
  change do
    create_table(:ar_internal_metadata) do
      column :key, "character varying", :null=>false
      column :value, "character varying"
      column :created_at, "timestamp(6) without time zone", :null=>false
      column :updated_at, "timestamp(6) without time zone", :null=>false
      
      primary_key [:key]
    end
    
    create_table(:customers) do
      primary_key :id, :type=>:Bignum
      column :email, "character varying"
      column :name, "character varying"
      column :identification, "character varying"
      column :created_at, "timestamp(6) without time zone", :null=>false
      column :updated_at, "timestamp(6) without time zone", :null=>false
    end
    
    create_table(:movies) do
      primary_key :id, :type=>:Bignum
      column :name, "character varying"
      column :description, "character varying"
      column :image_url, "character varying"
      column :start_date, "date"
      column :end_date, "date"
      column :created_at, "timestamp(6) without time zone", :null=>false
      column :updated_at, "timestamp(6) without time zone", :null=>false
    end
    
    create_table(:schema_migrations) do
      column :version, "character varying", :null=>false
      
      primary_key [:version]
    end
    
    create_table(:reservations) do
      primary_key :id, :type=>:Bignum
      foreign_key :movie_id, :movies, :type=>"bigint", :null=>false, :key=>[:id]
      foreign_key :customer_id, :customers, :type=>"bigint", :null=>false, :key=>[:id]
      column :reservation_date, "date"
      column :created_at, "timestamp(6) without time zone", :null=>false
      column :updated_at, "timestamp(6) without time zone", :null=>false
      
      index [:customer_id], :name=>:index_reservations_on_customer_id
      index [:movie_id], :name=>:index_reservations_on_movie_id
    end
  end
end
