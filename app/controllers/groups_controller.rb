class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice:
    else
      render :new
    end 
  end
  
  def index
    @groups = Group.all.order(updated_at: :desc)
  end
  
  def show
    @group = Group.find_by(id: params[:id])
    
    if !@group.users.include?(current_user)
      @group.users << current_user
    end
    
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :user_id [])
  end  
  
end
