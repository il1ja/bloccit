class User < ApplicationRecord
  before_save {self.email = email.downcase if email.present?}

  before_save {self.name = self.name.split.map(&:capitalize).join(' ')}

  validates :name, length: {minimum: 1, maximum: 100},presence: true

  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
          presence: true,
          uniqueness: { case_sensitive: false },
          length: { minimum: 3, maximum: 254 }

has_secure_password
end

# [1,2,3].map {|x| x + 1 }

# before_save {
#   self.name = name.split(' ').map {|name|
#     new_name = []
#     name.capitalize >> new_name
#   } new_name.join
# }


# = new_name
# new_name = new_name.split(' ')
# def cappin (new_name)
#   capped_name = []
#   self.name.each do |name|
#   name.capitalize << capped_name
# end
# capped_name.join = self.name
# end
