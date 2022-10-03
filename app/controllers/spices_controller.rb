class SpicesController < ApplicationController

    def index
        spices = Spice.all 
        render json: spices
    end

    def show 
        spices = Spice.find_by(id: params[:id])

        if spices 
        render json: spices
        else 
            render_spice_not_found

        end
    end

    def create 
        
        spices = Spice.create(spice_params)
        render json: spices, status: :created
    end

    def update 
        spices = Spice.find_by(id: params[:id])
        if spices 
            spices.update(spice_params)
            render json: spices
        else 
            render_spice_not_found
        end
    end


    def destroy 
        spices = Spice.find_by(id: params[:id])
        if spices

            spices.destroy
            head :no_content
        else 
                
            render_spice_not_found
        end
    end


    

    private

    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end


     def render_spice_not_found 
        render json: {error: "spice not found"}


     end
end

