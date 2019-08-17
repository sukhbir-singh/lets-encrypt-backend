module Api
    module V1
        class LetsEncryptsController < ApplicationController
            def check_status
              render :json => {success: true, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00", status: HelperMethods.generateCertificate.to_s
              }
            end
          
            def generate_certificate
              inp = HelperMethods.generateCertificate(user_params[:hdaname],user_params[:domain])
              if inp.save
                render :json => {success: true, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
              else
                render :json => {success: false, last_generated_at: "16 september 2019 12:00:01", expiry_date: "8 december 2019 11:59:00"}
              end
            end
          
            def regenerate_certificate
              render :json => {success: true, msg: "Successfully Regenerated", generated_at: "16 september 2019 12:00:01", last_generated_at: "11 july 2019 12:00:01", expiry_date: "8 december 2019 11:59:00", last_expiry_date: "26 september 2019 11:59:00"
              }
            end
          
            def delete_certificate
              render :json => {success: true, msg: "Successfully Deleted", data: {}}
            end

            private
            def user_params
              user_params.permit( :hdaname, :domain)
            end


        end
    end
end
