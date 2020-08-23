class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  validates :name, presence: true, uniqueness: true,
  length: {minimum: 2, maximum: 20 }

  validates :introduction, length: {maximum: 50}

  has_many :books

  #  conditions = warden_conditions.dup
   # if login = conditions.delete(:login)
    #  where(conditions).where(["username = :value", { :value => username }]).first
   # else
   #   where(conditions).first
   # end
 # end

  #def email_required?
  #  false
 # end

  #def email_changed?
  #  false
 # end

end
