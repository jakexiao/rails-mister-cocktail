class DosesController < ApplicationController
    def new
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose = Dose.new
      end
    
      def create
        # get the params from the form 
        @dose = Dose.new(dose_params)
        # find the right cocktail 
        @cocktail = Cocktail.find(params[:cocktail_id])
        # Assign the cocktail id to the dose.cocktail_id
        @dose.cocktail = @cocktail
        # Save the dose
        if @dose.save
          redirect_to cocktail_path(@cocktail)
        else
          render :new
        end
      end

      def destroy 
        @dose = Dose.find(params[:id])
        @dose.destroy
        redirect_to cocktail_path(@dose.cocktail)
      end 
    
      private 
    
      def dose_params
        params.require(:dose).permit(:description, :ingredient_id)
      end
end
