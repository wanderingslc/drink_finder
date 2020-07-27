class ImportController < ApplicationController
  def index 
  end

  def import_csv
    Import.import_csv(params[:file])
    redirect_to root_path, notice: 'Locations imported'
  end

end
