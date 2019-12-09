import {ionRangeSlider} from 'ion-rangeslider';
import $ from 'jquery'


$(".js-range-slider").ionRangeSlider({
    type: "single",
    min: 0,
    max: 5,
    grid: true,
    grid_num: 5,
    step: 0.5,
});
