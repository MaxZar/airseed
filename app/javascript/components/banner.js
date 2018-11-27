import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Change your life", "Louez vos idées"],
    typeSpeed: 50,
    loop: true
  });
};

export { loadDynamicBannerText };
