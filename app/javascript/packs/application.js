import "bootstrap";
import "../plugins/flatpickr";
import "../components/sidebar_toggle";
import { previewImageOnFileSelect} from "../components/photo_preview";
import { dataPickerHomepage} from "../components/datapicker";
import { initSweetAlertDeleteFriend } from '../plugins/init_sweetalert';
// import { getTrackStyle } from '../components/range_slider';


initSweetAlertDeleteFriend();

if (document.URL.match('/challenges/new')) {
  dataPickerHomepage();
}

previewImageOnFileSelect();

// if (/schedule/.test(window.location.href)) {
//   getTrackStyle();
// }
