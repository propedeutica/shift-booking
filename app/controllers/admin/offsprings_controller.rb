class Admin::OffspringsController < Admin::AdminIdentifiedController
  def index
    @offsprings = Offspring.all.includes(:assignment).includes(:user)
  end

  def show
    @offspring = Offspring.find_by(id: params[:id])
    if @offspring.nil?
      redirect_to admin_offsprings_path
      flash[:alert] = (t '.offspring_not_found')
    end
  end
end
