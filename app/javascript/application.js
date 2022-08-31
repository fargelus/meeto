// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
import 'bootstrap'
import Rails from '@rails/ujs'
import 'moment'
import 'daterangepicker'
import jquery from 'jquery'

window.$ = jquery

$('.datetimerange').daterangepicker({
    timePicker: true
})

Rails.start()
