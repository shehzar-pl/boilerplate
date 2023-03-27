class OtpsController < ApplicationController
  def new
  end

  def create
    otp = rand(100000..999999)

    current_user.update(verified: false)
    current_user.update(direct_otp: otp, direct_otp_sent_at: Time.now)

    UserMailer.send_otp(current_user).deliver_now
    if current_user.phone.present?
      TWILIO_CLIENT.messages.create(
        from: "+14406368107",
        to: current_user.phone,
        body: "Your OTP is #{otp}"
      )
    end
    redirect_to verify_otp_path
  end

  def verify
  end

  def check
    if current_user.direct_otp == params[:otp] 
        #&& current_user.otp_generated_at > 10.minutes.ago
      current_user.update(verified: true)
      redirect_to root_path
    else
      flash.now[:notice] = "Invalid OTP."
      render :verify
    end
  end
end