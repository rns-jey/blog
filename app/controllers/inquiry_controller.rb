class InquiryController < ApplicationController
  before_action :set_inquiry, only:[:edit, :update, :destroy]
  
  def index
    @inquiries = Inquiry.all
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      redirect_to @inquiry
    else
      flash[:error] = "Blank field"
      render :new
    end
  end

  def edit
  end

  def update
    if @inquiry.update(inquiry_params)
      redirect_to @inquiry
    else
      flash[:error] = "Blank field"
      render :edit
    end
  end

  def destroy
    @inquiry.destroy
    redirect_to inquiries_path
  end


  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end
end
