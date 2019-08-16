class BlogsController < ApplicationController
    def index
        @blogs = Blog.all
        #blog = Blog.all
        #binding.pry
    end

    def new
        @blog = Blog.new
    end

    def create
        #Blog.create(title: params[:blog][:title], content: params[:blog][:content])
        #Blog.create(blog_params)
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id
        @blog.save
        #@blog = current_user.blogs.build(blog_params)と上記を１行でもかける
        #上記のblogsはhas_many :blogsのもの
        #binding.pry
        redirect_to new_blog_path
    end

    def show
        @blog = Blog.find(params[:id])
        #ログイン中のユーザーがそのブログをお気に入り登録しているか判定
        @favarite = current_user.favarites.find_by(blog_id: @blog.id)
    end

    private

    def blog_params
        params.require(:blog).permit(:title, :content)
    end
    
end
