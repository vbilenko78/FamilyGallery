class InvitesController < ApplicationController
  def resend
    @member = Member.find(params[:id])
    @member.invite!
    redirect_to galleries_url, notice: 'Re-sent Confirmation Successfully!'
  end
end
