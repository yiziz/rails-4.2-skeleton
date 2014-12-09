class SessionPolicy < ApiPolicy
  def create?
    allow 
  end
end
