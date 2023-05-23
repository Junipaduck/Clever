/**
 * ��ǰ�̸����� ��ũ��Ʈ
 * ���� html/js/detailpage.js�� ����������3���� ����ϱ� ���� jqueryȭ ��Ŵ.
 * @auther duellist
 * @date 2011-06-16
 **/
var StringBuffer = function() {
    this.buffer = new Array();
};

StringBuffer.prototype.append = function(str) {
    this.buffer[this.buffer.length] = str;
};

StringBuffer.prototype.toString = function() {
    return this.buffer.join('');
};

// ���ڰ� �ƴ� ���ڴ� ��� ����
if (typeof(String.prototype.numeric) == 'undefined') {
    String.prototype.numeric = function() {
        return parseInt(this.replace(/[^-0-9]/g, '') || 0, 10);
    };
}
if (typeof(Number.prototype.numeric) == 'undefined') {
    Number.prototype.numeric = function() {
        return this.toString().numeric();
    };
}
if (typeof(String.prototype.number_format) == 'undefined') {
    // õ���� �޸� ���̱�
    String.prototype.number_format = function() {
        return this.numeric().toString().replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    };
}
if (typeof(Number.prototype.number_format) == 'undefined') {
    Number.prototype.number_format = function() {
        return this.toString().number_format();
    };
}
// ���ڿ� trim
if (typeof(String.prototype.trim) == 'undefined') {
    String.prototype.trim = function() { 
        return this.replace(/(^\s+)|(\s+$)/g, '');
    } 
}

// �ش� ��Ʈ���� ����Ʈ���� return
if (typeof(String.prototype.bytes) == 'undefined') {
    String.prototype.bytes = function() { 
        var str = this;
        var len = 0;
        for (var i = 0; i < str.length; i++) {
            len += (str.charCodeAt(i) > 128) ? 2 : 1;
        }   
        return len;
    }
}

function object_count(obj) {
    var cnt = 0;
    for (var i in obj) {
        cnt++;
    }
    return cnt;
}
var prd_cart_cnt = prd_cart_cnt || 0;
var is_unify_opt = is_unify_opt || false;

// �𳪹� ��ǰ�̸�����(quick) ��ư ����
window.quick_ele = null;
jQuery('.bt_quick').on('click', function(e) {
    window.quick_ele = this;
}); 

// ��ǰ �̸������ ajax �� utf-8 ���ڵ� �Ǿ --;;
if (typeof get_diy_option_lang == 'undefined') {
    function get_diy_option_lang(type) {
        return ({price_unit: '��'})[type];
    }
}

if (typeof shop_language == 'undefined') {
    var shop_language = 'kor';
}
function viewdetail(brandcode, is_unify_opt, is_cart_free) {
    pre_showdetail('visible', brandcode, is_unify_opt, is_cart_free);
}
// amount input box change action
function pre_set_amount(obj, option_mode, mode) {
    if (is_unify_opt == true) {
        pre_option_manager.set_amount(obj, option_mode, mode);
    }
    if (typeof window.diy_opt != 'undefined' && option_mode == 'addition') {
        diy_option_price(window.diy_opt.conf());
    }
}
// �ɼǺ� ���
var pre_optionStock = function(idx){
    if (typeof(pre_stockInfo) == 'object') {
        return pre_stockInfo[idx];
    }
}

var validateNumeric = function(el) {
    if (el.value == '') { return false; }
    el.value = el.value.replace(/(\s)/g, '');
    var pattern = /(^[0-9]+$)/;
    if (!pattern.test(el.value)) {
        return false;
    }
    return true;
};
var validateBytes = function(obj) {
    var maxsize = 200;

    if (obj.value.bytes() > maxsize) {
        if (typeof shop_language != 'undefined' && shop_language == 'eng') {
            alert("You have exceeded the maximum length. Please check that you entered a maximum of " + (maxsize / 2) + " korean characters or " + maxsize + " english letters/numbers/signs");
        } else {
            alert("�ɼ� �Է� ������ �ʰ��Ǿ����ϴ�.\n�ѹ� �� Ȯ�����ּ���\n" + "�ѱ۸�" + (maxsize / 2) + "�� �̳� Ȥ�� ����/����/��ȣ�� " + maxsize + "�� �̳����� �����մϴ�.");
        }
        return false;
    }
};
// �ݾ� ������ ���ڿ� ����
function change_price_str(F_str, G_price, N_count) {
    if(!F_str || !G_price || !N_count)
        return;

    var F_str   = jQuery(F_str).html();
    var price_x = F_str.replace(/[^0-9]?/g,'');
    var firtstr = F_str.substr(0, F_str.indexOf(price_x.substring(0,1)));
    var laststr = F_str.substr(F_str.lastIndexOf(price_x.charAt(price_x.length-1))+1);
    var total_price =(G_price * N_count).number_format();
    var total_str = firtstr + total_price  + laststr;
    return total_str;
}

var pre_optionJsonData = null;
var pre_stockInfo = null;
// ����ϰ� PC�� ��μ���
var basket_url = MOBILE_USE === '1' ? '/m/basket.html' : '/shop/basket.html';
var shopdetail_url = MOBILE_USE === '1' ? '/m/product.html' : '/shop/shopdetail.html';


if (is_unify_opt == true) { 
(function ($) {
$(document).ready(function(){
    window.pre_option_manager = {
        info: {
            min_amount: parseInt(pre_min_amount),         // �ּ� �ֹ� ����
            min_add_amount: parseInt(pre_min_add_amount), // �ֹ� ���� ����
            max_amount: parseInt(pre_max_amount),         // �ִ� �ֹ� ����
            prd_cart_cnt : parseInt(0),
            product_uid: pre_product_uid,                 // ��ǰ uid
            product_brandcode: null,
            product_name: pre_product_name,               // ��ǰ��
            product_price: pre_product_price,             // ��ǰ����
            option_type: pre_option_type,                 // �ɼ� ����
            option_display_type: pre_option_display_type, // �ɼ� ��� Ÿ��
            json: pre_optionJsonData,                     // ���� ������ ����� JSON ���
            type: null, // ���� ���õ� �ɼ��� Ÿ��
            view_member_only_price : (typeof(view_member_only_price) == 'undefined'? 0 : view_member_only_price), // ȸ�����ݳ��� ����
            is_bulk : is_bulk,
            bulk_arr_info : bulk_arr_info,
            is_soldout : '',                              // ǰ�� ����
            soldout_type: '',                             // ��ǰ �Ͻ�ǰ�� ������
            is_opt_restock: '',                           // �ɼǺ� ���԰� �˸� ����
            page_type: ''
        },
        data: {
            basic: [[]],
            prd_info: [],
            addition: []
        },
        // return min amount
        get_min_amount: function(mode) {
            return mode.toLowerCase() == 'addition' ? 1 : this.info.min_amount;
        },
        // return min add amount
        get_min_add_amount: function(mode) {
            return mode.toLowerCase() == 'addition' ? 1 : this.info.min_add_amount;
        },
        // return min amount
        get_max_amount: function(mode) {
            return mode.toLowerCase() == 'addition' ? 2147483647 : this.info.max_amount;
        },
        // input box focus in action
        input_focus: function(obj) {
            if ($(obj).attr('title') == $(obj).val()) {
                $(obj).val('');
            }
            $(obj).blur(function() {
                if ($(obj).val().replace(/[\s]/g, '').length == 0) {
                    $(obj).val($(obj).attr('title'));
                }
            });
            return false;
        },
        // ��Ŭ�� �ɼ� ����
        click_option: function(obj, option_mode, target) {
            var _this = this;
            var _info = this.info;
            var _json = this.info.json.basic;
            var _obj = $(obj);

            var _li = _obj.parents('.MK-oneclick-li', '#detailpage');
            var _ul = _obj.parents('.MK-oneclick-list', '#detailpage');
            var _key = parseInt(_obj.attr('opt_key'));
            var _option = $('[name="pre_optionlist[]"].' + option_mode + '_option');
            var _input = _option.filter('[opt_key="'+_key+'"]');
            var _value_text = $('.MK-oneclick-value[opt_key='+_key+']', '#detailpage');
            
            if (_li.hasClass('MK-oneclick-dis') === true) {
                return;
            }

            // �������
            if (_li.hasClass('MK-oneclick-sel') === true) {
                 _li.removeClass('MK-oneclick-sel'); 
                 if (_value_text) {
                     _value_text.html('');
                 }
                this.unset_child_option(option_mode, _option, _key);
                this.set_data();
                this.pre_sum_total_price();

                if (typeof pre_oneclick_change_mimg != 'undefined') {
                    pre_oneclick_change_mimg('');
                }
                return;
            }
            if (typeof shop_language == 'undefined') {
                var shop_language = 'kor';
            }
            if (pre_option_manager.info.view_member_only_price == 'Y' && IS_LOGIN === 'false') {
                alert(((shop_language == 'eng') ? 'Member login required to buy.' : 'ȸ�� �α����� �Ͻø� �����Ͻ� �� �ֽ��ϴ�.'));    
                return;
            }

            // �ɼ� ���� ������� ó��
            if (_obj.attr('title').replace(/[\s]/g, '').length == 0) {
                this.unset_child_option(option_mode, _option, _key);
                return false;
            }

            // ���� �ɼ� select ������ �ɼ� ��� disable
            _input.val(_obj.attr('value'));
            _li.addClass('MK-oneclick-sel').siblings('.MK-oneclick-li').removeClass('MK-oneclick-sel');

            // �ɼ� ���� üũ
            var _stock = 0;
            if (option_mode == 'basic') {
                _stock = $('#MS_amount_basic_0', '#detailpage').val();
            }
            if (this.pre_check_quantity(obj, option_mode, _stock) === false) {
                if (_info.page_type == 'pop_soldout_alarm') {
                    _li.removeClass('MK-oneclick-sel');
                    if (_value_text) {
                        _value_text.html('');
                    }
                }
                this.unset_child_option(option_mode, _option, _key);
                return false;
            }

            // �����ɼ� �����
            _this.remove_option(_key);
            if (_option.eq(_key + 1).attr('opt_mix') == 'Y') {
                _this.append_option(_option, _key + 1);
            }

            if (_value_text) {
                _value_text.html(_obj.attr('title'));
            }

            if (typeof afterUpdateOptionsLayout != 'undefined') {
                afterUpdateOptionsLayout(_this);
            }

            // �������Է�
            _this.set_oneclick_data();
            this.set_data();
            this.pre_sum_total_price();
            return false;
        },
        // �ɼǰ� ����
        remove_option: function(idx) {
            var _this = this;
            $.each($('[name="pre_optionlist[]"].basic_option'), function(_i, _d) {
                if (idx < _i && $(this).attr('opt_mix') == 'Y') {
                    if ($(this).attr('opt_oneclick') && $(this).attr('opt_oneclick') == 'Y') {
                        var _ul = $('.MK-oneclick-list[opt_key='+_i+']', '#detailpage');
                        _ul.find('.MK-oneclick-li').addClass('MK-oneclick-dis').removeClass('MK-oneclick-sel');
                        var _text = $('.MK-oneclick-value[opt_key='+_i+']', '#detailpage');
                        if (_text) {
                            _text.html('');
                        }
                    } else {
                        $(this).children('option').not(':first').remove();
                    }
                }
            });
        },
        // �ɼǰ� ���� ó��
        change_option: function(obj, option_mode, target) {
            var _form = $('form[name="detailform"]');
            if (pre_option_manager.info.view_member_only_price == 'Y' && typeof IS_LOGIN != 'undefined' && IS_LOGIN === 'false') {
                alert(((shop_language == 'eng') ? 'Member login required to buy.' : 'ȸ�� �α����� �Ͻø� �����Ͻ� �� �ֽ��ϴ�.'));
                document.location.href='/shop/member.html?type=login';
                return;
            }

            if ($(obj).attr('type') != 'radio') {
                // ���� ���õ� �ɼ��� Ÿ���� ������
                this.info.type = $(obj).get(0).tagName.toLowerCase();
                var _option = $('[name="pre_optionlist[]"].' + option_mode + '_option');
                var _idx = _option.index($(obj));
                var _last = _option.index(_option.filter(':last'));
                // �ۼ��� �ɼ� Ư������ üũ.
                if (option_mode == 'basic') {
                    if ($(obj).attr('opt_type') == 'CUSTOM') {
                        var reg = /[<{]/gi;
                        if (reg.test($(obj).val())) {
                            $(obj).val($(obj).val().replace(reg, ""));
                            alert("�ۼ��� �ɼ��� Ư�����ڸ� ����� �� �����ϴ�. �ٽ� �ۼ����ּ���.");
                            return false;
                        }
                    }
                }

                // �ʼ� �ɼ� üũ
                if (this.check_mandatory(obj) === false) {
                    this.unset_child_option(option_mode, _option, _idx);
                    return false;
                }

                // �ɼ� ���� ������� ó��
                if ($(obj).val().replace(/[\s]/g, '').length == 0) {
                    this.unset_child_option(option_mode, _option, _idx);
                    this.set_data();
                    this.pre_sum_total_price();
                    return false;
                }

                // ���õ� �ɼ��� ���� �ɼ��� ������ ���ۼ���
                // ���� �ɼǵ��� �ɼǰ��� ������ �� �ɼ� ���� �߰���
                if (option_mode == 'basic') {
                    this.remove_option(_idx);
                    if (_option.eq(_idx + 1).attr('opt_mix') == 'Y') {
                        this.append_option(_option, _idx + 1);
                    }
                }

                // �ɼ� ���� üũ
                var _stock = 0;
                if (option_mode == 'basic') {
                    _stock = $('#MS_amount_basic_0', _form).val();
                } else {
                    var _i = $('[name="pre_optionlist[]"].' + option_mode + '_option', _form).index($(obj));
                    _stock = $('#MS_amount_addition_' + _i, _form).val();
                }
                if (this.pre_check_quantity(obj, option_mode, _stock) === false) {
                    this.unset_child_option(option_mode, _option, _idx);
                    return false;
                }
            }
            if (this.info.page_type == 'pop_soldout_alarm') { // ���԰� �˸��˾��϶�
                if (option_mode == 'basic') {
                    if (_idx == _last) {
                        this.set_data();
                    }
                } else if (option_mode == 'addition') {
                    this.set_data();
                }
            } else {
                this.set_data();
            }
            this.pre_sum_total_price();

            return false;
        },
        // �ɼ� ���� ���
        unset_child_option: function(option_mode, option, idx) {
            if (option_mode != 'basic') {
                return false;
            }
            if (option.eq(idx).attr('opt_mix') != 'Y') {
                return false;
            }
            if (option.eq(idx + 1).attr('opt_mix') == 'Y') {
                this.remove_option(idx);
                this.set_data();
                this.pre_sum_total_price();
            }
        },
        // ���� �ɼ� ���� Ȯ��
        use_child_option: function(idx, _opt_ids, _opt_values) {
            var _info = this.info;
            var _json = this.info.json.basic;
            var _count = 0;
            var _hcount = 0;
            $.each(_json[idx], function(_i, _d) {
                if (_d.opt_mix == 'Y' && _opt_ids == _d.opt_ids.substring(0, _opt_ids.length) && $.trim(_opt_values + ',') == $.trim(_d.opt_values).substring(0, $.trim(_opt_values).length + 1)) {
                    if (_d.sto_state == 'HIDE') {
                        _hcount++;
                    }
                    _count++;
                }

            })
            return _count == _hcount ?  false : true;

        },
        // ������� �ɼ� Ȯ��
        check_show_option: function(_opt_ids, _opt_values) {
            var _info = this.info;
            var _json = this.info.json.basic;
            var _use = false;
            $.each(_json, function(_idx, _data) {
                $.each(_data, function(_i, _d) {

                    if (_d.opt_mix == 'Y' && $.inArray(_opt_ids, _d.opt_ids.split(',')) == _idx && $.inArray(_opt_values, _d.opt_values.split(',')) == _idx) {
                        if (_d.sto_state != 'HIDE') {
                            _use = true;
                            return false;
                        }
                    }
                })
                if (_use === true) {
                    return false;
                }
            })
            return _use;
        },
        // ��Ŭ�� �ɼ� Ȱ��ȭ
        append_option_oneclick: function(options, idx) {

            var _this = this;
            var _info = this.info;
            var _json = this.info.json.basic;
            var _option = new StringBuffer();

            
            var _ul = $('.MK-oneclick-list[opt_key='+idx+']', '#detailpage');
            _ul.find('.MK-oneclick-dis').removeClass('MK-oneclick-dis').removeClass('MK-oneclick-sel');
            _ul.find('.MK-oneclick-li').show();

            //return false;

            // ���յ� �ɼ��� ���¿� ���� �ؽ�Ʈ �߰�
            if (idx == options.index(options.filter('[opt_mix="Y"]:last'))) {
                var _opt_id = [];
                var _opt_value = [];

                // ���� �ɼǵ��� ���õ� �ɼ��� opt_id, opt_value ���� ��Ƶ�
                var _select_option =_this.get_selected_option(options);
                var _opt_id = _select_option[0];
                var _opt_value = _select_option[1];

                var _opt = null;
                var _in_opt = false;
                var _opt_ids = null;
                _ul.find('.MK-oneclick-link', '#detailpage').each(function() {
                    _in_opt = false;
                    _opt = $(this); // ���� �ɼǰ�
                    // opt_id, opt_value ���� ���ս�Ŵ
                    _opt_ids = _opt_id.length > 0 ? _opt_id.join(',') + ',' + _ul.attr('opt_id') : _ul.attr('opt_id');
                    _opt_values = _opt_value.length > 0 ? _opt_value.join(',') + ',' + $(this).attr('opt_val') : $(this).attr('opt_val');
                    // json������ �ش� opt_ids, opt_value���� ã��
                    $.each(_json[idx], function(_i, _d) {
                        if (_opt_ids == _d.opt_ids && $.trim(_opt_values) == $.trim(_d.opt_values)) {
                            var _add_text = '';
                            var _add_price = '';
                            var _text = _opt.attr('opt_val');
                            var _is_unlimit = _d.sto_unlimit == 'Y' ? true : false;
                             //�и����϶� ���� ���� �ɼ� ����
                            if (_d.sto_state == 'HIDE') {
                                _opt.closest('.MK-oneclick-li').hide();
                                return true;
                            }

                            // view_member_only_price, IS_LOGIN �ɼ��� �߰� �ݾ� ó���� ���� ��ǰ �󼼿��� ���� ��
                            if (typeof view_member_only_price != 'undefined' && view_member_only_price == 'Y' && typeof IS_LOGIN != 'undefined' && IS_LOGIN === 'false') {
                                _add_price = '';
                            } else {
                                // �и����� ��� �߰��ݾ��� �߰�����
                                if (_d.sto_price > 0) {
                                    _add_price = '(+' + Math.abs(parseInt(_d.sto_price, 10)).number_format() + ')';
                                    _opt.attr('price', Math.abs(parseInt(_d.sto_price, 10)));
                                } else if (_d.sto_price < 0) {
                                    _add_price = '(-' + Math.abs(parseInt(_d.sto_price, 10)).number_format() + ')';
                                    _opt.attr('price', '-' + Math.abs(parseInt(_d.sto_price, 10)));
                                } else {
                                    _opt.attr('price', '0');
                                }
                            }
                            switch (_d.sto_state) {
                                case 'HIDE': _opt.closest('.MK-oneclick-li').hide(); break;
                                case 'SOLDOUT': 
                                    _add_text = ' - ' + get_lang('soldout_txt'); 
                                    _opt.closest('.MK-oneclick-li').addClass('MK-oneclick-dis');
                                    break;
                                case 'TEMPOUT': 
                                    _add_text = ' - ' + get_lang('tempsoldout_txt'); 
                                    _opt.closest('.MK-oneclick-li').addClass('MK-oneclick-dis');
                                    break;
                                case 'DELAY': _add_text = ' - ' + get_lang('shipping_txt'); break;
                                case 'SALE':
                                    if (_is_unlimit === true) {
                                        _add_text = '';
                                    } else if (_d.sto_stop_use == 'Y' && (_d.sto_real_stock - _d.sto_stop_stock) <= 0 && _add_text.length == 0) {
                                        _opt.closest('.MK-oneclick-li').addClass('MK-oneclick-dis');
                                        _add_text = ' - ' + get_lang('soldout_txt');
                                    }

                                    if (pre_option_stock_display != 'NO' && _add_text.length == 0) {
                                        if (_d.sto_stop_use == 'Y') {
                                            _add_text = ' - (' + get_lang('stock_title') + ' : ' + Math.max(0, _d.sto_real_stock - _d.sto_stop_stock) + ' ' + get_lang('stock_unit') + ')';
                                        } else {
                                            _is_unlimit = true;
                                        }
                                        if (_is_unlimit === true) {
                                            if (pre_option_stock_display == 'DISPLAY') {
                                                _add_text = ' - (' + get_lang('stock_title') + ' : ' + get_lang('stock_unlimit') + ')';
                                            }
                                            if (pre_option_stock_display == 'LIMIT') {
                                                _add_text = '';
                                            }
                                        }
                                    }
                                    break;
                            }
                            if (typeof option_note_display != 'undefined' && option_note_display == 'DISPLAY' && _d.sto_note.length > 0) {
                                _add_text += '(' + _d.sto_note.substr(0, 20) + ')';
                            }
                            _in_opt = true;
                            _opt.attr('title', (_text + _add_price + _add_text));
                        }
                    })
                    // �и����� ��� ���յ��� ���� �ɼ��� �����Ҽ� ���� �ش� �ɼ��� ǰ�� ó��
                    if (_in_opt === false) { _opt.closest('.MK-oneclick-li').hide(); }
                });
            } else {
                if (_ul.attr('opt_mix') == 'Y') {

                    // ���� �ɼǵ��� ���õ� �ɼ��� opt_id, opt_value ���� ��Ƶ�
                    var _select_option =_this.get_selected_option(options);
                    var _opt_id = _select_option[0];
                    var _opt_value = _select_option[1];

                    var _opt_ids = null;
                    var _opt_values = null;
                    $.each(_ul.find('.MK-oneclick-link', '#detailpage'), function(_i, _d) {
                        _opt_ids = _opt_id.length > 0 ? _opt_id.join(',') + ',' + _ul.attr('opt_id') : _ul.attr('opt_id');
                        _opt_values = _opt_value.length > 0 ? _opt_value.join(',') + ',' + $(this).attr('opt_val') : $(this).attr('opt_val');
                        if (pre_option_manager.use_child_option(idx, _opt_ids, _opt_values) === false) {
                                    
                            $(this).parents('.MK-oneclick-li', '#detailpage').hide();
                        }
                    });
                }
            }
            return false;
        },
        // ���� �ɼǵ��� ���õ� �ɼ��� opt_id, opt_value ���� ����
        get_selected_option: function (options) {
            var _opt_id = [];
            var _opt_value = [];
            $.each(options, function(_i, _d) {
                if ($(this).attr('opt_oneclick') && $(this).attr('opt_oneclick') == 'Y') {
                    var _option_key = $(this).attr('opt_key');
                    var _opt = $('.MK-oneclick-sel[opt_key='+_option_key+']', '#detailpage').find('.MK-oneclick-link');
                    if (_opt.length > 0 && $(this).attr('opt_mix') == 'Y' && _opt.attr('value').length > 0) {
                        _opt_id.push($(this).attr('opt_id'));
                        _opt_value.push(_opt.attr('opt_val'));
                    }
                } else {
                    var _opt = $(this).children('option:selected');
                    if ($(this).attr('opt_mix') == 'Y' && _opt.text() != get_lang('non_option_txt') && _opt.val().length > 0) {
                        _opt_id.push($(this).attr('opt_id'));
                        _opt_value.push($(this).children('option:selected').attr('title'));
                    }
                }
            });
            return [_opt_id, _opt_value];
        },
        // ��Ŭ�� ���õ� �� hidden�� �־���
        set_oneclick_data: function () {
            var _opt_id = [];
            var _opt_value = [];
            $.each($('input[name="pre_optionlist[]"].basic_option'), function(_i, _d) {
                if ($(this).attr('opt_oneclick') && $(this).attr('opt_oneclick') == 'Y') {
                    var _option_key = $(this).attr('opt_key');
                    var _opt = $('.MK-oneclick-sel[opt_key='+_option_key+']', '#detailpage').find('.MK-oneclick-link');
                    if (_opt.length > 0 && _opt.attr('value').length > 0) {
                        $(this).val(_opt.attr('value'));
                        $(this).attr('opt_val', _opt.attr('opt_val'));
                    } else {
                        $(this).val('');
                        $(this).attr('opt_val', '');
                    }
                }
            });
            return true;
        },
        // �ɼǰ� �߰�
        append_option: function(options, idx) {

            var _this = this;
            var _info = this.info;
            var _json = this.info.json.basic;
            var _option = new StringBuffer();
            if (_json[idx] !== undefined) {

                // ��Ŭ�� �ɼ��� ��� �и�
                if ($(options.eq(idx).get(0)).attr('type') == 'hidden') {
                    this.append_option_oneclick(options, idx);
                    return false;
                }
                // ���� �ɼ��� �Է����̶�� option�� �߰��� �ʿ䰡 ����
                if (options.eq(idx).get(0).tagName.toLowerCase() == 'input') {
                    return false;
                }
                var _num = 0;
                var _add_price = '';
                $.each(_json[idx], function(_i, _d) {
                    if (_i == 0 && _d.opt_mandatory == 'N') {
                        _option.append('<option sto_id="0" price="0" title="' + get_lang('non_option_txt') + '" value="' + _num + '" style="color: #ff0000;">' + get_lang('non_option_txt') + '</option>');
                        _num++;
                    }
                    if (_info.option_display_type == 'EACH' && _d.opt_mix == 'Y') {
                        _add_price = '';
                        // view_member_only_price, IS_LOGIN �ɼ��� �߰� �ݾ� ó���� ���� ��ǰ �󼼿��� ���� ��
                        if (typeof view_member_only_price != 'undefined' && view_member_only_price == 'Y' && typeof IS_LOGIN != 'undefined' && IS_LOGIN === 'false') {
                            _add_price = '';
                        } else {
                            if (_d.sto_price > 0) {
                                _add_price = '(+' + (Math.abs(_d.sto_price)).number_format() + ')';
                            } else if (_d.sto_price < 0) {
                                _add_price = '(-' + (Math.abs(_d.sto_price)).number_format() + ')';
                            }
                        }
                        _option.append('<option matrix="" sto_id="' + _d.sto_id + '" price="' + _d.sto_price + '" title="' + _d.opt_values + '" value="' + _num + '">' + _d.opt_values + _add_price + '</option>');
                    } else {
                        var _value = _d.opt_value.split(',');
                        var _price = _d.opt_price.split(',');
                        var _matrix = _d.opt_matrix.split(',');
                        $.map(_value, function(_v, _k) {
                            if (_d.opt_mix == 'Y') {
                                _option.append('<option matrix="' + _matrix[_k] + '" sto_id="0" price="0" title="' + _v + '" value="' + _num + '">' + _v + '</option>');
                            } else {
                                _add_price = '';
                                // view_member_only_price, IS_LOGIN �ɼ��� �߰� �ݾ� ó���� ���� ��ǰ �󼼿��� ���� ��
                                if (typeof view_member_only_price != 'undefined' && view_member_only_price == 'Y' && typeof IS_LOGIN != 'undefined' && IS_LOGIN === 'false') {
                                    _add_price = '';
                                } else {
                                    if (_price[_k] > 0) {
                                        _add_price = '(+' + (Math.abs(_price[_k])).number_format() + ')';
                                    } else if (_price[_k] < 0) {
                                        _add_price = '(-' + (Math.abs(_price[_k])).number_format() + ')';
                                    }
                                }
                                _option.append('<option matrix="' + _matrix[_k] + '" sto_id="0" price="' + _price[_k] + '" title="' + _v + '" value="' + _num + '">' + _v + _add_price + '</option>');
                            }
                            _num++;
                        });
                    }
                    _num++;
                    // �ɼ� ��� ���°� �и����϶� ���յ� �ɼ��� ���
                    if (_info.option_display_type == 'EVERY' && _json[idx][0].opt_mix == 'Y') {
                        return false;
                    }
                });
                // �ϼ��� �ɼ��� �߰���
                $(options).eq(idx).children('option').not(':first').remove().end().end().append(_option.toString());

                // �ɼ��� ���¿� ���� �ؽ�Ʈ �߰�
                if (idx == options.index(options.filter('[opt_mix="Y"]:last'))) {

                    // ���� �ɼǵ��� ���õ� �ɼ��� opt_id, opt_value ���� ��Ƶ�
                    var _select_option =_this.get_selected_option(options);
                    var _opt_id = _select_option[0];
                    var _opt_value = _select_option[1];

                    var _opt = null;
                    var _in_opt = false;
                    var _opt_ids = null;
                    $(options).eq(idx).children('option').not(':first').not('option:contains("' + get_lang('non_option_txt') + '")').each(function() {
                        _in_opt = false;
                        _opt = $(this); // ���� �ɼǰ�
                        // opt_id, opt_value ���� ���ս�Ŵ
                        _opt_ids = _opt_id.length > 0 ? _opt_id.join(',') + ',' + $(this).parents('select:first').attr('opt_id') : $(this).parents('select:first').attr('opt_id');
                        _opt_values = _opt_value.length > 0 ? _opt_value.join(',') + ',' + $(this).attr('title') : $(this).attr('title');
                        // json������ �ش� opt_ids, opt_value���� ã��
                        $.each(_json[idx], function(_i, _d) {
                            if (_opt_ids == _d.opt_ids && $.trim(_opt_values) == $.trim(_d.opt_values)) {
                                var _add_text = '';
                                var _add_price = '';
                                var _text = _opt.text();
                                var _is_unlimit = _d.sto_unlimit == 'Y' ? true : false;
                                 //�и����϶� ���� ���� �ɼ� ����
                                if (_d.sto_state == 'HIDE') {
                                    _opt.remove();
                                    return true;
                                }

                                // view_member_only_price, IS_LOGIN �ɼ��� �߰� �ݾ� ó���� ���� ��ǰ �󼼿��� ���� ��
                                if (typeof view_member_only_price != 'undefined' && view_member_only_price == 'Y' && typeof IS_LOGIN != 'undefined' && IS_LOGIN === 'false') {
                                    _add_price = '';
                                } else {
                                    // �и����� ��� �߰��ݾ��� �߰�����
                                    if (_d.sto_price > 0) {
                                        _add_price = '(+' + Math.abs(parseInt(_d.sto_price, 10)).number_format() + ')';
                                        _opt.attr('price', parseInt(_opt.attr('price')) + Math.abs(parseInt(_d.sto_price, 10)));
                                    } else if (_d.sto_price < 0) {
                                        _add_price = '(-' + Math.abs(parseInt(_d.sto_price, 10)).number_format() + ')';
                                        _opt.attr('price', parseInt(_opt.attr('price')) - Math.abs(parseInt(_d.sto_price, 10)));
                                    }

                                    // �ǸŰ� ���������� ��� (discount_percent)
                                    _opt.attr('org_opt_price', Math.abs(parseInt(_d.org_opt_price, 10)));
                                }
                                switch (_d.sto_state) {
                                    case 'HIDE': _add_text = ' - ' + get_lang('soldout_txt'); break;
                                    case 'SOLDOUT': _add_text = ' - ' + get_lang('soldout_txt'); break;
                                    case 'TEMPOUT': _add_text = ' - ' + get_lang('tempsoldout_txt'); break;
                                    case 'DELAY': _add_text = ' - ' + get_lang('shipping_txt'); break;
                                    case 'SALE':
                                        if (_is_unlimit === true) {
                                            _add_text = '';
                                        } else if (_d.sto_stop_use == 'Y' && (_d.sto_real_stock - _d.sto_stop_stock) <= 0 && _add_text.length == 0) {
                                            _add_text = ' - ' + get_lang('soldout_txt');
                                        }

                                        if (pre_option_stock_display != 'NO' && _add_text.length == 0) {
                                            if (_d.sto_stop_use == 'Y') {
                                                _add_text = ' - (' + get_lang('stock_title') + ' : ' + Math.max(0, _d.sto_real_stock - _d.sto_stop_stock) + ' ' + get_lang('stock_unit') + ')';
                                            } else {
                                                _is_unlimit = true;
                                            }
                                            if (_is_unlimit === true) {
                                                if (pre_option_stock_display == 'DISPLAY') {
                                                    _add_text = ' - (' + get_lang('stock_title') + ' : ' + get_lang('stock_unlimit') + ')';
                                                }
                                                if (pre_option_stock_display == 'LIMIT') {
                                                    _add_text = '';
                                                }
                                            }
                                        }
                                        break;
                                }

                                if (typeof option_note_display != 'undefined' && option_note_display == 'DISPLAY' && _d.sto_note.length > 0) {
                                    _add_text += '(' + _d.sto_note.substr(0, 20) + ')';
                                }
                                _in_opt = true;
                                _opt.text(_text + _add_price + _add_text);
                            }
                        })
                        // �и����� ��� ���յ��� ���� �ɼ��� �����Ҽ� ���� �ش� �ɼ��� ǰ�� ó��
                        if (_in_opt === false) { _opt.remove(); }
                    });
                    //�и����϶� ������� �ɼ� ���Ž� ���õǾ��� �ɼǰ��� �ʱ�ȭ
                    /*
                    if ($(options).eq(idx).children('option').not('[value=""]').length <= 0) {
                        alert(get_lang('empty_option'));
                        $('[name="optionlist[]"]').val('').focus();
                        return false;

                    }
                    */
                } else {
                    if (pre_option_manager.info.option_display_type == 'EVERY') {
                        // ���� �ɼǵ��� ���õ� �ɼ��� opt_id, opt_value ���� ��Ƶ�
                        var _select_option =_this.get_selected_option(options);
                        var _opt_id = _select_option[0];
                        var _opt_value = _select_option[1];

                        var _opt = null;
                        var _opt_ids = null;
                        var _opt_values = null;
                        $(options).eq(idx).children('option').not(':first').not('option:contains("' + get_lang('non_option_txt') + '")').each(function() {
                            _opt = $(this); // ���� �ɼǰ�
                            // opt_id, opt_value ���� ���ս�Ŵ
                            _opt_ids = _opt_id.length > 0 ? _opt_id.join(',') + ',' + $(this).parents('select:first').attr('opt_id') : $(this).parents('select:first').attr('opt_id');
                            _opt_values = _opt_value.length > 0 ? _opt_value.join(',') + ',' + $(this).attr('title') : $(this).attr('title');
                            if ($(this).parents('select:first').attr('opt_mix') == 'Y' && _this.use_child_option(idx, _opt_ids, _opt_values) === false) {
                                _opt.remove();
                            }
                        });
                    }

                }
            }
            return false;
        },
        // �ɼ� �ʼ� �Է�/���� üũ
        check_mandatory: function(obj) {

            var _is_oneclick = ($(obj).attr('opt_oneclick') && $(obj).attr('opt_oneclick') === 'Y');
            var _text = $(obj).get(0).tagName.toLowerCase() == 'input' &&  _is_oneclick !== true ? get_lang('enter') : get_lang('select');
            if ($(obj).attr('require') == 'Y' && $(obj).val().replace(/[\s]/g, '').length == 0) {
                alert(get_lang('require_option', '', _text));
                return false;
            }
            return true;
        },
        // �ɼ� ���� üũ
        pre_check_quantity: function(obj, option_mode, stock, k_no) {
            var _this = this;
            var _info = this.info;
            var _option = $('[name="pre_optionlist[]"].' + option_mode + '_option');
            var _sto_id = null;
            var _sto_state = null;
            var _sto_unlimit = null;
            var _sto_real_stock = 0;
            var _sto_stop_use = null;
            var _sto_stop_stock = null;
            var _quantity_state = true; // �ɼ� ���� ���� ��
            var _quantity_mode = (obj.tagName !== undefined);
            var _is_oneclick = false;
            var _page_type = this.info.page_type;

            if (_this.data['prd_info'] != '' && _this.data['prd_info'] != undefined) {
                if (k_no != undefined) {
                    _info = _this.data['prd_info'][k_no];    
                }
            }
            if (obj.tagName && obj.tagName.toLowerCase() == 'a') {
                // ��Ŭ��
                var _idx = $(obj).attr('opt_key');
                _is_oneclick = true;
            } else {
                var _idx = _option.index($(obj));
            }

            if (_quantity_mode === true) {
                if (option_mode == 'basic') {
                    switch (_info.option_display_type) {
                        case 'EACH':
                            if (_info.json[option_mode][_idx][0].opt_mix == 'Y') {
                                _sto_id = _info.json[option_mode][_idx][$(obj).val()].sto_id;
                                _sto_state = _info.json[option_mode][_idx][$(obj).val()].sto_state;
                                _sto_unlimit = _info.json[option_mode][_idx][$(obj).val()].sto_unlimit;
                                _sto_real_stock = _info.json[option_mode][_idx][$(obj).val()].sto_real_stock;
                                _sto_stop_use = _info.json[option_mode][_idx][$(obj).val()].sto_stop_use;
                                _sto_stop_stock = _info.json[option_mode][_idx][$(obj).val()].sto_stop_stock;
                            }
                            break;
                        case 'EVERY':
                            var _opt_id = [];
                            var _value = [];
                            $.each(_option, function(_i, _d) {
                                if ($(this).attr('opt_oneclick') && $(this).attr('opt_oneclick') == 'Y') {
                                    var _option_key = $(this).attr('opt_key');
                                    var _key = $('.MK-oneclick-sel[opt_key='+_option_key+']', '#detailpage').find('.MK-oneclick-link').attr('value');
                                } else {
                                    var _key = $(this).children('option:selected').val();
                                }
                                if (_info.json[option_mode][_i][0].opt_mix == 'Y' && _key !== undefined && _key.length > 0) {
                                    if (_info.json[option_mode][_i][_key] === undefined) {
                                        _opt_id.push(0);
                                    } else {
                                        _opt_id.push(_info.json[option_mode][_i][_key].opt_id);
                                    }
                                    _value.push(_info.json[option_mode][_i][0].opt_value.split(',')[_key]);
                                }
                            });

                            $.each(_info.json[option_mode][_idx], function(_i, _d) {
                                if (_d.opt_ids == _opt_id.join(',') && _d.opt_values == _value.join(',')) {
                                    _sto_id = _d.sto_id;
                                    _sto_state = _d.sto_state;
                                    _sto_unlimit = _d.sto_unlimit;
                                    _sto_real_stock = _d.sto_real_stock;
                                    _sto_stop_use = _d.sto_stop_use;
                                    _sto_stop_stock = _d.sto_stop_stock;
                                }
                            });
                            break;
                    }
                } else {
                    if ($.isEmptyObject(_info.json[option_mode][_idx]) === false) {
                        _sto_id = _info.json[option_mode][_idx][$(obj).val()].sto_id;
                        _sto_state = _info.json[option_mode][_idx][$(obj).val()].sto_state;
                        _sto_unlimit = _info.json[option_mode][_idx][$(obj).val()].sto_unlimit;
                        _sto_real_stock = _info.json[option_mode][_idx][$(obj).val()].sto_real_stock;
                        _sto_stop_use = 'Y'; // �����ɼ��� ������ �������
                        _sto_stop_stock = 0;
                    }
                }
            } else {
                if (option_mode == 'basic') {
                    switch (_info.option_display_type) {
                        case 'EACH':
                            $.each(_info.json[option_mode], function(idx, data) {
                                $.each(data, function(key, value) {
                                    if (obj.opt_id == value.opt_ids && obj.opt_value == value.opt_values) {
                                        _sto_unlimit = value.sto_unlimit;
                                        _sto_real_stock = value.sto_real_stock;
                                        _sto_stop_use = value.sto_stop_use;
                                        _sto_stop_stock = value.sto_stop_stock;
                                        return false;
                                    }
                                });
                            });
                            _sto_id = obj.sto_id;
                            _sto_state = obj.sto_state;
                            break;
                        case 'EVERY':
                            var _opt_id = [];
                            var _value = [];
                            $.each(this.data[option_mode][0], function(_i, _d) {
                                if (_info.json[option_mode][_i]) {
                                    var _values = _info.json[option_mode][_i][0].opt_value.split(',');
                                    var _key = $.inArray(_d.opt_value, _values);

                                    if (_info.json[option_mode][_i][0].opt_mix == 'Y' && _key >= 0) {
                                        _opt_id.push(_info.json[option_mode][_i][_key].opt_id);
                                        _value.push(_info.json[option_mode][_i][0].opt_value.split(',')[_key]);
                                    }
                                }
                            });

                            var _break = null;
                            $.each(_info.json[option_mode], function(idx, data) {
                                $.each(data, function(_i, _d) {
                                    if (_d.opt_ids == _opt_id.join(',') && _d.opt_values == _value.join(',')) {
                                        _sto_id = _d.sto_id;
                                        _sto_state = _d.sto_state;
                                        _sto_unlimit = _d.sto_unlimit;
                                        _sto_real_stock = _d.sto_real_stock;
                                        _sto_stop_use = _d.sto_stop_use;
                                        _sto_stop_stock = _d.sto_stop_stock;
                                        _break = false;
                                        return false;
                                    }
                                });
                                if (_break === false) {
                                    return false;
                                }
                            });
                            break;
                    }
                } else {
                    if ($.isEmptyObject(_info.json[option_mode][k_no]) === false) {
                        var _d = this.data[option_mode][k_no][0];
                        var _values = _info.json[option_mode][k_no][0].opt_value.split(',');
                        var _key = $.inArray(_d.opt_value, _values);

                        if ($.isEmptyObject(_info.json[option_mode][k_no][_key]) === false) {
                            _sto_id = _info.json[option_mode][k_no][_key].sto_id;
                            _sto_state = _info.json[option_mode][k_no][_key].sto_state;
                            _sto_unlimit = _info.json[option_mode][k_no][_key].sto_unlimit;
                            _sto_real_stock = _info.json[option_mode][k_no][_key].sto_real_stock;
                            _sto_stop_use = 'Y'; // �����ɼ��� ������ �������
                            _sto_stop_stock = 0;
                        }
                    }
                }
            }

            if (_info.option_type == 'NO') {
                var _json = _info.json.basic[0][0];
                _sto_id = _json.sto_id;
                _sto_state = _json.sto_state;
                _sto_unlimit = _json.sto_unlimit;
                _sto_real_stock = _json.sto_real_stock;
                _sto_stop_use = _json.sto_stop_use;
                _sto_stop_stock = _json.sto_stop_stock;
            }

            if (_sto_id !== null && _sto_id > 0) {
                switch (_sto_state) {
                    case 'SOLDOUT':
                    case 'TEMPOUT':
                    case 'HIDE':
                        var _txt = (_sto_state == 'TEMPOUT') ? get_lang('temporary') : '';
                        // �Ͻ� ǰ���� ��� '�Ͻ�' �޽��� �߰�
                        if (_info.option_type == 'NO') {
                            alert(get_lang('selected_product_soldout', ''));
                        } else {
                            if (_page_type == 'pop_soldout_alarm') { // ���԰� �˸� �˾��ΰ��
                                break;
                            } else {
                                // ���԰� �˸� ��� ������̰�, �ɼǺ� ���԰�����϶��� ����
                                if ($.inArray(_sto_state, ['TEMPOUT', 'SOLDOUT']) >= 0 && _info.soldout_type == 'SMS' && _info.is_opt_restock == 'Y') {
                                    var state_txt = _sto_state == 'TEMPOUT' ? '�Ͻ�ǰ��' : 'ǰ��';
                                    if (confirm('�����Ͻ� ��ǰ�� �ɼ��� '+ state_txt +' �Ǿ����ϴ�.\n�� �԰� �˸��� ��û�Ͻø�, '+ state_txt +' ��ǰ�� �� �԰� �Ǿ� �ǸŰ� ���۵� �� ȸ������ �޴������� �Ǹ� �˸� �޽����� �߼��� �帳�ϴ�.')) {
                                        warehousing_call(pre_option_manager.info.product_uid);
                                    }
                                } else {
                                    alert(get_lang('selected_option_soldout', _txt));
                                }
                            }
                        }

                        if (_is_oneclick ===  false) {
                            $(obj).val('').focus();
                        }
                        _quantity_state = false;
                        
                        if ($('.MS_package_checkbox') && $('.MS_package_checkbox').length > 0) {
                            $('#package_sodout_type').val('N');
                            $('#check_package_basket_'+k_no).attr('checked',false);
                        }
                        break;
                    default:
                        if (_page_type == 'pop_soldout_alarm') { // ���԰� �˸� �˾��ΰ��
                            alert('�����Ͻ� ��ǰ�� �ɼ��� �ٷ� ���� ������ ��ǰ�Դϴ�.');
                            if (_is_oneclick ===  false) { 
                                $(obj).val('').focus();
                            }
                            _quantity_state = false;
                            break;
                        }
                        if (_sto_unlimit == 'N') {
                            if (_sto_stop_use == 'Y') {
                                if ((_sto_real_stock - _sto_stop_stock) <= 0) {
                                    alert(get_lang('selected_option_soldout', ''));
                                    if (_is_oneclick ===  false) {
                                        $(obj).val('').focus();
                                    }
                                    _quantity_state = false;
                                } else if ((_sto_real_stock - _sto_stop_stock) < stock.numeric()) {
                                    alert(get_lang('selected_option_lower_quantity'));
                                    if (_quantity_mode === true && _is_oneclick ===  false) {
                                        $(obj).val('').focus();
                                    }
                                    _quantity_state = false;
                                }
                            }
                        }
                        break;
                }
            } else { //���տɼ� �ƴҶ�
                if (_info.basic_opt_mix != 'Y') { //�⺻ �ɼ��� ���տɼ� �ƴҶ�
                    if (_info.is_soldout == 'N') { // ǰ���� �ƴѰ��
                        if (_page_type == 'pop_soldout_alarm') { // ���԰� �˸� �˾��ΰ��
                            alert('�����Ͻ� ��ǰ�� �ɼ��� �ٷ� ���� ������ ��ǰ�Դϴ�.');
                            if (_is_oneclick ===  false) {
                                $(obj).val('').focus();
                            }
                            _quantity_state = false;
                        }
                    }
                }
            }
            return _quantity_state;
        },
        // �ɼ� ������ üũ
        check_data: function() {
            var _this = this;
            var _state = true;

            // �⺻ �ɼ� ���� ���� üũ
            $.each($('[name="pre_optionlist[]"].basic_option'), function(_i, _d) {
                var _is_oneclick = ($(this).attr('opt_oneclick') && $(this).attr('opt_oneclick') === 'Y');
                var _text = $(this).get(0).tagName.toLowerCase() == 'input' && _is_oneclick != true ? get_lang('enter') : get_lang('select');
                if ($(this).attr('require') == 'Y') {
                    if (_this.data.basic[0][_i] === undefined || _this.data.basic[0][_i].opt_id === undefined) {
                        alert(get_lang('require_option', '', _text));
                        $(this).focus();
                        _state = false;
                        return false;
                    }
                }
            });

            // �⺻ �ɼǺ��� ���õ��� �ʾҴٸ� ������
            if (_state === false) {
                return _state;
            }

            // ���� �ɼ� ���� ���� üũ
            $.each($('[name="pre_optionlist[]"].addition_option'), function(_i, _d) {
                if ($(this).attr('require') == 'Y') {
                    if (_this.data.addition[_i] === undefined || _this.data.addition[_i].opt_id === undefined) {
                        alert(get_lang('require_option', '', '����'));
                        $(this).focus();
                        _state = false;
                        return false;
                    }
                }
            });
            return _state;
        },
        // �ɼ� ������ �ʱ�ȭ
        unset_data: function() {
            // ���� ����� ���� �ʱⰪ ����
            if ($('[name="pre_optionlist[]"].basic_option').length > 0) {
                this.data.basic = [[]];
            }
            this.data.addition = [];
        },
        // �ɼ� ������ �߰�
        set_data: function() {
            var _this = this;
            var _info = this.info;
            var _form = $('#sms_form');
            var _value = [];
            var _price = 0;

            // ��Ŭ�� ������ Ȯ��
            _this.set_oneclick_data();

            _this.unset_data(); // ������ �ʱ�ȭ �� ������ ���� ����
            $.each($('[name="pre_optionlist[]"].basic_option'), function(_i, _d) {
                var _is_oneclick = ($(this).attr('opt_oneclick') && $(this).attr('opt_oneclick') === 'Y');
                if ($(this).val().length > 0 && $(this).val() != $(this).attr('title')) {

                    if (_is_oneclick === true) {
                        var _opt = $('.MK-oneclick-sel[opt_key='+$(_d).attr('opt_key')+']', '#detailpage').find('.MK-oneclick-link');
                      if (typeof(_opt.attr('title')) != 'undefined') {
                        _this.data.basic[0].push({
                            opt_id:     $(_d).attr('opt_id') || '0',
                            opt_type:   $(_d).attr('opt_type') || '0',
                            opt_value:  _opt.attr('opt_val'),
                            opt_stock:  $('#MS_amount_basic_0', '#detailpage').val() || 1,
                            opt_price:  _opt.attr('price') || '0',
                            sto_id:     _opt.attr('sto_id') || '0',
                            sto_state:  _opt.attr('sto_state') || '0'
                        });
                      }
                    } else if ($(this).get(0).tagName.toLowerCase() == 'input') {
                        _this.data.basic[0].push({
                            opt_id: $(this).attr('opt_id') || '0',
                            opt_type: $(this).attr('opt_type'),
                            opt_value: $(this).val(),
                            opt_stock: $('#MS_amount_basic_0', '#detailpage').val() || 1,
                            opt_price: '0',
                            sto_id: $(this).attr('sto_id') || '0'
                        });
                    } else {
                        _this.data.basic[0].push({
                            opt_id: $(this).attr('opt_id') || '0',
                            opt_type: $(this).attr('opt_type'),
                            opt_value: $(this).children('option:selected').attr('title'),
                            opt_stock: $('#MS_amount_basic_0', '#detailpage').val() || 1,
                            opt_price: $(this).children('option:selected').attr('price') || '0',
                            sto_id: $(this).children('option:selected').attr('sto_id') || '0',
                            sto_state: $(this).children('option:selected').attr('sto_state') || '0',
                        });
                    }
                    if (_info.page_type == 'pop_soldout_alarm') {
                        _value.push(_this.data.basic[0][_i].opt_value);
                        _price += _this.data.basic[0][_i].opt_price.numeric();
                    }
                } else {
                    _this.data.basic[0].push({});
                }
            });
            if (_info.page_type == 'pop_soldout_alarm') {
                $('input[name="sel_option[]"]').remove();
                $('input[name="sel_price[]"]').remove();
                if (_value.length > 0) {
                    _form.append($('<input/>', {type: 'hidden', name: 'sel_option[]', value: _value.join(',') }));
                    _form.append($('<input/>', {type: 'hidden', name: 'sel_price[]', value: _price + _info.product_price.numeric() }));
                    _value = [];
                }
            }

            // radio ���� ���
            if ($('[name^="pre_optionlist"][type="radio"]').length > 0) {
                var _radio_ids = [];
                $.each($('[name^="pre_optionlist"][type="radio"]:checked'), function(_i, _d) {
                    _radio_ids.push($(this).attr('opt_id'));
                    _this.data.basic[0].push({
                        opt_id: $(this).attr('opt_id') || '0',
                        opt_type: 'SELECT',
                        opt_value: $(this).attr('title'),
                        opt_stock: 1,
                        opt_price: $(this).attr('price'),
                        sto_id: $(this).attr('sto_id') || '0'
                    });
                });
            }

            $.each($('[name="pre_optionlist[]"].addition_option'), function(_i, _d) {
                var _addition_data = [];
                if ($(this).val().length > 0) {
                    _addition_data.push({
                        opt_id: $(this).attr('opt_id') || '0',
                        opt_value: $(this).children('option:selected').attr('title'),
                        opt_stock: $('#MS_amount_addition_' + _i, '#detailpage').val() || 1,
                        opt_price: $(this).children('option:selected').attr('price') || '0',
                        sto_id: $(this).children('option:selected').attr('sto_id') || '0'
                    });
                    _this.data.addition.push(_addition_data);
                    if (_info.page_type == 'pop_soldout_alarm') {
                        _form.append($('<input/>', {type: 'hidden', name: 'sel_option[]', value: $(this).children('option:selected').attr('title') }));
                        _form.append($('<input/>', {type: 'hidden', name: 'sel_price[]', value: $(this).children('option:selected').attr('price').numeric() + _info.product_price.numeric() }));
                    }
                } else {
                    _addition_data.push({});
                    _this.data.addition.push(_addition_data);
                }
            });
            return true;
        },
        set_stock: function(obj, stock) {
            if (obj === undefined) {return false;}
            $.each(obj, function(_i, _d) {
                _d.opt_stock = stock;
            });
        },
        // �ɼ� ���� ���� ó��
        set_amount: function(obj, option_mode, mode) {
            // �ɼ� ���� ������� ó��
            if (typeof $(obj).val() == 'undefined' || $(obj).val().replace(/[\s]/g, '').length == 0) {
                this.set_data();
            }
            var _form = $('form[name="detailform"]');
            var _this = this;
            var _obj = typeof obj === 'string' ? $('#' + obj, _form) : $(obj);
            var _idx = typeof obj === 'string' ? obj.replace('MS_amount_' + option_mode + '_', '') : $(obj).attr('id').replace('MS_amount_' + option_mode + '_', '');
            var _option_amount = $(_obj).filter('input.' + option_mode + '_option');
            var _amount = _obj.val().numeric();
            var _data = option_mode == 'basic' ? _this.data[option_mode][0][_idx] : _this.data[option_mode][_idx];

            // ��Ű�� ��ǰ��� ����ǰ���� �ּ�/�ִ� ���� �� üũ�ǵ��� ��
            if ($('#package_maxorder_count'+_idx,_form).val() != undefined) {
                var _maxorder_count = $('#package_maxorder_count'+_idx,_form).val();
            }  else {
                var _maxorder_count = this.get_max_amount(option_mode);
            }
            if ($('#package_minorder_count'+_idx,_form).val() != undefined) {
                var _minorder_count = $('#package_minorder_count'+_idx,_form).val();
            }  else {
                var _minorder_count = this.get_min_amount(option_mode);
            }

            if (_amount.length == 0) {
                alert(get_lang('quantity_numbers'));
                _this.set_stock(_this.data[option_mode][_idx], _minorder_count);
                _obj.val(_minorder_count);
                return false;
            }

            if(_amount == 0) {
                _amount = '';
            }

            /**
             * 2017. 12. 01 
             * this.get_min_amount(option_mode) -> _minorder_count ����
             */
             // ��ǰ �ּҼ��� ������ �ּҼ����� ���� (�ּҼ�����������ŭ ����/����) ó��
             if (this.get_min_add_amount(option_mode) != 1 && (_amount % this.get_min_add_amount(option_mode)) != 0) {
                 _amount = this.get_min_add_amount(option_mode) * Math.floor(_amount / this.get_min_add_amount(option_mode));
                 if (_amount == 0) {                                                                                                   
                     _amount = this.get_min_add_amount(option_mode);                                                                   
                 }
             }                                               
             // ���������� �� ����
             switch (mode) {
                 case 'up': _amount += this.get_min_add_amount(option_mode); break;
                 case 'down': _amount -= this.get_min_add_amount(option_mode); break;
             }

            if (_amount < _minorder_count) {
                alert(get_lang('min_amount', _minorder_count));
                _this.set_stock(_this.data[option_mode][_idx], _minorder_count);
                _obj.val(_minorder_count);
                return false;
            }
            
            if (_amount.length != 0 && _amount < 1) {
                alert(get_lang('min_amount2', _minorder_count));
                _this.set_stock(_this.data[option_mode][_idx], _minorder_count);
                _obj.val(_minorder_count);
                return false;
            }

            if (_amount > _maxorder_count) {
                alert(get_lang('max_amount', _maxorder_count));
                _this.set_stock(_this.data[option_mode][_idx], _maxorder_count);
                _obj.val(_maxorder_count);
                return false;
            }

            if (_data !== undefined) {
                var _stock_state = true;
                // ��Ʈ��ǰ üũ�ڽ��� �����ϴ°��
                if ($('.MS_package_checkbox') && $('.MS_package_checkbox').length > 0) {
                    if (_this.data[option_mode][0][_idx]) {
                        if (_this.check_quantity(_this.data[option_mode][0][_idx], option_mode, _amount, _idx) === false) {
                            _stock_state = false;
                            return false;
                        }
                    }
                } else {
                    if (_this.data[option_mode][_idx] !== undefined) {
                        $.each(_this.data[option_mode][_idx], function(key, value) {
                            if (_this.pre_check_quantity(value, option_mode, _amount, _idx) === false) {
                                _stock_state = false;
                                return false;
                            }
                        });
                    }
                }
                // ������ �����Ҽ� ���� ��쿣 ���⼭ ����
                if (_stock_state === false) {
                    if (mode === undefined) {
                        _this.set_stock(_this.data[option_mode][_idx], _minorder_count);
                        _obj.val(_minorder_count);
                        _this.pre_sum_total_price();
                    }
                    return false;
                }
            }

            if (_data !== undefined) {
                _this.set_stock(_this.data[option_mode][_idx], _amount.toString());
            }

            // ���� ����
            _obj.val(_amount);
            var _tmp_bulk_dc_price = 0;
            var _bulk_condition = 'N';
            if (this.info.is_bulk == 'Y' && option_mode == 'basic' && $('.MK_dc_price_sell', _form) !== undefined) {
                var _product_price   = pre_option_manager.info.product_price.numeric();
                var _b_product_price = '';
                var _origin_price = _product_price; 
                //���� ���� Ȯ��
                $.each(pre_option_manager.info.bulk_arr_info, function(i,d) {
                    //�뷮���� ���� ����
                    if (_amount >= d[0] && _amount <= d[1]) {
                        _product_price = d[2];
                        _bulk_condition = 'Y';
                    }
                    if (i == pre_option_manager.info.bulk_arr_info.length - 1) {
                        _b_product_price = d[2]; 
                    }
                });
                //���� ���� ���� ���� ���, ��������(�뷮�������� ���� ����)
                if (_bulk_condition == 'N') {
                    _product_price = _b_product_price;
                }
                if (this.info.option_type == 'NO') {
                    _tmp_bulk_dc_price = _product_price;
                    _tmp_product_price = (_product_price * _amount);
                    $('.MK_dc_price_sell',_form).empty().append(_tmp_product_price.number_format());
                //�ɼ� �ִ� ��� _ ���� �޶��� ��쿡�� UPDATE
                } else if (_product_price != _origin_price) {
                    //�ɼ�
                    if (pre_option_type == 'PS') {
                        this.bulk_option_update();
                    }
                    $('.MK_dc_price_sell',_form).empty().append(_product_price.number_format());
                    //����� ���ΰ��� ����
                    pre_option_manager.info.product_price = _product_price;
                    this.set_data();
                }
            } else if (this.info.is_bulk != 'Y' && $('.MK_dc_price_sell', _form) !== undefined) {
                if (this.info.option_type == 'NO' && typeof($('#pre_disprice_wh').val()) != 'undefined') {
                    var _new_dc_price = $('#pre_disprice_wh').val() * _amount; 
                    $('.MK_dc_price_sell',_form).empty().append(_new_dc_price.number_format());
                }
            }
            if (this.info.option_type != 'NO') {
                _this.pre_sum_total_price();
            }

            //whitesal 

            if(document.getElementById('pre_option_type_wh')) {
                var optionobj = document.getElementById('pre_option_type_wh').value;
            } 
            
            if (optionobj != 'NO' && optionobj != '') {
                return;
            }
            
            // ��ǲ�ڽ� ��������.
            jQuery(document).ready(function(){
                jQuery("#pre_goods_amount").change(function(){
                    var amount = parseInt(document.getElementById('pre_goods_amount').value);
                    if (is_unify_opt == true) {
                        if(!amount) {amount = 1;}
                        document.getElementById('pre_goods_amount').value = _amount;
                        amount = parseInt(document.getElementById('pre_goods_amount').value);
                        set_amount(this, 'basic', 'up');
                    }
                });
            });

            // �ǸŰ���
            var price_value = document.getElementById('pre_pricevalue');
            if(price_value) {
                var price = parseInt(document.getElementById('pre_price_wh').value.replace(/,/g, ''), 10);
                var total_str = change_price_str(price_value, price, _amount);
                if(total_str)
                    price_value.innerHTML = total_str;
            }
        },
        // �ɼ� �Ѱ��� ���
        pre_sum_total_price: function() {
            var _form = $('form[name="detailform"]');
            var _product_price = this.info.product_price.numeric();
            var _basic_price = 0;
            var _basic_single_price = 0;
            var _addition_price = 0;
            var _option_price = 0;
            var _stock = 1;

            // �⺻�ɼ� �Ѱ��� ���
            $.map(this.data.basic, function(data, idx) {
                if (data.length == 0) {return true;}
                $.map(data, function(_d, _i) {
                    if (_d !== undefined && _d.opt_id !== undefined) {
                        if (_d.opt_type == 'SINGLE') {
                            // ���Ϻΰ�
                            _basic_single_price += _d.opt_price.numeric();
                        } else {
                            // �ߺ��ΰ�
                            _basic_price += _d.opt_price.numeric();
                        }
                        if (_d.opt_stock !== undefined && _d.opt_stock.length > 0) {
                            _stock = _d.opt_stock.numeric();
                        }
                    }
                });
            });
            _basic_price *= _stock;
            _basic_price += _basic_single_price;
            var opt_sum_price = 0;
            var opt_sum_value = 0;
            $('input[name="pre_hy_option[]"]', _form).each(function(i) {
                if ($(this).is(':checked') === true) {
                    var _chk_id = $(this).attr('id').replace("chk_","");
                    var str_id = _chk_id.substr(0,1);
                    var opt_price = $(this).attr('opt_price');
                    var cnt = $('#pre_hy_qrt_'+ _chk_id, _form).val();
                    opt_sum_value += opt_price.numeric() * cnt.numeric();
                }
            });

            // �����ɼ� �Ѱ��� ���
            $.map(this.data.addition, function(data, idx) {
                if (data.length == 0) {return true;}
                // ������ Ÿ���� ��ٱ��� �˾��� ��ǰ �󼼰� �ٶ� type casting ����
                data = data.length > 0 ? data : Array(data);
                $.map(data, function(_d, _i) {
                    if (_d !== undefined && _d.opt_id !== undefined) {
                        _addition_price += _d.opt_price.numeric() * _d.opt_stock.numeric();
                    }
                });
            });

            // �⺻�ɼ�, �����ɼ� ������ ���� ����� ���ɼ��� �ֱ⿡ ���� �������
            // option_type == 'NO' �� ��� ������ ���� �ٸ�
            if (this.info.option_type == 'NO') {
                _option_price = (_product_price * _stock).numeric();
            } else {
                _option_price = (_product_price * _stock).numeric() + _basic_price.numeric() + _addition_price.numeric() + opt_sum_value.numeric();
            }
            if ($('#pre_price_text', _form).length == 0) {
                $('#MK_p_total', _form).text(_option_price.number_format());
            } else {
                $('#pre_price_text', _form).text(_option_price.number_format());
            }

            if ($('#pre_price_text_usd', _form) && typeof exchange_rate != 'undefined' && typeof shop_language != 'undefined' && shop_language == 'eng') {
                $('#pre_price_text_usd', _form).text(price_exchange(exchange_rate, _option_price));
            }
        },
        print_option: function(form_name, mode) {
            var _form = $('form[name=detailform]');
            var _this = this;
            var _info = this.info;
            var _json = this.info.json;
            var _options = [];

            // �ʼ� �ɼǵ��� �����ߴ��� üũ
            // ���ø���Ʈ�϶� üũ ����
            if (mode != 'wish' && this.check_data() === false) {
                return false;
            }

            var _opt_id = [];
            var _opt_value = [];
            // ���յ� �ɼ��ε� sto_id�� ���� ���� �ʴٸ� ã�� ���� �˻� ���� ������
            $.each(this.data.basic[0], function(idx, data) {
                if (data === undefined || data.opt_id === undefined) {return true;}
                if (_json.basic[idx][0].opt_mix == 'Y' && data.sto_id == 0) {
                    _opt_id.push(data.opt_id);
                    _opt_value.push(data.opt_value);
                }
            });

            var _dummy = null;
            _opt_id = _opt_id.join(',');
            _opt_value = _opt_value.join(',');
            // ������ �˻� ���� �̿��� sto_id�� ã�� �ش� data�� _dummy�� ����
            if (_opt_id.length > 0 && _opt_value.length > 0) {
                $.each(_json.basic, function() {
                    if (_dummy === null) {
                        $.each(this, function(idx, data) {
                            if (_opt_id == data.opt_ids && $.trim(_opt_value) == $.trim(data.opt_values)) {
                                _dummy = data;
                                return false;
                            }
                        });
                    } else {
                        return false;
                    }
                });
            }

            // ��ٱ��� ������ ���� �ɼ� element ����
            $.each(this.data, function(option_mode, datas) {
                var _no = 0;
                var _dummy_key = 0;
                // �⺻/���� �ɼǿ� ���� element name�� �޸� �ϱ� ����
                var _option_name = option_mode == 'basic' ? 'option[basic][0]' : 'option[addition]';
                // �⺻/���� �ɼǿ� ���� ����ϴ� �����Ͱ� �ٸ�
                datas = option_mode == 'basic' ? datas[0] : datas;
                $.each(datas, function(idx, data) {
                    // �����Ͱ� ���� ��� �ǳʶ�
                    if (option_mode == 'addition') {data = data[0];}
                    if (data === undefined || data.opt_id === undefined) {
                        var _opt = $('[name="pre_optionlist[]"].' + option_mode + '_option:eq(' + idx + ')', _form);
                        if (_opt.get(0).tagName.toLowerCase() == 'input') {
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_id]" value="' + _opt.attr('opt_id') + '" class="MS_option_values" />');
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_type]" value="' + _opt.attr('opt_type') + '" class="MS_option_values" />');
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_value]" value="' + get_lang('no_input_txt') + '" class="MS_option_values" />');
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_stock]" value="' + $('#MS_amount_basic_0', _form).val() + '" class="MS_option_values" />');
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][sto_id]" value="0" class="MS_option_values" />');
                        } else {
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_id]" value="' + _opt.attr('opt_id') + '" class="MS_option_values" />');
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_value]" value="' + get_lang('non_option_txt') + '" class="MS_option_values" />');
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_stock]" value="' + $('#MS_amount_basic_0', _form).val() + '" class="MS_option_values" />');
                            _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][sto_id]" value="0" class="MS_option_values" />');
                        }
                    } else {
                        if (option_mode == 'basic' && _dummy !== null && _json[option_mode][idx][0].opt_mix == 'Y') {
                            _dummy_key = idx; // ���յ� �ɼ��� �迭 Ű���� ����
                            return true;
                        }
                        _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_id]" value="' + data.opt_id + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_value]" value="' + data.opt_value + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_stock]" value="' + data.opt_stock + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][sto_id]" value="' + data.sto_id + '" class="MS_option_values" />');
                    }
                    _no++;
                });
                // ���� �ɼǿ� ���� element�� ������
                if (option_mode == 'basic' && _dummy !== null) {
                    _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_id]" value="' + _dummy.opt_ids + '" class="MS_option_values" />');
                    _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_type]" value="' + _dummy.opt_type + '" class="MS_option_values" />');
                    _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_value]" value="' + _dummy.opt_values + '" class="MS_option_values" />');
                    _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][opt_stock]" value="' + datas[_dummy_key].opt_stock + '" class="MS_option_values" />');
                    _options.push('<input type="hidden" name="' + _option_name + '[' + _no + '][sto_id]" value="' + _dummy.sto_id + '" class="MS_option_values" />');
                }
            });

            // �߰��� �ɼ��� ���� ��� ����
            $('input.MS_option_values', _form).remove();
            // ���õ� �ɼ��� �ϳ��� ���� ��� ó��
            if (_options.length == 0) {
                $.each($('[name="pre_optionlist[]"].basic_option', _form), function(_i, _d) {
                    if ($(this).get(0).tagName.toLowerCase() == 'input') {
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][opt_id]" value="' + $(this).attr('opt_id') + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][opt_type]" value="' + $(this).attr('opt_type') + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][opt_value]" value="' + get_lang('no_input_txt') + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][opt_stock]" value="' + $('#MS_amount_basic_0', _form).val() + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][sto_id]" value="0" class="MS_option_values" />');
                    } else {
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][opt_id]" value="' + $(this).attr('opt_id') + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][opt_type]" value="' + $(this).attr('opt_type') + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][opt_value]" value="' + get_lang('non_option_txt') + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][opt_stock]" value="' + $('#MS_amount_basic_0', _form).val() + '" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="option[basic][0][' + _i + '][sto_id]" value="0" class="MS_option_values" />');
                    }
                });

                $.each($('[name="pre_optionlist[]"].addition_option'), function(_i, _d) {
                    _options.push('<input type="hidden" name="option[addition][' + _i + '][opt_id]" value="' + $(this).attr('opt_id') + '" class="MS_option_values" />');
                    _options.push('<input type="hidden" name="option[addition][' + _i + '][opt_type]" value="' + $(this).attr('opt_type') + '" class="MS_option_values" />');
                    _options.push('<input type="hidden" name="option[addition][' + _i + '][opt_value]" value="' + get_lang('non_option_txt') + '" class="MS_option_values" />');
                    _options.push('<input type="hidden" name="option[addition][' + _i + '][opt_stock]" value="1" class="MS_option_values" />');
                    _options.push('<input type="hidden" name="option[addition][' + _i + '][sto_id]" value="0" class="MS_option_values" />');
                });
            }

            if (_info.option_type == 'HYBRID') {
                var idx = 0;
                var option_chk = false;
                var _cnt = $('#MS_pre_basic_product').val();
                var _opt_id = '';
                var group_stock = [];
                var group_min_amount = [];
                var group_name = [];
                $('input[name="pre_hy_option[]"]').each(function() {
                    var _option_name = 'option[basic]['+ idx +'][0]';
                    var _option_title = $(this).attr('opt_title');
                    var _opt_stock = $('#' + $(this).attr('sto_key').replace('key', 'pre_hy_qrt')).val();
                    var amount_min = $(this).attr('amount_min').split(",");
                    _opt_id = $(this).attr('opt_id');
                    group_min_amount[parseInt(_opt_id)] = parseInt(amount_min[1]);
                    group_name[parseInt(_opt_id)] = _option_title;
                    if($(this).is(':checked') == true) {
                        if (group_stock[parseInt(_opt_id)] > 0) {
                            group_stock[parseInt(_opt_id)] += parseInt(_opt_stock);
                        } else {
                            group_stock[parseInt(_opt_id)] = parseInt(_opt_stock);
                        }
                        _options.push('<input type="hidden" name="amount[]" value="'+ _cnt +'" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[opt_id]" value="'+ $(this).attr('opt_id') +'" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[opt_type]" value="'+ $(this).attr('opt_type') +'" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[opt_value]" value="'+ $(this).attr('opt_name') +'" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[opt_stock]" value="'+ _opt_stock +'" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[sto_id]" value="'+ $(this).attr('sto_id') +'" class="MS_option_values" />');
                        _options.push('<input type="hidden" name="' + _option_name + '[prd_stock]" value="'+ _cnt+'" class="MS_option_values" />');
                        idx++;
                        option_chk = true; 
                    }  else {
                        if (group_stock[parseInt(_opt_id)] > 0) {
                            group_stock[parseInt(_opt_id)] += 0;
                        } else {
                            group_stock[parseInt(_opt_id)] = 0;
                        }
                    }
                });
                if (mode != 'wish') {
                    if (option_chk === false) {
                        alert(get_lang('not_selected'));
                        return false;
                    }
                    
                    // ���̺긮�� �׷캰 �ɼ� �ּҼ��� üũ
                    for (var i = 1; i <= group_stock.length; i++) {
                        if (group_stock[i] < group_min_amount[i]) {
                            alert(group_name[i] + '�ɼǱ׷��� �ּ� ���� ������ (' + group_min_amount[i] + ') �Դϴ�.');
                            return false;
                        }
                    }
                }
            }

            // ������ �ɼ� input ������ append��
            $('form[name="' + form_name + '"]').append(_options.join('\n'));
        },
        bulk_option_update: function() {
            if (this.info.option_type == 'NO' || $('[name="pre_optionlist[]"].basic_option').length == 0) {
                return false;
            }
            var bulk_option_select = '';
            var _form = $('form[name="detailform"]');
            //�뷮��������+�ɼ����������� ��쿡�� Ÿ����.
            var local_url = '/shop/bulk_block_option.ajax.html';
            var _this = this;
            $.ajax({
                url      : local_url,
                type     : 'POST',
                dataType : 'JSON',
                async    : false,
                data     : {
                            option_js : 'option',
                            uid       : pre_option_manager.info.product_uid,
                            amount    : $('#MS_amount_basic_0', _form).val(),
                            option_display_type : pre_option_manager.info.option_display_type 
                            },
                success  : function(res) {
                    if (res.result === true) {
                        $.each(res.option, function(k, v) {
                            //oneclick �ɼ�
                            if (v.opt_type == 'oneclick') {
                                //���� select �� ���� �ʿ�. 
                                var oneclick_val = '';
                                var opt_info     = v.chg_option;
                                $('.MK-oneclick-li[opt_key='+k+'] a', _form).each(function(opt_i){
                                    $(this).attr('title', opt_info[opt_i]['title']);
                                    $(this).attr('price', opt_info[opt_i]['price']);
                                });
                                
                                oneclick_val = $('.MK-oneclick-list[opt_key='+k+']', _form).siblings('input[name="pre_optionlist[]"]', _form).val();
                                if (opt_info[oneclick_val] != undefined && opt_info[oneclick_val]['title'].length > 0) {
                                    $('.MK-oneclick-value[opt_key='+k+']', _form).text(opt_info[oneclick_val]['title']);
                                }
                                //������ �ɼ�
                            } else if (v.select != undefined && v.opt_type == "select") {
                                var opt_mix = $('select[name="pre_optionlist[]"][opt_id='+v.opt_id+']', _form).attr('opt_mix') == undefined ? "N" : $('select[name="pre_optionlist[]"][opt_id='+v.opt_id+']', _form).attr('opt_mix');
                                if ($.isNumeric(v.opt_id) == false || opt_mix == 'N') {
                                    var opt_info = v.chg_option;
                                    $('select[name="pre_optionlist[]"][opt_id=\''+v.opt_id+'\'] option', _form).each(function(opt_i){
                                        if (opt_i != 0 && $(this).text() != '���þ���') {
                                            $(this).text(opt_info[opt_i-1]['title']);
                                            $(this).attr('price', opt_info[opt_i-1]['price']);
                                        }
                                    });
                                //����_�и��� �ɼ�
                                } else {
                                    pre_option_manager.info.json = eval("("+res.json+")");
                                    $('select[name="pre_optionlist[]"][opt_id=\''+v.opt_id+'\'] option', _form).each(function(opt_i){
                                        $(this).text($(this).attr('title'));
                                    });
                                }
                            }
                        });
                        pre_option_value_replace('', 'Y');
                    }
                },
            });
        }
    };

    // �ɼ� �� ����
    window.pre_option_value_replace = function(_uid, _after_bulk) {
        // �⺻ �ɼ��� ��� �ֻ��� �ɼ��� ������ ���� �ɼ��� ���� ����д�.
        // ���������� �ɼ��� �����ϸ� ���� �ɼ��� append ��
        var _uid = _uid || ''; // ��Ű���� �Բ� ����ϱ� ����
        var _option_list = $('[name="pre_optionlist' + _uid + '[]"].basic_option');
        var _mix_option_num = 1;
        var _mix_option_count = _option_list.filter('[opt_mix="Y"]').length;
        var _opt_ids = '';
        var _opt_values = '';
        var _cart_opt_ids = '';
        var _cart_opt_values = '';

        var _tmp_sto_matrix  = new Array();
        var _selected_matrix = '';
        var _cnt = 0;
        var _after_bulk = _after_bulk || 'N'; //�뷮���� ���� ȣ�� ��
        //�뷮��������_���� ����� ���.
        if (pre_option_manager.info.is_bulk == 'Y') {
            $.each(_option_list, function(b_i, b_d) {
                if ($(this).attr('opt_mix') == 'Y') {
                    $(this).attr('opt_id')
                    if ($(this).children("option:selected").attr('matrix') != undefined) {
                        _tmp_sto_matrix.push($(this).attr('opt_id')+':'+$(this).children("option:selected").attr('matrix'));
                    }
                    _cnt++;
                }
            });
            if ( _tmp_sto_matrix.length == _cnt) {
                _tmp_sto_matrix.pop();
                _selected_matrix = _tmp_sto_matrix.join(',');
                _selected_matrix += ',';
            }
        }
        $.each(_option_list, function(key, data) {
            // '���þ���' �ɼ� ������
            if ($(this).is('select') === false) {                   // ��Ŭ�� �ɼ�
                if (pre_option_manager.info.option_display_type == 'EVERY' && $(this).attr('opt_mix') == 'Y' && _mix_option_count > 1 && _mix_option_num < _mix_option_count) {
                    if (typeof cart_option_json != 'undefined' || key == 0) {
                        if (typeof cart_option_json != 'undefined') {
                            $.each(cart_option_json.basic, function(_idx, _data) {
                                _cart_opt_ids = _cart_opt_ids + cart_option_json.basic[_idx][key].opt_id + ',';
                                _cart_opt_values = _cart_opt_values + cart_option_json.basic[_idx][key].opt_value + ',';
                            });
                        }
                    }
                }

                var _idx = $(this).attr('opt_key');
                var _ul = $('.MK-oneclick-list[opt_key='+_idx+']', '#detailpage');
                var _op = $(this);

                // ���� �ɼ� ��� disable
                if (key > 0 && _op.attr('opt_mix') == 'Y') {
                    _ul.find('.MK-oneclick-li').addClass('MK-oneclick-dis');
                }

                // ������� �ɼ� ����
                if (_op.attr('opt_mix') == 'Y' && _mix_option_count > 1) {
                    var _opt_ids = '';
                    var _opt_values = '';

                    $.each(_ul.find('.MK-oneclick-link'), function(_i, _d) {
                        _opt_ids = _op.attr('opt_id');
                        _opt_values = $(this).attr('title');
                        if (_op.attr('opt_mix') == 'Y' && pre_option_manager.check_show_option(_opt_ids, _opt_values) === false) {
                            $(this).parents('.MK-oneclick-li').hide();
                        }
                    });
                }
                // �ɼǵ��� ������ ù��°, ���þ��� �ɼ��� ����
                if ($(this).attr('opt_mix') == 'Y' && _mix_option_count == 1) {
                    if (typeof cart_option_json != 'undefined' && pre_option_manager.info.option_display_type == 'EVERY') {
                        var _tmp_cart_data = new Array();
                        $.each(pre_option_manager.info.json.basic[key], function(_search_key, _search_data) {
                            if (_cart_opt_ids == _search_data.opt_ids.substring(0, _cart_opt_ids.length) && $.trim(_cart_opt_values) == $.trim(_search_data.opt_values).substring(0, $.trim(_cart_opt_values).length)) {
                                _tmp_cart_data.push(_search_data);
                            }
                        });
                    }
                    $.each(_ul.find('.MK-oneclick-link'), function(_i, _d) {
                        try {
                            var _opt = $(this);
                            var _add_text = '';
                            var _add_price = '';
                            var _text = _opt.attr('opt_val');
                            var _data = pre_option_manager.info.json.basic[key][_i];
                            if (typeof cart_option_json != 'undefined' && pre_option_manager.info.option_display_type == 'EVERY') {
                                var _tmp_use = false;
                                var _tmp_idx = null;
                                $.each(_tmp_cart_data, function(_tmp_key, _tmp_data) {
                                    if (_cart_opt_values + _text == _tmp_data.opt_values) {
                                        _tmp_idx = _tmp_key;
                                        _tmp_use = true;
                                    }
                                });
                                if (_tmp_use === false) {
                                    _opt.remove();
                                    _data = null;
                                } else {
                                    _data = _tmp_cart_data[_tmp_idx];
                                }
                            }

                            if (_data !== null) {
                                // view_member_only_price, IS_LOGIN �ɼ��� �߰� �ݾ� ó���� ���� ��ǰ �󼼿��� ���� ��
                                if (typeof view_member_only_price != 'undefined' && view_member_only_price == 'Y' && typeof IS_LOGIN != 'undefined' && IS_LOGIN === 'false') {
                                    _add_price = '';
                                } else {
                                    // �и����� ��� �߰��ݾ��� �߰�����
                                    if (pre_option_manager.info.option_display_type == 'EVERY') {
                                        if (_data.sto_price > 0) {
                                            _add_price = '(+' + (Math.abs(parseInt(_data.sto_price, 10))).number_format() + ')';
                                            _opt.attr('price', parseInt(_opt.attr('price'), 10) + Math.abs(parseInt(_data.sto_price, 10)));
                                        } else if (_data.sto_price < 0) {
                                            _add_price = '(-' + (Math.abs(parseInt(_data.sto_price, 10))).number_format() + ')';
                                            _opt.attr('price', parseInt(_opt.attr('price'), 10) - Math.abs(parseInt(_data.sto_price, 10)));
                                        }
                                        // �ǸŰ� ���������� ��� (discount_percent)
                                        _opt.attr('org_opt_price', Math.abs(parseInt(_data.org_opt_price, 10)));
                                    }
                                }
                            }

                            switch (_data.sto_state) {
                                case 'HIDE': $(this).parents('.MK-oneclick-li').hide(); break;
                                case 'SOLDOUT': 
                                    _add_text = ' - ' + get_lang('soldout_txt'); 
                                    $(this).parents('.MK-oneclick-li').addClass('MK-oneclick-dis');
                                    break;
                                case 'TEMPOUT': 
                                    _add_text = ' - ' + get_lang('tempsoldout_txt'); 
                                    $(this).parents('.MK-oneclick-li').addClass('MK-oneclick-dis');
                                    break;
                                case 'DELAY': _add_text = ' - ' + get_lang('shipping_txt'); break;
                                case 'SALE':
                                    var _is_unlimit = _data.sto_unlimit == 'Y' ? true : false;
                                    if (_is_unlimit === true) {
                                        _add_text = '';
                                    } else if (_data.sto_stop_use == 'Y' && (_data.sto_real_stock - _data.sto_stop_stock) <= 0 && _add_text.length == 0) {
                                        _add_text = ' - ' + get_lang('soldout_txt');
                                        $(this).parents('.MK-oneclick-li').addClass('MK-oneclick-dis');
                                    }

                                    if (pre_option_stock_display != 'NO' && _add_text.length == 0) {
                                        if (_data.sto_stop_use == 'Y') {
                                            var sto_now_stock = Math.max(0, _data.sto_real_stock - _data.sto_stop_stock);
                                            if (pre_op_stock_count_display != 'NULL' && sto_now_stock <= pre_op_stock_count_display || pre_op_stock_count_display == 'NULL') {
                                                _add_text = ' - (' + get_lang('stock_title') + ' : ' + sto_now_stock + ' ' + get_lang('stock_unit') + ')';
                                            }
                                        } else {
                                            _is_unlimit = true;
                                        }
                                        if (_is_unlimit === true && (pre_option_stock_display == 'DISPLAY'|| pre_option_stock_display == 'LIMIT')){
                                            if (pre_op_stock_limit_display == 'N') {
                                                _add_text = ' - (' + get_lang('stock_title') + ' : ' + get_lang('stock_unlimit') + ')';
                                            } else {
                                                _add_text = '';
                                            }
                                        }
                                    }
                                    break;
                            }
                            if (typeof option_note_display != 'undefined' && option_note_display == 'DISPLAY' && _data.sto_note.length > 0) {
                                _add_text += '(' + _data.sto_note.substr(0, 20) + ')';
                            }
                            _opt.attr('title', _text + _add_price + _add_text);
                        } catch (e) {
                            return true;
                        }
                    });
                }
                
            } else {
                // package �� ��� �ɼ� �������� ����
                if($('#product_type').val() != "PACKAGE") {
                    if ($(this).attr('opt_mix') == 'Y') {
                        $(this).children('option[title="' + get_lang('non_option_txt') + '"][value=0]').remove();
                    }
                }
                if (pre_option_manager.info.option_display_type == 'EVERY' && $(this).attr('opt_mix') == 'Y' && _mix_option_count > 1 && _mix_option_num < _mix_option_count) {
                    if (typeof cart_option_json != 'undefined' || key == 0) {

                        $.each($(this).children('option').not(':first').not('option:contains("' + get_lang('non_option_txt') + '")'), function(_i, _d) {
                            _opt_ids = key === 0 ? $(this).parents('select:first').attr('opt_id') : _cart_opt_ids + $(this).parents('select:first').attr('opt_id');
                            _opt_values = key === 0 ? $(this).attr('title') : _cart_opt_values + $(this).attr('title');
                            if ($(this).parents('select:first').attr('opt_mix') == 'Y' && pre_option_manager.use_child_option(key, _opt_ids, _opt_values) === false) {
                                $(this).remove();
                            }
                        });

                        if (typeof cart_option_json != 'undefined') {
                            $.each(cart_option_json.basic, function(_idx, _data) {
                                _cart_opt_ids = _cart_opt_ids + cart_option_json.basic[_idx][key].opt_id + ',';
                                _cart_opt_values = _cart_opt_values + cart_option_json.basic[_idx][key].opt_value + ',';
                            });
                        }
                    }
                }
                // �ɼǵ��� ������ ù��°, ���þ��� �ɼ��� ����
                if ($(this).attr('opt_mix') == 'Y' && _mix_option_count == _mix_option_num) {
                    if (typeof cart_option_json != 'undefined' && pre_option_manager.info.option_display_type == 'EVERY') {
                        var _tmp_cart_data = new Array();
                        $.each(pre_option_manager.info.json.basic[key], function(_search_key, _search_data) {
                            if (_cart_opt_ids == _search_data.opt_ids.substring(0, _cart_opt_ids.length) && $.trim(_cart_opt_values) == $.trim(_search_data.opt_values).substring(0, $.trim(_cart_opt_values).length)) {
                                _tmp_cart_data.push(_search_data);
                            }
                        });
                    }
                    var _tmp_opt_id = $(this).attr('opt_id');
                    var _bulk_i     = new Array();
                    if (_selected_matrix.length > 0) {
                        var _bulk_json  = pre_option_manager.info.json.basic[key];
                        $.each(_bulk_json, function(_k, _v) {
                            if (_v['sto_matrix'].indexOf(_selected_matrix) == 0) {
                                _bulk_i.push(_k);
                            }
                        });
                        
                    }

                    $.each($(this).children('option').not(':first').not('option:contains("' + get_lang('non_option_txt') + '")'), function(_i, _d) {
                        if ($(this).text() != get_lang('non_option_txt')) { // �ѹ��� �˻�
                            try {
                                var _opt = $(this);
                                var _add_text = '';
                                var _add_price = '';
                                var _text = _opt.text();
                                var _opt_matrix = _tmp_opt_id + ':' +_opt.attr('matrix');
                                var _data = pre_option_manager.info.json.basic[key][_i];
                                $.each(pre_option_manager.info.json.basic[key], function(_i, _d) {
                                    if(_opt_matrix == _d.sto_matrix) {
                                        _data = _d;
                                    }
                                });
                                if (typeof cart_option_json != 'undefined' && pre_option_manager.info.option_display_type == 'EVERY') {
                                    var _tmp_use = false;
                                    var _tmp_idx = null;
                                    $.each(_tmp_cart_data, function(_tmp_key, _tmp_data) {
                                        if (_cart_opt_values + _text == _tmp_data.opt_values) {
                                            _tmp_idx = _tmp_key;
                                            _tmp_use = true;
                                        }
                                    });
                                    if (_tmp_use === false) {
                                        _opt.remove();
                                        _data = null;
                                    } else {
                                        _data = _tmp_cart_data[_tmp_idx];
                                    }
                                }

                                if (_data !== null) {
                                    // view_member_only_price, IS_LOGIN �ɼ��� �߰� �ݾ� ó���� ���� ��ǰ �󼼿��� ���� ��
                                    if (typeof view_member_only_price != 'undefined' && view_member_only_price == 'Y' && typeof IS_LOGIN != 'undefined' && IS_LOGIN === 'false') {
                                        _add_price = '';
                                    } else {
                                        // �и����� ��� �߰��ݾ��� �߰�����
                                        if (pre_option_manager.info.option_display_type == 'EVERY' || (_after_bulk == 'Y' && pre_option_manager.info.option_display_type == 'EACH' && pre_option_manager.info.json.basic[0][0].opt_ids == 1)) {
                                            if (_data.sto_price > 0) {
                                                _add_price = '(+' + (Math.abs(parseInt(_data.sto_price, 10))).number_format() + ')';
                                                _opt.attr('price', Math.abs(parseInt(_data.sto_price, 10)));
                                                if (pre_option_manager.info.is_bulk == 'Y') {
                                                    _bulk_data = pre_option_manager.info.json.basic[key][_bulk_i[_i]] || pre_option_manager.info.json.basic[key][_i];
                                                    _add_price = '(+' + (Math.abs(parseInt(_bulk_data.sto_price, 10))).number_format() + ')';
                                                    _opt.attr('price', Math.abs(parseInt(_bulk_data.sto_price, 10)));
                                                }
                                            } else if (_data.sto_price < 0) {
                                                _add_price = '(-' + (Math.abs(parseInt(_data.sto_price, 10))).number_format() + ')';
                                                _opt.attr('price', parseInt(_opt.attr('price'), 10) - Math.abs(parseInt(_data.sto_price, 10)));
                                                if (pre_option_manager.info.is_bulk == 'Y') {
                                                    _bulk_data = pre_option_manager.info.json.basic[key][_bulk_i[_i]] || pre_option_manager.info.json.basic[key][_i];
                                                    _add_price = '(-' + (Math.abs(parseInt(_bulk_data.sto_price, 10))).number_format() + ')';
                                                    _opt.attr('price',  - Math.abs(parseInt(_bulk_data.sto_price, 10)));
                                                }
                                            }

                                            // �ǸŰ� ���������� ��� (discount_percent)
                                            _opt.attr('org_opt_price', Math.abs(parseInt(_data.org_opt_price, 10)));
                                        }
                                    }

                                    switch (_data.sto_state) {
                                        case 'HIDE': _opt.remove(); break;
                                        case 'SOLDOUT': _add_text = ' - ' + get_lang('soldout_txt'); break;
                                        case 'TEMPOUT': _add_text = ' - ' + get_lang('tempsoldout_txt'); break;
                                        case 'DELAY': _add_text = ' - ' + get_lang('shipping_txt'); break;
                                        case 'SALE':
                                            var _is_unlimit = _data.sto_unlimit == 'Y' ? true : false;
                                            if (_is_unlimit === true) {
                                                _add_text = '';
                                            } else if (_data.sto_stop_use == 'Y' && (_data.sto_real_stock - _data.sto_stop_stock) <= 0 && _add_text.length == 0) {
                                                _add_text = ' - ' + get_lang('soldout_txt');
                                            }

                                            if (pre_option_stock_display != 'NO' && _add_text.length == 0) {
                                                if (_data.sto_stop_use == 'Y') {
                                                    var sto_now_stock = Math.max(0, _data.sto_real_stock - _data.sto_stop_stock);
                                                    if (pre_op_stock_count_display != 'NULL' && sto_now_stock <= pre_op_stock_count_display || pre_op_stock_count_display == 'NULL') {
                                                        _add_text = ' - (' + get_lang('stock_title') + ' : ' + sto_now_stock + ' ' + get_lang('stock_unit') + ')';
                                                    }
                                                } else {
                                                    /*
                                                    if (_data.sto_real_stock < 0) {
                                                        _is_unlimit = true;
                                                    } else {
                                                        _add_text = ' - (' + get_lang('stock_title') + ' : ' + _data.sto_real_stock + ' ' + get_lang('stock_unit') + ')';
                                                    }
                                                    */
                                                    _is_unlimit = true;
                                                }
                                                if (_is_unlimit === true && (pre_option_stock_display == 'DISPLAY'|| pre_option_stock_display == 'LIMIT')){
                                                    if (pre_op_stock_limit_display == 'N') {
                                                        _add_text = ' - (' + get_lang('stock_title') + ' : ' + get_lang('stock_unlimit') + ')';
                                                    } else {
                                                        _add_text = '';
                                                    }
                                                }
                                            }
                                            break;
                                    }
                                    if (typeof option_note_display != 'undefined' && option_note_display == 'DISPLAY' && _data.sto_note.length > 0) {
                                        _add_text += '(' + _data.sto_note.substr(0, 20) + ')';
                                    }
                                    _opt.text(_text + _add_price + _add_text);
                                }
                            } catch (e) {
                                return true;
                            }
                        }
                    });
                }
            }
            _mix_option_num++;
        });

        // ���� �ɼ��� ���� ���� ���� �ؽ�Ʈ�� ��� ����
        $.each($('[name="pre_optionlist[]"].addition_option'), function(key, data) {
            // �ɼǵ��� ������ ù��°, ���þ��� �ɼ��� ����
            $.each($(this).children('option').not(':first'), function(_i, _d) {
                try {
                    var _add_text = '';
                    var _text = $(this).text();

                    switch (pre_option_manager.info.json.addition[key][_i].sto_state) {
                        case 'HIDE': $(this).remove(); break;
                        case 'SOLDOUT': _add_text = ' - ' + get_lang('soldout_txt'); break;
                        case 'TEMPOUT': _add_text = ' - ' + get_lang('tempsoldout_txt'); break;
                        case 'DELAY': _add_text = ' - ' + get_lang('shipping_txt'); break;
                        case 'SALE':
                            var _t = pre_option_manager.info.json.addition[key][_i];
                            var _is_unlimit = _t.sto_unlimit == 'Y' ? true : false;
                            if (_is_unlimit === true) {
                                _add_text = '';
                            } else if ((_t.sto_real_stock - _t.sto_stop_stock) <= 0 && _add_text.length == 0) {
                            // addition�� stop_use ���� ����. 0 �� ǰ���̴�.
                                _add_text = ' - ' + get_lang('soldout_txt');
                            }

                            if (pre_option_stock_display != 'NO' && _add_text.length == 0) {
                                if (_is_unlimit === true && (pre_option_stock_display == 'DISPLAY'|| pre_option_stock_display == 'LIMIT')) {
                                    if (pre_op_stock_limit_display == 'N') {
                                        _add_text = ' - (' + get_lang('stock_title') + ' : ' + get_lang('stock_unlimit') + ')';
                                    } else {
                                        _add_text = '';
                                    }
                                } else {
                                     var sto_now_stock = Math.max(0, _t.sto_real_stock - _t.sto_stop_stock);
                                     if (pre_op_stock_count_display != 'NULL' && sto_now_stock <= pre_op_stock_count_display || pre_op_stock_count_display == 'NULL') {
                                        _add_text = ' - (' + get_lang('stock_title') + ' : ' + sto_now_stock + ' ' + get_lang('stock_unit') + ')';
                                    }
                                }
                            }
                            break;
                    }
                    $(this).text(_text + _add_text);
                } catch (e) {
                    return true;
                }
            });
        });
    };
});
})(jQuery);
} // is_unify_opt

// input box focus in action
function pre_option_focus(obj) {
    pre_option_manager.input_focus(obj);
    return false;
}

// option change action
function pre_change_option(obj, option_mode, target) {
    pre_option_manager.change_option(obj, option_mode, target);
    return false;
}

// option click action
function pre_oneclick_click_option(obj, option_mode, target, dimg) {
    if (typeof pre_oneclick_change_mimg != 'undefined') {
        pre_oneclick_change_mimg(dimg);
    }
    pre_option_manager.click_option(obj, option_mode, target);
    return false;
}


// option change action
function pre_sum_total_price() {
    pre_option_manager.sum_total_price();
    return false;
}

function viewlayerbasket(visible, item, type, subs_type, uid, is_unify_opt) {
    if (is_unify_opt == true) {
        var _basket = jQuery('#MK_basketpage');
    } else {
        var _basket = jQuery('#basketpage');
    }
    // ��� �̿� : /shop/ 
    var layer_url = (MOBILE_USE === '1') ? '/m/' : '/shop/';
    if (visible == 'visible') {
        jQuery.ajax({
            type: 'POST',
            url: layer_url+'gobasket.layer.html',
            dataType: 'html',
            async: false,
            data: {
                'prdname': item,
                'type': type,
                'subs_type' : subs_type,
                'product_uid' : uid,
                'device_type': MOBILE_USE
            },
            success: function(req) {
                if (MOBILE_USE === '1') {
                    var _x = (jQuery(document).width() - 310) / 2;
                    var _y = 100;
                    var _w = 300, _h = 152;
                } else {
                    if (!is_unify_opt) {
                        var _x = jQuery(window).width() / 2 + jQuery(document).scrollLeft() - 250;
                        var _y = jQuery(window).height() / 2 + jQuery(document).scrollTop() - 200;
                        var _w = 380, _h = 200;
                    }
                }
                // ������ html�� ��üȭ ���Ѽ� �ʿ��� �κи� �̾� �´�.
                // �̷��� ���� ������ ������ html�� style�� ������ ��ü�� ������ ��ģ��.
                if (is_unify_opt == true) {
                    jQuery(_basket).html(req);
                    var _x       = (jQuery(window).width()) / 2 + jQuery(document).scrollLeft() - jQuery(_basket).outerWidth()/2;
                    var o_height = jQuery(_basket).outerHeight()/2;
                    var m_height = (jQuery(window).height() > 800) ? 80 : 10;
                    var _y       = (jQuery(window).height()) / 2 + jQuery(document).scrollTop() - o_height - m_height;
                    
                    jQuery(_basket).css({
                        'left': _x,
                        'top': _y,
                        'zIndex': 10000,
                        'visibility': visible
                    }).show();
                } else {
                    if (MOBILE_USE == '1') {
                        var _basket_layer = jQuery('<div></div>').html(req).find('.fixed-btn');
                    } else {
                        var _basket_layer = jQuery('<div></div>').html(req).find('table:first');
                    }
                    jQuery(_basket).html(_basket_layer).css({
                        'width': _w,
                        'height': _h,
                        'left': _x,
                        'top': _y,
                        'zIndex': 10000,
                        'visibility': visible
                    }).show();
                }
                return false;
            }
        });
    } else {
        jQuery(_basket).css('visibility', visible);
        pre_showdetail('hidden');
    }
}

var Items = {};
function pre_showdetail(visible, brandcode, is_unify_opt, is_cart_free) {
    Items = {};
    if (visible == 'visible') {
        if (is_unify_opt) {
            loadJs('/js/jquery.diy_option.js');
        }
        var _param = {
            'request': 'ajax',
            'brandcode': brandcode,
            'is_cart_free': (is_cart_free == 'Y' ? is_cart_free : '')
        };

        var multi_image_url = MOBILE_USE === '1' ? '/m/multi_image.html' : '/shop/multi_image.html';
        jQuery.ajax({
            type: 'POST',
            url: multi_image_url,
            dataType: 'json',
            data: _param,
            success: function(req) {
                if (req.uid) {
                    Items = {
                        '0': {
                            'uid': req.uid,
                            'name': "'" + req.brandname + "'",
                            'desc': "'" + req.brandname + "'",
                            'images': req.multi_image
                        }
                    };
                }
            }
        });

        var response = '';
        var detail_url = MOBILE_USE === '1' ? '/m/product_preview.html' : '/shop/detailpage.html';
        var xjson = jQuery.ajax({
            type: 'POST',
            url: detail_url,
            dataType: 'html',
            data: _param,
            success: function(req) {
                var json = xjson.getResponseHeader('X-JSON') ? eval('(' + xjson.getResponseHeader('X-JSON') + ')') : null;
                if (json != null) {
                    pre_optionJsonData = json.optionJsonData;
                    pre_stockInfo = json.stockInfo;
                }

                if (req.match('MSG:') != null) {
                    alert(req.replace('MSG:', ''));
                    return false;
                }

                if (is_unify_opt) {
                    jQuery('#detailpage').html(jQuery(req));
                    // ���������� ���� ä����
                    pre_option_manager.info.ORBAS = jQuery('input[name="ORBAS"]', '#detailpage').val();
                    pre_option_manager.info.min_amount = parseInt(jQuery('input[name="min_amount"]', '#detailpage').val());
                    pre_option_manager.info.max_amount = parseInt(jQuery('input[name="max_amount"]', '#detailpage').val());
                    pre_option_manager.info.min_add_amount = parseInt(jQuery('input[name="min_add_amount"]', '#detailpage').val());
                    pre_option_manager.info.product_uid = jQuery('input[name="product_uid"]', '#detailpage').val();
                    pre_option_manager.info.product_name = jQuery('input[name="product_name"]', '#detailpage').val();
                    pre_option_manager.info.product_price = jQuery('input[name="product_price"]', '#detailpage').val();
                    pre_option_manager.info.option_type = jQuery('input[name="option_type"]', '#detailpage').val();
                    pre_option_manager.info.option_display_type = jQuery('input[name="option_display_type"]', '#detailpage').val();
                    pre_option_manager.info.json = eval('(' + jQuery('input[name="optionJsonData"]', '#detailpage').val() + ')');
                    pre_op_stock_limit_display = jQuery('input[name="op_stock_limit_display"]', '#detailpage').val();
                    pre_op_stock_count_display = jQuery('input[name="op_stock_count_display"]', '#detailpage').val();
                    var prd_type = jQuery('input[name="product_type"]', '#detailpage').val();
                    // option_type == 'NO' �� ��� �⺻ �ɼ� ���� �߰���
                    if (pre_option_manager.info.option_type == 'NO' && prd_type != 'PACKAGE' || (jQuery.inArray(pre_option_manager.info.json, Array(undefined, null)) === -1 && object_count(pre_option_manager.info.json.basic) == 1 && pre_option_manager.info.json.basic[0][0].opt_value === undefined && prd_type != 'PACKAGE')) {
                        var _tmp_basic_opt_id = 0;
                        var _tmp_basic_sto_id = 0;
                        if (typeof(pre_option_manager.info.json.basic) != 'undefined') {
                            _tmp_basic_opt_id = typeof(pre_option_manager.info.json.basic[0][0].opt_ids) == 'undefined' ||  pre_option_manager.info.json.basic[0][0].opt_ids.length == 0 ? 0 : pre_option_manager.info.json.basic[0][0].opt_ids;
                            _tmp_basic_sto_id = typeof(pre_option_manager.info.json.basic[0][0].sto_id) == 'undefined' ||  pre_option_manager.info.json.basic[0][0].sto_id.length == 0 ? 0 : pre_option_manager.info.json.basic[0][0].sto_id;

                        }
                        pre_option_manager.data = {basic : [[{
                            opt_id: _tmp_basic_opt_id, 
                            opt_value: pre_option_manager.info.product_name,
                            opt_stock: pre_option_manager.get_min_amount('basic'),
                            opt_price: 0,
                            sto_id:_tmp_basic_sto_id 
                        }]]};
                        if (typeof(pre_option_manager.info.json.basic) != 'undefined') {
                            pre_option_manager.info.json.basic[0][0].opt_value = pre_option_manager.info.product_name;
                        }
                    }
                } else {
                    jQuery('#detailpage').html(req);
                    pre_changeOptvalue();
                    //loadJs('/js/neodesign/option_validate.js', function() { changeOptvalue(); });   // dom �� HTML �� �ѷ��ְ�. changeOptvalue();
                    if (MOBILE_USE === '1') {
                        loadJs('/js/multi_image_mobile.js');
                    } else {
                        loadJs('/js/multi_image.js');
                    }
                    
                    if (req.match('<!-- MULTI_IMAGE -->') != null) {
                        setTimeout(function() {
                            jQuery('#detailpage').html(req);
                            jQuery.imageShow();
                        }, 250);
                    }
                }

                var iebody = (document.compatMode && document.compatMode != 'BackCompat') ? document.documentElement : document.body,
                    _top = navigator.userAgent.match(/MSIE/i) ? iebody.scrollTop : pageYOffset;

                var _left = parseInt(jQuery('#detailpage').outerWidth() / 2) * -1;
                if (MOBILE_USE === '1') {
                    var _top = parseInt(jQuery(document).scrollTop()) + 100;
                    var el = jQuery('#detailpage').css({
                        'visibility' : visible,
                        'display': 'block',
                        'left': '50%',
                        'top': _top + 'px',
                        'zIndex': '9999',
                        'marginLeft': _left + 'px'
                    });
                } else {
                    var _top = (parseInt(jQuery('#detailpage').outerHeight() / 2) + parseInt(_top) * (-1)) * (-1);
                    var el = jQuery('#detailpage').css({
                        'visibility': visible,
                        'left': '50%',
                        'top': '50%',
                        'zIndex': '9999',
                        'marginLeft': _left + 'px',
                        'marginTop': _top + 'px'
                    });
                }
                if (window.quick_ele != null) {     // �𳪹� ������ ���ӽÿ� ������ �־, Ŭ�� element ��ġ�� ó��
                    el.css({'marginTop' : 0 + 'px', 'top' : jQuery(window.quick_ele).offset().top});
                }

                // �ɼ� �� ����
                if (is_unify_opt) {
                    pre_option_value_replace();
                }
            }
        });
    } else {
        if (MOBILE_USE === '1') {
            jQuery('#detailpage').css('display', 'none');
        } else {
            jQuery('#detailpage').css('visibility', visible);
        }
        if (typeof(jQuery('form[name="pre_subs_select_apply"]')) !== 'undefined') {
            jQuery('form[name="pre_subs_select_apply"]').remove();
        }
    
    }
}

function imageview(temp, type) {
    var url;
    var n4;
    var imgsc;

    var windowprops = 'height=350,width=450,toolbar=no,menubar=no,resizable=no,status=no';
    if (type == '1') {
        windowprops += ',scrollbars=yes';
        imgsc = 'yes';
    } else {
        imgsc = '';
    }

    if (temp.length == 0) {
        alert(((shop_language == 'eng') ? "large image is not" : "ū�̹����� �����ϴ�."));
        return;
    }

    n4 = (document.layers) ? true : false;
    if (n4) {
        url = '/shop/image_view.html?scroll=' + imgsc + '&image=/shopimages/' + db + '/' + escape(temp);
    } else {
        url = '/shop/image_view.html?scroll=' + imgsc + '&image=/shopimages/' + db + '/' + temp;
    }
    window.open(url, 'win', windowprops);
}

function pre_send_wish(temp, temp2, opt_type, is_unify_opt) {
    if (typeof pre_baskethidden == 'undefined') {
        var pre_baskethidden = $('input[name=ORBAS]','#detailpage').val();
    }
    if (is_unify_opt == true) {
        if (opt_type == 'DIY') {
            if (create_diy_option_input('detailform') === false) {
                return;
            }
        }
        if (pre_create_option_input('detailform', '', 'wish') === false) {
            return;
        }
    } else {
        if (document.getElementById('pre_option_type')) {
            var mobile_use = MOBILE_USE === '1' ? 'Y' : '';
            pre_wishvalidateSubmit(temp, document.detailform, pre_baskethidden, mobile_use);
            return false;
        }

        if (temp2 != '') {
            document.detailform.opts.value = '';
            for (var i = 0; i < temp2; i++) {
                document.detailform.opts.value += document.detailform.mulopt[i].selectedIndex + ',';
                document.detailform.optslist.value += document.detailform.mulopt[i].value + '[||]';
            }
        }
        if (typeof document.detailform.spcode != 'undefined' && document.detailform.spcode.selectedIndex < 2) {
            temp2 = document.detailform.spcode.selectedIndex - 1;
            if (typeof document.detailform.spcode2 == 'undefined' || document.detailform.spcode2.type == 'hidden') {
                temp3 = 1;
            } else {
                temp3 = document.detailform.spcode2.selectedIndex - 1;
            }
            /*
            if (num.length > 0 && num[(temp3 - 1) * 10 + (temp2 - 1)] == 0) {
                alert('�����Ͻ� ��ǰ�� �ɼ��� ǰ���Ǿ����ϴ�. �ٸ� �ɼ��� �����ϼ���');
                document.detailform.spcode.focus();
                return;
            }
            */
        }
        if (opt_type == 'NL' || opt_type == 'NU') {
            document.detailform.optslist.value = '';
            if (document.detailform.spcode.selectedIndex > 1) {
                document.detailform.optslist.value = document.detailform.spcode.options[document.detailform.spcode.selectedIndex].text + '[||]';
            }
            if (typeof document.detailform.spcode2 != 'undefined' && document.detailform.spcode2.selectedIndex > 1) {
                if (document.detailform.spcode2.type != 'hidden') document.detailform.optslist.value += document.detailform.spcode2.options[document.detailform.spcode2.selectedIndex].text + '[||]';
            }
        }
    }

    if (typeof pre_baskethidden != 'undefined' && pre_baskethidden == 'Y') {
        document.detailform.ordertype.value += '|parent.';
        document.detailform.target = 'loginiframe';
    } else if (typeof pre_baskethidden != 'undefined' && pre_baskethidden == 'A') {
        document.detailform.ordertype.value += '|parent.|layer';
        document.detailform.target = 'loginiframe';
    }

    document.detailform.action = shopdetail_url;
    document.detailform.mode.value = 'wish';
    document.detailform.optiontype.value = opt_type;
    //document.detailform.target = 'new';	
    document.detailform.submit();
}

function pre_send(temp, temp2, is_unify_opt, is_diy_opt, extra_require, uid) {
    if (extra_require == 'Y') {
        alert('������������ �߰� ���� ��ǰ�� ���� �������ּž� �մϴ�.');
        location.href = shopdetail_url + '?branduid=' + uid;
        return;
    }
    if(temp=="baro") {
       document.detailform.ordertype.value='baro';
       document.detailform.ordertype.value+= "|parent.|layer";
       document.detailform.target = "loginiframe";
    }else {
       document.detailform.ordertype.value='';
       document.detailform.target = "";
    }
    if (typeof pre_baskethidden == 'undefined') {
        var pre_baskethidden = $('input[name=ORBAS]','#detailpage').val();
    }
    if (is_unify_opt) {
        if (temp == 'giveapresent') {
            document.detailform.giveapresent.value = 'Y';
        }
        if (is_diy_opt) {
            if (create_diy_option_input('detailform') === false) {
                return;
            }
        }
        if (pre_create_option_input('detailform') === false) {
            return;
        }
        if (typeof(pre_bigin_basket) != 'undefined') {
            var bigin_action = (temp == "baro") ? 'ORDER' : 'BASKET';
            pre_bigin_basket(bigin_action);
        }

        // ������ ��û
        if (temp == 'pre_subs') {

            document.detailform.ordertype.value = 'SUBS';

            // detailform �� �߰�
            document.detailform.subs_action_type.value = document.pre_subs_select_apply.subs_action_type.value;

            // �̹��� �Բ��ޱ�
            document.detailform.subs_type.value   = document.pre_subs_select_apply.subs_type.value;


            if (document.pre_subs_select_apply.subs_type.value == 'pre_subs_select') {
                // ����ֱ� ������ ���
                subs_cycle_type  = '';
                subs_cycle       = '';
                subs_week        = '';
                subs_cycle_month = '';
                subs_day         = '';
                if (document.pre_subs_select_apply.subs_cycle != null) {
                    subs_cycle = document.pre_subs_select_apply.subs_cycle.value;
                }
                if (document.pre_subs_select_apply.subs_week != null) {
                    subs_week = document.pre_subs_select_apply.subs_week.value;
                }
                if (document.pre_subs_select_apply.subs_cycle_month != null) {
                    subs_cycle_month = document.pre_subs_select_apply.subs_cycle_month.value;
                }
                if (document.pre_subs_select_apply.subs_date != null) {
                    subs_day = document.pre_subs_select_apply.subs_date.value;
                } 
                if (subs_week != '' && subs_day == '') {
                    subs_cycle_type = 'WEEK';
                }
                if (subs_week == '' && subs_day != '') {
                    subs_cycle_type = 'MONTH';
                }
                if (subs_week == '' && subs_day == '') {
                    subs_cycle_type = 'FIX';
                }
            } else {
                // �̹��� �Բ��ޱ�
                subs_cycle = '';
                subs_week  = '';
                subs_cycle_month = '';
                subs_day   = '';
            }
            // ����ֱ� Ÿ��
            document.detailform.subs_cycle_type.value = subs_cycle_type;

            // ����ֱ�
            document.detailform.subs_cycle.value = subs_cycle;
            document.detailform.subs_cycle_month.value = subs_cycle_month;
            // ��ۿ���
            document.detailform.subs_week.value  = subs_week;
            // ��۳�¥
            document.detailform.subs_day.value  = subs_day;

            // ���� ������ �߰��� ��쿡�� ��ٱ��� Ÿ�� �ʵ��� ����
            document.detailform.subs_id.value = '';
            if (document.pre_subs_select_apply.subs_action_type.value != 'new') {
                var subs_select_radio = document.getElementsByName('subs_select_radio');
                if (subs_select_radio.length > 0) {
                    for (var subs_select_radio_i = 0; subs_select_radio_i < subs_select_radio.length; subs_select_radio_i++) {
                        if (subs_select_radio[subs_select_radio_i].checked) {
                            document.detailform.subs_id.value = subs_select_radio[subs_select_radio_i].value;
                        }
                    }
                }

                // ���� �����ۿ� �߰�
                subs_select_process(document.detailform);
                return;
            }

            document.detailform.action = basket_url + "?basket_type=SUBS";

        } else if (temp == 'pre_subs_select') {
            jQuery('#subs-apply').hide();
            jQuery('form[name="subs_select_apply"]').remove();
            // ������ ��û������ �ɼ�üũ ���� �ϱ� ����
            pre_subs_select_open(document.pre_subs_select, 'pre_subs_select');

            return;
        }

    } else {
        // �Ŀ��ɼ��� ��쿡 validate�� �Ʒ� �Լ��� ��������
        if (document.getElementById('pre_option_type')) {
            document.detailform.action=basket_url;
            pre_validateSubmit(temp, document.detailform, pre_baskethidden);
            return;
        }

        if (document.detailform.amount.value.length == 0) {
            alert(((shop_language == 'eng') ? "Input quantity." : "�ֹ������� �Է��ϼ���."));
            document.detailform.amount.focus();
            return;
        }
        if (isNaN(document.detailform.amount.value)) {
            alert(((shop_language == 'eng') ? "Input numbers in quantity field." : "�ֹ������� ���ڸ� �Է����ּ���."));
            document.detailform.amount.focus();
            return;
        }
        if (temp2 != '') {
            document.detailform.opts.value = '';
            for (var i = 0; i < temp2; i++) {
                if (typeof document.detailform.optselect != 'undefined') {
                    if (document.detailform.optselect[i].value == 1 && document.detailform.mulopt[i].selectedIndex == 0) {
                        alert(((shop_language == 'eng') ? 'Select the options required, must be select option.' : '�ʼ����� �׸��Դϴ�. �ɼ��� �ݵ�� �����ϼ���'));
                        document.detailform.mulopt[i].focus();
                        return;
                    }
                    document.detailform.opts.value += document.detailform.mulopt[i].selectedIndex + ',';
                }
            }
        }
        if (typeof document.detailform.spcode != 'undefined' && document.detailform.spcode.selectedIndex < 2) {
            alert(((shop_language == 'eng') ? 'selected option required to buy.' : '�ɼ��� �����ϼž� ���Ű� �����մϴ�.'));
            document.detailform.spcode.focus();
            return;
        }
        if (typeof document.detailform.spcode2 != 'undefined' && document.detailform.spcode2.selectedIndex < 2) {
            alert(((shop_language == 'eng') ? 'selected option required to buy.' : '�ɼ��� �����ϼž� ���Ű� �����մϴ�.'));
            document.detailform.spcode2.focus();
            return;
        }
        if (typeof document.detailform.spcode != 'undefined' && document.detailform.spcode.selectedIndex < 2) {
            temp2 = document.detailform.spcode.selectedIndex - 1;
            if (typeof document.detailform.spcode2 == 'undefined') {
                temp3 = 1;
            } else {
                temp3 = document.detailform.spcode2.selectedIndex - 1;
            }
            if (num[(temp3 - 1) * 10 + (temp2 - 1)] == 0) {
                alert(((shop_language == 'eng') ? 'The item of the selected option is out of stock. Please select another option.' : '�����Ͻ� ��ǰ�� �ɼ��� ǰ���Ǿ����ϴ�. �ٸ� �ɼ��� �����ϼ���'));
                document.detailform.spcode.focus();
                return;
            }
        }
    }
    if (typeof pre_baskethidden != 'undefined' && pre_baskethidden == 'Y') {
        document.detailform.ordertype.value += '|parent.';
        document.detailform.target = 'loginiframe';
    } else if (typeof pre_baskethidden != 'undefined' && pre_baskethidden == 'A') {
        document.detailform.ordertype.value += '|parent.|layer';
        document.detailform.target = 'loginiframe';
    }



    // ��ٱ��� ������ �ϰ�쿡�� ������ ���ε� �Ķ���͸� �߰����ش�.
    if (window.location.pathname == basket_url) {
        document.detailform.reload.value = 'Y';
    }

    document.detailform.action=basket_url;

    // ��ٱ��� ���
    common_basket_send(document.detailform, is_unify_opt);
}

function pre_package_send(uid) {
    if (confirm(((shop_language == 'eng') ? 'Please select an option from the product detail page, and put in the basket.\n\nDo you want to go to the product detail page?' : '������������ �ɼ��� �����ϰ� ��ٱ��Ͽ� ����ֽñ� �ٶ��ϴ�.\n\n��ǰ �� �������� �̵��Ͻðڽ��ϱ�?'))) {
        location.href = shopdetail_url + '?branduid='+uid;
    } else {
        return;
    }
}

function count_change(cnt) {
    var amount = document.detailform.amount.value;
    if (cnt == 0) {
        amount++;
    } else if (cnt == 1) {
        if (amount > 1) amount--;
    }
    document.detailform.amount.value = amount;
}

function login_chk(brandcode) {
    alert (((shop_language == 'eng') ? "The service is available only for members. Please login." : "ȸ�����Ը� ������ �Ǵ� �����Դϴ�.\n�켱 �α����� �Ͽ� �ֽñ� �ٶ��ϴ�."));
    location.href = '/shop/member.html?type=wish&brandcode=' + brandcode;
}

function warehousing_call(branduid) { 
    var opt = 'width=560,height=370';
    var dir = '/shop/soldout_sms_pop.html';
    if (is_unify_opt == true) {
        if (pre_option_manager.info.is_mobile_use == 'Y') {
            dir = '/m/pop_soldout_alarm.html';
            opt = '';
        }
    }
    win = window.open(dir + '?branduid=' + branduid, 'soldout_sms', opt);
    win.focus();
}

function MS_CyScrap(shopurl, branduid, key, sid) {
    var xml_url = escape('http://' + shopurl + '/cy_scrap.html?branduid=' + branduid + '&key=' + key);
    var cyScrap_url = 'http://api.cyworld.com/openscrap/shopping/v1/?xu=' + xml_url + '&sid=' + sid;
    window.open(cyScrap_url, 'cyopenscrap', 'width=450,height=410');
}

/**
 * onload �̺�Ʈ �ݹ� �Լ� �߰�
 * onload callback test pass : ie6 / ie7 / ie8 / ie9 / ff4 / chrom10
 */
function loadJs(filename, js_function) {
    if (document.getElementById(filename) == null) {
        var fileref = document.createElement('script');
        fileref.setAttribute('type','text/javascript');
        fileref.setAttribute('src', filename);
        fileref.setAttribute('id', filename);

        if (typeof(js_function) == 'function') {
            if (fileref.addEventListener == undefined) {
                fileref.onreadystatechange = function() {
                    if (fileref.readyState == 'loaded') js_function();
                }
            } else {
                fileref.addEventListener('load', js_function, false);
            }
        }

        if (typeof fileref != 'undefined') {
            rtn = document.getElementsByTagName('head')[0].appendChild(fileref);
        }
    } else {
        if (typeof(js_function) == 'function') {
            js_function();
        }
    }
};

/*
var changeOpt2value = function(num) {
    var optionIndex = optval = '';
    var optcnt = 0;
    var oki = oki2 = '-1';
    var soldout_txt = (shop_language == 'eng') ? ' (Out-of-stock)' : ' (ǰ��)';
    if (typeof document.detailform.spcode != 'undefined' && document.detailform.spcode.selectedIndex > 1) {
        temp2 = document.detailform.spcode.selectedIndex - 1;
        if (typeof document.detailform.spcode2 == 'undefined' || document.detailform.spcode2.type == 'hidden') {
            temp3 = 1;
        } else {
            temp3 = document.detailform.spcode2.length;
        }
        for(var i = 2; i < temp3; i++) {
            var len = document.detailform.spcode2.options[i].text.length;
            document.detailform.spcode2.options[i].text = document.detailform.spcode2.options[i].text.replace(soldout_txt, '');
            if (num[(i - 2) * 10 + (temp2 - 1)] == 0) {
                document.detailform.spcode2.options[i].text = document.detailform.spcode2.options[i].text + soldout_txt;
            }
        }
    }
};
*/

var pre_wish_action_lodding = false;
function pre_wish_toggle(temp, temp2, opt_type, is_unify_opt) {
    if (pre_wish_action_lodding === true) {
        return;
    }
    pre_wish_action_lodding = true;

    // block ���� ��� ��Ȯ�� ��
    var wish_prd_status = false;
    if ($('#MS_btn_wish', $('#detailpage')).length > 0 && $('#MS_btn_wish', $('#detailpage')).hasClass('wish-on') === true) {
        wish_prd_status = true;
    } else {
        wish_prd_status = false;
    }
    var action_type = wish_prd_status === true ? 'delete' : 'insert';

    if (typeof pre_baskethidden == 'undefined') {
        var pre_baskethidden = $('input[name=ORBAS]','#detailpage').val();
    }
    if (action_type == 'insert') {
        if (is_unify_opt == true) {
            if (opt_type == 'DIY') {
                if (create_diy_option_input('detailform') === false) {
                    return;
                }
            }
            if (pre_create_option_input('detailform', '', 'wish') === false) {
                return;
            }
        } else {
            if (document.getElementById('pre_option_type')) {
                var mobile_use = MOBILE_USE === '1' ? 'Y' : '';
                
                if (false === pre_wishvalidateSubmit('check', document.detailform, pre_baskethidden, mobile_use)) {
                    return;
                }
            }

            if (temp2 != '') {
                document.detailform.opts.value = '';
                for (var i = 0; i < temp2; i++) {
                    document.detailform.opts.value += document.detailform.mulopt[i].selectedIndex + ',';
                    document.detailform.optslist.value += document.detailform.mulopt[i].value + '[||]';
                }
            }
            if (typeof document.detailform.spcode != 'undefined' && document.detailform.spcode.selectedIndex < 2) {
                temp2 = document.detailform.spcode.selectedIndex - 1;
                if (typeof document.detailform.spcode2 == 'undefined' || document.detailform.spcode2.type == 'hidden') {
                    temp3 = 1;
                } else {
                    temp3 = document.detailform.spcode2.selectedIndex - 1;
                }
            }
            if (opt_type == 'NL' || opt_type == 'NU') {
                document.detailform.optslist.value = '';
                if (document.detailform.spcode.selectedIndex > 1) {
                    document.detailform.optslist.value = document.detailform.spcode.options[document.detailform.spcode.selectedIndex].text + '[||]';
                }
                if (typeof document.detailform.spcode2 != 'undefined' && document.detailform.spcode2.selectedIndex > 1) {
                    if (document.detailform.spcode2.type != 'hidden') document.detailform.optslist.value += document.detailform.spcode2.options[document.detailform.spcode2.selectedIndex].text + '[||]';
                }
            }
        }
    }

    var _jform = jQuery('form[name=detailform]');
    jQuery('input[name=wish_action_type]', _jform).val(action_type);
    jQuery('input[name=wish_data_type]', _jform).val('ones');
    var _url = MOBILE_USE === '1' ? '/m/wish.action.html' :'/shop/wish.action.html';
    jQuery.ajax({
        url  : _url,
        type : 'POST',
        data: _jform.serializeArray(),
        dataType: 'json',
        success: function(response) {
            if (response.success == true) {
                if (response.data.action_type && response.data.action_type == 'insert') {
                    jQuery('#MS_btn_wish', _jform).addClass('wish-on');
                    if (response.data.pixel_event_id && response.data.pixel_event_id.length > 0) {
                        if (typeof fbq === 'function') {
                            fbq('track', 'AddToWishlist', {}, {eventID: response.data.pixel_event_id});
                        }
                    }
                } else {
                    jQuery('#MS_btn_wish', _jform).removeClass('wish-on');
                }
                if (response.data.prd_count && response.data.prd_count.length > 0) {
                    jQuery('#MS_wish_count', _jform).html(response.data.prd_count);
                }
            } else {
                if (response.message != '') {
                    alert(response.message);
                }
            }
            pre_wish_action_lodding = false;
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            pre_wish_action_lodding = false;
        }
    });
    return;
}
function pre_create_option_input(form_name, relation, mode, product_type) {
    if (relation != 'relation_only') {
        if (pre_option_manager.print_option(form_name, mode) === false) {
            return false;
        }
    }
    // ���� ��ǰ�� �Բ� ��ٱ��� ��� ��� ����
    /*
    if (relation == 'relation' || relation == 'relation_only') {
        if (related_product_manager.print_option(form_name) === false) {
            return false;
        }
    }
    */
}
// ���̺긮�� �ɼ� ����
function pre_hybrid_option_add(obj) {
    var _form = $('form[name="detailform"]');
    
    var _this = this;
    var _info = pre_option_manager.info;
    var _json = pre_option_manager.info.json.basic;
    var option_mode = 'basic';

    if (typeof shop_language == 'undefined') {
        var shop_language = 'kor';
    }
    if (pre_option_manager.info.view_member_only_price == 'Y' && IS_LOGIN === 'false') {
        alert(((shop_language == 'eng') ? 'Member login required to buy.' : 'ȸ�� �α����� �Ͻø� �����Ͻ� �� �ֽ��ϴ�.'));    
        return;
    }

    // ���� ���õ� �ɼ��� Ÿ���� ������
    _info.type = $(obj).get(0).tagName.toLowerCase();

    // �ɼ� ���� ������� ó��
    if ($(obj).val().replace(/[\s]/g, '').length == 0) {
        return false;
    }
    var _option = new StringBuffer();
    var opt_id = $(obj).attr('opt_id');
    var opt_value = $(obj).attr('value');
    var opt_title = $(obj).attr('opt_title');
    var opt_name = $(obj).attr('opt_name');
    var amount_min = $(obj).attr('amount_min').split(",");
    var amount_max = $(obj).attr('amount_max').split(",");
    var sto_state = $(obj).attr('sto_state');
    var sto_unlimit = $(obj).attr('sto_unlimit');
    var sto_real_stock = $(obj).attr('sto_real_stock');
    var key = $(obj).attr('sto_key');
    var group_opt_cnt = 0;
    var opt_input_type = true;
    var opt_total_cnt = 0;
    var product_preview = false;
    var amount_min_cnt = (amount_min[2] == '') ? 1 : amount_min[2];
    if (MOBILE_USE == '') {
        var stock = $('input[name=pre_hy_qrt_' + opt_id + '_' + opt_value+']').val();
        // �ɼǺ� �����Է� �׸��� ������� ������ �⺻1�� üũ
        if (stock == undefined) {
            stock = 1;
            opt_input_type = false;
        }
        // �ɼǱ׷캰 ���õ� �� 
        $('input[name="pre_hy_option[]"]', _form).each(function(i) {
            if ($(this).is(':checked') === true) {
                var _chk_id = $(this).attr('id').replace("pre_chk_","");
                var str_id = _chk_id.split("_");
                if ($('#pre_hy_qrt_'+ _chk_id, _form).val() != undefined && opt_id == str_id[0]) {
                    group_opt_cnt += $('#pre_hy_qrt_'+ _chk_id, _form).val().numeric();
                }
                opt_total_cnt += $('#pre_hy_qrt_'+ _chk_id, _form).val().numeric();
            }      
        });
        var opt_total_chk = group_opt_cnt;
    } else {
        key = key.replace("key_","");
        var prd_chk_info = this.pre_product_chk_info(key);
        // �ɼǱ׷캰 ���õ� �� 
        $('input[name="amount[]"]', _form).each(function(i) {
            if ($(this).is(':checked') === true) {
            var amount_min2 = $(this).attr('amount_min').split(",");
            var amount_min_cnt2 = (amount_min2[2] == '') ? 1 : amount_min2[2]; 
                opt_total_cnt += amount_min_cnt2.numeric();
            }        
        });
        opt_total_chk = group_opt_cnt + prd_chk_info[3].numeric();
        var stock = ($(obj).attr('cart_opt') > 1) ? $(obj).attr('cart_opt') : 1;
        // �ɼǺ� �����Է� �׸��� ������� ������ �⺻1�� üũ
        if (stock == undefined) {
            stock = 1;
            opt_input_type = false;
        }
    }
    var price = $(obj).attr('opt_price') * stock;
    var chk_cnt = 0;            // ���õ� �ɼ� ����
    key = key.replace("key_","");
    var prd_chk_info = this.pre_product_chk_info(key);


    // üũ �����Ѱ�� ����Ⱥκ� ����
    if ($(obj).is(':checked') === false) {
        this.pre_sum_total_price2(prd_chk_info[2]); 
        $('#MK_total', _form, _form).text(prd_chk_info[0]);
        $('#MS_opt_key_' + key, _form).remove();
        $('#pre_hb_img_' + key, _form).siblings('span').removeClass('sel-img');
        if(prd_chk_info[0] == 0 && opt_input_type === true) {
            $('#MK_innerOpt_03', _form).parent().parent().parent().hide();
        }
        return false;
    } else {
        if (amount_min_cnt > stock.numeric() || (amount_max[2] < stock.numeric() && amount_max[2] > 0)) {        // �ɼǺ� ���ż���üũ (�ּ�/�ִ�) ����üũ
            alert(get_lang('hybrid_option', opt_name, amount_max[2]));
            $('input[name=pre_hy_qrt_' + opt_id + '_' + opt_value+']', _form).val(amount_min_cnt);
            $('#MS_amount_' + opt_id + '_' + opt_value, _form).val(amount_min_cnt);
            $(obj).attr("checked", false);
            return false;
        } else if (opt_total_chk > 0 && ((amount_min[1] > opt_total_chk && amount_min_cnt > opt_total_chk) || (amount_max[1] < opt_total_chk && amount_max[1] > 0))) {     // �ɼǱ׷캰 ���ż���üũ (�ּ�/�ִ�) ����üũ
            if (amount_min[1] == '') {
                alert(get_lang('hybrid_group_option2', opt_title, amount_max[1]));
            } else {
                alert(get_lang('hybrid_group_option', opt_title, amount_min[1], amount_max[1]));
            }
            $('input[name=pre_hy_qrt_' + opt_id + '_' + opt_value+']', _form).val(amount_min_cnt);
            $('#MS_amount_' + opt_id + '_' + opt_value, _form).val(amount_min_cnt);
            $(obj, _form).attr("checked", false);
            return false;
        } else if (opt_total_cnt > 0 && ((amount_min[0] > opt_total_cnt && amount_min_cnt > opt_total_cnt)|| (amount_max[0] < opt_total_cnt && amount_max[0] > 0))) {
            alert(get_lang('hybrid_product', opt_title, amount_min[0], amount_max[0]));
            $(obj, _form).attr("checked", false);
            $('input[name=pre_hy_qrt_' + opt_id + '_' + opt_value+']', _form).val(amount_min_cnt);
            $('#MS_amount_' + opt_id + '_' + opt_value, _form).val(amount_min_cnt);
            return false;
        }
        $('#pre_hb_img_' + key, _form).siblings('span').addClass('sel-img');
    }
    $('#MS_opt_key_' + key, _form).hide();
    $('#MK_innerOpt_03', _form).parent().parent().parent().show();
    _option.append('<li id="MS_opt_key_' + key +'">');
    _option.append('<input type="hidden" id="MS_keys_' + opt_value + '" value="' + key + '" class="basic_option" />');
    _option.append('<span class="MK_p-name">');
    _option.append(opt_title + ' : ');
    _option.append(opt_name+ '</span>');
    _option.append('<div class="MK_qty-ctrl">');
    _option.append('<input type="text" id="MS_amount_' + key + '" name="amount[]" value="' + stock + '" onfocusout="pre_set_amount_input(this, \'' + key + '\', \''+ opt_value +'\');" opt_id="'+opt_id+'" opt_title="'+opt_title+'" opt_price="'+price+'" opt_name="'+opt_name+'" amount_min="'+amount_min+'" amount_max="'+amount_max+'" sto_state="'+sto_state+'" sto_unlimit="'+sto_unlimit+'" sto_real_stock="'+sto_real_stock+'" size="4" style="text-align: right; float: left;" class="basic_option" />');
    if (pre_option_manager.info.is_mobile_use === true) {
        _option.append('&nbsp;<a href="javascript:pre_set_amount_input(this, \'' + key + '\', \'up\');" class="btn-type-02 box-gradient-02 box-shadow-02"><span> +1</span>');
        _option.append('</a>');
        _option.append('&nbsp;<a href="javascript:pre_set_amount_input(this, \'' + key + '\', \'down\');" class="btn-type-02 box-gradient-02 box-shadow-02"><span> -1</span>');
        _option.append('</a>');
    } else {
        _option.append('<a href="javascript:pre_set_amount_input(this, \'' + key + '\', \'up\');" class="MK_btn-up">');
        _option.append('<img src="/images/common/basket_up.gif" alt="' + get_lang('increase_quantity') + '" border="0" />');
        _option.append('</a>');
        _option.append('<a href="javascript:pre_set_amount_input(this, \'' + key + '\', \'down\');" class="MK_btn-dw">');
        _option.append('<img src="/images/common/basket_down.gif" alt="' + get_lang('decrease_quantity') + '" border="0" />');
        _option.append('</a>');
    }
    _option.append('</div>');
    if (price != 0) {
        _option.append('<strong class="MK_price"><span id="MK_p_price_' + key + '">' + price.number_format() + '</span>��</strong>');
    }
    _option.append('<a class="MK_btn-del" href="javascript:hybrid_option_delete(\'' + key + '\', '+ price + ',\'' +  amount_min[0] + '\');" id="MK_btn_del_' + this.option_idx + '">');
    if (pre_option_manager.info.is_mobile_use === true) {
        _option.append('<img src="/m/skin/basic/images/icon/icon_option_remove.gif" alt="' + get_lang('remove') + '" border="0" />');
    } else {
        _option.append('<img src="/board/images/btn_comment_del.gif" alt="' + get_lang('remove') + '" border="0" />');
    }
    _option.append('</a>');
    _option.append('</li>');
    $('#MK_total', _form).text(prd_chk_info[0]);
    $('#MK_innerOpt_03', _form).append(_option.toString());
    $('#hybrid_op_price', _form).val(prd_chk_info[2]);
    this.pre_sum_total_price2(prd_chk_info[2]); 
}


// ���õ� ��ǰüũ
function pre_product_chk_info(key) {
    var _form = $('form[name="detailform"]');
    var prd_cnt = 0;
    var group_cnt = 0;
    var price = 0;
    var min_cnt = 0;
    var return_array = new Array();
    $('input[name="pre_hy_option[]"]').each(function() {
        if($(this).is(':checked') == true) {
            if (MOBILE_USE == '') {
                var mk_no = $(this).attr('sto_key').replace("key_",""); 
                if ($('#pre_hy_qrt_' + mk_no, _form).val() != undefined) {
                    prd_cnt += $('#pre_hy_qrt_' + mk_no, _form).val().numeric();
                } else {
                    if ($('#MS_amount_' + mk_no, _form).val() != undefined) {
                        prd_cnt += $('#MS_amount_' + mk_no, _form).val().numeric();
                    } else {
                        prd_cnt += 1;
                    }
                }
                
                if ($(this).attr('id').replace("pre_chk_", "") == key) {
                    if ($('#pre_hy_qrt_' + mk_no, _form).val() != undefined) {
                        group_cnt += $('#pre_hy_qrt_' + mk_no, _form).val().numeric();
                        _chk = true;
                    } else {
                        if ($('#MS_amount_' + mk_no, _form).val() != undefined) {
                            group_cnt += $('#MS_amount_' + mk_no, _form).val().numeric();
                        } else {
                            group_cnt += 1;
                        }
                    }
                }
                if ($('#pre_hy_qrt_' + mk_no, _form).val() != undefined) {
                    price += $(this).attr('opt_price') * $('#pre_hy_qrt_' + mk_no, _form).val().numeric();
                } else {
                    if ($('#MS_amount_' + mk_no, _form).val() != undefined) {
                        price += $('#MS_amount_' + mk_no, _form).val() * $(this).attr('opt_price').numeric();
                    } else {
                        price += $(this).attr('opt_price').numeric();
                    }
                }
            } else {
                var mk_no = $(this).attr('sto_key').replace("key_",""); 
                var min_amount = $('#pre_chk_' + mk_no, _form).attr('amount_min').split(",");
                if ($('#MK_total', _form).text() == 0) {
                    prd_cnt += min_amount[2].numeric();
                    group_cnt += min_amount[2].numeric();
                    price += $(this).attr('opt_price').numeric() * $('#MS_amount_' + mk_no).val();
                } else {
                    if ($('#MS_amount_' + mk_no, _form).val() == undefined) {
                        prd_cnt += min_amount[2].numeric();
                        group_cnt += min_amount[2].numeric();
                        price += $(this).attr('opt_price').numeric();
                    } else {
                        prd_cnt += $('#MS_amount_' + mk_no, _form).val().numeric();
                        group_cnt += $('#MS_amount_' + mk_no, _form).val().numeric();
                        price += $(this).attr('opt_price') * $('#MS_amount_' + mk_no, _form).val().numeric();
                    }
                }
            }
        } else {
            if (MOBILE_USE != '') {
                min_amount = $('#pre_chk_'+key).attr('amount_min');
                if (min_amount != undefined && min_amount != '') {
                    min_amount = min_amount.split(",");
                    min_cnt = min_amount[2];
                }

            }
        }
    });
    return_array[0] = prd_cnt;
    return_array[1] = group_cnt;
    return_array[2] = price;
    return_array[3] = min_cnt;
    return return_array;
}

// ���̺긮�� �ɼ� ���� ����üũ
function pre_set_amount_input(obj, key, type) {
    var _form = $('form[name="detailform"]');
    var opt_set_cnt = 0;
    var value = '';
    var opt_input_type = true;
    var cnt = $('#MS_pre_basic_product', _form).val();
    var prd_opt_cnt = 0;
    if (type == 'up' || type == 'down') {
        if (MOBILE_USE == '') {
            if ($('#pre_hy_qrt_' + key, _form).val() != undefined) {
                obj = document.getElementsByName('pre_hy_qrt_' + key);
            } else {
                obj = $('#MS_amount_' + key, _form);
                opt_input_type = false;
            }
            if (type == 'up') {
                if ($('#pre_hy_qrt_' + key, _form).val() != undefined) {
                    $('#pre_hy_qrt_' + key, _form).val($('#pre_hy_qrt_' + key, _form).val().numeric() + 1);
                    value = $('#pre_hy_qrt_' + key, _form).val();
                } else {

                    $('#MS_amount_' + key, _form).val($('#MS_amount_' + key, _form).val().numeric() + 1);
                    value = $('#MS_amount_' + key, _form).val();
                    opt_input_type = false;
                }
                opt_set_cnt = 1;
            } else {
                if ($('#pre_hy_qrt_' + key, _form).val() != undefined) {
                    $('#pre_hy_qrt_' + key, _form).val($('#pre_hy_qrt_' + key, _form).val().numeric() - 1);
                    value = $('#pre_hy_qrt_' + key, _form).val();
                } else {
                    $('#MS_amount_' + key, _form).val($('#MS_amount_' + key, _form).val().numeric() - 1);
                    value = $('#MS_amount_' + key, _form).val();
                    opt_input_type = false;
                }
                opt_set_cnt = -1;
            }
        } else {
            if (type == 'up') {
                $('#MS_amount_' + key, _form).val($('#MS_amount_' + key, _form).val().numeric() + 1);
                value = $('#MS_amount_' + key, _form).val();
            } else if (type == 'down') { 
                $('#MS_amount_' + key, _form).val($('#MS_amount_' + key, _form).val().numeric() - 1);
                value = $('#MS_amount_' + key, _form).val();
            } else {
                value = obj.value;
            }
        }
    } else {
        if ($('#pre_hy_qrt_' + key, _form).val() == undefined) {
            value = $('#MS_amount_' + key, _form).val();
        } else {
            value = obj.value;
        }
    }
    
    $('#MS_amount_' + key, _form).val(value);
    $('#pre_hy_qrt_' + key, _form).val(value);

    var group_opt_cnt = 0;
    var checked = false;
    if (MOBILE_USE != '') {
        var opt_id = $('#MS_amount_'+key, _form).attr('opt_id');
        var opt_title = $('#MS_amount_'+key, _form).attr('opt_title');
        var opt_value = $('#MS_amount_'+key, _form).attr('value');
        var opt_name = $('#MS_amount_'+key, _form).attr('opt_name');
        var amount_min = $('#MS_amount_'+key, _form).attr('amount_min').split(",");
        var amount_max = $('#MS_amount_'+key, _form).attr('amount_max').split(",");
        var opt_price = value * $('#pre_chk_'+key, _form).attr('opt_price');

        var sto_state = $('#MS_amount_'+key, _form).attr('sto_state');
        var sto_unlimit = $('#MS_amount_'+key, _form).attr('sto_unlimit');
        var sto_real_stock = $('#MS_amount_'+key, _form).attr('sto_real_stock');
        // �ɼǱ׷캰 ���õ� �� 
        $('input[name="pre_hy_option[]"]', _form).each(function(i) {
            if ($(this).is(':checked') === true) {
            var _chk_id = $(this).attr('id').replace("pre_chk_","");
            var str_id = _chk_id.split("_");
                if ($('#MS_amount_'+ _chk_id, _form).val() != undefined && opt_id == str_id[0]) {
                    group_opt_cnt += $('#MS_amount_' + _chk_id, _form).val().numeric();
                    is_checked = true;
                }
                prd_opt_cnt += $('#MS_amount_' + _chk_id, _form).val().numeric();
            }      
        });
        if (opt_input_type === true) {
            var opt_total_chk = group_opt_cnt + opt_set_cnt;
        } else {
            var opt_total_chk = group_opt_cnt;
        }
    } else {
        var opt_id = $(obj).attr('opt_id');
        var opt_title = $(obj).attr('opt_title');
        var opt_value = $(obj).attr('value');
        var opt_name = $(obj).attr('opt_name');
        var amount_min = $(obj).attr('amount_min').split(",");
        var amount_max = $(obj).attr('amount_max').split(",");
        var opt_price = value * $('#pre_chk_'+key).attr('opt_price');
        var sto_state = $(obj).attr('sto_state');
        var sto_unlimit = $(obj).attr('sto_unlimit');
        var sto_real_stock = $(obj).attr('sto_real_stock');
        var product_preivew = false;
        // �ɼǱ׷캰 ���õ� �� 
        $('input[name="pre_hy_option[]"]').each(function(i) {
            if ($(this).is(':checked') === true) {
            var _chk_id = $(this).attr('id').replace("pre_chk_","");
            var str_id = _chk_id.split("_");
                if ($('#pre_hy_qrt_'+ _chk_id).val() != undefined && opt_id == str_id[0]) {
                    group_opt_cnt += $('#pre_hy_qrt_'+ _chk_id).val().numeric();
                    is_checked = true;
                }
                prd_opt_cnt += $('#pre_hy_qrt_' + _chk_id).val().numeric();
            }      
        });
        var opt_total_chk = group_opt_cnt;
    }
    var chk_cnt = 0;
    var prd_chk_info = this.pre_product_chk_info(key);

    // �ɼ��� ǰ���̵Ȱ�� ��������ȵǵ��� üũ
    if ($(obj).is(':disabled') === true) {
        var _txt = '';
        if (sto_state == 'TEMPOUT') { _txt = get_lang('temporary'); } // �Ͻ� ǰ���� ��� '�Ͻ�' �޽��� �߰�
        $('#pre_hy_qrt_' + key).val('1');
        alert(get_lang('selected_option_soldout', _txt));
        return;
    }
    amount_min[2] = (amount_min[2] == '') ? '1' : amount_min[2];

    if (amount_min[2] > opt_value.numeric() || (amount_max[2] < opt_value.numeric() && amount_max[2] > 0) && is_checked === true) {
        if (opt_value.numeric() > amount_max[2].numeric() && amount_max[2] > 0) {
            if (type == 'up') {
                opt_value = opt_value - 1;
            } else {
                opt_value = amount_min[2];
            }
        }
        if (opt_value.numeric() == 0) {
            alert(get_lang('hybrid_option2', opt_name, amount_min[2]));
            opt_value = amount_min[2];
            opt_price = opt_value * $('#MS_amount_'+key, _form).attr('opt_price');
        } else {
            if (amount_min[2] > opt_value) {
                alert(get_lang('hybrid_option2', opt_name, amount_min[2]));
                opt_value = amount_min[2];
            } else if (amount_max[2] > 0) {
                alert(get_lang('hybrid_option', opt_name, amount_max[2]));
            }
            opt_price = opt_value * $('#pre_chk_'+key, _form).attr('opt_price');
        }
        // �������õȰ����� �Է�

        pre_reset_option_value (opt_value, opt_price, key);
        return;
    } else if (opt_total_chk > 0 && (amount_min[1] > opt_total_chk || (amount_max[1] < opt_total_chk && amount_max[1] > 0)) && is_checked === true) {       // �ɼǱ׷캰 ���ż���üũ (�ּ�/�ִ�) ����üũ
        if (amount_min[1] == '') {
            alert(get_lang('hybrid_group_option2', opt_title, amount_max[1]));
        } else {
            alert(get_lang('hybrid_group_option', opt_title, amount_min[1], amount_max[1]));
        }
        if (opt_total_chk > amount_max[1].numeric() && amount_max[1] > 0) {
            if (type == 'up') {
                opt_value = opt_value - 1;
                opt_price = opt_value * $('#pre_chk_'+key, _form).attr('opt_price');
            } else {
                opt_value = amount_min[2];
                opt_price = amount_min[2] * $('#pre_chk_'+key, _form).attr('opt_price');
            }
        }
        // �������õȰ����� �Է�
        pre_reset_option_value (opt_value, opt_price, key);
        return;
    } else if (prd_chk_info[0] > 0 && (amount_min[0] > prd_chk_info[0] || (amount_max[0] < prd_chk_info[0] && amount_max[0] > 0)) && is_checked === true) {       // ��ǰ�������� üũ (�ּ�/�ִ�) ����üũ
        if (amount_max[0] > 0) {
            alert(get_lang('hybrid_product', opt_title, amount_min[0], amount_max[0]));
        } else {
            alert(get_lang('hybrid_product1', opt_title, amount_min[0]));
        }

        if (type == 'up') {
            opt_value = opt_value - 1;
            opt_price = opt_value * $('#pre_chk_'+key, _form).attr('opt_price');
        } else {
            opt_value = amount_min[2];
            opt_price = opt_value * $('#pre_chk_'+key, _form).attr('opt_price');
        }
        // �������õȰ����� �Է�
        pre_reset_option_value (opt_value, opt_price, key);
        return;
    }
    
    // �ɼǺ� ��������Ȱ�� ���üũ
    if (sto_unlimit == 'N' && (sto_real_stock < value.numeric())) {
        alert(get_lang('selected_option_lower_quantity'));
        if (MOBILE_USE == '') {
            $('#'+$(obj).attr('id')).val(value - 1);
        } else {
            $('#MS_amount_' + key, _form).val($('#MS_amount_' + key, _form).val() - 1);
        }
        return;
    }
    
    $('#MS_amount_' + key, _form).val(value);
    $('#pre_hy_qrt_' + key, _form).val(value);
    $('#MK_p_price_' + key, _form).text(opt_price);
    prd_chk_info = this.pre_product_chk_info(key);
    $('#MK_total', _form).text(prd_chk_info[0]);
    
    if (prd_chk_info[2] > 0) {
        $('#MK_opt_txt', _form).css('display', "inline");
        $('#MK_txt-opt', _form).text(prd_chk_info[2].number_format());
    } else {
        $('#MK_opt_txt', _form).css('display', "none");
        $('#MK_txt-opt', _form).text(prd_chk_info[2].number_format());
    }
    
    // �ɼ�üũ�Ȱ�쿡�� �ݾװ�����ش�.
    if (prd_chk_info[1] > 0) {
        this.pre_sum_total_price2(prd_chk_info[2]); 
        $('#hybrid_op_price', _form).val(prd_chk_info[2]);
    }
}

// ���̺긮�� �ɼ� ���� ���
function pre_sum_total_price2(price) {

    var _form = $('form[name="detailform"]');
    var _product_price = pre_option_manager.info.product_price.numeric();
    var _basic_price = 0;
    var _basic_single_price = 0;
    var _addition_price = 0;
    var _option_price = 0;
    var _stock = 1;
    var cnt = $('#MS_pre_basic_product', _form).val();
    var prd_chk_info = this.pre_product_chk_info(price);
    
    // �⺻��ǰ���� + ���̺긮�� �ɼ� 
    _basic_price = (_product_price.numeric() * cnt) + (prd_chk_info[2].numeric() * cnt);

    // �����ɼ� �Ѱ��� ���
    $.map(pre_option_manager.data.addition, function(data, idx) {
        if (data !== undefined) {
            $.map(data, function(_d, _i) {
                if (_d.opt_price) {
                    _addition_price += _d.opt_price * _d.opt_stock;
                }
            });
        }
    });

    // �⺻�ɼ�, �����ɼ� ������ ���� ����� ���ɼ��� �ֱ⿡ ���� �������
    // option_type == 'NO' �� ��� ������ ���� �ٸ�
    if (pre_option_manager.info.option_type == 'NO') {
        _option_price = (_product_price * _stock).numeric();
    } else {
        _option_price = _basic_price.numeric() + _addition_price.numeric();
    }

    if ($('input[name=basic_product]', _form).val() == undefined) {
        var _basic_product = cnt;
    } else {
        var _basic_product = $('input[name=basic_product]', _form).val();
    }

    var prd_total_price = _product_price * _basic_product;

    $('#MK_txt-prd', _form).text(prd_total_price.number_format());
    $('#MK_txt-opt', _form).text(prd_chk_info[2]*cnt.number_format());
    $('#MK_innerOptPrice', _form).css('display', "block");
    $('#pre_price_text', _form).text(_option_price.number_format()); 
    // �߰��ɼ� �ݾ�
    if(_addition_price > 0) {
        $('#MK_txt-add', _form).text(_addition_price.number_format());
        $('#MK_innerOptAdd', _form).css('display', "block");
    } else {
        $('#MK_txt-add', _form).text('0');
    }
    $('#MK_p_total', _form).text(_option_price.number_format());
}

// ���̺긮�� �⺻��ǰ ��������
function pre_basic_product_amount(type) {
    var _form = $('form[name="detailform"]');
    if (type == 'up') {
        $('#MS_pre_basic_product', _form).val($('#MS_pre_basic_product').val().numeric() + 1);
    } else if (type == 'down') {
        $('#MS_pre_basic_product', _form).val($('#MS_pre_basic_product').val().numeric() - 1);
    } else {
        $('#MS_pre_basic_product', _form).val(type);
    }
    if ($('#MS_pre_basic_product', _form).val().numeric() == 0) {
        // ��ǰ�ֹ� �ּ� ���� 1�� üũ
        alert(get_lang('min_amount', 1));
        $('#MS_pre_basic_product', _form).val('1');
        return;
    }
    var cnt = $('#MS_pre_basic_product', _form).val();
    var prd_chk_info = this.pre_product_chk_info(type);
    var opt_sum_price = prd_chk_info[2].numeric() * cnt;

    // ��ü���� ����� ���õ� �ɼ����üũ
    $('input[name="pre_hy_option[]"]', _form).each(function(i) {
        if ($(this).is(':checked') === true) {
            var _chk_id = $(this).attr('id').replace("chk_","");
            var str_id = _chk_id.substr(0,1);
            var sto_real_stock = $(this).attr('sto_real_stock');
            var sto_unlimit = $(this).attr('sto_unlimit'); 
            var opt_sum_value = $('#MS_amount_'+ _chk_id, _form).val() * cnt;
            if (sto_unlimit == 'N' && (sto_real_stock < opt_sum_value.numeric())) {
                $('#MS_pre_basic_product', _form).val($('#MS_pre_basic_product', _form).val() - 1);
                alert(get_lang('selected_option_lower_quantity'));
                if (type == 'up' || type == 'down') {
                    $('#MS_pre_basic_product', _form).val(cnt - 1);
                } else {
                    $('#MS_pre_basic_product', _form).val('1');
                }
                cnt = $('#MS_pre_basic_product', _form).val();
                opt_sum_price = prd_chk_info[2].numeric() * cnt;
            }      
        }
    });

    var price_value = document.getElementById('pre_pricevalue');
    var price = parseInt(document.getElementById('pre_price_wh').value.replace(/,/g, ''), 10);   
    var total_price = price * cnt;
    this.pre_sum_total_price2(total_price); 
    var prd_total_price = price * cnt;
    $('#MK_txt-opt', _form).text(opt_sum_price.number_format());
    $('#MK_p_price_basic_0', _form).text(prd_total_price.number_format() + get_lang('won'));
}

// �ɼ� �������ѵ� ���  ���õ� �ɼǰ� ����
function pre_reset_option_value (val, opt_price, key) {

    var _form = $('form[name="detailform"]');
    $('input[name=pre_hy_qrt_' + key +']').val(val);
    $('#MS_amount_' + key, _form).val(val);
    $('#MK_p_price_' + key, _form).text(opt_price);
    prd_chk_info = this.pre_product_chk_info(key);
    $('#MK_total').text(prd_chk_info[0]);
    if (prd_chk_info[2] > 0) {
        $('#MK_opt_txt', _form).css('display', "inline");
        $('#MK_txt-opt', _form).text(prd_chk_info[2].number_format());
    } else {
        $('#MK_opt_txt', _form).css('display', "none");
        $('#MK_txt-opt', _form).text(prd_chk_info[2].number_format());
    }
    if (prd_chk_info[1] > 0) {
        this.pre_sum_total_price2(prd_chk_info[2]); 
        $('#hybrid_op_price', _form).val(prd_chk_info[2]);
    }
    if(prd_chk_info[0] == 0) {
        $('#MK_innerOpt_03', _form).parent().parent().parent().hide();
    }
}
var pre_priceCalculate = function(obj) {
    var regularPrice = parseInt(document.getElementById('pre_regular_price').value.replace(/,/g, ''), 10);
    var discountPrice = parseInt(document.getElementById('pre_discount_price').value.replace(/,/g, ''), 10);
    var quantity = parseInt(document.getElementById('pre_goods_amount').value, 10);
    var optionType = document.getElementById('pre_option_type').value;
    var optionPrice = 0;
    var optionIndex = '';
    var discountType = document.getElementById('pre_discount_type').value;
    var optionDisPrice = 0;

    pre_changeOptvalue();

    var optionInfo = pre_GetOptionInfo();
    if (optionType != 'PC') {
        jQuery.each(optionInfo, function(idx, obj) {
            if (obj >= 0) {
                optionPrice += parseInt(pre_optionJsonData[idx].price[obj], 10);
                if (discountType == true && optionType != 'PP' && pre_optionJsonData[idx].disprice != undefined) {
                    optionDisPrice += parseInt(pre_optionJsonData[idx].disprice[obj], 10);
                } else if (discountType == true && optionType != 'PP' && pre_optionJsonData[idx].disprice == undefined) {
                    optionDisPrice += parseInt(pre_optionJsonData[idx].price[obj], 10);
                }

                // �ʼ��ɼ��� ��쿡�� stock index �����ϵ�����
                if (pre_optionJsonData[idx].mandatory == 'Y') {
                    optionIndex += obj + ',';
                }
            }
        });
        optionIndex = optionIndex.replace(/,$/g, '');

        // ǰ�� üũ
        if (pre_optionStock(optionIndex) == 0) {
            alert(((shop_language == 'eng') ? 'The item of the selected option is out of stock. Please select another option.' : '�����Ͻ� �ɼ��� ǰ���Դϴ�. �ٸ� �ɼ��� �������ּ���.'));
            obj.selectedIndex = 0;
            return false;
        }
    }

    // �ɼǺ� ���� �ݾ� ó��
    var totalPrice = regularPrice + optionPrice;
    //if(discountType == true && optionDisPrice > 0 ) { ���̳ʽ� �ɼ��� ���� ����
	if(discountType == true) {
        var totaldisPrice = discountPrice + optionDisPrice;
    } else {
        var totaldisPrice = discountPrice + optionPrice;
    }

    if (document.getElementById('pre_currency')) {
        var currency = totalPrice / parseInt(document.getElementById('pre_currency').value, 10);
        document.getElementById('pre_dollarprice').value = currency.toFixed(2);
    }

    // �ɼ� ������ ���� ������ �ݾ� ����� �ٸ���.
    var price_text = document.getElementById('pre_price_text');
    //var discount_text = document.getElementById('downpricevalue');
    var is_discount = document.getElementById('pre_is_discount') ? document.getElementById('pre_is_discount').value : false;

    if (optionType == 'PP') {
        if (price_text) {
            regularPrice = (is_discount == true && discountPrice) ? discountPrice : regularPrice;
            document.getElementById('pre_price_text').innerHTML = ((regularPrice * quantity) + optionPrice).toString().number_format();
        }
        if (shop_language == 'eng' && document.getElementById('pre_price_text_usd')) {
            var tmp_price = ((regularPrice * quantity) + optionPrice);
            var price_usd = tmp_price / exchange_rate;
            document.getElementById('pre_price_text_usd').innerHTML = price_usd.toFixed(2);
        }
        /*
        if (discount_text && discountType == true) {
            //document.getElementById('downpricevalue').innerHTML = ((discountPrice * quantity) + optionPrice).toString().number_format();
        }
        */
        document.getElementById('pre_price').value = ((regularPrice * quantity) + optionPrice).toString().number_format();
        /*
        if(discount_text && discountType == true){
            document.getElementById('pre_disprice').value = ((discountPrice * quantity) + optionPrice).toString().number_format();
        }
        */

    } else if (optionType != 'PC') {    // �����ۼ����� �ɼ����밡�� ����
        if (price_text) {
            document.getElementById('pre_price_text').innerHTML = (totalPrice * quantity).toString().number_format();
        }
        if (shop_language == 'eng' && document.getElementById('pre_price_text_usd')) {
            var tmp_price = (totalPrice * quantity);
            var price_usd = tmp_price / exchange_rate;
            document.getElementById('pre_price_text_usd').innerHTML = price_usd.toFixed(2);
        }
        /*
        if (discount_text && discountType == true) {
            //document.getElementById('downpricevalue').innerHTML = (totaldisPrice * quantity).toString().number_format();
        }
        */
        document.getElementById('pre_price').value = (totalPrice * quantity).toString().number_format();
        /*
        if (discount_text && discountType == true) {
            document.getElementById('pre_disprice').value = (discountPrice * quantity).toString().number_format();
        }
        */
    }
};

// ������ �ɼǿ� ���� ����� �ݾ� ó�� - ��Ʈ��ǰ

// ������ �ɼ� ����Ʈ�� index ���� or ������ ����
var pre_GetOptionInfo = function() {
    var optionArr = document.getElementsByName('pre_optionlist[]');
    var optionIndex = new Array();

    for (var i = 0; i < optionArr.length; i++) {
        if (optionArr[i].type == 'text') {
            optionIndex[i] = optionArr[i].value.trim().bytes();
        } else {
            optionIndex[i] = optionArr[i].selectedIndex - 1;
        }
    }
    return optionIndex;
};

/**
 * �ɼǺ� ǰ�� ���� ǥ��
 */
var pre_changeOptvalue = function() {
    var optionobj = document.getElementById('pre_option_type');
    if (optionobj == undefined) {
        return false;
    }
    var optionType  = optionobj.value;
    var optionIndex = optval = tempval = '';
    var optcnt = 0;
    var tmpok = new Array(10);
    var oki2 = -1;
    var oki;

    //product_preview.html�� ����Ǿ�����.
    if (typeof (pre_display_option_stock) != 'undefined') {
        pre_display_option_stock(optionType);
    }

    if (shop_language == 'eng') {
        var soldout_txt = 'out of stock';
    } else {
        var soldout_txt = 'ǰ��';
    }
    if (optionType != 'PC') {
        var soldout_txt_length = soldout_txt.length + 3;//�� ǰ��ǥ�� ���ڿ� ���� ���� �� �� ����( �� �� ) 3�ڸ� �����ش�.

        var optionArr = document.getElementsByName('pre_optionlist[]');
        var optnum = optionArr.length;
        for (var i = 0; i < optnum; i++) {
            if (pre_optionJsonData[i].mandatory == 'Y') {
                tmpok[optcnt++] = i;
                oki2 = i;
            }
        }
        if (optcnt == 1) {
            oki = tmpok[0];
            var num2 = optionArr[oki].length;
            for (var j = 0; j < num2; j++) {
                var len = optionArr[oki].options[j].text.length;
                if (optionArr[oki].options[j].text.substring(len-soldout_txt_length,len)==" ("+soldout_txt+")") optionArr[oki].options[j].text = optionArr[oki].options[j].text.substring(0,len-soldout_txt_length);
                if (pre_optionStock(j - 1) == 0 && optionArr[oki].options[j].text.match(soldout_txt) == null) {
                    optionArr[oki].options[j].text += ' (' + soldout_txt + ')';
                    //optionArr[i].options[j].text = 'ǰ���� ��ǰ�Դϴ�.';
                }
            }
        } else if (oki2 != -1) {
            for (i = 0; i < optcnt - 1; i++) {
                if (optionArr[tmpok[i]].selectedIndex <= 0) return;
                var tmpi = optionArr[tmpok[i]].selectedIndex;
                tempval = tempval + (tmpi - 1) + ',';
            }

            var num2 = optionArr[oki2].length;
            for (var j = 1; j < num2; j++) {
                optval = tempval + (j - 1);
                var len = optionArr[oki2].options[j].text.length;
                if (optionArr[oki2].options[j].text.substring(len-soldout_txt_length,len)==" ("+soldout_txt+")") optionArr[oki2].options[j].text = optionArr[oki2].options[j].text.substring(0,len-soldout_txt_length);
                if (pre_optionStock(optval) == 0 && optionArr[oki2].options[j].text.match(soldout_txt) == null) {
                    optionArr[oki2].options[j].text += ' (' + soldout_txt + ')';
                    //optionArr[oki2].options[j].text = 'ǰ���� ��ǰ�Դϴ�.';
                }
            }
        }
    }
};

var pre_validateSubmit = function(temp, form, baskettype) {
    var optionType  = document.getElementById('pre_option_type').value;
    var maxsize = 200;

    if (validateNumeric(document.getElementById('pre_goods_amount')) == false) {
        alert(((shop_language == 'eng') ? 'Please enter a minimum quantity of 1' : '������ 1�̻� �Է����ּ���.'));
        document.getElementById('pre_goods_amount').focus();
        return false;
    }

    var optionInfo = pre_GetOptionInfo();

    if (shop_language == 'eng') {
        var opt_required_txt = 'Required';
        var opt_select_txt   = 'Select';
    } else {
        var opt_required_txt = '�ʼ� �Է�';
        var opt_select_txt   = '���� �Է�';
    }

    for (var i = 0; i < optionInfo.length; i++) {
        if (optionType == 'PC') {
            if (optionInfo[i] > maxsize) {
                if (shop_language == 'eng') {
                    alert("You have exceeded the maximum length. Please check that you entered a maximum of " + (maxsize / 2) + " korean characters or " + maxsize + " english letters/numbers/signs");
                } else {
                    alert("�ɼ� �Է� ������ �ʰ��Ǿ����ϴ�.\n�ѹ� �� Ȯ�����ּ���\n" + "�ѱ۸�" + (maxsize / 2) + "�� �̳� Ȥ�� ����/����/��ȣ�� " + maxsize + "�� �̳����� �����մϴ�.");
                }
                return false;
            }

            if (pre_optionJsonData[i].mandatory == 'Y' && (optionInfo[i] <= 0 || document.getElementById('pre_optionlist_' + i).value.trim() == opt_required_txt)) {
                alert(((shop_language == 'eng') ? 'You did not enter the required option. Please enter an option.' : '�ʼ��ɼ��� �Է����� �ʾҽ��ϴ�. �ɼ��� �Է����ּ���'));
                jQuery('#pre_optionlist_' + i).focus();
                return false;
            }
            if (document.getElementById('pre_optionlist_' + i).value.trim() == opt_select_txt) {
                document.getElementById('pre_optionlist_' + i).value = '';
            }
        } else {
            if (pre_optionJsonData[i].mandatory == 'Y' && document.getElementById('pre_optionlist_' + i ).selectedIndex == 0) {
                alert(((shop_language == 'eng') ? 'You did not enter the required option. Please enter an option.' : '�ʼ��ɼ��� �������� �ʾҽ��ϴ�. �ɼ��� �������ּ���'));
                document.getElementById('pre_optionlist_' + i).focus();
                return false;
            }
        }
    }

    // �ٷ� ����
    if (temp == 'baro') {
        form.ordertype.value = 'baro';
        form.ordertype.value += '|parent.|layer';
        form.target = 'loginiframe';
    }else {
        form.ordertype.value = '';
        form.target = '';
    }
    if (baskettype == 'A' && temp != 'check') {
        form.ordertype.value += '|parent.|layer';
        form.target = 'loginiframe';
    } else if (baskettype == 'Y' && temp != 'check') {
        form.ordertype.value += '|parent.';
        form.target = 'loginiframe';
    }

    // ������ ��������
    if (document.getElementById('direct_order') && document.getElementById('direct_order').value == 'payco_checkout') {
        if (typeof MOBILE_USE != 'undefined' && MOBILE_USE == 1) {
            form.target = "";
        }
        else {
            window.open('', 'payco_win', 'width=692');
            form.target = "payco_win";
        }
    }

    if (temp != 'check') {
        if (typeof m_acecounter_use !== 'undefined' && m_acecounter_use === true && typeof ACM_PRODUCT == 'function') {
            ACM_PRODUCT(form.amount.value);
            setTimeout(function () { form.submit(); }, 100);
        } else {
            form.submit();
        }
    }
};

var pre_wishvalidateSubmit = function(temp, form, baskettype, mobileuse) {
    var optionType = document.getElementById('pre_option_type').value;
    var maxsize = 200;
    var optionIndex = '';

    var optionInfo = pre_GetOptionInfo();

    if (shop_language == 'eng') {
        var opt_required_txt = 'Required';
        var opt_select_txt   = 'Select';
    } else {
        var opt_required_txt = '�ʼ� �Է�';
        var opt_select_txt   = '���� �Է�';
    }

    // wish �� �������� �ʼ�üũ ����
    for (var i = 0; i < optionInfo.length; i++) {
        if (optionType == 'PC') {
            if (temp != 'check' && (document.getElementById('pre_optionlist_' + i).value.trim() == opt_select_txt || document.getElementById('pre_optionlist_' + i).value.trim() == opt_required_txt)) {
                document.getElementById('pre_optionlist_' + i).value = '';
            }
            if (optionInfo[i] > maxsize) {
                if (shop_language == 'eng') {
                    alert("You have exceeded the maximum length. Please check that you entered a maximum of " + (maxsize / 2) + " korean characters or " + maxsize + " english letters/numbers/signs");
                } else {
                    alert("�ɼ� �Է� ������ �ʰ��Ǿ����ϴ�.\n�ѹ� �� Ȯ�����ּ���\n" + "�ѱ۸�" + (maxsize / 2) + "�� �̳� Ȥ�� ����/����/��ȣ�� " + maxsize + "�� �̳����� �����մϴ�.");
                }
                return false;
            }
        } else {
            optionIndex += optionInfo[i] + ',';
        }		
    }

    if (baskettype == 'A' && temp != 'check') {
        form.ordertype.value += '|parent.|layer';
        form.target = 'loginiframe';
    } else if (baskettype == 'Y' && temp != 'check') {
        form.ordertype.value += '|parent.';
        form.target = 'loginiframe';
    }
    form.mode.value = 'wish';
    form.optioncode.value = optionIndex;
    if(mobileuse == 'Y') {
        form.action = '/m/product.html';
    } else {
        form.action = '/shop/shopdetail.html';
    }
    if (temp != 'check') form.submit();
};