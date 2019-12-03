import "bootstrap";
import "../components/sidebar_toggle"
import { previewImageOnFileSelect} from "../components/photo_preview"
import { dataPickerHomepage} from "../components/datapicker"

if (document.URL.match('/challenges/new')) {
  dataPickerHomepage();
}

previewImageOnFileSelect();
