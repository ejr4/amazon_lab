class ProductsController < ApplicationController

def new
    @product = Product.new
end


def show
    @product = Product.find(params[:id])
    @review = Review.new
    @reviews = @product.reviews.order(created_at: :desc)

     
    
end
def index
    @products = Product.order(created_at: :desc)
end

def create
    # find all form data, all query string data, and all
    # url params in the 'params' available in any cntlr mthd
    # question = Question.new(title: params[:question][:title])
    @product = Product.new(product_params) #replace above due to def of question_params below 
    # render json: params # was debug line

    if @product.save
        redirect_to product_path(@product)
    else
        render :new
    end
end
def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
end
def edit
    @product = Product.find(params[:id])
end
def update
    
    # render json: params
    @product = Product.find(params[:id])
    if @product.update(product_params)
        redirect_to product_path(@product)
    else
    render :edit
    end
  
end
private
def product_params
    params.require(:product).permit(:title, :description, :price)
end


end
