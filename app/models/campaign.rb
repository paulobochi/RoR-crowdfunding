class Campaign < ActiveRecord::Base
  include ClassyEnum::ActiveRecord

  belongs_to :category
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  monetize :amount_to_raise_cents,
    :numericality => {
      :greater_than_or_equal_to => 500
    }
  classy_enum_attr :campaign_type
end
