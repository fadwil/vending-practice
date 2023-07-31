class SnackMachinesController < ApplicationController
  def update
    SnackMachine.create!(machine_id: params[:machine_id], snack_id: params[:snack_id])
    redirect_to "/machines/#{params[:machine_id]}"
  end
end
