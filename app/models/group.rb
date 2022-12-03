class Group < ApplicationRecord
   has_many :group_users, dependent: :destroy
   has_many :users, through: :group_users, source: :user




  def is_owned_by?(user)
    owner.id == user.id
  end

  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end

end
