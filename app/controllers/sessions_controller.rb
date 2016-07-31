class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # SessionHelper方法, 将成功登陆的userid保存在session内置对象中(保持登陆状态)
      log_in user
      # 重定向到用户详情界面
      redirect_to user
    else
      # 登陆失败, 将错误信息放入flash对象中
      flash.now[:danger] = "Invalid email/password combination"
      # 还是登陆界面
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
