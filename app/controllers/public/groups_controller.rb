class Public::GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])


  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end







  private


  def group_params
    params.require(:group).permit(:name, :introduction, :user_id, :owner_id)
  end
end
