// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "controllers"
import 'bootstrap'
import Rails from '@rails/ujs'
import 'libs/daterangepicker'
import 'libs/suggestions'

Rails.start()
