require 'test_helper'

class ResendInvitationControllerTest < ActionController::TestCase
  test "should get resend_invite" do
    get :resend_invite
    assert_response :success
  end

end
