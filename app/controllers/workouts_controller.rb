class WorkoutsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_workout, only: [:show, :edit, :update, :destroy]

 def index
 	@workouts = Workout.all.order("created_at DESC")
 end


 def show

 end


 def new
 	@workout = Workout.new
 end

 def create
	 if params[:view] == "automatic"
		 @mv = OtherServiceCall.new.api_call(params[:wokout])
		 if @mv == true
			 redirect_to 'http://localhost:3000/admin/workouts',notice: "Workout Successfully Saved"
		 else
			 redirect_to new_admin_workout_path(view: params[:view]),alert: "Workout Not Found Please Verify it"
		 end
 	@workout = Workout.new(workout_params)
 	if @workout.save
 		redirect_to 'http://localhost:3000/admin/workouts',notice: "Workout Successfully Saved"
 	else
 		render 'new'
 	end
end
 end

 def update
 	if @workout.update(workout_params)
 		redirect_to @workout
 	else
 		render 'edit'
 	end
 end

 def edit
 end

 def destroy
 	@workout.destroy
 	redirect_to root_path
 end


 private

 def workout_params
 	params.require(:workout).permit(:set,:workout,:meal)
 end

 def find_workout
 	@workout = Workout.find(params[:id])
 end


end
