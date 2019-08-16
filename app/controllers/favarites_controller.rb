class FavaritesController < ApplicationController
    def create
        favarite = current_user.favarites.create(blog_id: params[:blog_id])
        redirect_to blogs_url, notice: "#{favarite.blog.user.name}さんのブログをお気に入り登録しました"
      end
    
      def destroy
        favarite = current_user.favarites.find_by(id: params[:id]).destroy
        redirect_to blogs_url, notice: "#{favarite.blog.user.name}さんのブログをお気に入り解除しました"
      end
end

