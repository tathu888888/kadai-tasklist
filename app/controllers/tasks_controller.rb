class TasksController < ApplicationController
    before_action :require_user_logged_in
      before_action :currect_user, only: [:destroy,:update,:edit,:show]
        # before_action :set_task, only: [ :edit, :update , :destroy]







    # before_action :only: [:show, :edit, :update, :destroy ,:index]

  def index

    # @tasks = Task.all
      @task = current_user.tasks.build  # form_with 用
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
       @task1 = current_user.tasks.find_by(id: params[:id])
       



    
  end



   
  
  def show
        @task1 = Task.find(params[:id])

    
    @task = current_user.tasks.find_by(id: params[:id])
    

    
    




       
  end

  def new
      @task = current_user.tasks.build  # form_with 用
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    

  
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'tasks/index'
    end
  end

  def edit
    
      
  end

  def update
    

    if @task.update(task_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end

 def destroy

    @task.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_to root_url
 end



  private
  
  def currect_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
  def task_params
    params.require(:task).permit(:content, :status,:user_id)
  end
  
  def set_task
    @task = Task.find(params[:id])
        # @task = current_user.tasks.find_by(id: params[:id])


  end
  
  

  

  
end

  
  


