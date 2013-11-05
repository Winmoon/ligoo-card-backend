class AddAttachmentCoverToEstablishments < ActiveRecord::Migration
  def self.up
    change_table :establishments do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :establishments, :cover
  end
end
