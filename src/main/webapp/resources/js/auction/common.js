// 리소스 로드 시 사용할 프로토콜 선언 
// 로컬 파일 확인 시 프로토콜이 file: 등으로 지정되므로 https:가 아니면 항상 http:를 사용하도록 함.
if (!protocol) {
	var protocol = document.location.protocol;

	if (protocol !== 'https:') {
		protocol = 'http:';
	}
}

// 리소스 로더
if ( typeof window.yepnope !== 'function' ) {
	// yepnope.js
	// Version - 1.5.4pre
	//
	// by
	// Alex Sexton - @SlexAxton - AlexSexton[at]gmail.com
	// Ralph Holzmann - @ralphholzmann - ralphholzmann[at]gmail.com
	//
	// http://yepnopejs.com/
	// https://github.com/SlexAxton/yepnope.js/
	//
	// Tri-license - WTFPL | MIT | BSD
	(function(a,b,c){function d(a){return"[object Function]"==o.call(a)}function e(a){return"string"==typeof a}function f(){}function g(a){return!a||"loaded"==a||"complete"==a||"uninitialized"==a}function h(){var a=p.shift();q=1,a?a.t?m(function(){("c"==a.t?B.injectCss:B.injectJs)(a.s,0,a.a,a.x,a.e,1)},0):(a(),h()):q=0}function i(a,c,d,e,f,i,j){function k(b){if(!o&&g(l.readyState)&&(u.r=o=1,!q&&h(),l.onload=l.onreadystatechange=null,b)){"img"!=a&&m(function(){t.removeChild(l)},50);for(var d in y[c])y[c].hasOwnProperty(d)&&y[c][d].onload()}}var j=j||B.errorTimeout,l=b.createElement(a),o=0,r=0,u={t:d,s:c,e:f,a:i,x:j};1===y[c]&&(r=1,y[c]=[]),"object"==a?l.data=c:(l.src=c,l.type=a),l.width=l.height="0",l.onerror=l.onload=l.onreadystatechange=function(){k.call(this,r)},p.splice(e,0,u),"img"!=a&&(r||2===y[c]?(t.insertBefore(l,s?null:n),m(k,j)):y[c].push(l))}function j(a,b,c,d,f){return q=0,b=b||"j",e(a)?i("c"==b?v:u,a,b,this.i++,c,d,f):(p.splice(this.i++,0,a),1==p.length&&h()),this}function k(){var a=B;return a.loader={load:j,i:0},a}var l=b.documentElement,m=a.setTimeout,n=b.getElementsByTagName("script")[0],o={}.toString,p=[],q=0,r="MozAppearance"in l.style,s=r&&!!b.createRange().compareNode,t=s?l:n.parentNode,l=a.opera&&"[object Opera]"==o.call(a.opera),l=!!b.attachEvent&&!l,u=r?"object":l?"script":"img",v=l?"script":u,w=Array.isArray||function(a){return"[object Array]"==o.call(a)},x=[],y={},z={timeout:function(a,b){return b.length&&(a.timeout=b[0]),a}},A,B;B=function(a){function b(a){var a=a.split("!"),b=x.length,c=a.pop(),d=a.length,c={url:c,origUrl:c,prefixes:a},e,f,g;for(f=0;f<d;f++)g=a[f].split("="),(e=z[g.shift()])&&(c=e(c,g));for(f=0;f<b;f++)c=x[f](c);return c}function g(a,e,f,g,h){var i=b(a),j=i.autoCallback;i.url.split(".").pop().split("?").shift(),i.bypass||(e&&(e=d(e)?e:e[a]||e[g]||e[a.split("/").pop().split("?")[0]]),i.instead?i.instead(a,e,f,g,h):(y[i.url]?i.noexec=!0:y[i.url]=1,f.load(i.url,i.forceCSS||!i.forceJS&&"css"==i.url.split(".").pop().split("?").shift()?"c":c,i.noexec,i.attrs,i.timeout),(d(e)||d(j))&&f.load(function(){k(),e&&e(i.origUrl,h,g),j&&j(i.origUrl,h,g),y[i.url]=2})))}function h(a,b){function c(a,c){if(a){if(e(a))c||(j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}),g(a,j,b,0,h);else if(Object(a)===a)for(n in m=function(){var b=0,c;for(c in a)a.hasOwnProperty(c)&&b++;return b}(),a)a.hasOwnProperty(n)&&(!c&&!--m&&(d(j)?j=function(){var a=[].slice.call(arguments);k.apply(this,a),l()}:j[n]=function(a){return function(){var b=[].slice.call(arguments);a&&a.apply(this,b),l()}}(k[n])),g(a[n],j,b,n,h))}else!c&&l()}var h=!!a.test,i=a.load||a.both,j=a.callback||f,k=j,l=a.complete||f,m,n;c(h?a.yep:a.nope,!!i),i&&c(i)}var i,j,l=this.yepnope.loader;if(e(a))g(a,0,l,0);else if(w(a))for(i=0;i<a.length;i++)j=a[i],e(j)?g(j,0,l,0):w(j)?B(j):Object(j)===j&&h(j,l);else Object(a)===a&&h(a,l)},B.addPrefix=function(a,b){z[a]=b},B.addFilter=function(a){x.push(a)},B.errorTimeout=1e4,null==b.readyState&&b.addEventListener&&(b.readyState="loading",b.addEventListener("DOMContentLoaded",A=function(){b.removeEventListener("DOMContentLoaded",A,0),b.readyState="complete"},0)),a.yepnope=k(),a.yepnope.executeStack=h,a.yepnope.injectJs=function(a,c,d,e,i,j){var k=b.createElement("script"),l,o,e=e||B.errorTimeout;k.src=a;for(o in d)k.setAttribute(o,d[o]);c=j?h:c||f,k.onreadystatechange=k.onload=function(){!l&&g(k.readyState)&&(l=1,c(),k.onload=k.onreadystatechange=null)},m(function(){l||(l=1,c(1))},e),i?k.onload():n.parentNode.insertBefore(k,n)},a.yepnope.injectCss=function(a,c,d,e,g,i){var e=b.createElement("link"),j,c=i?h:c||f;e.href=a,e.rel="stylesheet",e.type="text/css";for(j in d)e.setAttribute(j,d[j]);g||(n.parentNode.insertBefore(e,n),m(c,0))}})(this,document);
}

(function ( window, document, undefined ){
	'use strict';

	if ( !window.ui ) {
		window.ui = {
			'version': '0.0.1'
		};
	}

	// jQuery 파일이 여러번 불려질 경우 플러그인 관리가 어려워 따로 플러그인 선언을 위한 jQuery를 따로 선언함.
	if ( !window.$ui ) {
		window.$ui = window.jQuery;
	}

	var toString = ( {} ).toString;

	// Helper Functions
	function isPlainObject( obj ) {
		return toString.call( obj ) === '[object Object]';
	}

	// 리소스 로더
	if ( typeof ui.loader !== 'function' ) {
		ui.loader = function () {
			yepnope.apply( window, [].slice.call( arguments, 0 ) );
		};
	}

	// 리소스 프리셋
	if ( !ui.resources ) {
		ui.resources = {};
	}
	if ( typeof ui.addResource !== 'function' ) {
		ui.addResource = function () {
			function addResource( name, obj ) {
				if ( !ui.resources[ name ] ) {
					ui.resources[ name ] = obj;
				}
			}

			var key,
				arg = arguments[ 0 ];

			if ( arguments.length === 2 && typeof arg === 'string' ) {
				addResource( arg, arguments[ 1 ] );
			} else {
				if ( isPlainObject( arg ) ) {
					for ( key in arg ) {
						if ( arg.hasOwnProperty( key ) ) {
							addResource( key, arg[ key ] );
						}
					}
				}
			}
		};
	}

	function jQueryPluginLoaded( pluginName ) {
		if ( !window.$ui ) {
			window.$ui = window.jQuery;
		}

		return !!( window.$ui && window.$ui.fn[ pluginName ] );
	}

	ui.addResource({
		// 리소스 - jquery.js
		'jquery': {
			'test': function () {
				return !!window.$ui && !!window.jQuery;
			},
			'nope': protocol + '//script.auction.co.kr/common/jquery.js',
			'complete': function () {
				if ( !!window.jQuery && !window.$ui ) {
					window.$ui = window.jQuery;
				}
			}
		},

		// 리소스 - jquery.pin.js
		'pin': {
			'test': function () {
				return jQueryPluginLoaded( 'pin' );
			},
			'nope': protocol + '//script.auction.co.kr/style/js/jquery.pin.js'
		},

		// 리소스 - jquery.tooltip.js
		'tooltip': {
			'test': function () {
				return jQueryPluginLoaded( 'tooltip' );
			},
			'nope': protocol + '//script.auction.co.kr/style/js/jquery.tooltip.js'
		},

		// 리소스 - jquery.placeholder.js
		'placeholder': {
			'test': function () {
				return jQueryPluginLoaded( 'placeholder' );
			},
			'nope': protocol + '//script.auction.co.kr/style/js/jquery.placeholder.js'
		},

		// 리소스 - jquery.selectbox.js
		'selectbox': {
			'test': function () {
				return jQueryPluginLoaded( 'selectbox' );
			},
			'nope': protocol + '//script.auction.co.kr/style/js/jquery.selectbox.js'
		}
	});

	// 리소스 로더
	if ( typeof ui.load !== 'function' ) {
		ui.load = function ( res, onComplete ) {
			var oldOnComplete;

			function checkTestObject( res ) {
				var obj = {};
				if ( typeof res === 'string' ) {
					if ( !isPlainObject( ui.resources[ res ] ) ) {
						throw new TypeError();
					}
					obj = ui.resources[ res ];
				} else if ( isPlainObject( res ) ) {
					obj = res;
				}
				if ( typeof obj.test === 'function' ) {
					obj.test = obj.test();
				}
				return obj;
			}

			if ( toString.call( res ) === '[object Array]' ) {
				for ( var tests = [], i = 0, len = res.length; i < len; i++ ) {
					tests[ i ] = checkTestObject( res[ i ] );
				}

				if ( onComplete ) {
					oldOnComplete = tests[ len - 1 ].complete;
					if ( typeof oldOnComplete === 'function' ) {
						tests[ len - 1 ].complete = function () {
							oldOnComplete();
							onComplete();
						};
					} else {
						tests[ len - 1 ].complete = onComplete;
					}
				}
			} else {
				tests = checkTestObject( res );

				if ( onComplete ) {
					oldOnComplete = tests.complete;
					if ( typeof oldOnComplete === 'function' ) {
						tests.complete = function () {
							oldOnComplete();
							onComplete();
						};
					} else {
						tests.complete = onComplete;
					}
				}
			}

			ui.loader( tests );
		};
	}
}( this, this.document ));

/* 공통 함수 */
/* Type Check */
function typeOf(sth) {
	if (sth === null) {
		return "null";
	}

	if (sth === undefined) {
		return "undefined";
	}

	var typeStr = Object.prototype.toString.call(sth),
		regexp = /\b[A-Z][a-zA-Z]+/,
		result = typeStr.match(regexp)[0].toLowerCase();

	if (result === "number" && isNaN(sth)) {
		result = "nan";
	}

	return result;
}

// 객체 확장
function extend() {
	var len = arguments.length,
		i = 0,
		result = {},
		key,
		obj,
		resultVal,
		objVal;

	while (i < len) {
		obj = arguments[i++];

		for (key in obj) {
			if (obj.hasOwnProperty(key)) {
				resultVal = result[key];
				objVal = obj[key];
				if (resultVal && typeOf(resultVal) === "object" && objVal && typeOf(objVal) === "object") {
					result[key] = extend(resultVal, objVal);
				} else if (objVal !== undefined) {
					result[key] = objVal;
				}
			}
		}
	}

	return result;
}

// 다수 요소 속성 지정
function setAttr(element, attributes) {
	for (var attr in attributes) {
		element.setAttribute(attr, attributes[attr]);
	}
}

// 다수 스타일 적용
function setStyles(element, props) {
	props = props || {};
	for (var prop in props) {
		element.style[prop] = props[prop];
	}
}

// 스타일 속성값 가져오기
var getStyle = (function () {
	var func;

	if (window.getComputedStyle) {
		func = function (element, property) {
			return window.getComputedStyle(element, null).getPropertyValue(property);
		};
	} else if (document.documentElement.currentStyle) {
		func = function (element, property) {
			return element.currentStyle[property.replace(/\-(.)/g, function (match, letter) {
				return letter.toUpperCase();
			})];
		}
	}

	return func;
}());

// 클래스 체크
function hasClass(element, className) {
	var elementClass = element.className,
		classList = className.split(/\s+/g),
		i = classList.length,
		result = true;

	while (i--) {
		result = !!( result && new RegExp('(^|\\s)' + classList[i] + '(\\s|$)', 'g').test(elementClass) );
	}

	return result;
}

// 클래스 추가
function addClass(element, className) {
	if ( !hasClass(element, className) ) {
		element.className += ' ' + className;
	}
	return element;
};

// 클래스 제거
function removeClass(element, className) {
	if ( hasClass(element, className) ) {
		var elementClass = element.className,
			classList = className.split(/\s+/g),
			i = classList.length;
		while (i--) {
			element.className = elementClass.replace( new RegExp('(^|\\s)' + classList[i] + '(?:\\s|$)'), '$1' );
		}
	}
	return element;
};

// 클래스 토글
function toggleClass(element, class1, class2) {
	if (class2) {
		if ( hasClass(element, class1) ) {
			removeClass(element, class1);
			addClass(element, class2);
		} else {
			removeClass(element, class2);
			addClass(element, class1);
		}
	} else {
		if ( hasClass(element, class1) ) {
			removeClass(element, class1);
		} else {
			addClass(element, class1);
		}
	}
}

// 클래스로 요소 가져오기
function getElementsByClassName(context, className, tagName) {
	context = context || document;
	tagName = tagName || '*';

	if (context.getElementsByClassName) {
		return Array.prototype.slice.call(context.getElementsByClassName(className));
	} else {
		var all = context.getElementsByTagName(tagName),
			i = all.length,
			elements = [],
			element = null;

		while (i--) {
			element = all[i];
			if ( hasClass(element, className) ) {
				elements.push(element);
			}
		}
		elements = elements.reverse();

		return elements;
	}
}

// 타이머 클리어
function clearTimer(timer) {
	window.clearTimeout(timer);
	window.clearInterval(timer);
	return null;
}

// 이미지 바꾸기
function changeImage(img, src1, src2, alt) {
	if (!img) {
		return;
	}
	var src = img.getAttribute('src');
	img.setAttribute('src', src.replace(src1, src2));
	if (alt) {
		img.setAttribute('alt', alt);
	}
}

// 이벤트 추가/제거
function addEvent(element, type, listener) {
	if (!element) {
		return null;
	}

	listener.guid = listener.guid || addEvent.guid++;

	var func = listener;

	if (element.addEventListener) {
		type = type.toLowerCase();
		if (type === 'mouseenter') {
			type = 'mouseover';
			func = mouseEnterLeave(func);
		} else if (type === 'mouseleave') {
			type = 'mouseout';
			func = mouseEnterLeave(func);
		}
		element.addEventListener(type, func, false);
	} else if (element.attachEvent) {
		func = function () {
			listener.call(element, fixEvent(window.event));
		};
		element.attachEvent('on' + type, func);
	}

	element.events = element.events || {};
	element.events[type] = element.events[type] || {};
	element.events[type][listener.guid] = func;

	function mouseEnterLeave(fn) {
		return function (evt) {
			var rel = evt.relatedTarget;
			if (!isChildOf(rel, this)) {
				fn.call(this, evt);
			}
		};
	}
}
addEvent.guid = 1;

function removeEvent(element, type, listener) {
	if (!element) {
		return;
	}

	var guid = listener && listener.guid,
		events = element.events,
		eventsType = null,
		func = null;

	if (element.removeEventListener) {
		if (type === 'mouseenter') {
			type = 'mouseover';
		} else if (type === 'mouseleave') {
			type = 'mouseout';
		}
		eventsType = events && events[type];
		if (listener) {
			func = guid && eventsType && eventsType[guid];
			element.removeEventListener(type, func, false);
			delete element.events[type][listener.guid];
		} else if (eventsType) {
			for (guid in eventsType) {
				element.removeEventListener(type, eventsType[guid], false);
				delete element.events[type][guid];
			}
		}
	} else if (element.detachEvent) {
		eventsType = events && events[type];
		if (listener) {
			func = guid && eventsType && eventsType[guid];
			if (func) {
				element.detachEvent('on' + type, func);
				delete element.events[type][listener.guid];
			}
		} else if (eventsType) {
			for (guid in eventsType) {
				element.detachEvent('on' + type, eventsType[guid]);
				delete element.events[type][guid];
			}
		}
	}
}


function addEventAll(elements, type, listener) {
	var i = elements && elements.length;
	while (i--) {
		addEvent(elements[i], type, listener);
	}
}

function removeEventAll(elements, type, listener) {
	var i = elements && elements.length;
	while (i--) {
		removeEvent(elements[i], type, listener);
	}
}

function isChildOf(element, parent) {
	while (element && (element !== document.body)) {
		if (element === parent) {
			return true;
		}
		element = element.parentNode;
	}
	return false;
}

function fixEvent(e) {
	e.preventDefault = fixEvent.preventDefault;
	e.stopPropagation = fixEvent.stopPropagation;
	e.relatedTarget = e.toElement;
	return e;
}
fixEvent.preventDefault = function() {
	this.returnValue = false;
}
fixEvent.stopPropagation = function() {
	this.cancelBubble = true;
}

// onload 이벤트 추가
function addLoadEvent(fn) {
	var oldonload = window.onload;
	if (typeof oldonload !== 'function') {
		window.onload = fn;
	} else {
		window.onload = function () {
			if (oldonload) {
				oldonload();
			}
			fn();
		};
	}
}
/* //공통 함수 */

/* On DOM Ready */
(function () {
	var window = this,
		document = window.document,
		browser = (function () {
			var ua = window.navigator.userAgent.toLowerCase();
			return {
				version: (ua.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [])[1],
				safari: /webkit/.test(ua),
				opera: /opera/.test(ua),
				msie: (/msie/.test(ua)) && (!/opera/.test(ua)),
				mozilla: (/mozilla/.test(ua)) && (!/(compatible|webkit)/.test(ua))
			};
		}()),
		readyBound = false,
		isReady = false,
		readyList = [];

	var onDomReady = window.onDomReady = function (fn, args) {
		bindReady();

		if (isReady) {
			fn.call(window, []);
		} else {
			readyList.push(function () {
				return fn.call(window, []);
			});
		}
	};

	bindReady();

	function domReady() {
		if (!isReady) {
			isReady = true;
			if (readyList) {
				var i = 0,
					len = readyList.length;
				while (i < len) {
					readyList[i++].call(window, []);
				}
				readyList = [];
			}
		}
	}

	function bindReady() {
		if (readyBound) {
			return;
		}

		readyBound = true;

		if (document.addEventListener && !browser.opera) {
			document.addEventListener('DOMContentLoaded', domReady, false);
		}

		if (browser.msie && window === window.top) {
			(function () {
				if (isReady) {
					return;
				}
				try {
					document.documentElement.doScroll('left');
				} catch (e) {
					window.setTimeout(arguments.callee, 0);
					return;
				}
				domReady();
			}());
		}

		if (browser.opera) {
			document.addEventListener('DOMContentLoaded', function () {
				if (isReady) {
					return;
				}
				var i = 0,
					styleSheets = document.styleSheets,
					len = styleSheets.length;
				while (i < len) {
					if (styleSheets[i++].disabled) {
						window.setTimeout(arguments.callee, 0);
						return;
					}
				}
				domReady();
			}, false);
		}

		if (browser.safari) {
			var numStyles;
			(function () {
				if (isReady) {
					return;
				}
				var readyState = document.readyState;
				if (readyState !== 'loaded' && readyState !== 'complete') {
					window.setTimeout(arguments.callee, 0);
					return;
				}
				if (numStyles === undefined) {
					var linx = document.getElementsByTagName('link'),
						i = 0,
						styles = document.getElementsByTagName('style'),
						len = linx.length;
					while (i < len) {
						if (linx[i++].getAttribute('rel') === 'stylesheet') {
							numStyles++;
						}
					}
					numStyles += styles.length;
				}
				if (document.styleSheets.length !== numStyles) {
					window.setTimeout(arguments.callee, 0);
					return;
				}
				domReady();
			}());
		}

		addLoadEvent(domReady);
	}
}());
/* //On DOM Ready */

/*
 * 애니메이션 관련
 * emile.js (c) 2009 Thomas Fuchs
 * Licensed under the terms of the MIT license.
 */
(function (emile, container) {
	var parseEl = document.createElement('div'),
		props = ('backgroundColor borderBottomColor borderBottomWidth borderLeftColor borderLeftWidth ' + 'borderRightColor borderRightWidth borderSpacing borderTopColor borderTopWidth bottom color filter fontSize ' + 'fontWeight height left letterSpacing lineHeight marginBottom marginLeft marginRight marginTop maxHeight ' + 'maxWidth minHeight minWidth opacity outlineColor outlineOffset outlineWidth paddingBottom paddingLeft ' + 'paddingRight paddingTop right textIndent top width wordSpacing zIndex').split(' '),
		supportsOpacity = 'opacity' in parseEl.style;
	function interpolate(source, target, pos) {
		return (source + (target - source) * pos).toFixed(3);
	}
	function s(str, p, c) {
		return str.substr(p, c || 1);
	}
	function color(source, target, pos) {
		var i = 2,
			j, c, tmp, v = [],
			r = [];
		while (j = 3, c = arguments[i - 1], i--)
		if (s(c, 0) == 'r') {
			c = c.match(/\d+/g);
			while (j--) v.push(~~c[j]);
		} else {
			if (c.length == 4) c = '#' + s(c, 1) + s(c, 1) + s(c, 2) + s(c, 2) + s(c, 3) + s(c, 3);
			while (j--) v.push(parseInt(s(c, 1 + j * 2, 2), 16));
		}
		while (j--) {
			tmp = ~~ (v[j + 3] + (v[j] - v[j + 3]) * pos);
			r.push(tmp < 0 ? 0 : tmp > 255 ? 255 : tmp);
		}
		return 'rgb(' + r.join(',') + ')';
	}
	function alphaOpacity(source, target, pos) {
		return 'alpha(opacity=' + parseInt(source + (target - source) * pos) + ')';
	}
	function parse(prop) {
		var p = parseFloat(prop, 10),
			q = prop.replace(/^[\-\d\.]+/, '');

		return isNaN(p) ? {
			v: q,
			f: color,
			u: ''
		} : {
			v: p,
			f: interpolate,
			u: q
		};
	}
	function parseAlphaOpacity(el) {
		var m = /[\d\.]+/.exec(el.currentStyle.filter),
			p = m ? parseFloat(m, 10) : 100;
		return {
			v: p,
			f: alphaOpacity,
			u: ''
		};
	}
	function normalize(style) {
		var css, prop, rules = {},
			i = props.length,
			v, el;
		parseEl.innerHTML = '<div style="' + style + '"></div>';
		el = parseEl.childNodes[0];
		css = el.style;
		while (i--) {
			prop = props[i];
			if (v = css[prop]) {
				if (prop === 'filter' && el.filters && !supportsOpacity) {
					rules[prop] = parseAlphaOpacity(el);
				} else {
					rules[prop] = parse(v);
				}
			}
		}
		return rules;
	}
	container[emile] = function (el, style, opts) {
		el = typeof el == 'string' ? document.getElementById(el) : el;
		opts = opts || {};
		var target = normalize(style),
			comp = !!window.getComputedStyle ? getComputedStyle(el, null) : el.currentStyle,
			prop, current = {},
			start = +new Date,
			dur = opts.duration || 200,
			finish = start + dur,
			interval, easing = opts.easing ||
			function (pos) {
				return (-Math.cos(pos * Math.PI) / 2) + 0.5;
			};
		for (prop in target) {
			if (prop === 'filter' && el.filters && !supportsOpacity) {
				current[prop] = parseAlphaOpacity(el);
			} else {
				current[prop] = parse(comp[prop]);
			}
		}
		interval = setInterval(function () {
			var time = +new Date,
				pos = time > finish ? 1 : (time - start) / dur;
			for (prop in target) {
				el.style[prop] = target[prop].f(current[prop].v, target[prop].v, easing(pos)) + target[prop].u;
			}
			if (time > finish) {
				clearInterval(interval);
				opts.after && opts.after();
			}
		}, 10);
	}
})('emile', this);
/* // 애니메이션 관련 */

//헤더 타입
var headerType;

// 브라우저 체크
var isie = (navigator.userAgent.toLowerCase().indexOf('msie') != -1) ? true : false;
var isie6 = (navigator.userAgent.toLowerCase().indexOf('msie 6') != -1) ? true : false;
if (navigator.userAgent.toLowerCase().indexOf('msie 7') != -1) {
	isie6 = false;
	var isie7 = true;
}
if (navigator.userAgent.toLowerCase().indexOf('msie 8') != -1) {
	isie6 = false;
	var isie8 = true;
}
var isfirefox = (navigator.userAgent.toLowerCase().indexOf('firefox') != -1) ? true : false;
var isopera = (navigator.userAgent.toLowerCase().indexOf('opera') != -1) ? true : false;

try {
	document.execCommand('BackgroundImageCache', false, true);
} catch (e) {}

// 플래시 테두리 제거
function getFlash(id, url, w, h, t, bg) {
	if (!t) var t = 'transparent';
	if (!bg) var bg = 'none';
	var flashout = '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,115,0" width="' + w + '" height="' + h + '" id="' + id + '">';
	flashout += '<param name="movie" value="' + url + '" /><param name="wmode" value="' + t + '" /><param name="bgcolor" value="' + bg + '" />';
	flashout += '<param name="allowScriptAccess" value="sameDomain" /><param name="quality" value="high" /><param name="menu" value="false" />';
	flashout += '<embed src="' + url + '" width="' + w + '" height="' + h + '" name="' + id + '" wmode="' + t + '" bgcolor="' + bg + '" swLiveConnect="true" allowScriptAccess="sameDomain" quality="high" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />';
	flashout += '</object>';
	document.write(flashout);
}

function printSWF(id, flashUri, vWidth, vHeight, winMode, bgColor, flashVars) {
	var classid = (function () {
			var obj = document.createElement('object'),
				hasClassid = false;

			if (obj.classid !== undefined) {
				hasClassid = true;
			}
			obj = null;

			return hasClassid;
		}()),
		_obj_ = "";

	if (classid) {
		_obj_ =  '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,115,0" width="' + vWidth + '" height="' + vHeight + '" id="' + id + '" align="middle">';
		_obj_ += '<param name="allowScriptAccess" value="always">';
		_obj_ += '<param name="allowFullScreen" value="true">';
		_obj_ += '<param name="movie" value="' + flashUri + '">';
		_obj_ += '<param name="quality" value="high">';
		_obj_ += '<param name="wmode" value="' + winMode + '">';
		_obj_ += '<param name="bgcolor" value="' + bgColor + '">';
		_obj_ += '<param name="flashvars" value="' + flashVars + '">';
		_obj_ += '</object>';
	} else {
		_obj_ += '<embed src="' + flashUri + '" quality="high" wmode="' + winMode + '" bgcolor="' + bgColor + '" width="' + vWidth +'" height="' + vHeight + '" id="' + id + '" flashvars="' + flashVars + '" align="middle" allowScriptAccess="always" allowFullScreen="true" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"></embed>';
	}
	document.writeln( _obj_ );

	window[id] = document.getElementById(id);
}

// 롤오버시 이미지 바꾸기
function overimg(imgobj, dmt) {
	changeimg(imgobj, dmt);
	imgobj.onmouseout = function () {
		changeimg(this, dmt);
	}
}

// 이미지 바꾸기
function changeimg(imgobj, dmt, alt) {
	if (!dmt) dmt = 'on';
	var src = imgobj.src;
	var ext = src.substring(src.lastIndexOf('.'));
	if (src.indexOf(dmt + ext) == -1) imgobj.src = src.replace(ext, dmt + ext);
	else imgobj.src = src.replace(dmt + ext, ext);
	if (alt) imgobj.alt = alt;
}

// [deprecated] rvi 관련 top위치 변경(이 함수는 ie6 전용으로 css expression에 의해서 호출되고 값을 return해줌).
function quickpositionforie6() {}

/* 플래시 객체 반환 */
function thisMovie(movieName) {
	return window[movieName];
}

/* 서브페이지 전체카테고리보기 */
function allCategory(isOpen) {
	this.obj = document.getElementById('viewallcates');
	var btnimg = document.getElementById('viewallcatesbtn');
	if (isOpen == "open") {
		this.obj.style.height = '280px';
		thisMovie("allCate").allCateOpen(true);
	} else if (isOpen == "close") {
		this.obj.style.height = '1px';
		thisMovie("allCate").allCateOpen(false);
	}
	var obj = this.obj;
	btnimg.onclick = function () {
		allCategory((obj.offsetHeight < 280) ? 'open' : 'close');
	}
}

// 헤더 카테고리관련 플래시에서 호출
function maincategory(flag, action) {
	var obj = document.getElementById('maincategoryflash');
	var body = document.getElementById('body');
	if (!body) for (var body = document.getElementsByTagName('div')[0];
	(!body.className && body.className != 'blank'); body = body.nextSibling) body = body;
	if (flag == 'all' && action == 'open') {
		body.style.marginTop = '280px';
		obj.style.height = '312px';
	} else if (flag == 'all' && action == 'close') {
		body.style.marginTop = '0';
		obj.style.height = '33px';
	} else if (flag == 'sub' && action == 'open') {
		obj.style.height = '490px';
	} else if (flag == 'sub' && action == 'close') {
		obj.style.height = '33px';
	}
}

// 헤더 셀렉트박스
function init_headerselect(isbiz) {
	try {
		clearTimeout(eval('layerclosetimer.' + layerid))
	} catch (error) {}
	var layerid = 'hsrhsel';
	var selectid = 'optSection';
	var obj = document.getElementById(layerid);
	var sel = document.getElementById(selectid);
	sel.style.display = 'none';
	if (isie) var newsel = document.createElement('<div class="select">');
	else {
		var newsel = document.createElement('div');
		newsel.setAttribute('class', 'select');
	}
	newsel.innerHTML = sel.options[0].innerHTML;
	sel.parentNode.insertBefore(newsel, sel);
	sel.myson = newsel;
	sel.mylayer = obj;
	newsel.onclick = function () {
		var ck = obj.style.display;
		if (!ck || ck == 'none') obj.style.display = 'block';
		else layer(layerid);
	}
	newsel.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	newsel.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
	obj.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	obj.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
	var opts = '',
		ul = obj.getElementsByTagName('ul')[0];
	for (var i = 0, max = sel.options.length; i < max; i++) {
		opts += '<li><a href="#" onclick="select_headerselect(' + i + ');return false;">' + sel.options[i].text + '</a></li>';
	}
	ul.innerHTML = opts;
}

function select_headerselect(num) {
	var selectid = 'optSection';
	var sel = document.getElementById(selectid);
	sel.options[num].selected = 'selected';
	sel.mylayer.style.display = 'none';
	sel.myson.innerHTML = sel.options[num].text;
}

// 그냥 레이어 온오프
function showlayernormal(layerid, target, parent, zIndex) {
	try {
		clearTimeout(eval('layerclosetimer.' + layerid))
	} catch (error) {}
	var obj = document.getElementById(layerid);
	obj.style.display = 'block';
	if (parent && zIndex) {
		parent.style.zIndex = zIndex;
	}
	if (target) {
		target.onmouseout = function () {
			layerclose(layerid, parent, zIndex);
		}
		if (headerType == 'D') {
			if (layerid == 'myauctionlayer') {
				obj.style.left = (isie6) ? (getoffset(target)[2] - 10) + 'px' : (getoffset(target)[2] - 7) + 'px';
			}
			if (layerid == 'sellmanagementlayer') {
				obj.style.left = (isie6) ? (getoffset(target)[2] - 20) + 'px' : (getoffset(target)[2] - 17) + 'px';
			}
		}
	}
	obj.onmouseover = function () {
		this.mover = true;
		layerwaitforclose(layerid);
	}
	obj.onmouseout = function () {
		this.mover = false;
		layerclose(layerid, parent, zIndex);
	}
}

// 그냥 레이어 온오프 - 클릭시
function showlayernormalclick(layerid) {
	var obj = document.getElementById(layerid);
	obj.style.display = (obj.style.display == 'block') ? 'none' : 'block';
}

// 2009-03-26 심진구 : Layer와 IFrame을 겹쳐서 노출
function ShowLayerWithFrame(layerid, target) {
	try {
		clearTimeout(eval('layerclosetimer.' + layerid))
	} catch (error) {}
	var obj = document.getElementById(layerid);

	// IFrame 생성
	var dummyFrame = document.getElementById(layerid + 'dummyFrame');
	if (dummyFrame == null) {
		dummyFrame = document.createElement('<iframe>');
		dummyFrame.id = layerid + 'dummyFrame';
		dummyFrame.name = 'dummyFrame';
		dummyFrame.borderwidth = '0';
		dummyFrame.border = '0';
		dummyFrame.frameborder = '0';
		dummyFrame.scrolling = 'no';
		dummyFrame.style.position = 'absolute';
		obj.style.zIndex = (obj.style.zIndex > 0) ? obj.style.zIndex : 10000;
		dummyFrame.style.zIndex = obj.style.zIndex - 1;

		obj.parentElement.appendChild(dummyFrame);
	}

	obj.style.display = 'block';
	dummyFrame.style.display = 'block';

	dummyFrame.style.width = parseInt(getoffset(obj)[0]) - 2;
	dummyFrame.style.height = parseInt(getoffset(obj)[1]) - 14;
	dummyFrame.style.left = parseInt(getoffset(obj)[2]);
	dummyFrame.style.top = 0;
	dummyFrame.style.marginTop = 5;
	dummyFrame.style.marginWidth = 0;
	dummyFrame.style.marginHeight = 0;

	if (target) {
		target.onmouseout = function () {
			layerclose(layerid);
			layerclose(dummyFrame.id);
		}
		if (headerType == 'D') {
			if (layerid == 'myauctionlayer') {
				obj.style.left = (isie6) ? (getoffset(target)[2] - 10) + 'px' : (getoffset(target)[2] - 7) + 'px';
			}
			if (layerid == 'sellmanagementlayer') {
				obj.style.left = (isie6) ? (getoffset(target)[2] - 20) + 'px' : (getoffset(target)[2] - 17) + 'px';
			}
		}
	}
	obj.onmouseover = function () {
		this.mover = true;
		layerwaitforclose(layerid);
		layerwaitforclose(dummyFrame.id);
	}
	obj.onmouseout = function () {
		this.mover = false;
		layerclose(layerid);
		layerclose(dummyFrame.id);
	}
}

// 헤더 카테고리
function init_headercates(from, depth) {
	var id;
	switch (depth) {
	case 1:
		id = 'headercates_onedepth';
		break;
	case 2:
		id = 'headercates_twodepth';
		break;
	case 3:
		id = 'headercates_threedepth';
		break;
	case 4:
		id = 'headercates_fourdepth';
		break;
	default:
		id = 'headercates_twodepth';
	}

	var obj = document.getElementById(id);
	layer(id, from, 'justify-left', 'bottom+1', true);
	from.onmouseover = function () {
		layer(id, this, 'justify-left', 'bottom+1', true);
	}
	from.onmouseout = function () {
		layerclose(id);
	}
	obj.onmouseout = function () {
		layerclose(id);
	}
	obj.onmouseover = function () {
		layerwaitforclose(id);
	}
	obj.onmouseout = function () {
		layerclose(id);
	}
}

function init_headercates2(from, depth) {
	var id;
	switch (depth) {
	case 3:
		id = 'headercates_threedepth';
		break;
	case 4:
		id = 'headercates_fourdepth';
		break;
	}
	var obj = document.getElementById(id);
	layer(id, from, 'justify-right+23', 'bottom+1', true);
	from.onmouseover = function () {
		layer(id, this, 'justify-right+23', 'bottom+1', true);
	}
	from.onmouseout = function () {
		layerclose(id);
	}
	obj.onmouseout = function () {
		layerclose(id);
	}
	obj.onmouseover = function () {
		layerwaitforclose(id);
	}
	obj.onmouseout = function () {
		layerclose(id);
	}
}
// 물품미리보기


function product_preview(clickobj, productnum, notiframe) {
	var obj = document.getElementById('product_id_' + productnum);
	if (!obj.mypreview) {
		obj.mybtn = clickobj.getElementsByTagName('img')[0];
		obj.mypreview = document.getElementById('product_preview_id_' + productnum);
		obj.mypreview.getElementsByTagName('td')[0].innerHTML = document.getElementById('product_preview_ex').innerHTML; //내용넣기
		obj.mypreview.style.display = 'none';
	}
	if (obj.mypreview.style.display == 'none') {
		obj.className = 'noborder';
		if (isie) obj.mypreview.style.display = 'block';
		else obj.mypreview.style.display = 'table-row';
		changeimg(obj.mybtn);
	} else {
		obj.className = '';
		obj.mypreview.style.display = 'none';
		changeimg(obj.mybtn);
	}
	if (!notiframe) resize_me();
}

// 물품미리보기 닫기
function close_product_preview(clickobj, notiframe) {
	var myid;
	for (var ck = clickobj.parentNode;
	(ck.tagName.toLowerCase() != 'tr' && !ck.id); ck = ck.parentNode) myid = ck.parentNode.id;
	product_preview('', myid.substring(myid.lastIndexOf('_') + 1), notiframe);
	if (!notiframe) resize_me();
}

// 갤러리뷰 확대보기
function product_detail_view() {
	var obj = document.getElementById('product_preview_layer');
	var isiframe = obj ? false : true;
	if (!obj) obj = parent.document.getElementById('product_preview_layer');
	with(obj.style) {
		left = '-10000px';
		top = '0';
		display = 'block';
	}
	var objinfo = getoffset(obj);
	var winheight = (!isiframe) ? getwinsize('clientHeight') : parent.getwinsize('clientHeight');
	var st = (!isiframe) ? getwinsize('scrollTop') : parent.getwinsize('scrollTop');
	var yp = parseInt(((winheight / 2) - (objinfo[1] / 2)) + st) - 93;
	if (yp < 0) yp = 0;
	with(obj.style) {
		left = '127px';
		top = yp + 'px';
		zIndex = '10000';
	}
}

function product_detail_view_close() {
	document.getElementById('product_preview_layer').style.display = 'none';
}

// 모자이크뷰 확대보기
function mosaic_detail_view(target) {
	var obj = document.getElementById('mosaic_preview_layer');
	var arr = document.getElementById('mosaic_preview_arrow');
	var targetinfo = getoffset(target);
	if (targetinfo[2] < 140) var arrlp = 16,
		llp = 46;
	else if (targetinfo[2] < 290) var arrlp = 85,
		llp = 127;
	else if (targetinfo[2] < 440) var arrlp = 235,
		llp = 127;
	else if (targetinfo[2] < 590) var arrlp = 385,
		llp = 127;
	else if (targetinfo[2] < 740) var arrlp = 535,
		llp = 127;
	else var arrlp = 604,
		llp = 208;
	with(obj.style) {
		left = llp + 'px';
		top = (targetinfo[3] + 69 + 24) + 'px';
		zIndex = '10000';
		display = 'block';
	}
	with(arr.style) {
		left = arrlp + 'px';
	}
	obj.onmouseover = function () {
		target.getElementsByTagName('img')[0].className = 'on';
		this.style.display = 'block';
	}
	obj.onmouseout = function () {
		target.getElementsByTagName('img')[0].className = '';
		this.style.display = 'none';
	}
	target.onmouseout = function () {
		document.getElementById('mosaic_preview_layer').style.display = 'none';
	}
}

// 요즘뜨는 인기모델 물품정보
var popularmodells = new Array();

function init_popularmodel() {
	var obj = document.getElementById('popularmodellist');
	var lis = obj.getElementsByTagName('li');
	var atag;
	for (var i = 0, max = lis.length; i < max; i++) {
		atag = lis[i].getElementsByTagName('a')[0];
		atag.myno = i;
		atag.mylayer = lis[i].getElementsByTagName('div')[0];
		atag.onmouseover = function () {
			var os = getoffset(this);
			this.mylayer.style.left = (this.myno != 0 && this.myno != 6) ? (isopera) ? (os[2] - 1) + 'px' : os[2] + 'px' : (isie) ? (os[2] + 1) + 'px' : (os[2]) + 'px';
			this.mylayer.style.top = (os[3] - 11) + 'px';
			popularmodelhl();
			this.mylayer.style.display = 'block';
		}
		atag.mylayer.onmouseover = function () {
			this.style.display = 'block';
		}
		atag.mylayer.onmouseout = function () {
			this.style.display = 'none';
		}
		popularmodells.push(atag.mylayer);
	}
}

function popularmodelhl() {
	for (var i = 0, max = popularmodells.length; i < max; i++) {
		popularmodells[i].style.display = 'none';
	}
}

// 요즘뜨는 인기모델 열기,닫기
function popu_onc() {
	var obj = document.getElementById('popumodel_hidden');
	var btn = document.getElementById('popumodel_btn');
	if (!obj.style.display || obj.style.display == 'none') {
		obj.style.display = 'block';
		btn.src = btn.src.replace('popu_more.gif', 'popu_close.gif');
	} else {
		obj.style.display = 'none';
		btn.src = btn.src.replace('popu_close.gif', 'popu_more.gif');
	}
}

// SRP 카테고리 더보기/닫기
function src_cates_onc(clickobj) {
	var ul = clickobj.parentNode.parentNode.getElementsByTagName('ul')[0];
	var imgobj = clickobj.getElementsByTagName('img')[0];
	if (!ul.onc || ul.onc == 'close') {
		ul.onc = 'open';
		ul.style.height = 'auto';
		changeimg(imgobj);
		imgobj.alt = '닫기';
	} else {
		ul.onc = 'close';
		ul.style.height = '20px';
		changeimg(imgobj);
		imgobj.alt = '더보기';
	}
}

// SRP 카테고리 더보기/닫기 0714
function src_cates_oncsp(clickobj) {
	var ul = clickobj.parentNode.parentNode.getElementsByTagName('ul')[0];
	var imgobj = clickobj.getElementsByTagName('img')[0];
	if (!ul.onc || ul.onc == 'close') {
		ul.onc = 'open';
		ul.style.height = 'auto';
		changeimg(imgobj);
		imgobj.alt = '닫기';
	} else {
		ul.onc = 'close';
		ul.style.height = '43px';
		changeimg(imgobj);
		imgobj.alt = '더보기';
	}
}

// 레이어 감춤.
function hide(id) {
	document.getElementById(id).style.display = 'none';
}

// 윈도우 사이즈
function getwinsize(target) {
	if (target == 'clientHeight' && isopera) return self.innerHeight;
	else {
		if (document.documentElement.clientWidth) return eval('document.documentElement.' + target);
		else return eval('document.body.' + target);
	}
}

// 페이지 사이즈
function getpageysize() {
	var height = getwinsize('clientHeight');
	var scrollheight = (isfirefox) ? self.innerHeight + window.scrollMaxY : document.body.scrollHeight;
	return (scrollheight > height) ? scrollheight : height;
}

// 화면상 위치
function getoffset(element) {
	var info = [element.offsetWidth, element.offsetHeight, element.offsetLeft, element.offsetTop],
		offsetParent = element.offsetParent;

	while (offsetParent && offsetParent !== document.body && offsetParent !== document.documentElement) {
		info[2] += offsetParent.offsetLeft;
		info[3] += offsetParent.offsetTop;
		offsetParent = offsetParent.offsetParent;
	}

	return info;
}
// 화면상 위치(outside)
function getoffsetoutside(target) {
	var targetinfo = [target.offsetWidth, target.offsetHeight, 0, 0];
	for (target;
	(target.tagName.toLowerCase() != 'body' && target.tagName.toLowerCase() != 'html'); target = target.offsetParent) {
		targetinfo[2] += target.offsetLeft;
		targetinfo[3] += target.offsetTop;
	}
	return targetinfo;
}

// 화면상 위치(inside layer)
function getoffsetinlayer(target) {
	var targetinfo = [target.offsetWidth, target.offsetHeight, 0, 0];
	for (target; (target && target.className && target.className.indexOf('cmrdlayer') == -1); target = target.offsetParent) {	/* 2011-05-17 mod */
		targetinfo[2] += target.offsetLeft;
		targetinfo[3] += target.offsetTop;
	}
	return targetinfo;
}

// 이미지옆 간단메뉴
function show_product_menu(imgobj, productcode, pos) {
	var obj = document.getElementById('productovermenu');
	if (obj.mycode && obj.mycode != productcode) obj.style.display = 'none';
	obj.mycode = productcode;
	var lis = obj.getElementsByTagName('li');
	if (window.ProductOverMenu) {
		lis[0].innerHTML = "<a href='javascript:ProductOverMenu.clickMenu(0, \"" + productcode + "\");'>관심상품 등록</a>";
		lis[1].innerHTML = "<a href='javascript:ProductOverMenu.clickMenu(1, \"" + productcode + "\");'>비교함에 담기</a>";
		//lis[2].innerHTML="<a href='javascript:ProductOverMenu.clickMenu(2, \"" + productcode + "\");'>새창으로 보기</a>";
	} else {
		lis[0].innerHTML = '<a href="#관심상품 등록?물품코드=' + productcode + '">관심상품 등록</a>';
		lis[1].innerHTML = '<a href="#비교함에 담기?물품코드=' + productcode + '">비교함에 담기</a>';
		//lis[2].innerHTML='<a href="#새창으로 보기?물품코드='+productcode+'" target="_blank">새창으로 보기</a>';
	}
	if (pos == 'rightntop+1') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+1', true, true);
	else if (pos == 'rightntop+2') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+2', true, true);
	else if (pos == 'best100border') layer(obj.id, imgobj, 'justify-left-2', 'justify-bottom+2', true, true);
	else if (pos == 'best100normal') layer(obj.id, imgobj, 'justify-left-3', 'justify-bottom+1', true, true);
	else if (pos == 'specialprice') layer(obj.id, imgobj, 'justify-left', 'justify-bottom+2', true, true);
	else if (imgobj.offsetWidth < 100 || pos == 'right') layer(obj.id, imgobj, 'right-1', 'justify-top', true, true);
	else if (pos == 'thick' && !isfirefox) layer(obj.id, imgobj, 'justify-left', 'justify-bottom', true, true);
	else layer(obj.id, imgobj, 'justify-left', 'justify-bottom+1', true, true);
	imgobj.style.borderColor = '#F00F00';
	imgobj.onmouseout = function () {
		layerclose(obj.id);
		this.style.borderColor = '#E5E5E5';
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
		imgobj.style.borderColor = '#F00F00';
	}
	obj.onmouseout = function () {
		layerclose(this.id);
		imgobj.style.borderColor = '#E5E5E5';
	}
}


// 이미지옆 간단메뉴 0718LP개편
function show_product01_menu(imgobj, productcode, pos) {
	var obj = document.getElementById('productovermenu01');
	if (obj.mycode && obj.mycode != productcode) obj.style.display = 'none';
	obj.mycode = productcode;
	var lis = obj.getElementsByTagName('li');
	if (window.ProductOverMenu01) {
		lis[0].innerHTML = "<a href='javascript:ProductOverMenu01.clickMenu(0, \"" + productcode + "\" title='관심상품 등록');'>관심</a>";
		lis[1].innerHTML = "<a href='javascript:ProductOverMenu01.clickMenu(1, \"" + productcode + "\" title='비교함에 담기');'>비교</a>";
		lis[2].innerHTML = "<a href='javascript:ProductOverMenu01.clickMenu(3, \"" + productcode + "\" title='미리보기');'>미리</a>";
		lis[3].innerHTML = "<a href='javascript:ProductOverMenu01.clickMenu(2, \"" + productcode + "\" title='새창보기');'>새창</a>";
	} else {
		lis[0].innerHTML = '<a href="#관심상품 등록?물품코드=' + productcode + '" title="관심상품 등록">관심</a>';
		lis[1].innerHTML = '<a href="#비교함에 담기?물품코드=' + productcode + '" title="비교함에 담기">비교</a>';
		lis[2].innerHTML = '<a href="#미리 보기?물품코드=' + productcode + '"  title="미리보기">미리</a>';
		lis[3].innerHTML = '<a href="#새창으로 보기?물품코드=' + productcode + '" target="_blank"  title="새창보기">새창</a>';
	}
	if (pos == 'rightntop+1') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+1', true, true);
	else if (pos == 'rightntop+2') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+2', true, true);
	else if (pos == 'best100border') layer(obj.id, imgobj, 'justify-left-2', 'justify-bottom+2', true, true);
	else if (pos == 'best100normal') layer(obj.id, imgobj, 'justify-left-3', 'justify-bottom+1', true, true);
	else if (pos == 'specialprice') layer(obj.id, imgobj, 'justify-left', 'justify-bottom+2', true, true);
	else if (pos == 'bic300') layer(obj.id, imgobj, 'justify-left+90', 'justify-bottom+26', true, true); //0905 300*300큰이미지
	else if (imgobj.offsetWidth < 100 || pos == 'right') layer(obj.id, imgobj, 'right-1', 'justify-top', true, true);
	else if (imgobj.offsetWidth > 220 || pos == 'right') layer(obj.id, imgobj, 'justify-left+50', 'justify-bottom+30', true, true); //0728큰이미지수정
	else if (pos == 'chekig') layer(obj.id, imgobj, 'justify-left+3', 'justify-bottom+26', true, true); //0728
	else if (pos == 'thick' && !isfirefox) layer(obj.id, imgobj, 'justify-left', 'justify-bottom', true, true);
	else layer(obj.id, imgobj, 'justify-left', 'justify-bottom+28', true, true);
	imgobj.style.borderColor = '#F00F00';
	imgobj.onmouseout = function () {
		layerclose(obj.id);
		this.style.borderColor = '#E5E5E5';
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
		imgobj.style.borderColor = '#F00F00';
	}
	obj.onmouseout = function () {
		layerclose(this.id);
		imgobj.style.borderColor = '#E5E5E5';
	}
}


// 레이어컨트롤 등록(포지션 justify-left, bottom)
function init_layer_lb(from, layerid) {
	var obj = document.getElementById(layerid);
	layer(layerid, from, 'justify-left', 'bottom', true);
	from.onmouseover = function () {
		layer(layerid, this, 'justify-left', 'bottom', true);
	}
	from.onmouseout = function () {
		layerclose(layerid);
	}
	obj.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	obj.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
}

// 콤보박스 등록
function init_combobox(from, layerid, isdesign, selectboxid, inlayer, cutlength) {
	var obj = document.getElementById(layerid);
	var ck = document.getElementById(layerid).style.display;
	var ul = obj.getElementsByTagName('ul')[0];
	var retg = from.getElementsByTagName('span')[0];
	if (!cutlength) cutlength = 12;
	//if(!cutlength) cutlength=6; 0905셀렉트박스갯수수정
	//열려있으면 닫고 끝.
	if (ck == 'block') {
		layer(layerid);
		return;
	}
	//셀렉트박스 기능을 사용할 경우 들어갈 innerHTML 설정.
	if (selectboxid) {
		var opts = '',
			sel = document.getElementById(selectboxid);
		for (var i = 0, max = sel.options.length; i < max; i++) {
			//if(i==0) retg.innerHTML=sel.options[i].text;
			opts += '<li><a href="#" onclick="select_combobox(\'' + selectboxid + '\',' + i + ');return false;">' + sel.options[i].text + '</a></li>';
		}
		ul.innerHTML = opts;
	}
	//안의 컨텐츠 높이가 108이상일경우 스크롤바 생성(display가 none일경우 offsetHeight을 가져오지 못하므로 block설정).
	obj.style.left = '-10000px'; //셀렉트가 생성되는 동안 화면에서 안보이게
	obj.style.display = 'block';
	obj.style.width = from.offsetWidth + 'px';
	ul.style.height = 'auto';
	if ((cutlength * 18) < (ul.offsetHeight - 2)) {
		ul.style.height = (cutlength * 18) + 'px';
		ul.style.overflow = 'auto';
		ul.style.overflowX = 'hidden';
		if (!obj.inserted) {
			var paddel = document.createElement('div');
			paddel.className = 'rpadding';
			obj.insertBefore(paddel, ul);
			obj.removeChild(ul);
			paddel.appendChild(ul);
			obj.inserted = true;
		}
		if (sel && sel.options.length > cutlength) {
			obj.style.display = 'block';
			var lih = ul.getElementsByTagName('li')[0].offsetHeight;
			ul.scrollTop = lih * sel.selectedIndex;
		}
	}
	//위아래 구분 080507
	var objheight = obj.offsetHeight;
	obj.style.display = 'none';
	/* 2012-10-23 del
	var isupper = ((objheight + from.offsetTop + from.offsetHeight) > getpageysize()) ? true : false;
	//2012-10-23 del */
	/* 2012-10-23 add */
	var isupper = ((objheight + getOffset(from).top + from.offsetHeight) > getpageysize()) ? true : false;
	/* //2012-10-23 add */
	//포지션 설정
	var left = 'justify-left';
	var vposition = (isupper) ? 'top+1' : (isie && isdesign) ? 'bottom-1' : 'bottom-1';
	if (layerid == 'hdviewotherp') vposition = 'bottom-1';
	layer(layerid, from, left, vposition, true, false, inlayer);
	//a태그 기능 설정.
	var save, atags = ul.getElementsByTagName('a');
	for (var i = 0, max = atags.length; i < max; i++) {
		if (!atags[i].funcsaved) {
			atags[i].savefunc = atags[i].onclick;
			atags[i].funcsaved = true;
		}
		atags[i].onmouseover = function () {
			layerwaitforclose(layerid);
		}
		atags[i].onclick = function () {
			if (this.savefunc) this.savefunc();
			retg.innerHTML = this.innerHTML;
			document.getElementById(layerid).style.display = 'none';
			if (this.href.substring(this.href.lastIndexOf('#')) == '#') return false;
		}
	}
	// 마우스아웃시 사라짐 설정.
	var fromOldOnMouseOver = from.onmouseover;
	from.onmouseover = function () {
		layerwaitforclose(layerid);

		if (fromOldOnMouseOver) {
			from.onmouseover = fromOldOnMouseOver;
			fromOldOnMouseOver = null;
		}
	}
	obj.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	from.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
	obj.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
}
var global_selectbox_titlearea = {};
function select_combobox(selectboxid, no) {
	var sel = document.getElementById(selectboxid);
	if (!global_selectbox_titlearea[selectboxid]) {
		var p = sel.parentNode;
		for (var tg = p;
		(tg.previousSibling.nodeType != 1 || tg.previousSibling.className.indexOf('combo') == -1); tg = tg.previousSibling) {}
		global_selectbox_titlearea[selectboxid] = tg.previousSibling.getElementsByTagName('span')[0];
	}
	global_selectbox_titlearea[selectboxid].innerHTML = sel.options[no].text;
	sel.options[no].selected = 'selected';
	if (window.jQuery) {
		jQuery(sel).trigger('change');
	} else if (typeof sel.onchange === 'function') {
		sel.onchange.call(sel);
	}
}
// 콤보박스 활성/비활성
function disableCombobox(combobox, disabledClass) {
	if (typeof combobox === 'string') {
		combobox = document.getElementById(combobox);
	}
	if (combobox) {
		combobox.oldonclick = combobox.onclick;
		combobox.onclick = null;
		addClass(combobox, disabledClass);
	}
}
function enableCombobox(combobox, disabledClass) {
	if (typeof combobox === 'string') {
		combobox = document.getElementById(combobox);
	}
	if (combobox) {
		var oldonclick = combobox.oldonclick;
		if (oldonclick) {
			combobox.onclick = oldonclick;
		}
		removeClass(combobox, disabledClass);
	}
}
// 레이어 컨트롤.
var layerclosetimer = {};
function layerclose(layerid, parent, zIndex) {
	if (!window.layerclosetimer) {
		window.layerclosetimer = {};
	}
	if (layerid != 'wagglex2layer' || (layerid == 'wagglex2layer' && !document.getElementById(layerid).mover)) {
		layerclosetimer[layerid] = setTimeout(function () {
			layer(layerid);
			if (parent) {
				parent.style.zIndex = ""; // 725.2014-10-01
				$('#'+layerid).closest('.'+parent).css({'zIndex':''}); // 725.2014-10-01
			}
		}, 100);
	}
}
function layerwaitforclose(layerid) {
	if (!window.layerclosetimer) {
		return null;
	}
	clearTimeout(layerclosetimer[layerid]);
}
function layer(layerid, target, xpos, ypos, isoverevent, outside, inlayer) {
	if (layerclosetimer && layerclosetimer[layerid]) {
		clearTimeout(layerclosetimer[layerid]);
		layerclosetimer[layerid] = null;
	}

	var sameparent, targetinfo, objinfo, objparentinfo, xpospm, ypospm,
		layerpos = {},
		obj = document.getElementById(layerid);

	if (!obj) {
		return;
	}

	// common.js에 이미 선언되어 있으나 다른 js 파일에 같은 이름, 다른 로직으로 선언된 함수가 있어
	// 충돌하는 경우가 발생하여 layer() 함수 안에 다시 선언
	function getoffset(element) {
		var info = [element.offsetWidth, element.offsetHeight, element.offsetLeft, element.offsetTop],
			offsetParent = element.offsetParent;

		while (offsetParent && offsetParent !== document.body && offsetParent !== document.documentElement) {
			info[2] += offsetParent.offsetLeft;
			info[3] += offsetParent.offsetTop;
			offsetParent = offsetParent.offsetParent;
		}

		return info;
	}

	if (target && (!obj.style.display || obj.style.display == 'none')) {
		obj.style.display = 'block';
		sameparent = obj.offsetParent === target.offsetParent;
		objparentinfo = getoffset(obj.offsetParent);
		objinfo = [obj.offsetWidth, obj.offsetHeight];
		obj.style.display = 'none';

		targetinfo = getoffset(target);
		if (sameparent) {
			layerpos.top = target.offsetTop;
			layerpos.left = target.offsetLeft;
		} else {
			layerpos.top = targetinfo[3] - objparentinfo[3];
			layerpos.left = targetinfo[2] - objparentinfo[2];
		}

		if (xpos) {
			if (typeof xpos === 'string') {
				if (xpospm = xpos.match(/([a-z-]+)(\-|\+)([0-9]+)/)) {
					xpos = xpospm[1];
				}
				if (xpos === 'left') {
					// setleft(targetinfo[2] - objinfo[0]);
					layerpos.left -= objinfo[0];
				} else if (xpos === 'justify-left') {
					// setleft(targetinfo[2]) - document.documentElement.scrollLeft;
					layerpos.left -= document.documentElement.scrollLeft;
				} else if (xpos === 'right') {
					// setleft(targetinfo[2] + targetinfo[0]);
					layerpos.left += targetinfo[0];
				} else if (xpos === 'justify-right') {
					// setleft((targetinfo[2] + targetinfo[0]) - objinfo[0]);
					layerpos.left = (layerpos.left + targetinfo[0]) - objinfo[0];
				} else if (xpos === 'center') {
					// setleft((targetinfo[2] + (targetinfo[0] / 2)) - (objinfo[0] / 2));
					layerpos.left = (layerpos.left + (targetinfo[0] / 2)) - (objinfo[0] / 2);
				}
				setleft(layerpos.left);
			} else if (typeof xpos === 'number' && !isNaN(xpos)) {
				setleft(xpos);
			}
		} else if (xpos === 0) {
			setleft(xpos);
		}

		if (ypos) {
			if (typeof ypos === 'string') {
				if (ypospm = ypos.match(/([a-z-]+)(\-|\+)([0-9]+)/)) {
					ypos = ypospm[1];
				}
				if (ypos === 'top') {
					// settop(targetinfo[3] - objinfo[1]);
					layerpos.top -= objinfo[1];
				} else if (ypos === 'justify-top') {
					// settop(targetinfo[3]);
				} else if (ypos === 'bottom') {
					// settop(targetinfo[3] + targetinfo[1]);
					layerpos.top += targetinfo[1];
				} else if (ypos === 'justify-bottom') {
					// settop((targetinfo[3] + targetinfo[1]) - objinfo[1]);
					layerpos.top = (layerpos.top + targetinfo[1]) - objinfo[1];
				} else if (ypos === 'middle') {
					// settop((targetinfo[3] + (targetinfo[1] / 2)) - (objinfo[1] / 2));
					layerpos.top = (layerpos.top + (targetinfo[1] / 2)) - (objinfo[1] / 2);
				}
				settop(layerpos.top);
			} else if (typeof ypos === 'number' && !isNaN(ypos)) {
				settop(ypos);
			}
		} else if (ypos === 0) {
			settop(ypos);
		}

		obj.style.display = 'block';
	} else {
		if (!isoverevent) {
			obj.style.display = 'none';
		}
	}
	function setleft(value) {
		if (xpospm) {
			var addition = parseInt(xpospm[3], 10);
			if (xpospm[2] === '-') {
				addition = -addition;
			}
			value += addition;
		}
		obj.style.left = value + 'px';
	}
	function settop(value) {
		if (ypospm) {
			var addition = parseInt(ypospm[3], 10);
			if (ypospm[2] === '-') {
				addition = -addition;
			}
			value += addition;
		}
		obj.style.top = value + 'px';
	}
}
// 탭 만들기
function maketab(objid, isoverevent) {
	var obj = document.getElementById(objid);
	var tabs = obj.childNodes;
	var saveids = new Array(),
		tabschild, temp, isfisttab = true,
		ntabshtml = '';
	for (var i = 0; i < tabs.length; i++) {
		if (tabs[i].nodeType == 1) {
			tabschild = tabs[i].childNodes;
			for (var j = 0; j < tabschild.length; j++) {
				if (tabschild[j].nodeType == 1 && tabschild[j].className == 'tab') {
					if (isfisttab) {
						ntabshtml += tabschild[j].innerHTML;
						isfisttab = false;
					} else ntabshtml += tabschild[j].innerHTML.replace('on.gif', '.gif');
					tabs[i].removeChild(tabschild[j]);
				}
			}
			saveids.push(tabs[i].id);
		}
	}
	if (navigator.userAgent.toLowerCase().indexOf('msie') != -1) ntab = document.createElement('<div class="tab">');
	else {
		ntab = document.createElement('div');
		ntab.setAttribute('class', 'tab');
	}
	ntab.innerHTML = ntabshtml;
	obj.insertBefore(ntab, obj.childNodes[0]);
	var atags = ntab.getElementsByTagName('a');
	for (var i = 0, max = atags.length; i < max; i++) {
		atags[i].mydiv = document.getElementById(saveids[i]);
		if (i > 0) atags[i].mydiv.style.display = 'none';
		atags[i].className = (i == 0) ? 'firston' : (i == (max - 1)) ? 'last' : '';
		if (isoverevent) {
			atags[i].onmouseover = function () {
				tabchange(this, true);
			}
			atags[i].onclick = function () {
				return false;
			}
		} else {
			atags[i].onclick = function () {
				tabchange(this);
				return false;
			}
		}
		atags[i].onfocus = function () {
			tabchange(this);
			this.blur();
		}
	}
}

/* 탭 변환 */
function tabchange(atag, isoverevent) {
	var tabarea = atag.parentNode;
	var atags = tabarea.getElementsByTagName('a');
	var img, obj;
	for (var i = 0, max = atags.length; i < max; i++) {
		img = atags[i].childNodes[0];
		if (atag == atags[i]) {
			if (!isoverevent) atags[i].className = (atags[i].className.indexOf('first') != -1) ? 'firston' : (atags[i].className.indexOf('last') != -1) ? 'laston' : 'on';
			if (img.src.indexOf('on.gif') == -1) img.src = img.src.replace('.gif', 'on.gif');
			atags[i].mydiv.style.display = 'block';
		} else {
			if (!isoverevent) atags[i].className = (atags[i].className.indexOf('first') != -1) ? 'first' : (atags[i].className.indexOf('last') != -1) ? 'last' : '';
			if (img.src.indexOf('on.gif') != -1) img.src = img.src.replace('on.gif', '.gif');
			atags[i].mydiv.style.display = 'none';
		}
	}
}

/* 상하 움직이는 Quick Menu */
function scrolls(objid, starttop, bottommargin) {
	var obj = document.getElementById(objid);
	var move = function () {
		obj.style.top = (starttop + document.documentElement.scrollTop) + 'px';
		setTimeout(move, 10);
	}
	move();
}

/* iframe resize */
function resize_iframe(id, height) {
	var iframeobj = parent.document.getElementById(id);
	if (iframeobj) {
		iframeobj.height = height + 'px';
	}
}

// 컨텐츠에 따라 <iframe> 높이 변경
// offset: [object Number] 컨텐츠 높이에 추가로 더해질 높이 값
// recursive: [object Boolean] <iframe>이 중첩되서 사용된 경우
function resizeFrame( offset, recursive ) {
	var win = window,
		doc = win.document,
		docEl = doc.documentElement,
		docBody = doc.body,
		frameElement = win.frameElement;

	if ( frameElement ) {
		if ( typeof offset !== 'number' ) {
			offset = 0;
		}
		do {
			if (docEl.style.height !== 'auto' && docBody.style.height !== 'auto') {
				docEl.style.height = 'auto';
				docBody.style.height = 'auto';
			}
			frameElement.style.height = docEl.scrollHeight + offset + 'px';
			win = win.parent;
			docEl = win.document.documentElement;
			frameElement = win.frameElement;
		} while ( recursive && frameElement );
	}
}

// 특정 element로 화면 스크롤
function jumpTo( elementId ) {
	// 최상위 window를 특정 위치로 스크롤 이동
	function scrollTo( top ) {
		var doc = window.top.document;

		doc.documentElement.scrollTop = top;
		doc.body.scrollTop = top;
	}

	// <body> 요소에 대한 element의 상단 위치 값
	function getOffsetTop( element ) {
		var top = 0;

		while ( element && element.nodeName.toLowerCase() !== 'body' ) {
			top += element.offsetTop;
			element = element.offsetParent;
		}

		return top;
	}

	// 최상위 window에 대한 <iframe>의 상단 위치 값
	function getFrameTop() {
		var win = window,
			frameElement = win.frameElement,
			top = 0;

		while ( frameElement ) {
			top += getOffsetTop( frameElement );
			win = win.parent;
			frameElement = win.frameElement;
		}

		return top;
	}

	// 최상위 window이면 브라우저가 처리하도록 id값을 location.hash로 지정
	if ( window.top === window ) {
		location.hash = elementId;
	} else {
		var element = document.getElementById( elementId );

		if ( element ) {
			scrollTo( getOffsetTop( element ) + getFrameTop() );
		}
	}
}

/* 마이옥션 접기 펼치기 */
function layer_toggle(obj) {
	obj.style.display = (obj.style.display == 'block') ? 'none' : 'block';
}

/* 마이옥션 접기 펼치기할 때 이미지 alt관련 수정 */
function myamainchangeimg(obj) {
	changeimg(obj, '_on', (obj.alt == '접기') ? '펼치기' : '접기');
}

/* 마이옥션 메뉴편집 */
function myauction_mmenu() {
	clearTimeout(anitimer);
	var obj = document.getElementById('open');
	var innerobj = obj.getElementsByTagName('div')[0];
	var to;
	if (!obj.style.display || obj.style.display == 'none') {
		with(obj.style) {
			position = 'absolute';
			height = 'auto';
			left = '-10000px';
			display = 'block';
		}
		innerobj.style.marginTop = 0;
		innerobj.style.marginTop = (-(obj.offsetHeight - 14)) + 'px';
		to = 0;
		obj.style.left = '0';
	} else {
		to = -(obj.offsetHeight - 14);
	}
	var anitimer, speed = (isopera) ? 3 : 5;
	var ani = function () {
		clearTimeout(anitimer);
		var iomt = parseInt(innerobj.style.marginTop);
		if (to == 0) {
			if (to == iomt) clearTimeout(anitimer);
			else {
				innerobj.style.marginTop = (iomt + Math.ceil((to - iomt) / speed)) + 'px';
				setTimeout(ani, 10);
			}
		} else {
			if (to == iomt) {
				clearTimeout(anitimer);
				obj.style.display = 'none';
			}
			else {
				innerobj.style.marginTop = (iomt + Math.floor((to - iomt) / speed)) + 'px';
				setTimeout(ani, 10);
			}
		}
	}
	ani();
}

// 마이옥션 판매자관련메뉴
function myauction_sellermenu(clickobj, sellerid, isleft) {
	var obj = document.getElementById('sellerovermenu');
	if (obj.mycode && obj.mycode != sellerid) obj.style.display = 'none';
	obj.mycode = sellerid;
	var lis = obj.getElementsByTagName('li');
	lis[0].innerHTML = '<a href="#판매자정보확인?판매자아이디=' + sellerid + '">판매자 정보확인</a>';
	lis[1].innerHTML = '<a href="#판매자물품보기?판매자아이디=' + sellerid + '">판매자 물품보기</a>';
	lis[2].innerHTML = '<a href="#단골판매자 등록?판매자아이디=' + sellerid + '">단골판매자 등록</a>';
	lis[3].innerHTML = '<a href="#쪽지보내기?판매자아이디=' + sellerid + '">쪽지 보내기</a>';
	layer(obj.id, clickobj, (isleft) ? 'justify-left' : 'center', 'bottom', true, true);
	clickobj.onmouseout = function () {
		layerclose(obj.id);
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
	}
	obj.onmouseout = function () {
		layerclose(this.id);
	}
}

// 마이옥션 판매중인 물품
function myauction_sellerprod(clickobj, sellerid, isleft) {
	var obj = document.getElementById('sellerovermenu2');
	if (obj.mycode && obj.mycode != sellerid) obj.style.display = 'none';
	obj.mycode = sellerid;
	var lis = obj.getElementsByTagName('li');
	lis[0].innerHTML = '<a href="#전체물품 보기?판매자아이디=' + sellerid + '">전체물품 보기</a>';
	lis[1].innerHTML = '<a href="#인기물품 보기?판매자아이디=' + sellerid + '">인기물품 보기</a>';
	lis[2].innerHTML = '<a href="#추천물품 등록?판매자아이디=' + sellerid + '">추천물품 등록</a>';
	layer(obj.id, clickobj, (isleft) ? 'center' : 'center', 'bottom', true, true);
	clickobj.onmouseout = function () {
		layerclose(obj.id);
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
	}
	obj.onmouseout = function () {
		layerclose(this.id);
	}
}

function myauction_auctionprod(clickobj, sellerid, isleft) {
	var obj = document.getElementById('sellerovermenu3');
	if (obj.mycode && obj.mycode != sellerid) obj.style.display = 'none';
	obj.mycode = sellerid;
	var lis = obj.getElementsByTagName('li');
	lis[0].innerHTML = '<a href="#같은모델 다른물품 보기?판매자아이디=' + sellerid + '">같은모델 다른물품 보기</a>';
	lis[1].innerHTML = '<a href="#판매자 다른물품 보기?판매자아이디=' + sellerid + '">판매자 다른물품 보기</a>';
	lis[2].innerHTML = '<a href="#경매종료 알람 등록?판매자아이디=' + sellerid + '">경매종료 알람 등록</a>';
	lis[3].innerHTML = '<a href="#v?판매자아이디=' + sellerid + '">단골판매자 등록</a>';
	layer(obj.id, clickobj, (isleft) ? 'justify-right' : 'center', 'bottom', true, true);
	clickobj.onmouseout = function () {
		layerclose(obj.id);
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
	}
	obj.onmouseout = function () {
		layerclose(this.id);
	}
}

function myauction_auctionprod2(clickobj, sellerid, isleft) {
	var obj = document.getElementById('sellerovermenu4');
	if (obj.mycode && obj.mycode != sellerid) obj.style.display = 'none';
	obj.mycode = sellerid;
	var lis = obj.getElementsByTagName('li');
	lis[0].innerHTML = '<a href="#같은모델 다른물품 보기?판매자아이디=' + sellerid + '">같은모델 다른물품 보기</a>';
	lis[1].innerHTML = '<a href="#판매자 다른물품 보기?판매자아이디=' + sellerid + '">판매자 다른물품 보기</a>';
	lis[2].innerHTML = '<a href="#v?판매자아이디=' + sellerid + '">단골판매자 등록</a>';
	layer(obj.id, clickobj, (isleft) ? 'justify-right' : 'center', 'bottom', true, true);
	clickobj.onmouseout = function () {
		layerclose(obj.id);
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
	}
	obj.onmouseout = function () {
		layerclose(this.id);
	}
}

/* 카테고리 포커스 */
function init_category_focus() {
	var obj = document.getElementById('category_focus');
	obj.nowno = 0;
	obj.myul = obj.getElementsByTagName('ul');
	obj.myulnum = obj.myul.length;
	for (var i = 1; i < obj.myulnum; i++) obj.myul[i].style.display = 'none';
}

function category_focus(flag) {
	var obj = document.getElementById('category_focus');
	if (obj.myulnum < 2) return;
	else {
		obj.nowno = (flag == 'prev') ? (obj.nowno == 0) ? obj.myulnum - 1 : obj.nowno - 1 : (obj.nowno == (obj.myulnum - 1)) ? 0 : obj.nowno + 1;
		for (var i = 0; i < obj.myulnum; i++) {
			if (i == obj.nowno) obj.myul[i].style.display = 'block';
			else obj.myul[i].style.display = 'none';
		}
	}
}

/* 카테고리 접기/펼치기 */
function category_toggle(clickobj) {
	var btn = clickobj.getElementsByTagName('img')[0];
	var min = document.getElementById('cates_mini');
	var max = document.getElementById('cates_maxi');
	if (!min.style.display || min.style.display == 'none') {
		min.style.display = 'block';
		max.style.display = 'none';
		changeimg(btn);
	} else if (min.style.display == 'block') {
		min.style.display = 'none';
		max.style.display = 'block';
		changeimg(btn);
	}
}

/* 마이옥션 펼치기 닫기 */
function faqview(obj) {
	var con = getcon(obj)
	if (con.style.display != 'block') {
		con.style.display = 'block';
	} else {
		con.style.display = 'none';
	}
}

function getcon(obj) {
	for (i = 0; i < 1; i++) {
		if (obj.nextSibling.nodeType == 1) {
			obj = obj.nextSibling;
		} else {
			obj = obj.nextSibling;
			i--;
		}
	}
	return obj;
}

function makefaq(id) {
	var obj = document.getElementById(id);
	var childs = obj.childNodes;
	for (var i = 0, max = childs.length; i < max; i++) {
		if (childs[i].nodeType == 1 && childs[i].className == 'faqtit') {
			childs[i].onclick = function () {
				faqview(this);
			}
		}
	}
}

/* 마이옥션 물품문의 프리뷰 */
function mya_preview(clickobj) {
	if (typeof(clickobj) == 'string') clickobj = document.getElementById(clickobj);
	if (clickobj == null) return;
	if (!clickobj.myp) {
		var ck, cktr;
		for (ck = clickobj.parentNode; ck.tagName.toLowerCase() != 'tr'; ck = ck.parentNode) cktr = ck.parentNode;
		for (ck = cktr.nextSibling; ck.nodeType != 1; ck = ck.nextSibling) clickobj.myp = ck.nextSibling;
		clickobj.myptd = clickobj.myp.getElementsByTagName('td')[0];
	}
	ck = clickobj.myp.style.display;
	if (!ck || ck == 'none') {
		clickobj.myptd.style.borderBottom = '1px solid #A0A0A0';
		clickobj.myp.style.display = (isie) ? 'block' : 'table-row';
	} else {
		clickobj.myptd.style.borderBottom = '0';
		clickobj.myp.style.display = 'none';
	}
}

/* 관심물품 메인 하단 */
function myabot3_tab(no) {
	var obj, id = 'myabot3tab';
	for (var i = 1; i <= 3; i++) {
		obj = document.getElementById(id + i);
		if (i == no) {
			if (!obj.style.display || obj.style.display == 'none') obj.style.display = 'block';
			else if (obj.style.display == 'block') obj.style.display = 'none';
		} else obj.style.display = 'none';
	}
}

/* 좌우이동컨텐츠 초기화 */
function init_move_content(id, displaynum, hide) {
	var obj = document.getElementById(id);
	var ul = obj.getElementsByTagName('ul')[0];
	var lis = ul.getElementsByTagName('li');
	var itemw = lis[0].offsetWidth;
	for (var i = 0, max = lis.length, maxh = 0; i < max; i++) if (maxh < lis[i].offsetHeight) maxh = lis[i].offsetHeight;
	with(ul.style) {
		width = ((itemw * max) + 10) + 'px';
		height = maxh + 'px';
		marginLeft = '0px';
		overflow = 'hidden';
	}
	if (hide) obj.style.display = 'none';
	obj.myul = ul;
	obj.mylisw = itemw;
	obj.mylisnum = max;
	obj.working = false;
	obj.replaytimer = null;
	obj.displaynum = displaynum;

	if (isie6) { //ie6에서 보더색상이 안바뀌는 관계로 스크립트로 처리 -_- +
		var imgs;
		for (var i = 0; i < max; i++) {
			imgs = lis[i].getElementsByTagName('img');
			for (var j = 0, jmax = imgs.length; j < jmax; j++) {
				if (imgs[j].className == 'line') {
					imgs[j].onmouseover = function () {
						this.style.border = '1px solid #F00F00';
					}
					imgs[j].onmouseout = function () {
						this.style.border = '1px solid #E5E5E5';
					}
				}
			}
		}
	}

	var btnprev = document.getElementById(id + '_prev');
	var btnnext = document.getElementById(id + '_next');
	if (obj.displaynum >= obj.mylisnum) {
		setopacity(btnprev, 30);
		setopacity(btnnext, 30);
		return;
	} else {
		setopacity(btnprev, 30);
	}
	btnprev.onmouseover = function () {
		obj.mouseover = true;
		obj.replaytimer = setTimeout("move_action('" + id + "','prev');", 200);
	}
	btnprev.onmouseout = function () {
		obj.mouseover = false;
		clearTimeout(obj.replaytimer);
	}
	btnnext.onmouseover = function () {
		obj.mouseover = true;
		obj.replaytimer = setTimeout("move_action('" + id + "','next');", 200);
	}
	btnnext.onmouseout = function () {
		obj.mouseover = false;
		clearTimeout(obj.replaytimer);
	}

}

/* 투명도 주기 080416 추가 */
function setopacity(target, value) {
	if (isie) target.style.filter = 'alpha(opacity=' + value + ')';
	else target.style.opacity = value / 100;
}

/* 좌우이동컨텐츠 액션 */
function move_action(id, flag) {
	var obj = document.getElementById(id);
	clearTimeout(obj.replaytimer);
	var setmg = function (value) {
		obj.myul.style.marginLeft = value + 'px';
	}
	var getmg = function () {
		return parseInt(obj.myul.style.marginLeft);
	}
	var to, actiontimer;
	var action = function () {
		mg = getmg();
		if (to != mg) {
			if (flag == 'prev') setmg(mg + Math.ceil((to - mg) / speed));
			else if (flag == 'next') setmg(mg + Math.floor((to - mg) / speed));
			obj.working = true;
			actiontimer = setTimeout(action, 10);
		} else {
			obj.working = false;
			setopacity(document.getElementById(id + '_prev'), (to == 0) ? 30 : 100);
			setopacity(document.getElementById(id + '_next'), (to == (-((obj.mylisnum - obj.displaynum) * obj.mylisw))) ? 30 : 100);
			clearTimeout(actiontimer);
			if (obj.mouseover) obj.replaytimer = setTimeout("move_action('" + id + "','" + flag + "');", 300);
		}
	}
	var maxminus, speed = (isfirefox) ? 3 : 5;
	var mg = getmg();
	if (flag == 'prev' && mg < 0 && !obj.working) {
		to = mg + obj.mylisw;
		action(mg + obj.mylisw);
	} else if (flag == 'next' && mg > (-((obj.mylisnum - obj.displaynum) * obj.mylisw)) && !obj.working) {
		to = mg - obj.mylisw;
		action();
	}
}

/* 롤링 컨텐츠 초기화 - 인수로 넘긴 id 오브젝트안에 ul태그만 적용. 다른 용도 ul이나 중복 ul 사용 불가. */
/* 20080404 ul외에 다른 태그도 적용가능하도록 수정. */
function init_rolling_content(id, tag, classname, random) {
	var obj = document.getElementById(id);
	obj.nowno = 0;
	if (tag) {
		if (classname) {
			var temp = obj.getElementsByTagName(tag);
			obj.mycs = new Array();
			for (var i = 0, max = temp.length; i < max; i++) if (temp[i].className == classname) obj.mycs.push(temp[i]);
		} else obj.mycs = obj.getElementsByTagName(tag);
	} else obj.mycs = obj.getElementsByTagName('ul');
	obj.mycsnum = obj.mycs.length;
	var showno = 0;
	if (random) {
		showno = Math.floor(Math.random() * obj.mycsnum);
		obj.nowno = showno;
	}
	for (var i = 0; i < obj.mycsnum; i++) {
		if (i != showno) obj.mycs[i].style.display = 'none';
	}
	if (classname == 'rankitems') init_homepage_textroll(id);
}

/* 롤링 컨텐츠 액션(id,'prev'또는'next') */
function rolling_action(id, flag) {
	var obj = document.getElementById(id);
	if (obj.mycsnum < 2) return;
	else {
		obj.nowno = (flag == 'prev') ? (obj.nowno == 0) ? obj.mycsnum - 1 : obj.nowno - 1 : (obj.nowno == (obj.mycsnum - 1)) ? 0 : obj.nowno + 1;
		for (var i = 0; i < obj.mycsnum; i++) {
			if (i == obj.nowno) obj.mycs[i].style.display = 'block';
			else obj.mycs[i].style.display = 'none';
		}
	}
}

/* 팝업 스크립트 */
function popup(url, left, top) {
	var w = 360,
		h = 360;
	var winnameset = url.split('/'),
		winname = winnameset[winnameset.length - 1].split('.')[0];
	window.open(url, winname, 'width=' + w + ',height=' + h + ',resizable=no,scrollbars=yes,toolbars=no,status=yes,menu=no');
}

function resize_popup(w, h, scroll, center) {
	var docEl = document.documentElement,
		width,
		height;

	function resize() {
		// 창 내부 너비와 높이
		width = docEl.clientWidth;
		height = docEl.clientHeight;
		// 창 내부 너비와 높이가 입력 받은 너비/높이와 다를 경우 그 차이만큼 리사이즈
		if (width !== w || height !== h) {
			window.resizeBy(w - width, h - height);
		}
	}

	scroll = scroll === false ? false : true; // 스크롤 여부: 기본은 스크롤 활성
	if (!scroll) {
		// 스크롤 비활성
		docEl.style.overflowY = 'hidden';
		docEl.style.overflowX = 'hidden';
	} else {
		// 스크롤 활성
		docEl.style.overflowY = 'auto';
		docEl.style.overflowX = 'hidden';
	}

	resize();
	// 창을 화면 중앙으로 이동
	if (center) {
		// 크롬 영역(창 테두리, 주소표시줄 등)까지 고려해야하지만 큰 효과 없으므로 무시
		window.moveTo((screen.availWidth / 2) - (w / 2), (screen.availHeight / 2) - (h / 2));
	}
}

/* 레이어 위치값 브라우저마다 달라서 함수로 설정 */
function getlayerpos(pos, flag) {
	if (flag == 'vdpro') {
		if (pos == 'x') return (isie) ? 'right+5' : 'right+2';
		else if (pos == 'y') return (isie) ? 'justify-top+6' : (isfirefox) ? 'justify-top-4' : 'justify-top+3';
	}
	if (flag == 'psieh') {
		if (pos == 'y') return (isie7 || isfirefox) ? 'bottom+7' : 'bottom+5';
	}
}

/* 마이옥션 공지사항 레이어 */
function myauctionnoticelayer(target) {
	target.obj = document.getElementById('noticelayer');
	target.obj.style.left = target.offsetLeft + 9 + 'px';
	target.obj.style.top = (target.className == 'one') ? target.offsetTop + 24 + 'px' : target.offsetTop + 12 + 'px';
	target.obj.style.display = 'block';
	target.onmouseout = function () {
		this.obj.style.display = 'none';
	}
	target.obj.onmouseover = function () {
		this.style.display = 'block';
	}
	target.obj.onmouseout = function () {
		this.style.display = 'none';
	}
}

/* img change */
function imgchange(imgobj) {
	if (imgobj.src.indexOf('on.gif') == -1) {
		imgobj.src = imgobj.src.replace('.gif', 'on.gif');
		imgobj.onmouseout = function () {
			if (this.src.indexOf('on.gif') != -1) this.src = this.src.replace('on.gif', '.gif');
		}
	}
}

/* 마우스오버 레이어 등록 단축 */
function layernpos(target, layerid, left, top, outside) {
	target.obj = document.getElementById(layerid);
	//target.obj.className = 'onc';
	layer(layerid, target, left, top, true, outside);
	target.onmouseout = function () {
		layerclose(layerid);
	}
	target.obj.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	target.obj.onmouseout = function () {
		layerclose(layerid);
	}
}

/* 인기물품 더보기 레이어 열고닫기 */
function morepopuprod() {
	var target = document.getElementById('btn_morepopuprod');
	layer('rlayer_morepopuprod', target, 'justify-right+2', 'bottom');
	var obj = document.getElementById('rlayer_morepopuprod');
	target.getElementsByTagName('span')[0].innerHTML = (!obj.style.display || obj.style.display == 'none') ? '인기물품 더보기' : '인기물품 감추기';
}

/* 인기물품 더보기 정렬레이어 */
function pplayersort(target, layerid) {
	target.obj = document.getElementById(layerid);
	target.obj.style.left = target.offsetLeft + 2 + 'px';
	target.obj.style.top = (isie6) ? target.offsetTop + target.offsetHeight + 6 + 'px' : target.offsetTop + target.offsetHeight + 'px';
	target.obj.style.display = 'block';
	target.onmouseover = function () {
		this.obj.style.left = this.offsetLeft + 2 + 'px';
		this.obj.style.top = (isie6) ? this.offsetTop + this.offsetHeight + 6 + 'px' : this.offsetTop + this.offsetHeight + 'px';
		this.obj.style.display = 'block';
	}
	target.onmouseout = function () {
		this.obj.style.display = 'none';
	}
	target.obj.onmouseover = function () {
		this.style.display = 'block';
	}
	target.obj.onmouseout = function () {
		this.style.display = 'none';
	}
}

// 뷰페이지 물품 확대보기
function product_zoom_view() {
	var obj = document.getElementById('layer_product_zoom');
	var isiframe = obj ? false : true;
	if (!obj) obj = parent.document.getElementById('layer_product_zoom');
	with(obj.style) {
		left = '-10000px';
		top = '0';
		display = 'block';
	}
	var objinfo = getoffset(obj);
	var winheight = (!isiframe) ? getwinsize('clientHeight') : parent.getwinsize('clientHeight');
	var st = (!isiframe) ? getwinsize('scrollTop') : parent.getwinsize('scrollTop');
	var yp = parseInt(((winheight / 2) - (objinfo[1] / 2)) + st) - 93
	if (yp < 0) yp = 0;
	with(obj.style) {
		left = '65px';
		top = yp + 'px';
		zIndex = '10000';
	}
}

function product_zoom_view_close() {
	document.getElementById('layer_product_zoom').style.display = 'none';
}

function forgoodscomparison() {
	return 'justify-left-' + document.getElementById('goodscomparison').parentNode.scrollLeft;
}

/* 홈페이지 랭킹부분 */
function init_homepage_textroll(id) {
	var obj = document.getElementById(id);
	var childs = obj.childNodes;
	for (var i = 0, max = childs.length; i < max; i++) {
		if (childs[i].nodeType == 1 && childs[i].className == 'rankitems') {
			childs[i].imglink = childs[i].getElementsByTagName('div')[0].getElementsByTagName('a')[0];
			childs[i].img = childs[i].imglink.getElementsByTagName('img')[0];
			childs[i].ul = childs[i].getElementsByTagName('ul')[0];
			childs[i].ul.setclass = function (onobj) {
				for (var k = 0, kmax = this.lis.length; k < kmax; k++) {
					if (onobj == this.lis[k].link) {
						if (this.lis[k].img.src.indexOf('_on.gif') == -1) this.lis[k].img.src = this.lis[k].img.src.replace('.gif', '_on.gif');
						this.lis[k].link.className = 'on';
					} else {
						if (this.lis[k].img.src.indexOf('_on.gif') != -1) this.lis[k].img.src = this.lis[k].img.src.replace('_on.gif', '.gif');
						this.lis[k].link.className = '';
					}
				}
			}
			childs[i].ul.lis = childs[i].ul.getElementsByTagName('li');
			for (var j = 0, jmax = childs[i].ul.lis.length; j < jmax; j++) {
				childs[i].ul.lis[j].img = childs[i].ul.lis[j].getElementsByTagName('img')[0];
				childs[i].ul.lis[j].link = childs[i].ul.lis[j].getElementsByTagName('a')[0];
				childs[i].ul.lis[j].link.saveevent = childs[i].ul.lis[j].link.onmouseover;
				childs[i].ul.lis[j].link.onmouseover = function () {
					if (this.saveevent) this.saveevent();
					this.parentNode.parentNode.setclass(this);
				}
			}
			childs[i].ul.lis[0].link.onmouseover();
		}
	}
}

/* 홈페이지 랭킹부분 이미지 변경 */
function homepage_textroll_imgchange(overobj, newsrc, newalt) {
	overobj.parentNode.parentNode.parentNode.parentNode.imglink.href = overobj.href;
	with(overobj.parentNode.parentNode.parentNode.parentNode.img) {
		src = newsrc;
		alt = newalt;
	}
}

/* 카테고리 레이어 스크롤바 생성 */
function init_subcategorylayer(from, layerid) {
	var obj = document.getElementById(layerid);
	obj.style.display = 'block';
	obj.style.height = (obj.offsetHeight > 274) ? '270px' : 'auto';
	obj.style.display = 'none';
	init_layer_lb(from, layerid);
}


/* ie6 png24 출처:웹 */
function setPng24(obj) {
	/* DEPRECATED */
}

/* 펼침부분 */
function faqShow(n) {
	var p = "a" + n; //이 부분은 강좌 보기 버튼 클릭시 보여줄 내용 id로
	var i = "i" + n; // 이 부분은 강좌 보기, 감추기 토글 버튼 id로
	if (document.getElementById(p).style.display == "none") {
		document.getElementById(p).style.display = "block";
		document.getElementById(i).src = protocol + "//pics.auction.co.kr/myauction/buy/return_close_ar.gif";
	} else {
		document.getElementById(p).style.display = "none";
		document.getElementById(i).src = protocol + "//pics.auction.co.kr/myauction/buy/return_open_ar.gif";
	}
}

// SRP kms2-요즘뜨는 인기상품 0202
function src_kmsup_oncsp(clickobj) {
	var ul = clickobj.parentNode.parentNode.getElementsByTagName('ul')[0];
	var imgobj = clickobj.getElementsByTagName('img')[0];
	if (!ul.onc || ul.onc == 'close') {
		ul.onc = 'open';
		ul.style.height = 'auto';
		changeimg(imgobj);
		imgobj.alt = '닫기';
	} else {
		ul.onc = 'close';
		ul.style.height = '145px';
		changeimg(imgobj);
		imgobj.alt = '더보기';
	}
}

/*  메인롤링  */
function rotatecontents(objectid) {
	this.titleobject = null;
	this.titlesetbyrule = null;
	this.pagingobject = null;
	this.pagingstart = '';
	this.pagingdelimiter = '/';
	this.pagingend = '';
	this.rotatemethod = null;
	this.maxzindex = 1;
	this.speed = 5;
	this.autoplay = false;
	this.autoplaytime = 3;
	this.buttonobject = null;
	this.buttontype = 'text';
	this.buttononclassname = 'on';
	this.buttononimagename = '';
	this.addtitle = function (title) {
		titles.push(title);
	}

	var object = document.getElementById(objectid);
	var items = new Array(),
		itemsnum, titles = new Array();
	var btns = new Array(),
		btnsmover = new Array(),
		btnsmout = new Array();
	var speed, timer, nowno = 0,
		canimove = true;
	var isie = (navigator.userAgent.toLowerCase().indexOf('msie') != -1) ? true : false;

	this.initialize = function () {
		var isfirst = true,
			removeobjs = new Array(),
			childs = object.childNodes;
		for (var i = 0, j = -1, max = childs.length; i < max; i++) {
			if (childs[i].nodeType == 1) {
				j++;
				if (this.titleobject) {
					if (this.titlesetbyrule == 'alt') {
						titles.push((childs[i].nodeName.toLowerCase() == 'img') ? childs[i].alt : childs[i].getElementsByTagName('img')[0].alt);
					} else if (this.titlesetbyrule == 'nextobject' && j % 2) {
						titles.push(childs[i].innerHTML);
						removeobjs.push(childs[i]);
						continue;
					} else if (this.titlesetbyrule == 'prevobject' && j % 2 == 0) {
						titles.push(childs[i].innerHTML);
						removeobjs.push(childs[i]);
						continue;
					}
				}
				if (!isfirst) childs[i].style.display = 'none';
				items.push(childs[i]);
				if (this.rotatemethod == 'overlap' || this.rotatemethod == 'slide' || this.rotatemethod == 'fadein') {
					speed = this.speed;
					object.style.position = 'relative';
					with(childs[i].style) {
						position = 'absolute';
						left = '0px';
						top = '0px';
						width = object.offsetWidth + 'px';
					}
					if (this.rotatemethod == 'fadein') {
						setopacity(childs[i], (isfirst) ? 100 : 0);
					}
				}
				if (isfirst) isfirst = false;
			}
		}
		itemsnum = items.length;
		if (removeobjs[0]) {
			for (var i = 0, max = removeobjs.length; i < max; i++) object.removeChild(removeobjs[i]);
		}
		if (this.titleobject) this.titleobject = (titles[0]) ? document.getElementById(this.titleobject) : null;
		if (this.pagingobject) this.pagingobject = document.getElementById(this.pagingobject);
		this.settitlenpaging(nowno);
		object.style.width = object.offsetWidth + 'px';
		object.style.height = object.offsetHeight + 'px';
		object.style.overflow = 'hidden';
		object.onmouseover = function () {
			clearTimeout(eval(objectid).autoplaytimer);
		}
		object.onmouseout = function () {
			eval(objectid).autoplayaction();
		}
		if (this.buttonobject) {
			this.buttonobject = document.getElementById(this.buttonobject);
			var childs = this.buttonobject.childNodes;
			for (var i = 0, j = 0, max = childs.length; i < max; i++) {
				if (childs[i].nodeType == 1) {
					childs[i].myno = j;
					if (childs[i].onmouseover) btnsmover.push(childs[i].onmouseover);
					if (childs[i].onmouseout) btnsmout.push(childs[i].onmouseout);
					btns.push(childs[i]);
					j++;
				}
			}
			if (items.length != btns.length) this.buttonobject = null;
			else this.setbtns();
		}
		this.autoplayaction();
	}

	this.settitlenpaging = function (no) {
		if (this.titleobject) this.titleobject.innerHTML = titles[no];
		if (this.pagingobject) this.pagingobject.innerHTML = this.pagingstart + (no + 1) + this.pagingdelimiter + itemsnum + this.pagingend;
	}

	this.setzindex = function (no) {
		for (var i = 0; i < itemsnum; i++) {
			if (i == no) {
				items[i].style.zIndex = this.maxzindex + 3;
				items[i].style.display = '';
			} else if (i == nowno) {
				items[i].style.zIndex = this.maxzindex + 2;
			} else {
				items[i].style.zIndex = this.maxzindex + 1;
				items[i].style.display = 'none';
			}
		}
	}

	this.setbtns = function (no) {
		if (!no && no !== 0) no = nowno;
		for (var i = 0; i < itemsnum; i++) {
			if (i == no) {
				this.setbtnon(btns[i]);
				btns[i].onmouseover = null;
				btns[i].onmouseout = null;
			} else {
				this.setbtnoff(btns[i]);
				btns[i].onmouseover = function () {
					eval(objectid).setbtnon(this);
					if (btnsmover[this.myno]) btnsmover[this.myno]();
				}
				btns[i].onmouseout = function () {
					eval(objectid).setbtnoff(this);
					if (btnsmout[this.myno]) btnsmout[this.myno]();
				}
			}
		}
	}

	this.setbtnon = function (target) {
		var classes, exist = false;
		if (this.buttontype == 'image') {
			var btnimg = target.getElementsByTagName('img')[0];
			var btnimgexp = btnimg.src.substring(btnimg.src.lastIndexOf('.'));
			if (btnimg.src.indexOf(this.buttononimagename + btnimgexp) == -1) btnimg.src = btnimg.src.replace(btnimgexp, this.buttononimagename + btnimgexp);
		}
		classes = target.className.split(' ');
		for (var i = 0; i < classes.length; i++) if (classes[i] == this.buttononclassname) exist = true;
		if (!exist) target.className = target.className + ' ' + this.buttononclassname;
	}

	this.setbtnoff = function (target) {
		var classes;
		if (this.buttontype == 'image') {
			var btnimg = target.getElementsByTagName('img')[0];
			var btnimgexp = btnimg.src.substring(btnimg.src.lastIndexOf('.'));
			if (btnimg.src.indexOf(this.buttononimagename + btnimgexp) != -1) btnimg.src = btnimg.src.replace(this.buttononimagename + btnimgexp, btnimgexp);
		}
		if (target.className.indexOf(this.buttononclassname) != -1) {
			if (target.className.indexOf(' ') == -1) target.className = target.className.replace(this.buttononclassname, '');
			else {
				classes = target.className.split(' ');
				for (var i = 0; i < classes.length; i++) if (classes[i] == this.buttononclassname) classes[i] = '';
				target.className = classes.join(' ');
			}
		}
	}

	this.change = function (no) {
		no = no - 1;
		if (no != nowno) {
			if (this.rotatemethod == 'overlap') this.moveaction('overlap', no, (no < nowno) ? 'prev' : 'next');
			else if (this.rotatemethod == 'slide') this.moveaction('slide', no, (no < nowno) ? 'prev' : 'next');
			else if (this.rotatemethod == 'fadein') this.fadeinaction(no);
			else this.hideitem(no);
			this.settitlenpaging(no);
			if (this.buttonobject) this.setbtns(no);
		}
	}

	this.prev = function () {
		var prevno = (nowno == 0) ? itemsnum - 1 : nowno - 1;
		if (this.rotatemethod == 'overlap') this.moveaction('overlap', prevno, 'prev');
		else if (this.rotatemethod == 'slide') this.moveaction('slide', prevno, 'prev');
		else if (this.rotatemethod == 'fadein') this.fadeinaction(prevno);
		else this.hideitem(prevno);
		this.settitlenpaging(prevno);
	}

	this.next = function () {
		var nextno = (nowno == (itemsnum - 1)) ? 0 : nowno + 1;
		if (this.rotatemethod == 'overlap') this.moveaction('overlap', nextno, 'next');
		else if (this.rotatemethod == 'slide') this.moveaction('slide', nextno, 'next');
		else if (this.rotatemethod == 'fadein') this.fadeinaction(nextno);
		else this.hideitem(nextno);
		this.settitlenpaging(nextno);
		if (this.buttonobject) this.setbtns(nextno);
	}

	this.autoplaytimer = null;
	this.autoplayaction = function () {
		if (!this.autoplay) return;
		this.autoplaytimer = setTimeout(objectid + '.next()', this.autoplaytime * 1000);
	}

	this.hideitem = function (no) {
		clearTimeout(this.autoplaytimer);
		for (var i = 0; i < itemsnum; i++) items[i].style.display = (i == no) ? '' : 'none';
		this.autoplayaction();
		nowno = no;
	}

	var getleft = function (no) {
		return parseInt(items[no].style.left);
	}

	var setleft = function (no, value) {
		items[no].style.left = value + 'px';
	}

	this.moveaction = function (method, no, direction) {
		clearTimeout(this.autoplaytimer);
		if (canimove) {
			canimove = false;
			setleft(no, (direction == 'prev') ? -(object.offsetWidth) : object.offsetWidth);
			this.setzindex(no);
			var now, snow, to = 0,
				mv = 0;
			var action = function () {
				clearTimeout(timer);
				now = getleft(no);
				if (method == 'slide') snow = getleft(nowno);
				if (now != to) {
					mv = (now - to) / speed;
					setleft(no, (direction == 'prev') ? Math.ceil(now - mv) : Math.floor(now - mv));
					if (method == 'slide') setleft(nowno, (direction == 'prev') ? Math.ceil(snow - mv) : Math.floor(snow - mv));
					setTimeout(action, 10);
				} else {
					eval(objectid + '.autoplayaction()');
					clearTimeout(timer);
					canimove = true;
					nowno = no;
				}
			}
			action();
		}
	}

	var getopacity = function (target) {
		return (isie) ? parseInt(target.style.filter.match(/alpha\(opacity=([0-9]+)\)/)[1]) : target.style.opacity * 100;
	}

	var setopacity = function (target, value) {
		if (isie) target.style.filter = 'alpha(opacity=' + value + ')';
		else target.style.opacity = value / 100;
	}

	this.fadeinaction = function (no) {
		clearTimeout(this.autoplaytimer);
		if (canimove) {
			canimove = false;
			setopacity(items[no], 0);
			this.setzindex(no);
			var nowo, to = 0;
			var action = function () {
				clearTimeout(timer);
				nowo = getopacity(items[no]);
				if (nowo != 100) {
					setopacity(items[no], Math.ceil(nowo + (100 - nowo) / speed));
					setTimeout(action, 10);
				} else {
					eval(objectid + '.autoplayaction()');
					clearTimeout(timer);
					canimove = true;
					nowno = no;
				}
			}
			action();
		}
	}
}

// 메인레프트 플래시에서 호출
function mainleftcategory(flag, action) {
	//alert(flag+' '+action);
	var obj = document.getElementById('swf_reward');
	if (flag == 'left' && action == 'open') {
		obj.style.width = '500px';
	} else if (flag == 'left' && action == 'out') {
		obj.style.width = '156px';
	}
}

// 0203 해외쇼핑
function global_oncsp(clickobj) {
	var ul = clickobj.parentNode.parentNode.getElementsByTagName('ul')[0];
	var imgobj = clickobj.getElementsByTagName('img')[0];
	if (!ul.onc || ul.onc == 'close') {
		ul.onc = 'open';
		ul.style.height = 'auto';
		changeimg(imgobj);
		imgobj.alt = '닫기';
	} else {
		ul.onc = 'close';
		ul.style.height = '45px';
		changeimg(imgobj);
		imgobj.alt = '더보기';
	}
}

// 추가 랜덤 함수
function best100start() {
	best100_rcontents.change(Math.ceil(Math.random() * 10));
}

function specialpricestart() {
	specialprice_rcontents.change(Math.ceil(Math.random() * 10));
}

function photofocusstart() {
	photofocus_rcontents.change(Math.ceil(Math.random() * 5));
}

function adserverbstart() {
	adserverb_rcontents.change(Math.ceil(Math.random() * 4));
}

//0401 레이어컨트롤 등록(포지션 justify-right, bottom)
function init_layer_lbrt(from, layerid) {
	var obj = document.getElementById(layerid);
	layer(layerid, from, 'justify-right', 'bottom', true);
	from.onmouseover = function () {
		layer(layerid, this, 'justify-right', 'bottom', true);
	}
	from.onmouseout = function () {
		layerclose(layerid);
	}
	obj.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	obj.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
}

// 20090324 오수연 스티커
function init_layer_lb4(from, layerid) {
	var obj = document.getElementById(layerid);
	var targetinfo = getoffset(from)
	layer(layerid, from, targetinfo[0], targetinfo[1], true);
	from.onmouseover = function () {
		layer(layerid, from, targetinfo[0], targetinfo[1], true);
	}
	from.onmouseout = function () {
		layerclose(layerid);
	}
	obj.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	obj.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
}

// 20090324 오수연 배송서비스확장 2단계 에서 해당 레이어 안의 이미지 롤오버 및 마우스 아웃시 해당 레이어 클로즈
function init_layer_lb3(imgobj, dmt, layerid) {
	var obj = document.getElementById(layerid);

	layer(layerid, imgobj, 'justify-left', 'bottom', true);
	obj.style.display == 'block'

	changeimg(imgobj, dmt);
	//imgobj.onmouseout = function () {
	imgobj.onclick = function () {
		changeimg(this, dmt);
	}
}

// 20090324 오수연 배송서비스확장 이미지 롤오보 및 레이어컨트롤 등록(포지션 justify-left, bottom)
function init_layer_lb2(from, layerid) {
	var obj = document.getElementById(layerid);
	var src = from.src;
	var ext = src.substring(src.lastIndexOf('.'));

	layer(layerid, from, 'justify-left', 'bottom', true);
	from.src = src.replace(ext, '_on' + ext);
	from.onmouseover = function () {
		layer(layerid, this, 'justify-left', 'bottom', true);
		from.src = src.replace(ext, '_on' + ext);
	}
	from.onmouseout = function () {
		layerclose(layerid);
		from.src = src.replace('_on' + ext, ext);
	}
	obj.onmouseover = function () {
		from.src = src.replace(ext, '_on' + ext);
		layerwaitforclose(layerid);
	}
	obj.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
}

// cpp 플래시에서 호출
function lwOpenStatus(flag, action) {
	//alert(flag+' '+action);
	var obj = document.getElementById('cateleftflash');
	if (flag == 'lwBBnn' && action == 'open') {
		obj.style.width = '461px';
		obj.style.height = '261px';
	} else if (flag == 'lwBBnn' && action == 'close') {
		obj.style.width = '82px';
		obj.style.height = '130px';
	}
}

function openStatus(flag, action) {
	//alert(flag+' '+action);
	var obj = document.getElementById('cateflashopen');
	if (flag == 'iconMeta' && action == 'open') {
		obj.style.height = '1000px';
	} else if (flag == 'iconMeta' && action == 'close') {
		obj.style.height = '138px';
	}
}

/* vip가격 */
// 마일리지
function addPriceTop() {
	thisMovie("Price_top").addFLData(100, 1);
}
// 세일가
function addPriceSale() {
	thisMovie("PriceSale").addFLData(9200, 2);
}
// 세일가2
function addPriceSaleA() {
	thisMovie("PriceSale2").addFLData(19200, 2);
}
// 가격
function addPrice() {
	thisMovie("PriceFL").addFLData(16800, 0);
}

function reSizeTop(val) {
	var targetObj = document.getElementById("priceTOP");
	targetObj.style.width = val;
}

function reSizeSale(val) {
	var targetObj = document.getElementById("pricesele");
	targetObj.style.width = val;
}

function reSizeSaleA(val) {
	var targetObj = document.getElementById("pricesele2");
	targetObj.style.width = val;
}

function reSize(val) {
	var targetObj = document.getElementById("price");
	targetObj.style.width = val;
}

// 가격 세팅
function setPrice(flash_id, price) {
	thisMovie(flash_id).addFLData(price, 0);
}

function setPrice2(flash_id, price) {
	thisMovie(flash_id).addFLData(price, 2);
}

function setPrice3(flash_id, price) {
	thisMovie(flash_id).addFLData(price, 2);
}

function resizePriceWidth(wrapper_id, price) {
	var wrapper = document.getElementById(wrapper_id);
	wrapper.style.width = calcPriceWidth(price) + 'px';
}

function resizePriceWidth2(wrapper_id, price) {
	var wrapper = document.getElementById(wrapper_id);
	wrapper.style.width = calcPriceWidth2(price) + 'px';
}

function resizePriceWidth3(wrapper_id, price) {
	var wrapper = document.getElementById(wrapper_id);
	wrapper.style.width = calcPriceWidth3(price) + 'px';
}

// 자릿 수에 해당하는 폭 계산
function calcPriceWidth(val) {
	var len = val.length,
		commas = parseInt((len - 1) / 3),
		width = (len * 16) + (commas * 8) + 14;
	return width;
}

function calcPriceWidth2(val) {
	var len = val.length,
		commas = parseInt((len - 1) / 3),
		width = (len * 9) + (commas * 4) + 11;
	return width;
}

function calcPriceWidth3(val) {
	var len = val.length,
		commas = parseInt((len - 1) / 3),
		width = (len * 9) + (commas * 4) + 11;
	return width;
}
/* //vip가격 */

/* moral-popup */
function openMap() {
	var fmap = document.getElementById('fmap'),
		layer = document.getElementById('layer'),
		overlay = fmap.getElementsByTagName('iframe')[0];
	fmap.style.display = 'block';
	if (window.VP) {
		if (layer.offsetHeight > VP.height) {
			layer.style.top = '0';
			layer.style.marginTop = '0';
		} else {
			layer.style.top = ((VP.height - layer.offsetHeight) / 2) + 'px';
			layer.style.marginTop = '0';
		}
		if (overlay) {
			fmap.style.width = document.body.scrollWidth + 'px';
			fmap.style.height = document.body.scrollHeight + 'px';
			overlay.style.width = document.body.scrollWidth + 'px';
			overlay.style.height = document.body.scrollHeight + 'px';
		}
	}
}

function closeMap() {
	document.getElementById("fmap").style.display = "none";
}
/* //moral-popup */
/* Layer */
var openLayerReg = {};

function openLayer(layer_id, options) {
	var layer = document.getElementById(layer_id),
		config = extend({
			/*
			opener: element,
			datum: element,
			offset: {},
			*/
			closeTimeout: 300,
			closeOnFocusOut: false
		}, options);
	if (openLayerReg && openLayerReg[layer_id]) {
		delete openLayerReg[layer_id];
	}
	layer.style.display = 'block';
	if (config.datum) {
		var key,
			datum = typeof config.datum === "string" ? document.getElementById(config.datum) : config.datum,
			datumOffset = getOffset(datum),
			layerParent = layer.offsetParent,
			parentOffset = getOffset(layerParent);
		layer.style.position = 'absolute';
		layer.style.top = (datumOffset.top - parentOffset.top) + "px";
		layer.style.left = (datumOffset.left - parentOffset.left) + "px";
	}
	if (config.opener && config.closeTimeout) {
		var opener = typeof config.opener === "string" ? document.getElementById(config.opener) : config.opener,
			timer;

		addEvent(opener, "mouseleave", function () {
			timer = setTimeout(function () {
				closeLayer(layer_id);
			}, config.closeTimeout);
		});
		addEvent(layer, "mouseenter", function () {
			if (timer) {
				timer = clearTimeout(timer);
			}
		});
		addEvent(layer, "mouseleave", function () {
			closeLayer(layer_id);
		});
	}
	if (openLayerReg) {
		for (key in openLayerReg) {
			if (openLayerReg.hasOwnProperty(key)) {
				closeLayer(key);
			}
		}
	}
	if (config.closeOnFocusOut) {
		openLayerReg[layer_id] = layer;
	}
}

function closeLayer(layer_id, btn) {
	var layer = document.getElementById(layer_id);
	layer.style.display = 'none';
	if (btn) {
		btn = extend({
			img: null,
			from: '',
			to: '',
			alt: ''
		}, btn);
		if (typeof btn.img === 'string') {
			btn.img = document.getElementById(btn.img);
		}
		changeImage(btn.img, btn.from, btn.to, btn.alt);
	}
	if (openLayerReg[layer_id]) {
		delete openLayerReg[layer_id];
	}
}
function toggleLayer(layer_id) {
	var layer = document.getElementById(layer_id);
	if (layer.style.display === "block") {
		layer.style.display = "none";
	} else {
		layer.style.display = "block";
	}
}
function moveLayer(layer, x, y) {
	layer = typeof layer === "string" ? document.getElementById(layer) : layer;
	if (!layer) {
		return null;
	}
	var parent = layer.offsetParent,
		parentOffset = getOffset(parent);
	layer.style.top = (y - parentOffset.top) + "px";
	layer.style.left = (x - parentOffset.left) + "px";
}
function openBaroOnLayer(layer, where) {
	layer = typeof layer === "string" ? document.getElementById(layer) : layer;
	where = typeof where === "string" ? document.getElementById(where) : where;
	if (!layer) {
		return null;
	}
	layer.style.display = "block";
	if (where) {
		var whereOffset = getOffset(where),
			layerOffset = getOffset(layer),
			top = whereOffset.top - layerOffset.height - 10,
			left = whereOffset.left;
		moveLayer(layer, left, top);
	}
}
/* //Layer */

/* main0909탭버튼 */
function tabChange(obj, num, imgId, total) {
	for (i = 1; i <= total; i++) {
		var imgIds = document.getElementById(imgId + i);
		var imgSrc = imgIds.getAttribute("src");
		if (i == num) {
			document.getElementById(obj + i).style.display = '';
			imgIds.setAttribute("src", imgSrc.replace("_off", "_on"));
		}
		else {
			document.getElementById(obj + i).style.display = 'none';
			imgIds.setAttribute("src", imgSrc.replace("_on", "_off"));
		}
	}
}

/* 쇼핑백 */
function LayerStatus(isOpen) {
	this.obj = document.getElementById('uxa-qna');
	if (isOpen == "open") {
		this.obj.style.height = '432px';
		this.obj.style.width = '305px';
		thisMovie("UvwGuide").UvwGuideOpen(true);
	} else if (isOpen == "close") {
		this.obj.style.height = '0px';
		this.obj.style.width = '0px';
		thisMovie("UvwGuide").UvwGuideOpen(false);
	}
}

/* i-pay popup */
function contView(obj) {
	var target = document.getElementById(obj);
	target.style.display = (target.style.display == 'none' ? 'block' : 'none');
}

/* 단축 url */
function url_open(from, url) {
	openUrlBox();
}

/* 마우스클릭 레이어 등록 단축 */
function layerclick(target, layerid, left, top, outside) {
	target.obj = document.getElementById(layerid);
	layer(layerid, target, left, top, true, outside);
}

/* SRP 섹션화 0303 */
function src_category(clickobj) {
	var ul = clickobj.parentNode.parentNode.getElementsByTagName('ul')[0];
	var imgobj = clickobj.getElementsByTagName('img')[0];
	if (!ul.onc || ul.onc == 'close') {
		ul.onc = 'open';
		ul.style.height = 'auto';
		ul.style.padding = '10px 0 5px 0';
		changeimg(imgobj);
		imgobj.alt = '닫기';
	} else {
		ul.onc = 'close';
		ul.style.height = '0px';
		ul.style.padding = '0px';
		changeimg(imgobj);
		imgobj.alt = '더보기';
	}
}
/* 메인동영상 */
function LayerStatus(isOpen) {
	this.obj = document.getElementById('uxa-movie');
	if (isOpen == "open") {
		this.obj.style.height = '289px';
		this.obj.style.width = '523px';
		this.obj.style.top = '-239px';
		thisMovie("Shopperama").UvwGuideOpen(true);
	} else if (isOpen == "close") {
		this.obj.style.height = '49px';
		this.obj.style.width = '523px';
		this.obj.style.top = '0px';
		thisMovie("Shopperama").UvwGuideOpen(false);
	}
}
/* ad wing펼쳐짐 */
function flashSizeControl(divName, width, height) {
	width = parseInt(width, 10);
	height = parseInt(height, 10);
	this.obj = document.getElementById(divName);
	this.obj.style.height = height + 'px';
	this.obj.style.width = width + 'px';
	if (width > 81) {
		this.obj.style.zIndex = '10000';
	} else {
		this.obj.style.zIndex = '';
	}
}
/* //ad wing펼쳐짐 */
/* ad img */
function printAdImage(hrefURL, onClickURL, srcURL, vWidth, vHeight, onImpressionURL, onOutImpURL) {
	var _obj_ = '';
	_obj_ += '<a href="' + hrefURL + '" onclick="adLog(\'' + onClickURL + '\');" target="_blank">';
	_obj_ += '<img src="' + srcURL + '" alt="광고배너" style="width:' + vWidth + 'px; height:' + vHeight + 'px; border:0;">';
	_obj_ += '</a>';
	if (onImpressionURL != "") {
		_obj_ += '<img src="' + onImpressionURL + '" alt="" style="display:none;">';
	}
	if (onOutImpURL == null || onOutImpURL == "") {} else {
		_obj_ += '<img src="' + onOutImpURL + '" alt="" style="display:none;">';
	}
	try {
		if (isShPrintAdImage != undefined && ShCategoryBannerHtml != undefined && isShPrintAdImage == true) {
			isShPrintAdImage = false;
			ShCategoryBannerHtml = _obj_;
		} else {
			document.write(_obj_);
		}
	} catch (e) {
		document.write(_obj_);
	}
}
/* //ad img */
/* 옥션 바로가기 */
var displyaMode = false;

function show(auction) {
	if (displyaMode) return;
	this.obj = document.getElementById("nwAuction");
	if (auction == "open") {
		this.obj.style.display = 'block';
	}
	else {
		this.obj.style.display = 'none';
	}

}

function FLlayerControll(auction) {
	displyaMode = auction == "open" ? true : false;
	thisMovie("nowAuction").Fl_Sstaus(auction);
}
/* //옥션 바로가기 */
// 셀러포인트적용 콤보박스 100309
function init_combobox2(from, layerid, isdesign, selectboxid, inlayer, cutlength) {

	var obj = document.getElementById(layerid);
	var ck = document.getElementById(layerid).style.display;
	var ul = obj.getElementsByTagName('ul')[0];
	var retg = from.getElementsByTagName('span')[0];
	if (!cutlength) cutlength = 12;
	//if(!cutlength) cutlength=6; 0905셀렉트박스갯수수정
	//열려있으면 닫고 끝.
	if (ck == 'block') {
		layer(layerid);
		return;
	}

	//셀렉트박스 기능을 사용할 경우 들어갈 innerHTML 설정.
	if (selectboxid) {
		var opts = '',
			sel = document.getElementById(selectboxid);
		for (var i = 0, max = sel.options.length; i < max; i++) {
			//if(i==0) retg.innerHTML=sel.options[i].text;
			opts += '<li><a href="#" onclick="select_combobox(\'' + selectboxid + '\',' + i + ');return false;">' + sel.options[i].text + '</a></li>';
		}
		ul.innerHTML = opts;
	}

	//안의 컨텐츠 높이가 75이상일경우 스크롤바 생성(display가 none일경우 offsetHeight을 가져오지 못하므로 block설정).
	obj.style.left = '-10000px'; //셀렉트가 생성되는 동안 화면에서 안보이게
	obj.style.display = 'block';
	obj.style.width = from.offsetWidth + 'px';
	ul.style.height = 'auto';
	if ((cutlength * 6) < (ul.offsetHeight - 2)) {
		ul.style.height = (cutlength * 6) + 'px';
		ul.style.overflow = 'auto';
		ul.style.overflowX = 'hidden';
		if (!obj.inserted) {
			if (isie) var paddel = document.createElement('<div class="rpadding">');
			else {
				var paddel = document.createElement('div');
				paddel.setAttribute('class', 'rpadding');
			}
			obj.insertBefore(paddel, ul);
			obj.removeChild(ul);
			paddel.appendChild(ul);
			obj.inserted = true;
		}
		if (sel && sel.options.length > cutlength) {
			obj.style.display = 'block';
			var lih = ul.getElementsByTagName('li')[0].offsetHeight;
			ul.scrollTop = lih * sel.selectedIndex;
		}
	}

	//위아래 구분 080507
	var objheight = obj.offsetHeight;
	obj.style.display = 'none';
	var isupper = ((objheight + from.offsetTop + from.offsetHeight) > getpageysize()) ? true : false;

	//포지션 설정
	var left = 'justify-left';
	var vposition = (isupper) ? 'top+1' : (isie && isdesign) ? 'bottom-1' : 'bottom-1';
	if (layerid == 'hdviewotherp') vposition = 'bottom-1';
	layer(layerid, from, left, vposition, true, false, inlayer);

	//a태그 기능 설정.
	var save, atags = ul.getElementsByTagName('a');
	for (var i = 0, max = atags.length; i < max; i++) {
		if (!atags[i].funcsaved) {
			atags[i].savefunc = atags[i].onclick;
			atags[i].funcsaved = true;
		}
		atags[i].onmouseover = function () {
			layerwaitforclose(layerid);
		}
		atags[i].onclick = function () {
			if (this.savefunc) this.savefunc();
			retg.innerHTML = this.innerHTML;
			document.getElementById(layerid).style.display = 'none';
			if (this.href.substring(this.href.lastIndexOf('#')) == '#') return false;
		}
	}

	// 마우스아웃시 사라짐 설정.
	from.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	obj.onmouseover = function () {
		layerwaitforclose(layerid);
	}
	from.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
	obj.onmouseout = function () {
		if (obj.style.display == 'block') layerclose(layerid);
	}
}
/* 띠배너 */
function Findlayer(isOpen) {
	this.obj = document.getElementById('uxa-linebanner');
	if (isOpen == "open") {
		this.obj.style.height = '306px';
		thisMovie("RealtimeAuction").UvwGuideOpen(true);
	} else if (isOpen == "close") {
		this.obj.style.height = '75px';
		thisMovie("RealtimeAuction").UvwGuideOpen(false);
	}
}
/*해피쪽지슬라이드*/
function happyNote(config, hStatus, noteHeight) {
	var supportsOpacity,
			settings = extend({
				duration: 500,
				begin: 1000,
				pause: 2000
			}, config),
			wrapper = document.getElementById('min_fixed'),
			button = document.getElementById('min_fixed_opener'),
			btn_img = button.getElementsByTagName('img')[0],
			info_txt = document.getElementById('min_fixed_infotxt'),
			no_more = document.getElementById('min_fixed_no_more'),
			opened_class = 'mini_fixed_opened',
			timer = null;

	if (wrapper) {
		supportsOpacity = 'opacity' in wrapper.style;
	}

	function getOpacityString(value) {
		var str;
		if (supportsOpacity) {
			str = 'opacity:' + value;
		} else {
			str = 'filter:alpha(opacity=' + (value * 100) + ')';
		}
		return str;
	}

	function addOpacityRule(rules, value) {
		if (supportsOpacity) {
			rules.opacity = value;
		} else {
			rules.filter = 'alpha(opacity=' + (value * 100) + ')';
		}
		return rules;
	}

	// open
	if (hStatus == 1) {
		timer = window.setTimeout(function() {
			open(true);
		}, settings.begin);
	} else {
		close();
	}

	addEvent(button, 'click', function(e) {

		e = e || window.event;
		if (e.preventDefault) {
			e.preventDefault();
		}

		e.returnValue = false;

		if (hasClass(wrapper, opened_class)) {
			close();
		} else {
			open();
		}

	});

	function open(pause) {
		//emile(wrapper, 'height:258px', {
		emile(wrapper, 'height:' + noteHeight + 'px', {
			duration: settings.duration,
			after: function() {
				addClass(wrapper, opened_class);
				if (pause) {
					if (timer) {
						window.clearTimeout(timer);
						timer = null;
						timer = window.setTimeout(function() {
							close();
						}, settings.pause);
					}
				}
			}
		});

		changeButton('O');
	}
	function close() {

		emile(wrapper, 'height:34px', {
			duration: settings.duration,
			after: function() {
				removeClass(wrapper, opened_class);
			}
		});

		changeButton('C');
	}
	function changeButton(opts) {

		//Clss를변경하게
		var parentDiv = button.parentNode;

		if (opts == 'O') {
			removeClass(parentDiv, 'happy-hidden');
		} else {
			addClass(parentDiv, 'happy-hidden');
		}
	}
	return {
		open: open,
		close: close
	};
}

/* 해피쪽지 위치 조정 IE6에서 expression으로 사용 */
function minFixedWidth(el) {
	/* DEPRECATED */
}

/* more */
function showHideLayer(el, showAlt, hideAlt) {
	var layer_id = el.getAttribute('href').split('#')[1],
		layer = document.getElementById(layer_id);
	var imgs = el.getElementsByTagName('img')[0];
	var imgsC = el.childNodes[0].nodeName.toLowerCase();
	if (layer.style.display != "none") {
		layer.style.display = "none";
		if (imgsC == 'img') {
			imgs.src = imgs.src.replace('on.gif', 'off.gif');
			if (showAlt) {
				imgs.alt = showAlt;
			}
		}
	} else {
		layer.style.display = "";
		if (imgsC == 'img') {
			imgs.src = imgs.src.replace('off.gif', 'on.gif');
			if (hideAlt) {
				imgs.alt = hideAlt;
			}
		}
	}
}
/* //more */

/* lnb */
function lnb() {
	var lnbTab = document.getElementsByTagName('li'),
		lenTab = lnbTab.length;

	if (!lnbTab) {
		return;
	}

	liCont();

	function liCont() {
		var i = lenTab, liOver;
		while (i--) {
			if (i < 0) break;

			if (typeof(lnbTab[i]) != "undefined") liOver = lnbTab[i];
			else continue;

			var divLayer = lnbTab[i].getElementsByTagName('div'),
			divLen = ((typeof(divLayer) != "undefined") ? divLayer.length : 0);
			if (typeof(liOver.className) != "undefined" && liOver.className.toLowerCase() == 'uxaonlayer') {
				addEvent(liOver, 'mouseenter', function () {
					select(this);
					scroll();
				});
				addEvent(liOver, 'mouseleave', function () {
					unselect();
				});
			}
		}
	}

	function select(liOver) {
		unselect();
		if (typeof(liOver) != "undefined" && typeof(liOver.className) != "undefined")
			liOver.className += ' hover';
	}

	function unselect() {
		var i = lenTab, liOver;
		while (i--) {
			if (i < 0) break;

			if (typeof(lnbTab[i]) != "undefined") liOver = lnbTab[i];
			else continue;

			if (typeof(liOver.className) != "undefined" && liOver.className.toLowerCase() == 'uxaonlayer hover') {
				liOver.className = liOver.className.replace(' hover', '');
			}
		}
	}
	var divCont = document.getElementsByTagName('div'),
	divContLen = ((typeof(divCont) != "undefined") ? divCont.length : 0);
	function scroll() {
		var i = divContLen, divScroll;
		while (i--) {
			if (i < 0) break;

			if (typeof(divCont[i]) != "undefined") divScroll = divCont[i];
			else continue;

			if (typeof(divScroll.className) != "undefined" && divScroll.className.toLowerCase() == 'uxa-scroll') {
				if (divScroll.offsetHeight > 270) {
					divScroll.style.height = '270px';
				} else if (divScroll.offsetHeight < 270) {
					divScroll.style.height = 'auto';
				}
			}
		}
	}
}

// DOM이 준비되면 lnb 함수 실행
onDomReady(function () {
	lnb();
});
/*//lnb */

/* 2011-08-12 mod */
/* checkbox */
function uxacheck() {
	var checkboxes = getElementsByClassName(document, 'uxacbox', 'span'),
		len = checkboxes.length,
		i = 0,
		checkbox;

	for (; i < len; i++) {
		checkbox = checkboxes[i];
		addEvent(checkbox, 'click', function () {
			if (hasClass(this, 'uxacbox-checked')) {
				removeClass(this, 'uxacbox-checked');
			} else {
				addClass(this, 'uxacbox-checked');
			}
		});
	}
}

function uxacheck2() {
	var checkboxes = getElementsByClassName(document, 'uxacbox2', 'span'),
		len = checkboxes.length,
		i = 0,
		checkbox;

	for (; i < len; i++) {
		checkbox = checkboxes[i];
		addEvent(checkbox, 'click', function () {
			if (hasClass(this, 'uxacbox-checked2')) {
				removeClass(this, 'uxacbox-checked2');
			} else {
				addClass(this, 'uxacbox-checked2');
			}
		});
	}
}

function uxacheck3() {
	var checkboxes = getElementsByClassName(document, 'uxacbox3', 'span'),
		len = checkboxes.length,
		i = 0,
		checkbox;

	for (; i < len; i++) {
		checkbox = checkboxes[i];
		addEvent(checkbox, 'click', function () {
			if (hasClass(this, 'uxacbox-checked3')) {
				removeClass(this, 'uxacbox-checked3');
			} else {
				addClass(this, 'uxacbox-checked3');
			}
		});
	}
}

function uxacheck4() {
	var checkboxes = getElementsByClassName(document, 'uxacbox4', 'span'),
		len = checkboxes.length,
		i = 0,
		checkbox;

	for (; i < len; i++) {
		checkbox = checkboxes[i];
		addEvent(checkbox, 'click', function () {
			if (hasClass(this, 'uxacbox-checked4')) {
				removeClass(this, 'uxacbox-checked4');
			} else {
				addClass(this, 'uxacbox-checked4');
			}
		});
	}
}
/* //checkbox */
/* //2011-08-12 mod */

/* 마우스오버 레이어 등록 단축 */
function anView(obj) {
	var target = document.getElementById(obj);
	target.style.display = (target.style.display = 'block');
}

function anNone(obj) {
	var target = document.getElementById(obj);
	target.style.display = (target.style.display = 'None');
}

/* tablebg */
function tblPlist() {
	var div = document.getElementsByTagName('div'),
		divLen = div.length;
	for (var i = 0; i < divLen; i++) {
		if (div[i].className.toLowerCase() == 'uxb-prodlist') {
			var tr = div[i].getElementsByTagName('tr')[1],
				divC = div[i].getElementsByTagName('div'),
				divCLen = divC.length;
			for (var t = 0; t < divCLen; t++) {
				if (divC[t].className.toLowerCase() == 'selectimgbox') {
					divC[t].style.marginTop = tr.clientHeight - 3 + 'px';
				}
			}
		}
	}
}
/* //tablebg */

/* labelfor */
function click(el) {
	var layer_id = el.getAttribute('for')[1],
		layer = document.getElementById(layer_id);
	if (navigator.appVersion.indexOf('MSIE') != -1) {
		layer.click()
	}
}
/* //labelfor */

/* 다른상품보기 */
function otherGoods() {
	var div = document.getElementsByTagName('div'),
		divLen = div.length;
	for (var i = 0; i < divLen; i++) {
		if (div[i].className.toLowerCase() == 'uxb-prodlist') {
			var tr = div[i].getElementsByTagName('tr'),
				trLen = tr.length;
			for (var t = 0; t < trLen; t++) {
				var divC = tr[t].getElementsByTagName('div'),
					divCLen = divC.length;
				for (var h = 0; h < divCLen; h++) {
					if (divC[h].className.toLowerCase() == 'usellerbox') {
						divC[h].style.height = tr[t].clientHeight + 'px';
						var divL = divC[h].getElementsByTagName('div'),
							divLLen = divL.length;
						for (var j = 0; j < divLLen; j++) {
							if (divL[j].className.toLowerCase() == 'usellerboxin') {
								divL[j].style.marginTop = -(divL[j].clientHeight / 2) + 'px';
							}
						}
					}
				}
			}
		}
	}
}
/* //다른상품보기 */

/*
 * Simple JavaScript Inheritance by John Resig
 * http://ejohn.org/blog/simple-javascript-inheritance/
 */
(function(){
	var initializing = false, fnTest = /xyz/.test(function(){xyz;}) ? /\b_super\b/ : /.*/;
	this.Class = function(){};

	Class.extend = function(prop) {
		var _super = this.prototype;

		initializing = true;
		var prototype = new this();
		initializing = false;

		for (var name in prop) {
			prototype[name] = typeof prop[name] == "function" &&
				typeof _super[name] == "function" && fnTest.test(prop[name]) ?
				(function(name, fn){
					return function() {
						var tmp = this._super;

						this._super = _super[name];

						var ret = fn.apply(this, arguments);
						this._super = tmp;

						return ret;
					};
				})(name, prop[name]) :
				prop[name];
		}

		function Class() {
			if ( !initializing && this.init )
				this.init.apply(this, arguments);
		}

		Class.prototype = prototype;

		Class.constructor = Class;

		Class.extend = arguments.callee;

		return Class;
	};
})();

// 레이어 객체 클래스
var Layer = function (element, config) {
	if (!element) {
		return null;
	}

	var self = this;

	self.element = typeof element === 'string' ? document.getElementById(element) : element;
	self.config = extend({
		openClass: 'layer-open',
		isOpen: false,
		onOpen: null,
		onClose: null,
		onDestroy: null
	}, config);

	if (self.config.isOpen) {
		self.open();
	}
};
Layer.prototype = {
	open: function () {
		if (this.isOpen) {
			return null;
		}

		var self = this,
			element = self.element,
			config = self.config;

		if (config.openClass) {
			addClass(element, config.openClass);
		} else {
			element.style.display = 'block';
		}

		self.isOpen = true;

		if (typeof config.onOpen === 'function') {
			config.onOpen.call(self);
		}
	},
	close: function () {
		if (!this.isOpen) {
			return null;
		}

		var self = this,
			element = self.element,
			config = self.config;

		if (config.openClass) {
			removeClass(element, config.openClass);
		} else {
			element.style.display = 'none';
		}

		self.isOpen = false;

		if (typeof config.onClose === 'function') {
			config.onClose.call(self);
		}
	},
	toggle: function () {
		if (this.isOpen) {
			this.close();
		} else {
			this.open();
		}
	},
	destroy: function () {
		var self = this,
			element = self.element,
			config = self.config;

		if (typeof config.onDestroy === 'function') {
			config.onDestroy.call(self);
		}

		if (element && element.events) {
			var type = null;
			for (type in element.events) {
				removeEvent(element, type);
			}
		}

		delete self.open;
		delete self.close;
		delete self.toggle;
		delete self.element;
	}
};

/*이미지형 상품 리스트*/
function imgResize() {
	var ul = document.getElementsByTagName('ul'),
		len = ul.length,
		i = 0,
		t = 0,
		list,
		listClass;

	i = len;
	while (i--) {
		list = ul[i];
		listClass = list.className.toLowerCase();

		if (listClass == 'uxa-ims') {
			var li = list.children,
				liLen = li.length;
			if (list.clientWidth < 930) {
				t = liLen;
				while (t--) {
					li[t].style.width = '24.9%';
				}
			} else if (list.clientWidth >= 930) {
				t = liLen;
				while (t--) {
					li[t].style.width = '19.8%';
				}
			}
		/* BC_2028 */
		} else if (listClass == 'uxc-ims' || listClass == 'uxc-shimgsb') {	/* 2011-04-19 수정 - 브랜드+ 슬롯 */
			var li = list.children,
				liLen = li.length;
			if (list.offsetWidth < 620) {
				t = liLen;
				while (t--) {
					li[t].style.width = '33.3%';
				}
			} else if (list.offsetWidth >= 620) {
				t = liLen;
				while (t--) {
					li[t].style.width = '24.9%';
				}
			}
		} else if (listClass == 'uxc-sohoimst') {
			var li = list.children,
				liLen = li.length;
			if (list.clientWidth < 900) {
				t = liLen;
				while (t--) {
					li[t].style.width = '24.9%';	// 2011-04-28 mod
				}
			} else if (list.clientWidth >= 900) {
				t = liLen;
				while (t--) {
					li[t].style.width = '19.8%';
				}
			}
		} else if (listClass == 'uxc-sohoimsb') {
			var li = list.children,
				liLen = li.length;
			if (list.clientWidth < 430) {
				t = liLen;
				while (t--) {
					li[t].style.width = '33%';
				}
			} else if (list.clientWidth >= 430) {
				t = liLen;
				while (t--) {
					li[t].style.width = '24.9%';
				}
			}
		}
		/* //BC_2028 */
	}
}
// 이미지옆 간단메뉴 list
function show_product03_menu(imgobj, productcode, pos) {
	var obj = document.getElementById('productovermenu03');
	if (obj.mycode && obj.mycode != productcode) obj.style.display = 'none';
	obj.mycode = productcode;
	var lis = obj.getElementsByTagName('li');
	if (window.ProductOverMenu03) {
		lis[0].innerHTML = "<a href='javascript:ProductOverMenu03.clickMenu(0, \"" + productcode + "\");'>" + protocol + "//pics.auction.co.kr/listing/2010/txt_layer01.gif</a>";
		lis[1].innerHTML = "<a href='javascript:ProductOverMenu03.clickMenu(1, \"" + productcode + "\");'>" + protocol + "//pics.auction.co.kr/listing/2010/txt_layer02.gif</a>";
	} else {
		lis[0].innerHTML = '<a href="#쇼핑백담기?물품코드=' + productcode + '">쇼핑백담기</a>';
		lis[1].innerHTML = '<a href="#관심상품담기?물품코드=' + productcode + '">관심상품담기</a>';
	}
	if (pos == 'rightntop+1') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+1', true, true);
	else if (pos == 'rightntop+2') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+2', true, true);
	else if (pos == 'best100border') layer(obj.id, imgobj, 'justify-left-2', 'justify-bottom+2', true, true);
	else if (pos == 'best100normal') layer(obj.id, imgobj, 'justify-left-3', 'justify-bottom+1', true, true);
	else if (pos == 'specialprice') layer(obj.id, imgobj, 'justify-left', 'justify-bottom+2', true, true);
	else if (imgobj.offsetWidth < 100 || pos == 'right') layer(obj.id, imgobj, 'right-1', 'justify-top', true, true);
	else if (pos == 'thick' && !isfirefox) layer(obj.id, imgobj, 'justify-left', 'justify-bottom', true, true);
	else layer(obj.id, imgobj, 'justify-left', 'justify-bottom+1', true, true);
	imgobj.style.borderColor = '#F00F00';
	imgobj.onmouseout = function () {
		layerclose(obj.id);
		this.style.borderColor = '#E5E5E5';
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
		imgobj.style.borderColor = '#F00F00';
	}
	obj.onmouseout = function () {
		layerclose(this.id);
		imgobj.style.borderColor = '#E5E5E5';
	}
}
/*이미지옆 간단메뉴 image*/
function show_product04_menu(imgobj, productcode, pos) {
	var obj = document.getElementById('productovermenu04');
	if (obj.mycode && obj.mycode != productcode) obj.style.display = 'none';
	obj.mycode = productcode;
	var lis = obj.getElementsByTagName('li');
	if (window.ProductOverMenu04) {
		lis[0].innerHTML = "<a href='javascript:ProductOverMenu04.clickMenu(0, \"" + productcode + "\");'>" + protocol + "//pics.auction.co.kr/listing/2010/txt_layer01.gif</a>";
		lis[1].innerHTML = "<a href='javascript:ProductOverMenu04.clickMenu(1, \"" + productcode + "\");'>" + protocol + "//pics.auction.co.kr/listing/2010/txt_layer02.gif</a>";
	} else {
		lis[0].innerHTML = '<a href="#쇼핑백담기?물품코드=' + productcode + '">쇼핑백담기</a>';
		lis[1].innerHTML = '<a href="#관심상품담기?물품코드=' + productcode + '">관심상품담기</a>';
	}
	if (pos == 'rightntop+1') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+1', true, true);
	else if (pos == 'rightntop+2') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+2', true, true);
	else if (pos == 'best100border') layer(obj.id, imgobj, 'justify-left-2', 'justify-top+2', true, true);
	else if (pos == 'best100normal') layer(obj.id, imgobj, 'justify-left-3', 'justify-top+1', true, true);
	else if (pos == 'specialprice') layer(obj.id, imgobj, 'justify-left', 'justify-top+2', true, true);
	else if (imgobj.offsetWidth < 100 || pos == 'right') layer(obj.id, imgobj, 'right-1', 'justify-top', true, true);
	else if (pos == 'thick' && !isfirefox) layer(obj.id, imgobj, 'justify-left', 'justify-bottom', true, true);
	else layer(obj.id, imgobj, 'justify-right-1', 'justify-bottom', true, true);
	imgobj.style.borderColor = '#F00F00';
	imgobj.onmouseout = function () {
		layerclose(obj.id);
		this.style.borderColor = '#E5E5E5';
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
		imgobj.style.borderColor = '#F00F00';
	}
	obj.onmouseout = function () {
		layerclose(this.id);
		imgobj.style.borderColor = '#E5E5E5';
	}
}
/*//이미지옆 간단메뉴 image*/
/*이미지옆 간단메뉴 image2*/
function show_product05_menu(imgobj, productcode, pos) {
	var obj = document.getElementById('productovermenu05');
	if (obj.mycode && obj.mycode != productcode) obj.style.display = 'none';
	obj.mycode = productcode;
	var lis = obj.getElementsByTagName('li');
	if (window.ProductOverMenu05) {
		lis[0].innerHTML = "<a href='javascript:ProductOverMenu05.clickMenu(0, \"" + productcode + "\");'>" + protocol + "//pics.auction.co.kr/listing/2010/txt_layer01.gif</a>";
		lis[1].innerHTML = "<a href='javascript:ProductOverMenu05.clickMenu(1, \"" + productcode + "\");'>" + protocol + "//pics.auction.co.kr/listing/2010/txt_layer02.gif</a>";
	} else {
		lis[0].innerHTML = '<a href="#쇼핑백담기?물품코드=' + productcode + '">쇼핑백담기</a>';
		lis[1].innerHTML = '<a href="#관심상품담기?물품코드=' + productcode + '">관심상품담기</a>';
	}
	if (pos == 'rightntop+1') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+1', true, true);
	else if (pos == 'rightntop+2') layer(obj.id, imgobj, 'right-1', (isopera) ? 'justify-top' : 'justify-top+2', true, true);
	else if (pos == 'best100border') layer(obj.id, imgobj, 'justify-left-2', 'justify-bottom+2', true, true);
	else if (pos == 'best100normal') layer(obj.id, imgobj, 'justify-left-3', 'justify-bottom+1', true, true);
	else if (pos == 'specialprice') layer(obj.id, imgobj, 'justify-left', 'justify-bottom+2', true, true);
	else if (imgobj.offsetWidth < 100 || pos == 'right') layer(obj.id, imgobj, 'right-1', 'justify-top', true, true);
	else if (pos == 'thick' && !isfirefox) layer(obj.id, imgobj, 'justify-left', 'justify-bottom', true, true);
	else layer(obj.id, imgobj, 'justify-left', 'justify-bottom+42', true, true);
	imgobj.style.borderColor = '#F00F00';
	imgobj.onmouseout = function () {
		layerclose(obj.id);
		this.style.borderColor = '#666';
	}
	obj.onmouseover = function () {
		layerwaitforclose(this.id);
		imgobj.style.borderColor = '#F00F00';
	}
	obj.onmouseout = function () {
		layerclose(this.id);
		imgobj.style.borderColor = '#666';
	}
}
/*//이미지옆 간단메뉴 image2*/
/*loadingbar*/
function pre_check(){
	var loading = document.getElementById("loading");
	document.getElementById("loading").style.position = "absolute";
	document.getElementById("loading").style.display = "block";
	document.getElementById("loading").style.left = document.body.clientWidth / 2 - loading.offsetWidth / 2 + 'px';
	document.getElementById("loading").style.top = document.documentElement.clientHeight / 2 - loading.offsetHeight / 2 + 'px';
}
/*//loadingbar*/
/*clpbanner*/
function printAdImageSet(hrefURL, onClickURL, srcURL, vWidth, vHeight, onImpressionURL, oid) {
	var _obj_ = '';
	_obj_ += '<img src="' + srcURL + '" alt="광고배너" onclick="adLog(\'' + onClickURL + '\'); window.open(\'' + hrefURL + '\');" style="width:' + vWidth + 'px; height:' + vHeight + 'px; cursor:pointer;">';
	if (onImpressionURL != '') {
		_obj_ += '<img src="' + onImpressionURL + '" alt="" style="display:none;">';
	}
	document.getElementById(oid).innerHTML = _obj_;
}
function printVarAdImage(hrefURL, onClickURL, srcURL, vWidth, vHeight, onImpressionURL) {
	var _obj_ = '';
	_obj_ += '<div style="background:url(' + srcURL + ') no-repeat center 0; height:' + vHeight + 'px; margin-bottom:15px;">';
	_obj_ += '<a href="' + hrefURL + '" onclick="adLog(\'' + onClickURL + '\');" target="_blank">';
	_obj_ += '</a>';
	if (onImpressionURL != '') {
		_obj_ += '<img src="' + onImpressionURL + '" alt="" style="display:none;">';
	}
	_obj_ += '</div>';
	document.write(_obj_);
}
/*//clpbanner*/

/* 2010-09-14 lp_left 레이어 온(다른 레이어 오프)-클릭시 */
function uxcQuicLayerclick(id,idnum) {
	var obj = document.getElementById(id + idnum),
		objpid = document.getElementById('uxa-left'),
		objclass = getElementsByClassName(objpid,'uxc-layer790'),
		num = 0;
	for (var i = 0 ;i < objclass.length ; i++ ) {
		num++;
		var objelse = document.getElementById(id + num);
		if (num != idnum){
			objelse.style.display = 'none';
		}
	}
	obj.style.display = (obj.style.display == 'block') ? 'none' : 'block';
}
/* //2010-09-14 lp_left 레이어 온(다른 레이어 오프)-클릭시 */

function uxcBenefitOpen() {
	var content = document.getElementById("uxcBenefitOpen"),
		toggleButton = document.getElementById("uxcBenefitOpenToggle");

	addEvent(toggleButton, "click", function (e) {
		e.preventDefault();

		if (content.style.display === "none") {
			content.style.display = "block";
			changeImage(toggleButton, "btn_top_more.gif", "btn_top_moreoff.gif", "혜택 정보 닫기");
		} else {
			content.style.display = "none";
			changeImage(toggleButton, "btn_top_moreoff.gif", "btn_top_more.gif", "혜택 정보 열기");
		}
	});
}

/* 마이 옥션 상단 */
function initMyAuctionTop() {
	var benefitInfo = document.getElementById("uxcBenefitInfo"),
		benefitToggle = document.getElementById("uxcBenefitInfoToggle");

	addEvent(benefitToggle, "click", function (e) {
		e.preventDefault();

		if (benefitInfo.style.display === "none") {
			benefitInfo.style.display = "block";
			changeImage(benefitToggle, "btn_top_more.gif", "btn_top_moreoff.gif", "혜택 정보 닫기");
		} else {
			benefitInfo.style.display = "none";
			changeImage(benefitToggle, "btn_top_moreoff.gif", "btn_top_more.gif", "혜택 정보 열기");
		}
	});
}

/* 2011-08-02 mod */
function textTabs(id, options) {
	options = options || {};

	var config = extend({
			eventType: "click"
		}, options),
		tabList = document.getElementById(id),
		tabs = tabList.getElementsByTagName("a"),
		tab,
		contents = [],
		len = tabs && tabs.length,
		i = 0,
		index = 0;

	if (!tabs) {
		return false;
	}

	function getContent(href) {
		var idRegExp = /#(.+)/,
			contentId = idRegExp.exec(href),
			content = null;

		if (contentId) {
			content = document.getElementById(contentId[1]);
		}

		return content;
	}

	for (; i < len; i++) {
		tab = tabs[i];
		tab.index = i;
		if (tab && tab.getAttribute) {
			contents.push(getContent(tab.getAttribute("href", 2)));

			addEvent(tab, "click", function (e) {
				e.preventDefault();

				unselectAll();
				addClass(this, "on");
				contents[this.index].style.display = "block";
			});

			if (config.eventType && config.eventType !== "click") {
				addEvent(tab, config.eventType, function (e) {
					e.preventDefault();

					unselectAll();
					addClass(this, "on");
					contents[this.index].style.display = "block";
				});
			}
		}
	}

	function unselectAll() {
		var i = len;

		while (i--) {
			removeClass(tabs[i], "on");
			contents[i].style.display = "none";
		}
	}
}
/* //2011-08-02 mod */

function initTabs(id) {
	var tabList = document.getElementById(id),
		tabs = tabList.getElementsByTagName("li"),
		tab,
		tabAnchor,
		contents = [],
		len = tabs && tabs.length,
		i = 0,
		index = 0;

	if (!tabs) {
		return false;
	}

	function getContent(href) {
		var idRegExp = /#(.+)/,
			contentId = idRegExp.exec(href),
			content = null;

		if (contentId) {
			content = document.getElementById(contentId[1]);
		}

		return content;
	}

	for (; i < len; i++) {
		tab = tabs[i];
		tabAnchor = tab.getElementsByTagName("a")[0];
		tabs[i].index = i;
		content = getContent(tabAnchor.getAttribute("href", 2));
		contents.push(content);

		addEvent(tab, "click", function (e) {
			e.preventDefault();

			unselectAll();
			addClass(this, "selected");
			addClass(contents[this.index], "uxa-tab-content-selected");
		});
	}

	function unselectAll() {
		var i = len;

		while (i--) {
			removeClass(tabs[i], "selected");
			removeClass(contents[i], "uxa-tab-content-selected");
		}
	}
}

/* BC_2137: 소호관 패션탭 */
function getOffset(element, relativeTo) {
	if (typeof element === "string") {
		element = document.getElementById(element);
	}

	if (!element) {
		return null;
	}

	if (!relativeTo) {
		relativeTo = document.body;
	} else {
		if (typeof relativeTo === "string") {
			relativeTo = document.getElementById(relativeTo);
		}

		var position = getStyle(relativeTo, "position");

		if (position !== "relative" && position !== "absolute" && position !== "fixed") {
			relativeTo = relativeTo.offsetParent;
		}
	}

	var width = element.offsetWidth,
		height = element.offsetHeight,
		top = element.offsetTop,
		left = element.offsetLeft;

	element = element.offsetParent;

	while (element && (element !== relativeTo)) {
		top += element.offsetTop;
		left += element.offsetLeft;
		element = element.offsetParent;
	}

	return {
		"width": width,
		"height": height,
		"top": top,
		"left": left
	};
}

function fashionTabHeight() {
	var leftbox = document.getElementById("leftbox"),
		wrapper = document.getElementById("uxaFashionTab"),
		offsetTop = getOffset(wrapper).top,
		viewportHeight,
		height;

	if (leftbox) {
		leftbox.style.marginRight = 0;
	}

	if (!wrapper) {
		return null;
	}

	wrapper.style.height = (document.documentElement.offsetHeight - offsetTop - 20) + "px";

	document.getElementById("body").style.minWidth = "986px";

	/* ie6 min/max width fix */
	if (isie6) {
		onDomReady(function () {
			var documentElement = document.documentElement,
				body = document.getElementById("body");

			if (!body) {
				return null;
			}

			function fix() {
				var documentWidth = documentElement.clientWidth,
					width = "auto";

				if (documentWidth < 986) {
					width = "986px";
				} else if (documentWidth > 1140) {
					width = "1140px";
				}

				body.style.width = width;
			}

			fix();

			window.attachEvent("onresize", fix);
		});
	}
}
/* //BC_2137: 소호관 패션탭 */

/* Ticker */
var Ticker = function (list, options) {
	if (!list) {
		return null;
	} else if (typeof list === "string") {
		list = document.getElementById(list);
	}

	var config = extend({
			"speed": 300,
			"interval": 3000
		}, options);

	this.list = list;
	this.listItems = this.list.getElementsByTagName("li");
	this.config = config;
};
Ticker.prototype = {
	init: function () {
		var self = this,
			list = self.list;

		self.roll();

		addEvent(list, "mouseenter", function () {
			self.stop();
		});
		addEvent(list, "mouseleave", function () {
			self.roll();
		});
	},
	roll: function () {
		var config = this.config,
			list = this.list,
			listItems = this.listItems;

		this.interval = setInterval(function () {
			var firstItem = listItems[0];

			emile(firstItem, "margin-top:" + (-firstItem.offsetHeight) + "px", {
				"duration": config.speed,
				"after": function () {
					list.appendChild(firstItem);
					firstItem.style.marginTop = 0;
					firstItem = null;
				}
			});
		}, config.interval);
	},
	stop: function () {
		var interval = this.interval;

		if (interval) {
			clearInterval(interval);
		}

		this.interval = null;
	}
};
Ticker.create = function (list, options) {
	var ticker = new Ticker(list, options);

	ticker.init();

	return ticker;
};
/* //Ticker */

/* Ink/Toner Printer Details */
function initInkTonerPrinterDetails() {
	if (!window.jQuery) {
		return null;
	}

	var $container = $("#inktContainer"),
		$tabs = $container.find("div.inktv > ul a"),
		$allContents = $container.find("div.inkt-provly");

	$tabs.each(function () {
		var $this = $(this),
			$content = $(this.getAttribute("href", 2));

		$this
			.data("content.inktvTab", $content)
			.data("isSelected.inktvTab", false);
	});
$tabs.bind({
		"mouseenter": function () {
			var $this = $(this),
				isSelected = $this.data("isSelected.inktvTab"),
				$content;

			if (isSelected) {
				return null;
			}

			$content = $this.data("content.inktvTab");

			$tabs.removeClass("selected");
			$this.addClass("selected");
			$allContents.css("display", "none");
			$content.css("display", "block");
		}
	});

	$container.bind("mouseleave", function () {
		$tabs.removeClass("selected");
		$allContents.css("display", "none");
	});
}
/* //Ink/Toner Printer Details */

/* Toggle Table Row */
function toggleRow(row) {
	row = typeof row === "string" ? document.getElementById(row) : row;

	if (row.style.display === "none") {
		row.style.display = "";
	} else {
		row.style.display = "none";
	}
}
/* //Toggle Table Row */

/* Q&A List */
function qnaList() {
	var $qst = $("li.qst");

	$qst.unbind(".qnaList");
	$qst.find("a").unbind(".qnaList");

	$qst.each(function () {
		var $this = $(this),
			$ans = $this.next("li.ans"),
			$btnImg = $this.find("a.btn img");

		$this.data("ans", $ans);
		$this.data("btnImg", $btnImg);
	});

	$qst.bind({
		"open.qnaList": function () {
			var $this = $(this),
				$ans = $this.data("ans"),
				$btnImg = $this.data("btnImg");

			$ans.css("display", "");
			$btnImg.attr({
				"src": function () {
					return this.src.replace("btn_plus.gif", "btn_minus.gif");
				},
				"alt": "펼쳐보기"
			});
		},
		"close.qnaList": function () {
			var $this = $(this),
				$ans = $this.data("ans"),
				$btnImg = $this.data("btnImg");

			$ans.css("display", "none");
			$btnImg.attr({
				"src": function () {
					return this.src.replace("btn_minus.gif", "btn_plus.gif");
				},
				"alt": "접기"
			});
		},
		"toggle.qnaList": function () {
			var $this = $(this),
				$ans = $this.data("ans");

			if ($ans.is(":visible")) {
				$this.trigger("close");
			} else {
				$this.trigger("open");
			}
		}
	});

	$qst.find("a").bind("click.qnaList", function (e) {
		e.preventDefault();

		$(this).parents("li.qst").trigger("toggle.qnaList");
	});

	$qst.trigger("close.qnaList");
}
/* //Q&A List */

//리스트 이미지 오버시 버튼
function overpbtn(self) {
	var $self = $(self),
		$shopDiv = $self.parent().next();

	if($shopDiv.attr('class') == 'pbtn') {
		$shopDiv.css('display','block');
		$self.bind('mouseout', function () {
			$shopDiv.hide();
		});
		$shopDiv
			.bind('mouseover', function () {
				$shopDiv.css('display','block');
			})
			.bind('mouseout', function () {
				$shopDiv.hide();
			});
	}
}

// 롤링배너
function bannerRoll(selector, options) {
	if (!window.jQuery) {
		return null;
	}

	var defaults = {
			banners: ".banner",
			controllers: ".controllers a",
			selectedIndex: 0,
			selectedBanner: "banner-on",
			selectedControl: "on",
			interval: 3000
		},
		config = $.extend({}, defaults, options),
		container = $(selector),
		banners = container.find(config.banners),
		controllers = container.find(config.controllers),
		len = controllers.length,
		selectedIndex = config.selectedIndex,
		timer;

	function select(index) {
		var selectedBanner = config.selectedBanner,
			selectedControl = config.selectedControl;

		banners.removeClass(selectedBanner);
		banners.eq(index).addClass(selectedBanner);
		controllers.removeClass(selectedControl);
		controllers.eq(index).addClass(selectedControl);

		selectedIndex = index;
	}

	function roll() {
		if (timer) {
			timer = clearInterval(timer);
		}

		timer = setInterval(function () {
			var next = selectedIndex + 1;

			if (next >= len) {
				next = 0;
			}

			select(next);
		}, config.interval);
	}

	controllers.bind("mouseenter click", function () {
		select(controllers.index(this));
	});

	container.bind({
		"mouseenter": function () {
			if (timer) {
				timer = clearInterval(timer);
			}
		},
		"mouseleave": function () {
			roll();
		}
	});

	roll();
}

// Table Row Show/Hide
function hideRow(row) {
	row = typeof row === "string" ? document.getElementById(row) : row;
	if (row && row.style) {
		var children = row.getElementsByTagName("*"),
			i = children.length,
			child;
		while (i--) {
			child = children[i];
			if (child.style) {
				child.style.display = "none";
			}
		}
		row.style.display = "none";
	}
}

function showRow(row) {
	row = typeof row === "string" ? document.getElementById(row) : row;
	if (row && row.style) {
		var children = row.getElementsByTagName("*"),
			i = children.length,
			child;
		while (i--) {
			child = children[i];
			if (child.style) {
				child.style.display = "";
			}
		}
		row.style.display = "";
	}
}
 
/* fixedBanner 10-13 */
function fixedBanner(element, offset) {
	ui.load(['jquery', 'pin'], function () {
		var $element = $(element);
		if (!$element.length) {
			$element = $('#' + element);
		}
		if ($(window).width() > 981) {
			if ($element.length) {
				if (jQuery.fn.pin) {
					$element.pin({
						top: offset,
						bottom: 5,
						limit: '#footer, #footer1'
					});
				}
			}
		}
	});
}

/* Supported Features */
removeClass(document.documentElement, 'no-js');
addClass(document.documentElement, "js");

if (!window.support) {
	var support = {};
}

// for IE6. Deprecated.
function checkPositionFixed() {}

/* SRP 인기모델 최저가 테이블 */
function tblBestView(wrapper) {
	if (typeof wrapper === 'string') {
		wrapper = document.getElementById(wrapper);
	}
	var table = wrapper.getElementsByTagName('table')[0],
		rows = table.getElementsByTagName('tr'),
		len = rows.length,
		i = 3,
		row;
	while (i < len) {
		row = rows[i++];
		if (row.style.display === 'none') {
			showRow(row);
		} else {
			hideRow(row);
		}
	}
	if (hasClass(wrapper, 'tbl-best-extpanded')) {
		removeClass(wrapper, 'tbl-best-extpanded');
	} else {
		addClass(wrapper, 'tbl-best-extpanded');
	}
}
/* IE6 hover fix */
function hoverFix(selector, options) {
	ui.load('jquery', function () {
		var config = jQuery.extend({
				context: document.documentElement,
				hoverClass: 'hover'
			}, options);

		jQuery(function () {
			$(config.context)
				.delegate(selector, 'mouseenter', function () {
					$(this).addClass(config.hoverClass);
				})
				.delegate(selector, 'mouseleave', function () {
					$(this).removeClass(config.hoverClass);
				});
		});
	});
}

// 내가 클릭한 모델
function initClickedBox(selector, options) {
	var config = $.extend({
			clicked: 'tr.clicked',
			clickedBox: 'div.clicked-box',
			clickedBoxTop: 'div.clicked-box-t',
			clickedBoxSide: 'div.clicked-box-l, div.clicked-box-r',
			clickedBoxBottom: 'div.clicked-box-b',
			clickedBoxTemplate: '<div class="clicked-box"><div class="clicked-box-t">내가 클릭한 모델</div><div class="clicked-box-r"></div><div class="clicked-box-l"></div><div class="clicked-box-b"></div></div>'
		}, options);

	$(selector).each(function () {
		var clickedBox, topBorder, sideBorders, bottomBorder, rowOffset, boxOffset, boxPos, diff,
			listing = $(this),
			clicked = listing.length && listing.find(config.clicked);

		if (!listing || !listing.length || !clicked || !clicked.length) {
			return;
		}

		clickedBox = $(config.clickedBoxTemplate).appendTo(document.body);
		clickedBox.width(clicked.outerWidth());
		topBorder = clickedBox.find(config.clickedBoxTop);
		sideBorders = clickedBox.find(config.clickedBoxSide);
		bottomBorder = clickedBox.find(config.clickedBoxBottom);

		rowOffset = clicked.offset();
		boxOffset = clickedBox.css('display', 'block').offset();
		boxPos = clickedBox.position();
		diff = {
			top: boxOffset.top - boxPos.top,
			left: boxOffset.left - boxPos.left
		};

		clickedBox.css({
			top: rowOffset.top - diff.top,
			left: rowOffset.left - diff.left
		});
		sideBorders.css({
			height: clicked.outerHeight() - topBorder.outerHeight() - bottomBorder.outerHeight()
		});
		bottomBorder.css({
			top: clicked.outerHeight() - bottomBorder.outerHeight()
		});
	});
}

// 기기 체크
// isTablet()과 isMobile()은 HP와 SRP에서 사용 중
function isMobileDevice() {
	var phoneArray = new Array('samsung-', 'sch-', 'shw-', 'sph-', 'sgh-', 'lg-', 'canu', 'im-', 'ev-', 'iphone', 'nokia', 'blackberry', 'lgtelecom', 'natebrowser', 'sonyericsson', 'mobile', 'android', 'ipad');
	for (i = 0; i < phoneArray.length; i++) {
		if (navigator.userAgent.toLowerCase().indexOf(phoneArray[i]) > -1) {
			return true;
		}
	}
	return false;
}
function isTabletDevice() {
	if (!isMobileDevice()) {
		return false;
	}
	// 태블릿검사
	if (navigator.userAgent.toLowerCase().indexOf('ipad') > -1 ||
		(navigator.userAgent.toLowerCase().indexOf('android') > -1 && navigator.userAgent.toLowerCase().indexOf('mobile') == -1)) {
		return true;
	}
	// 갤럭시 탭만을 위한 리다이렉트. Mobile 이라는 단어가 안들어오게 되면 지우셔도 됨
	var galaxyTabModel = new Array('shw-');
	for (i = 0; i < galaxyTabModel.length; i++) {
		if (navigator.userAgent.toLowerCase().indexOf(galaxyTabModel[i]) > -1) {
			return true;
		}
	}
	return false;
}

// 2014-04-18 베이비 플러스, SDP_LP/SRP 내노출 시작
function init_rotator(){
	if (!$('.item-list-img').length){
		return;
	}
	$('.item-list-img').each(function() {
		var wrap = $(this).parent();
		var $mom = $(wrap).attr('id');
		var num = $(this).parent().find('li').length;
		$(this).find('li').each(function(i){
			var num = $(this).parent().find('li').length;
			var number = i + 1;
			for(var i = 1; i < num; i++){
				$(this).attr('class',$mom + '_' + number);
			}
		});
		if(num < 1){
			$(this).next('.ban-control').hide();
		}
		$('#'+ $mom).find('.ban-btn-next').click(function() {
			var first = $('#'+ $mom).find('li:first-child');
			var last = $('#'+ $mom).find('li:last-child');			
			first.appendTo('#'+ $mom+' .item-list-img');
		});
		$('#'+ $mom).find('.ban-btn-prev').click(function() {
			var first = $('#'+ $mom).find('li:first-child');
			var last = $('#'+ $mom).find('li:last-child');
			last.prependTo('#'+ $mom+' .item-list-img');
		});
	});
}
// 2014-04-18 베이비 플러스, SDP_LP/SRP 내노출 끝



/////////////////////////////////////////////////////////////////////////////////// VIP 통합 작업 시작
//check device
var isapple=(/applewebkit/i).test(navigator.userAgent); //safari,chrome
var isios=(/(ipod|iphone|ipad)/i).test(navigator.userAgent);//ios
var isipad=(/(ipad)/i).test(navigator.userAgent);//ipad
var isandroid=(/android/i).test(navigator.userAgent);//android
var device;

////////// 물음표 마우스 오버
function openHelpLayer() {
	function int_ddDDdd(el){	
		$(el).removeClass('open');
		$(this).next('.layer_box').show();
		$(this).next('.layer_box').each(function(){
			var layerWidth = $(this).outerWidth();
			var btnLeft = $(this).prev('a').offset().left;

			if(btnLeft < layerWidth*2){
				$(this).css({'left':'0px'});
			} else{
				$(this).css({'right':'0px'});
			}
		});
	}
	$('.help_box_type1 .btn1').bind('click', function(){	
		if($(this).attr('class')=="btn1 open"){
			$(this).removeClass('open');
			$(this).next('.layer_box').show();
			$(this).next('.layer_box').each(function(){
				var layerWidth = $(this).outerWidth();
				var btnLeft = $(this).prev('a').offset().left;

				if(btnLeft < layerWidth*2){
					$(this).css({'left':'0px'});
				} else{
					$(this).css({'right':'0px'});
				}
			});			
		} else {	
			$(this).addClass('open');
			$(this).next('.layer_box').hide();
		}
	});
	
	$('.help_box_type1 .btn1').bind('mouseleave focusout', function(){	
		if($(this).parent().hasClass('mouseover') ){					
			$(this).next('.layer_box').hide();
		}			
	});	
}

////////// 슬리이드 배너 이미지 좌우 버튼
function mobile_slidebtn(){
	$(".mod-control .prev , .mod-control .next , .today_list .control .prev , .today_list .control .next , .rolling_banner_type1 .ban-btn-prev , .rolling_banner_type1 .ban-btn-next").css("opacity","1").css("background-position","0 0");
	$(".mod-control .next , .today_list .control .next").css("background-position","-35px 0");
	$(".rolling_banner_type1 .ban-btn-next").css("background-position","-60px -120px");
	$(".rolling_banner_type1 .ban-btn-prev").css("background-position","0 -120px");
}

////////// 헤더 카테고리 네비게이션 중분류 클릭 미완
function mobile_allmenudepth2(){
	$(".allmenu_depth2_li a.allmenu_depth2").click(function(){
		if($(this).attr("href") == "javascript:;"){
			$(this).attr("href",this.title);
			return;
		}
		$(this).attr("title",this.href);
		$(this).attr("href","javascript:;");
	});
}

////////// 오늘의 스마트쇼핑 미완
function mobile_today_cont(){
	$(".today_cont li.on a").click(function(){
		if($(this).attr("href") == "javascript:;"){
			$(this).attr("href",this.title);
			return;
		}
	});
	$(".today_cont li a").click(function(){
		$(this).attr("title",this.href);
		$(this).attr("href","javascript:;");
	});
}

////////// 카테고리 화살표 클릭시 세분류 노출
function mobile_lp_category_list(){
	// 상단 locbar 의 카테고리
	$("#locbar .dropdown").click(function(){
		$("#locbar .categorylayer").css("display","none !important");
	});
	$("#locbar .dropdown").toggle(function(){
		$(this).next().css("display","block !important");
	},function(){
		$(this).next().css("display","none !important");
	});

	// lp 페이지의 카테고리
	$("#access_category input.view").click(function(){
		$("#access_category input.view").next().attr("style","display:none !important");
	});
	$("#access_category input.view").toggle(function(){
		$(this).next().attr("style","display:block !important");
	},function(){
		$(this).next().attr("style","display:none !important");
	});
}

////////// lp 페이지 슬롯부분 옥션 랭킹순 선택박스
function mobile_lp_layer_sort(){
	$(".layer_select.layer_sort .option .question").toggle(function(){
		$(".layer_select.layer_sort .option").attr("style","display:block !important;");
	},function(){
		$(".layer_select.layer_sort .option , .layer_select.layer_sort .layer_sort_guide1 , .layer_select.layer_sort .layer_sort_guide2").attr("style","display:none;");
	});

}

////////// PDPLayer 위치 조절
function mobile_PDPLayer(){
	$("#PDPLayer.pdp_popup_wrap").css("left","0");
}

////////// a태그 href # 값 일괄 수정
function mobile_href(){
	$("a[href='#']").attr("href","javascript:;");
}

////////// header x 버튼
function header_close_btn(){
	$("#allmenu .btn_allmenu_close").addClass("mobile");
}


////////// 시작
setTimeout(function(){
	if(isios || isipad || isandroid){  // 2014-06-02 크롬 모바일 인식 오류 수정
		//alert('mobile');

		$("body").addClass("mobile"); //2014-06-23 BC7937

		openHelpLayer(); // 물음표 마우스 오버

		mobile_slidebtn(); // 슬리이드 배너 이미지 좌우 버튼

		// mobile_allmenudepth2(); // 헤더 카테고리 네비게이션 중분류 클릭 미완   // 2014-06-02 크롬 모바일 인식 오류 수정

		// mobile_today_cont(); // 오늘의 스마트쇼핑 미완   // 2014-06-02 크롬 모바일 인식 오류 수정

		mobile_lp_category_list(); // 카테고리 화살표 클릭시 세분류 노출

		mobile_lp_layer_sort(); // lp 페이지 슬롯부분 옥션 랭킹순 선택박스

		mobile_PDPLayer(); // PDPLayer 위치 조절

		mobile_href(); // a태그 href # 값 일괄 수정

		// VIP 무빙레이어 옵션 보기
		$('.moving_option .order_options').find('a').bind('click', function(){
			//alert('dd');
			if($(this).attr('class') == 'open' ){
				$('.order_options_layer').animate({'height': '348px'}, 300);
				$(this).attr('class','');
			}else{
				$('.order_options_layer').animate({'height': '0px'}, 300);
				$(this).attr('class','open');
			}
		});	
	} else {
		//alert('Web');

	}
}

 , 1500);
/////////////////////////////////////////////////////////////////////////////////// VIP 통합 작업 끝

