module Rules
  module ApplicationRule
    def allow
      true
    end
    def deny
      false
    end
    def authenticated?
      user.present?
    end
    def user?
      user and user.user?
    end
    def guest?
      user.nil?
    end
    def target_self?
      user and target and user.class == target.class and user.id == target.id
    end
  end
end
