class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def soon
    redirect_to(:action=>'home')
  end
end
