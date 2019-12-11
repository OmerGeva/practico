import "bootstrap";



import "../plugins/flatpickr"
import "../plugins/confetti"

import "../components/facebook_sign_in"

import "../components/chat"
import "../components/week_month_year_chart"
import "../components/sidebar_toggle"
import { previewImageOnFileSelect } from "../components/photo_preview"
import { dataPickerHomepage } from "../components/datapicker"
import { initSweetAlertDeleteFriend } from '../plugins/init_sweetalert';
import  'ion-rangeslider/css/ion.rangeSlider.css';

import { timer } from '../components/timer';
import { setupCreateChallengePage } from '../components/create-challenge'
import { checkBox } from '../components/checkbox';


initSweetAlertDeleteFriend();

if (document.URL.match('/challenges/new')) {
  dataPickerHomepage();
  setupCreateChallengePage()
}

previewImageOnFileSelect();
checkBox();

// timer();

