module Api 
  module V1 
    class BlogsController < Api::V1::ApplicationController 
      def create
        result = Blogs::Operations.new_blog(params, @current_user)
        render_error(errors: result.errors.all, status: 400) and return unless result.success?
        payload = {
          blog: BlogBlueprint.render_as_hash(result.payload),
          status: 201
        }
        render_success(payload: payload)
      end

      def index 
        blogs = Blog.all 
        payload = {
          blogs: BlogBlueprint.render_as_hash(blogs),
          status: 200
        }
        render_success(payload: payload)
      end

      def show 
        blog = Blog.find(params[:id])

        payload = {
          blog: BlogBlueprint.render_as_hash(blog),
          status: 200
        }
        render_success(payload: payload)
      end

      def update
        result = Blogs::Operations.update_blog(params)
        render_error(errors: result.errors.all, status: 400) and return unless result.success?
        payload = {
          blog: BlogBlueprint.render_as_hash(result.payload),
          status: 201
        }
        render_success(payload: payload)
      end

      def destroy 
        blog = Blog.find(params[:id])
        blog.destroy 
        render_success(payload: "Blog has been destroyed!", status: 200)
      end
    end
  end
end