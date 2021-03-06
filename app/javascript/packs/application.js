import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "../plugins/flatpickr"



// import { initUpdateNavbarOnScroll } from '../components/navbar';
// initUpdateNavbarOnScroll();

import { loadDynamicBannerText } from '../components/banner';
if (document.getElementById('banner-typed-text')) {
  loadDynamicBannerText();
}

import { initMapbox } from '../plugins/init_mapbox';
initMapbox();
import { modalPlayer } from '../components/modal';
modalPlayer();

