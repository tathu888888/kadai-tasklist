class TaskPostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy,:update]


  def create
    @task_post = current_user.task_posts.build(task_post_params)
    if @task_post.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @task_posts = current_user.task_posts.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'tasks/index'
    end
  end
  def destroy
    @task_post.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @task_post = TaskPost.find(params[:id])
    
    
  end
  
  def show
        @task_post = TaskPost.find(params[:id])

    
  
  end
  
  def update
    
       if @task_post.update(task_post_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end
    
     
  
  private

  def task_post_params
    params.require(:task_post).permit(:content)
  end
  
    def correct_user
    @task_post = current_user.task_posts.find_by(id: params[:id])
    unless @task_post
      redirect_to root_url
    end
    end

end