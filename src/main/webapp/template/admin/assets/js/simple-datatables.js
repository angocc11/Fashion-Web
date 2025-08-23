(function (f) {
    if (typeof exports === "object" && typeof module !== "undefined") {
        module.exports = f();
    } else if (typeof define === "function" && define.amd) {
        define([], f);
    } else {
        var g;
        if (typeof window !== "undefined") {
            g = window;
        } else if (typeof global !== "undefined") {
            g = global;
        } else if (typeof self !== "undefined") {
            g = self;
        } else {
            g = this;
        }
        g.simpleDatatables = f();
    }
})(function () {
    var define, module, exports;
    return (function () {
        function r(e, n, t) {
            function o(i, f) {
                if (!n[i]) {
                    if (!e[i]) {
                        var c = typeof require === "function" && require;
                        if (!f && c) return c(i, true);
                        if (u) return u(i, true);
                        var a = new Error("Cannot find module '" + i + "'");
                        throw ((a.code = "MODULE_NOT_FOUND"), a);
                    }
                    var p = (n[i] = { exports: {} });
                    e[i][0].call(
                        p.exports,
                        function (r) {
                            var n = e[i][1][r];
                            return o(n || r);
                        },
                        p,
                        p.exports,
                        r,
                        e,
                        n,
                        t
                    );
                }
                return n[i].exports;
            }
            for (var u = typeof require === "function" && require, i = 0; i < t.length; i++) o(t[i]);
            return o;
        }
        return r;
    })()(
        {
            1: [
                function (require, module, exports) {
                    (function (global) {
                        (function () {
                            "use strict";
                            var root =
                                typeof globalThis !== "undefined"
                                    ? globalThis
                                    : typeof window !== "undefined"
                                    ? window
                                    : typeof global !== "undefined"
                                    ? global
                                    : typeof self !== "undefined"
                                    ? self
                                    : this;

                            // Utility function
                            function myFunction() {
                                console.log("Utility function executed.");
                            }

                            module.exports = {
                                parseDate: (t, format) => {
                                    let date;
                                    switch (format) {
                                        case "ISO_8601":
                                            date = new Date(t);
                                            break;
                                        case "MYSQL":
                                            date = new Date(t.replace(" ", "T") + "Z");
                                            break;
                                        default:
                                            date = new Date(t);
                                    }
                                    return date.getTime();
                                },
                                myFunction: myFunction,
                            };
                        })();
                    }).call(
                        this,
                        typeof global !== "undefined"
                            ? global
                            : typeof self !== "undefined"
                            ? self
                            : typeof window !== "undefined"
                            ? window
                            : {}
                    );
                },
                {},
            ],
            2: [
                function (require, module, exports) {
                    "use strict";

                    // Import module
                    const utility = require("./utility");

                    // Example usage
                    const parsedDate = utility.parseDate("2024-11-21", "ISO_8601");
                    console.log("Parsed Date:", parsedDate);

                    module.exports = {
                        parsedDate,
                    };
                },
                { "./utility": 1 },
            ],
        },
        {},
        [2]
    )(2);
});
