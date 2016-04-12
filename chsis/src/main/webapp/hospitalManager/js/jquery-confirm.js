/*!
 * jquery-confirm v2.0.0 (http://craftpip.github.io/jquery-confirm/)
 * Author: Boniface Pereira
 * Website: www.craftpip.com
 * Contact: hey@craftpip.com
 *
 * Copyright 2013-2015 jquery-confirm
 * Licensed under MIT (https://github.com/craftpip/jquery-confirm/blob/master/LICENSE)
 */

if (typeof jQuery === 'undefined') {
    throw new Error('jquery-confirm requires jQuery');
}

var jconfirm, Jconfirm;
(function ($) {
    "use strict";
    $.fn.confirm = function (options) {
        if(typeof options === 'undefined') options = {};
        /*
         *  Alias of jconfirm to emulate native confirm
         */
        var $this = $(this);
        $this.on('click', function (e) {
            e.preventDefault();
            if ($this.attr('href'))
                options['confirm'] = function () {
                    location.href = $this.attr('href');
                };
            $.confirm(options);
        });
        return $this;
    };
    $.confirm = function (options) {
        /*
         *  Alias of jconfirm
         */
        return jconfirm(options);
    };
    $.alert = function (options) {
        /*
         *  Alias of jconfirm
         */
        options.cancelButton = false;
        return jconfirm(options);
    };
    $.dialog = function (options) {
        /*
         *  Alias of jconfirm
         */
        options.cancelButton = false;
        options.confirmButton = false;
        options.confirmKeys = [13];
        return jconfirm(options);
    };
    jconfirm = function (options) {
        if (typeof options === 'undefined')
            options = {};
        /*
         * initial function for calling.
         */
        if (jconfirm.defaults) {
            /*
             * Merge global defaults with plugin defaults
             */
            $.extend(jconfirm.pluginDefaults, jconfirm.defaults);
        }
        /*
         * merge options with plugin defaults.
         */
        var options = $.extend({}, jconfirm.pluginDefaults, options);
        return new Jconfirm(options);
    };
    Jconfirm = function (options) {
        /*
         * constructor function Jconfirm,
         * options = user options.
         */
        $.extend(this, options);
        this._init();
    };
    Jconfirm.prototype = {
        _init: function () {
            var that = this;
            this._rand = Math.round(Math.random() * 99999);
            this._buildHTML();
            this._bindEvents();
            setTimeout(function () {
                that.open();
            }, 0);
        },
        animations: ['anim-scale', 'anim-top', 'anim-bottom', 'anim-left', 'anim-right', 'anim-zoom', 'anim-opacity', 'anim-none', 'anim-rotate', 'anim-rotatex', 'anim-rotatey', 'anim-scalex', 'anim-scaley'],
        _buildHTML: function () {
            /*
             * Cleaning animations.
             */
            this.animation = 'anim-' + this.animation.toLowerCase();
            this.closeAnimation = 'anim-' + this.closeAnimation.toLowerCase();

            /*
             * Append html to body.
             */
            this.$el = $(this.template).appendTo(this.container).addClass(this.theme);
            this.$el.find('.jconfirm-box-container').addClass(this.columnClass);

            this.CSS = {
                '-webkit-transition-duration': this.animationSpeed / 1000 + 's',
                'transition-duration': this.animationSpeed / 1000 + 's',
                '-webkit-transition-timing-function': 'cubic-bezier(.38,1.28,.2, ' + this.animationBounce + ')',
                'transition-timing-function': 'cubic-bezier(.38,1.28,.2, ' + this.animationBounce + ')'
            };
            //0.27, 1.12, 0.32
            this.$el.find('.jconfirm-bg').css(this.CSS);
            this.$b = this.$el.find('.jconfirm-box').css(this.CSS).addClass(this.animation);
            this.$body = this.$b; // alias

            /*
             * Add rtl class if rtl option has selected
             */
            if (this.rtl)
                this.$el.addClass("rtl");

            /*
             * Setup title contents
             */
            this.$title = this.$el.find('div.title');
            this.setTitle();
            this.contentDiv = this.$el.find('div.content');
            this.$content = this.contentDiv; // alias

            /*
             * Settings up buttons
             */
            this.$btnc = this.$el.find('.buttons');
            if (this.confirmButton && this.confirmButton.trim() !== '') {
                this.$confirmButton = $('<button class="btn">' + this.confirmButton + '</button>').appendTo(this.$btnc).addClass(this.confirmButtonClass);
            }

            if (this.cancelButton && this.cancelButton.trim() !== '') {
                this.$cancelButton = $('<button class="btn">' + this.cancelButton + '</button>').appendTo(this.$btnc).addClass(this.cancelButtonClass);
            }

            if (!this.confirmButton && !this.cancelButton) {
                this.$btnc.remove();
            }

            if (!this.confirmButton && !this.cancelButton && this.closeIcon === null) {
                this.$closeButton = this.$b.find('.closeIcon').show();
            }

            if (this.closeIcon === true) {
                this.$closeButton = this.$b.find('.closeIcon').show();
            }

            this.setContent();

            if (this.autoClose)
                this._startCountDown();
        },
        setTitle: function (string) {
            this.title = (typeof string !== 'undefined') ? string : this.title;

            if (this.title && this.$title) {
                this.$title.html('<i class="' + this.icon + '"></i> ' + this.title);
            } else {
                this.$title.remove();
            }
        },
        setContent: function (string) {
            var that = this;
            this.content = (string) ? string : this.content;
            var animate = (string) ? true : false;

            /*
             * Set content.
             */
            if (typeof this.content === 'boolean') {
                if (!this.content)
                    this.contentDiv.remove(); else
                    console.error('Invalid option for property content: passed TRUE');
            } else if (typeof this.content === 'string') {

                if (this.content.substr(0, 4).toLowerCase() === 'url:') {
                    this.contentDiv.html('');
                    this.$btnc.find('button').prop('disabled', true);
                    var url = this.content.substring(4, this.content.length);
                    $.get(url).done(function (html) {
                        that.contentDiv.html(html);
                    }).always(function (data, status, xhr) {
                        if (typeof that.contentLoaded === 'function')
                            that.contentLoaded(data, status, xhr);

                        that.$btnc.find('button').prop('disabled', false);
                        that.setDialogCenter();
                    });
                } else {
                    this.contentDiv.html(this.content);
                }

            } else if (typeof this.content === 'function') {

                this.contentDiv.html('');
                this.$btnc.find('button').attr('disabled', 'disabled');

                var promise = this.content(this);
                if (typeof promise !== 'object') {
                    console.error('The content function must return jquery promise.');
                } else if (typeof promise.always !== 'function') {
                    console.error('The object returned is not a jquery promise.');
                } else {
                    promise.always(function (data, status) {
                        that.$btnc.find('button').removeAttr('disabled');
                        that.setDialogCenter();
                    });
                }

            } else {
                console.error('Invalid option for property content, passed: ' + typeof this.content);
            }

            this.setDialogCenter(animate);
        },
        _startCountDown: function () {
            var opt = this.autoClose.split('|');
            if (/cancel/.test(opt[0]) && this.type === 'alert') {
                return false;
            } else if (/confirm|cancel/.test(opt[0])) {
                this.$cd = $('<span class="countdown">').appendTo(this['$' + opt[0] + 'Button']);
                var that = this;
                that.$cd.parent().click();
                var time = opt[1] / 1000;
                this.interval = setInterval(function () {
                    that.$cd.html(' [' + (time -= 1) + ']');
                    if (time === 0) {
                        that.$cd.parent().trigger('click');
                        clearInterval(that.interval);
                    }
                }, 1000);
            } else {
                console.error('Invalid option ' + opt[0] + ', must be confirm/cancel');
            }
        },
        _bindEvents: function () {
            var that = this;
            var boxClicked = false;

            this.$el.find('.jconfirm-scrollpane').click(function (e) {
                // ignore propagated clicks
                if (!boxClicked) {
                    // background clicked
                    if (that.backgroundDismiss) {
                        that.cancel();
                        that.close();
                    } else {
                        that.$b.addClass('hilight');
                        setTimeout(function () {
                            that.$b.removeClass('hilight');
                        }, 400);
                    }
                }
                boxClicked = false;
            });

            this.$el.find('.jconfirm-box').click(function (e) {
                boxClicked = true;
            });

            if (this.$confirmButton) {
                this.$confirmButton.click(function (e) {
                    e.preventDefault();
                    var r = that.confirm(that.$b);
                    that.onAction('confirm');

                    if (typeof r === 'undefined' || r)
                        that.close();
                });
            }
            if (this.$cancelButton) {
                this.$cancelButton.click(function (e) {
                    e.preventDefault();
                    var r = that.cancel(that.$b);
                    that.onAction('cancel');

                    if (typeof r === 'undefined' || r)
                        that.close();
                });
            }
            if (this.$closeButton) {
                this.$closeButton.click(function (e) {
                    e.preventDefault();
                    that.cancel();
                    that.onAction('close');
                    that.close();
                });
            }
            if (this.keyboardEnabled) {
                setTimeout(function () {
                    $(window).on('keyup.' + this._rand, function (e) {
                        that.reactOnKey(e);
                    });
                }, 500);
            }

            $(window).on('resize.' + this._rand, function () {
                that.setDialogCenter(true);
            });
        },
        reactOnKey: function key(e) {

            /*
             * prevent keyup event if the dialog is not last!
             */
            var a = $('.jconfirm');
            if (a.eq(a.length - 1)[0] !== this.$el[0])
                return false;

            var key = e.which;
            // Do not react if Enter/Space is pressed on input elements
            if (this.contentDiv.find(':input').is(':focus') && /13|32/.test(key))
                return false;

            if ($.inArray(key, this.cancelKeys) !== -1) {
                /*
                 * Cancel key pressed.
                 */
                if (!this.backgroundDismiss) {
                    /*
                     * If background dismiss is false, Glow the modal.
                     */
                    this.$el.find('.jconfirm-bg').click();
                    return false;
                }

                if (this.$cancelButton) {
                    this.$cancelButton.click();
                } else {
                    this.close();
                }
            }
            if ($.inArray(key, this.confirmKeys) !== -1) {
                /*
                 * Confirm key pressed.
                 */
                if (this.$confirmButton) {
                    this.$confirmButton.click();
                }
            }
        },
        setDialogCenter: function (animate) {
            var windowHeight = $(window).height();
            var boxHeight = this.$b.outerHeight();
            var topMargin = (windowHeight - boxHeight) / 2;
            var minMargin = 100;
            if (boxHeight > (windowHeight - minMargin)) {
                var style = {
                    'margin-top': minMargin / 2,
                    'margin-bottom': minMargin / 2
                }
            } else {
                var style = {
                    'margin-top': topMargin
                }
            }
            if (animate) {
                this.$b.animate(style, {
                    duration: this.animationSpeed,
                    queue: false
                });
            } else {
                this.$b.css(style);
            }
        },
        close: function () {
            var that = this;

            if (this.isClosed())
                return false;

            if (typeof this.onClose === 'function')
                this.onClose();
            /*
             unbind the window resize & keyup event.
             */
            $(window).unbind('resize.' + this._rand);
            if (this.keyboardEnabled)
                $(window).unbind('keyup.' + this._rand);

            that.$el.find('.jconfirm-bg').removeClass('seen');
            this.$b.addClass(this.closeAnimation);
            var closeTimer = (this.closeAnimation == 'anim-none') ? 0 : this.animationSpeed;
            setTimeout(function () {
                that.$el.remove();
            }, closeTimer + 50); // wait 50 miliseconds more, for the animation to end gracefully.

            jconfirm.record.closed += 1;
            jconfirm.record.currentlyOpen -= 1;

            if (jconfirm.record.currentlyOpen < 1)
                $('body').removeClass('jconfirm-noscroll');

            return true;
        },
        open: function () {
            var that = this;
            if (this.isClosed())
                return false;

            that.$el.find('.jconfirm-bg').addClass('seen');

            $('body').addClass('jconfirm-noscroll');
            this.$b.removeClass(this.animations.join(' '));
            this.$b.find('input[autofocus]:visible:first').focus();
            jconfirm.record.opened += 1;
            jconfirm.record.currentlyOpen += 1;
            if (typeof this.onOpen === 'function')
                this.onOpen();

            var jcr = 'jconfirm-box' + this._rand;
            this.$b.attr('aria-labelledby', jcr).attr('tabindex', -1).focus();
            if (this.$title)
                this.$title.attr('id', jcr); else if (this.$content)
                this.$content.attr('id', jcr);

            return true;
        },
        isClosed: function () {
            return this.$el.css('display') === '';
        }
    };

    jconfirm.pluginDefaults = {
        template: '<div class="jconfirm"><div class="jconfirm-bg"></div><div class="jconfirm-scrollpane"><div class="container"><div class="row"><div class="jconfirm-box-container span6 offset3"><div class="jconfirm-box" role="dialog" aria-labelledby="labelled" tabindex="-1"><div class="closeIcon"><span class="glyphicon glyphicon-remove"></span></div><div class="title"></div><div class="content"></div><div class="buttons"></div><div class="jquery-clear"></div></div></div></div></div></div></div>',
        title: '提醒',
        content: '确定继续操作?',
        contentLoaded: function () {
        },
        icon: '',
        confirmButton: '确认',
        cancelButton: '取消',
        confirmButtonClass: 'btn-default',
        cancelButtonClass: 'btn-default',
        theme: 'white',
        animation: 'zoom',
        closeAnimation: 'scale',
        animationSpeed: 500,
        animationBounce: 1.2,
        keyboardEnabled: false,
        rtl: false,
        confirmKeys: [13, 32], // ENTER or SPACE key
        cancelKeys: [27], // ESC key
        container: 'body',
        confirm: function () {
        },
        cancel: function () {
        },
        backgroundDismiss: true,
        autoClose: false,
        closeIcon: null,
        columnClass: 'col-md-4 col-md-offset-4',
        onOpen: function () {
        },
        onClose: function () {
        },
        onAction: function () {
        }
    };

    jconfirm.record = {
        opened: 0,
        closed: 0,
        currentlyOpen: 0
    };
})(jQuery);
