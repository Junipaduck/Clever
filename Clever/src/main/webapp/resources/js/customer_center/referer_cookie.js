if (typeof getQueryStringValue !== 'function') {
    function getQueryStringValue (key) {
        return decodeURIComponent(window.location.search.replace(new RegExp("^(?:.*[&\\?]" + encodeURIComponent(key).replace(/[\.\+\*]/g, "\\$&") + "(?:\\=([^&]*))?)?.*$", "i"), "$1"));
    }
}

function RefererCookie() {
    this.services = [];
}

RefererCookie.prototype.addService = function (service) {
    this.services.push(service); 
}

RefererCookie.prototype.handler = function () {
    for (var key in this.services) {
        if (typeof this.services[key].handler === 'function') {
            this.services[key].handler();
        }
    }
}

function EnuriBrandStoreCookie() {
    this.cookies = {
        refurl: {
            name: 'refurl',
            value: getQueryStringValue('ref'),
            expire: 7,
        },
        mcv: {
            name: 'enuri_mcv',
            value: getQueryStringValue('mcv'),
            expire: 7,
        }
    };
}

EnuriBrandStoreCookie.prototype.handler = function () {
    if (getQueryStringValue('ref').indexOf('enuri_') > -1 && typeof setCookie === 'function') {
        setCookie(this.cookies.refurl.name, this.cookies.refurl.value, this.cookies.refurl.expire);
        if (getQueryStringValue('mcv').length > 0) {
            setCookie(this.cookies.mcv.name, this.cookies.mcv.value, this.cookies.mcv.expire);
        }
    }
}
