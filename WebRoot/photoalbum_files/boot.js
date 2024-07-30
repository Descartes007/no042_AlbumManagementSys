//测试编码
(function () {
	var d = document, h = "script", t, i, c = [], s = d.getElementsByTagName(h), s = s[s.length - 1], n = "/_f.js\"></";
	if (typeof JetsumFw != "object") {
		JetsumFw = {Path:s.getAttribute("src").replace("boot.js", ""), Class:{}, JsPath:"jsfiles", Call:function (f) {
			var n = d.createElement(h);
			n.type = "text/java" + h;
			n.src = this.JsPath + "/" + f + ".js";
			alert(n);
			d.body.appendChild(n);
		}, Wait:function (a, b) {
			if (a()) {
				return b();
			}
			setTimeout(function () {
				JetsumFw.Wait(a, b);
			}, 50);
		}};
	}
	var m = "<" + h + " type=\"text/java" + h + "\" src=\"" + JetsumFw.Path;
	$ = function (a) {
		return d.getElementById(a);
	};
	if (t = s.getAttribute("loadClass")) {
		c = t.split(";");
	}
	for (i in c) {
		d.write(m + "classes" + n.replace("f", c[i]) + h + ">");
	}
	c = [];
	if (t = s.getAttribute("loadPrototype")) {
		c = t.split(";");
	}
	for (i in c) {
		d.write(m + "prototypes" + n.replace("f", c[i]) + h + ">");
	}
})();