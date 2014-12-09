require 'spec_helper'

describe Api::V1::SessionsController do
  
  context "/sessions/create" do
    it "is routable" do
      expect(post: '/api/sessions/create').to be_routable
    end
  end
end
