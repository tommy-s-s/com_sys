class User < ApplicationRecord
    attr_accessor :remember_token,  :activation_token
#    belongs_to  :busho, optional: true
    has_many :user_bushos
    accepts_nested_attributes_for :user_bushos, allow_destroy: true
    has_many :bushos, through: :user_bushos
    belongs_to  :committee, optional: true
    belongs_to  :yakushoku, optional: true
    before_save { email.downcase! }

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                        length: { maximum: 100 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    # user モデルでパスワードハッシュが使用できるようにする
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 } ,allow_nil: true

    #入社年月日必須に変更
    validates :join_date, presence: true
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
                                                      BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end

    private

        def downcase_email
            self.email = email.downcase
        end



end
