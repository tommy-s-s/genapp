class User < ApplicationRecord
    attr_accessor :remember_token,  :activation_token
    before_save { self.email = email.downcase }

    #各モデル相互登録するために追加↓
    has_many :user_bushos
    has_many :bushos, through: :user_bushos
    accepts_nested_attributes_for :user_bushos, allow_destroy: true
    belongs_to  :committee, optional: true
    belongs_to  :yakushoku, optional: true


    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

    def self.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
                                                      BCrypt::Password.create(string, cost: cost)
    end

    def self.new_token
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
