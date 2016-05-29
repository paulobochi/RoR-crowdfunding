class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.monetize :amount_to_raise
      t.references :category, index: true, foreign_key: true
      t.references :owner, references: :user, index: true, foreign_key: true
      t.datetime :end_at

      t.timestamps null: false
    end
  end
end
