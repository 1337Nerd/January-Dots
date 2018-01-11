// ==UserScript==
// @name                 No focus in new tab
// @description          Don't place the caret in the location bar when opening a new tab.
// @author               skofkyo
// @homepageURL          http://bbs.kafan.cn/forum.php?mod=redirect&goto=findpost&ptid=1865786&pid=38002012
// @compatibility        Created 2018-01-11. Tested on Firefox 59.
// ==/UserScript==
(function() {
  window.CustomNewTab = {
    init: function() {
      gBrowser.tabContainer.addEventListener('TabOpen', CustomNewTab.newTabfocus, false);
    },
    newTabfocus: function() {
      if (/^(about|http|file|chrome)/.test(gBrowser.selectedBrowser.currentURI.spec)) {
        setTimeout(function() {
          gBrowser.selectedBrowser.focus();
        }, 0);
      }
    }
  }
  CustomNewTab.init();
})();
