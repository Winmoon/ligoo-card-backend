class AddLikesCountToEstablishments < ActiveRecord::Migration

  def self.up

    add_column :establishments, :likes_count, :integer, :null => false, :default => 0

  end

  def self.down

    remove_column :establishments, :likes_count

  end

end
