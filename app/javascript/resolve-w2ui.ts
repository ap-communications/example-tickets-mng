import $ from 'jquery';

interface Window {
  $: unknown;
  jQuery: unknown;
  w2utils: unknown;
  w2ui: unknown;
  w2obj: unknown;
}
declare var window: Window
window.$ = $;
window.jQuery = $;
const w2uiModule = require('exports-loader?w2ui,w2utils,w2obj!w2ui');

window.w2utils = w2uiModule["w2utils"];
window.w2ui = w2uiModule["w2ui"];
window.w2obj = w2uiModule["w2obj"];
