// // ログイン
// const open = document.querySelector('#sign-in-open');
// const close = document.querySelector('#sign-in-close');
// const modal = document.querySelector('#sign-in-modal');
// const mask = document.querySelector('#mask');
// const showKeyframes = {
//   opacity: [0, 1],
//   visibility: 'visible',
// };
// const hideKeyframes = {
//   opacity: [1, 0],
//   visibility: 'hidden',
// };
// const options = {
//   duration: 880,
//   easing: 'ease',
//   fill: 'forwards',
// };
// open.addEventListener('click', () => {
//   modal.animate(showKeyframes, options);
//   mask.animete(showKeyframes, options);
// });
// close.addEventListener('click', () => {
//   modal.animate(hideKeyframes, options);
//   mask.animete(hideKeyframes, options);
// });
// mask.addEventListener('click', () => {
//   close.click();
// });