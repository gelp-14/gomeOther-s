;(function ( $, window, document, undefined ) {
		var a = $;
		var pluginName = "smartkey",
		defaults = {
			name: null,
			keys: null,
			excludeInput: !0,
			callback: null
		};
		
		var c = {};
	var d = [];
	var e = null;
	var f = null;
	var g = !1;
	var h = !1;
	var i = {
		27: "esc",
		9: "tab",
		32: "space",
		13: "enter",
		8: "backspace",
		145: "scrollclock",
		20: "capslock",
		144: "numlock",
		19: "pause",
		45: "insert",
		36: "home",
		46: "delete",
		35: "end",
		33: "pageup",
		34: "pagedown",
		37: "left",
		38: "up",
		39: "right",
		40: "down",
		112: "f1",
		113: "f2",
		114: "f3",
		115: "f4",
		116: "f5",
		117: "f6",
		118: "f7",
		119: "f8",
		18: "alt",
		120: "f9",
		121: "f10",
		122: "f11",
		123: "f12",
		17: "ctrl",
		16: "shift",
		109: "-",
		107: "=",
		219: "[",
		221: "]",
		220: "\\",
		222: "'",
		187: "=",
		188: ",",
		189: "-",
		190: ".",
		191: "/",
		96: "0",
		97: "1",
		98: "2",
		99: "3",
		100: "4",
		101: "5",
		102: "6",
		103: "7",
		104: "8",
		105: "9",
		106: "*",
		110: ".",
		111: "/",
		48: "0",
		49: "1",
		50: "2",
		51: "3",
		52: "4",
		53: "5",
		54: "6",
		55: "7",
		56: "8",
		57: "9",
		65: "a",
		66: "b",
		67: "c",
		68: "d",
		69: "e",
		70: "f",
		71: "g",
		72: "h",
		73: "i",
		74: "j",
		75: "k",
		76: "l",
		77: "m",
		78: "n",
		79: "o",
		80: "p",
		81: "q",
		82: "r",
		83: "s",
		84: "t",
		85: "u",
		86: "v",
		87: "w",
		88: "x",
		89: "y",
		90: "z"
	};
	var j = {
		27: "esc",
		9: "tab",
		13: "enter",
		17: "ctrl",
		16: "shift",
		18: "alt",
		20: "capslock",
		144: "numlock",
		35: "end",
		33: "pageup",
		34: "pagedown",
		37: "left",
		38: "up",
		39: "right",
		40: "down"
	};
	var k = function(b, d) {
			this.el = b, this.name = d.name, this.keys = d.keys, this.excludeInput = d.excludeInput, this.callback = d.callback, c[d.name] = this, null != b && (b.bind("click", function() {
				h = !0, f = b, setTimeout(function() {
					h = !1
				}, 50)
			}), g || (g = !0, a(document).bind("click", function() {
				h || (f = null)
			})))
		};

	function l(b) {
		var g = d.join("+");
		a.each(c, function(c, d) {
			(b && !d.excludeInput || !b && d.excludeInput) && a.each(d.keys, function(a, b) {
				return g == b ? (f == d.el ? d.callback.call(d.el, e) : null == f && d.callback(e), !1) : void 0
			})
		})
	}
	function m() {
		for (var a = 0; a < d.length; a++) if (d[a].length > 1) return !0;
		return !1
	}
	a(document).bind("keydown", function(a) {
		var b = document.activeElement.tagName.toLowerCase();
		var c = a ? a : window.event;
		var f = null;
		"input" == b || "textarea" == b ? (f = j[c.keyCode || c.which], f && f != e && (e = f, d = [f], l(!0), e = null)) : (f = i[c.keyCode || c.which], f && f != e && (e = f, d.push(f), l(!1)))
	}), a(document).bind("keyup", function(a) {
		var b = document.activeElement.tagName.toLowerCase();
		var c = a ? a : window.event;
		if (f = i[c.keyCode || c.which], "input" == b || "textarea" == b) d = [], e = null;
		else {
			var f = i[c.keyCode || c.which];
			for (var g = d.length - 1; g >= 0; g--) f == d[g] && d.splice(g, 1);
			m() && (d = []), e = null
		}
	})


		function Smartkey ( el, options ) {
				this.el = a(el);
				this.options = a.extend( {}, defaults, options );
				this._defaults = defaults;
				this._name = pluginName;
				this.init();
		}

		a.extend(Smartkey.prototype, {
				hotKey: null,
				init: function() {
					var a = this;
					var b = a.el;
					var c = a.options;
					(b[0] == document.body || b[0] == document || b[0] == window) && (b = null), a.hotKey = new k(b, c)
				}
		});
		a.fn[ pluginName ] = function ( options ) {
				return this.each(function() {
						if ( !a.data( this, "plugin_" + pluginName ) ) {
								a.data( this, "plugin_" + pluginName, new Smartkey( this, options ) );
						}
						// console.log($.data(this,"plugin_elevator"));
				});
		};

})( jQuery, window, document );