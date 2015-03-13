class CategoriesController < ApplicationController
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @category.update(post_params)
        format.html { redirect_to @category, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @category = Category.find(params[:id])
      @category.destroy
    respond_to do |format|
      format.html { redirect_to (categories_path), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name, :description, :date, :emailid)
  end
  
end