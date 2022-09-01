import 'daterangepicker'
import moment from 'moment'
import jquery from 'jquery'

window.$ = jquery

$(() => {
    $('.datetimerange').daterangepicker({
        singleDatePicker: true,
        timePicker: true,
        timePicker24Hour: true,
        showDropdowns: true,
        locale: {
            "format": "DD/MM/YYYY HH:mm",
            "applyLabel": "Применить",
            "cancelLabel": "Отмена",
            "daysOfWeek": [
                "Вс",
                "Пн",
                "Вт",
                "Ср",
                "Чт",
                "Пт",
                "Сб"
            ],
            "monthNames": [
                "Январь",
                "Февраль",
                "Март",
                "Апрель",
                "Май",
                "Июнь",
                "Июль",
                "Август",
                "Сентябрь",
                "Октябрь",
                "Ноябрь",
                "Декабрь"
            ],
        },
        maxYear: parseInt(moment().format('YYYY'),10) + 1
    })
})
