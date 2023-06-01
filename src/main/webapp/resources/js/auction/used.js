(function (window, document) {
	
	// Tabs
	function initTopTabs() {
		var wrapper = $('div.tab_umarket'),
			tablist = wrapper.find('ul.tablist'),
			tabs = tablist.children('li'),
			activeTab = tabs.filter('.on'),
			tabpanels = wrapper.find('div.tabpanel'),
			hasActivePanel = !!tabpanels.filter('.tabpanel-active').length;
		// 마우스 올렸을 때 
		tabs.bind({
			select: function (e, tabClass) {
				tabClass = tabClass || 'on';
				var tab = $(this),
					index = tab.index();
				console.log(e.currentTarget); 
				tabs.removeClass('on hover');
				tab.addClass(tabClass);

				if (tabpanels.length > 1) {
					tabpanels.removeClass('tabpanel-active');
					tabpanels.eq(index).addClass('tabpanel-active');
				} else if (tabpanels.length) {
					tabpanels.addClass('tabpanel-active');
				}
			},
			'click mouseenter': function (e) {
				$(this).trigger('select', 'hover');
			}
		});


		// 마우스 나갔을 때
		wrapper.bind('mouseleave', function () {
			if (activeTab.length) {
				if (hasActivePanel) {
					activeTab.trigger('select', 'on');
				} else {
					tabs.removeClass('hover');
					tabpanels.removeClass('tabpanel-active');
					activeTab.addClass('on');
				}
			} else {
				tabs.removeClass('hover');
				tabpanels.removeClass('tabpanel-active');
			}
		});
	}

	$(function () {
		initTopTabs();
		//$("div.gnb-cont").drawer();
	});
}(this, this.document));
