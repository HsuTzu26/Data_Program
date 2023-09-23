(function(){/*

 Copyright The Closure Library Authors.
 SPDX-License-Identifier: Apache-2.0
*/
'use strict';var m;function aa(a){var b=0;return function(){return b<a.length?{done:!1,value:a[b++]}:{done:!0}}}
var da="function"==typeof Object.defineProperties?Object.defineProperty:function(a,b,c){if(a==Array.prototype||a==Object.prototype)return a;a[b]=c.value;return a};
function ea(a){a=["object"==typeof globalThis&&globalThis,a,"object"==typeof window&&window,"object"==typeof self&&self,"object"==typeof global&&global];for(var b=0;b<a.length;++b){var c=a[b];if(c&&c.Math==Math)return c}throw Error("Cannot find global object");}
var fa=ea(this);function r(a,b){if(b)a:{var c=fa;a=a.split(".");for(var d=0;d<a.length-1;d++){var e=a[d];if(!(e in c))break a;c=c[e]}a=a[a.length-1];d=c[a];b=b(d);b!=d&&null!=b&&da(c,a,{configurable:!0,writable:!0,value:b})}}
r("Symbol",function(a){function b(f){if(this instanceof b)throw new TypeError("Symbol is not a constructor");return new c(d+(f||"")+"_"+e++,f)}
function c(f,g){this.h=f;da(this,"description",{configurable:!0,writable:!0,value:g})}
if(a)return a;c.prototype.toString=function(){return this.h};
var d="jscomp_symbol_"+(1E9*Math.random()>>>0)+"_",e=0;return b});
r("Symbol.iterator",function(a){if(a)return a;a=Symbol("Symbol.iterator");for(var b="Array Int8Array Uint8Array Uint8ClampedArray Int16Array Uint16Array Int32Array Uint32Array Float32Array Float64Array".split(" "),c=0;c<b.length;c++){var d=fa[b[c]];"function"===typeof d&&"function"!=typeof d.prototype[a]&&da(d.prototype,a,{configurable:!0,writable:!0,value:function(){return ha(aa(this))}})}return a});
function ha(a){a={next:a};a[Symbol.iterator]=function(){return this};
return a}
function t(a){var b="undefined"!=typeof Symbol&&Symbol.iterator&&a[Symbol.iterator];return b?b.call(a):{next:aa(a)}}
function ia(a){if(!(a instanceof Array)){a=t(a);for(var b,c=[];!(b=a.next()).done;)c.push(b.value);a=c}return a}
function ja(a,b){return Object.prototype.hasOwnProperty.call(a,b)}
var ka="function"==typeof Object.assign?Object.assign:function(a,b){for(var c=1;c<arguments.length;c++){var d=arguments[c];if(d)for(var e in d)ja(d,e)&&(a[e]=d[e])}return a};
r("Object.assign",function(a){return a||ka});
var la="function"==typeof Object.create?Object.create:function(a){function b(){}
b.prototype=a;return new b},na;
if("function"==typeof Object.setPrototypeOf)na=Object.setPrototypeOf;else{var oa;a:{var pa={a:!0},ra={};try{ra.__proto__=pa;oa=ra.a;break a}catch(a){}oa=!1}na=oa?function(a,b){a.__proto__=b;if(a.__proto__!==b)throw new TypeError(a+" is not extensible");return a}:null}var sa=na;
function u(a,b){a.prototype=la(b.prototype);a.prototype.constructor=a;if(sa)sa(a,b);else for(var c in b)if("prototype"!=c)if(Object.defineProperties){var d=Object.getOwnPropertyDescriptor(b,c);d&&Object.defineProperty(a,c,d)}else a[c]=b[c];a.N=b.prototype}
function ta(){this.u=!1;this.l=null;this.i=void 0;this.h=1;this.m=this.v=0;this.I=this.j=null}
function va(a){if(a.u)throw new TypeError("Generator is already running");a.u=!0}
ta.prototype.A=function(a){this.i=a};
function wa(a,b){a.j={La:b,Qa:!0};a.h=a.v||a.m}
ta.prototype.return=function(a){this.j={return:a};this.h=this.m};
function w(a,b,c){a.h=c;return{value:b}}
ta.prototype.o=function(a){this.h=a};
function xa(a,b,c){a.v=b;void 0!=c&&(a.m=c)}
function ya(a,b){a.h=b;a.v=0}
function za(a){a.v=0;var b=a.j.La;a.j=null;return b}
function Aa(a){a.I=[a.j];a.v=0;a.m=0}
function Ba(a){var b=a.I.splice(0)[0];(b=a.j=a.j||b)?b.Qa?a.h=a.v||a.m:void 0!=b.o&&a.m<b.o?(a.h=b.o,a.j=null):a.h=a.m:a.h=0}
function Ca(a){this.h=new ta;this.i=a}
function Da(a,b){va(a.h);var c=a.h.l;if(c)return Ea(a,"return"in c?c["return"]:function(d){return{value:d,done:!0}},b,a.h.return);
a.h.return(b);return Fa(a)}
function Ea(a,b,c,d){try{var e=b.call(a.h.l,c);if(!(e instanceof Object))throw new TypeError("Iterator result "+e+" is not an object");if(!e.done)return a.h.u=!1,e;var f=e.value}catch(g){return a.h.l=null,wa(a.h,g),Fa(a)}a.h.l=null;d.call(a.h,f);return Fa(a)}
function Fa(a){for(;a.h.h;)try{var b=a.i(a.h);if(b)return a.h.u=!1,{value:b.value,done:!1}}catch(c){a.h.i=void 0,wa(a.h,c)}a.h.u=!1;if(a.h.j){b=a.h.j;a.h.j=null;if(b.Qa)throw b.La;return{value:b.return,done:!0}}return{value:void 0,done:!0}}
function Ga(a){this.next=function(b){va(a.h);a.h.l?b=Ea(a,a.h.l.next,b,a.h.A):(a.h.A(b),b=Fa(a));return b};
this.throw=function(b){va(a.h);a.h.l?b=Ea(a,a.h.l["throw"],b,a.h.A):(wa(a.h,b),b=Fa(a));return b};
this.return=function(b){return Da(a,b)};
this[Symbol.iterator]=function(){return this}}
function Ja(a){function b(d){return a.next(d)}
function c(d){return a.throw(d)}
return new Promise(function(d,e){function f(g){g.done?d(g.value):Promise.resolve(g.value).then(b,c).then(f,e)}
f(a.next())})}
function x(a){return Ja(new Ga(new Ca(a)))}
function Ka(){for(var a=Number(this),b=[],c=a;c<arguments.length;c++)b[c-a]=arguments[c];return b}
r("Reflect.setPrototypeOf",function(a){return a?a:sa?function(b,c){try{return sa(b,c),!0}catch(d){return!1}}:null});
r("Promise",function(a){function b(g){this.h=0;this.j=void 0;this.i=[];this.u=!1;var h=this.l();try{g(h.resolve,h.reject)}catch(k){h.reject(k)}}
function c(){this.h=null}
function d(g){return g instanceof b?g:new b(function(h){h(g)})}
if(a)return a;c.prototype.i=function(g){if(null==this.h){this.h=[];var h=this;this.j(function(){h.m()})}this.h.push(g)};
var e=fa.setTimeout;c.prototype.j=function(g){e(g,0)};
c.prototype.m=function(){for(;this.h&&this.h.length;){var g=this.h;this.h=[];for(var h=0;h<g.length;++h){var k=g[h];g[h]=null;try{k()}catch(l){this.l(l)}}}this.h=null};
c.prototype.l=function(g){this.j(function(){throw g;})};
b.prototype.l=function(){function g(l){return function(n){k||(k=!0,l.call(h,n))}}
var h=this,k=!1;return{resolve:g(this.wa),reject:g(this.m)}};
b.prototype.wa=function(g){if(g===this)this.m(new TypeError("A Promise cannot resolve to itself"));else if(g instanceof b)this.bb(g);else{a:switch(typeof g){case "object":var h=null!=g;break a;case "function":h=!0;break a;default:h=!1}h?this.la(g):this.v(g)}};
b.prototype.la=function(g){var h=void 0;try{h=g.then}catch(k){this.m(k);return}"function"==typeof h?this.cb(h,g):this.v(g)};
b.prototype.m=function(g){this.A(2,g)};
b.prototype.v=function(g){this.A(1,g)};
b.prototype.A=function(g,h){if(0!=this.h)throw Error("Cannot settle("+g+", "+h+"): Promise already settled in state"+this.h);this.h=g;this.j=h;2===this.h&&this.ab();this.I()};
b.prototype.ab=function(){var g=this;e(function(){if(g.O()){var h=fa.console;"undefined"!==typeof h&&h.error(g.j)}},1)};
b.prototype.O=function(){if(this.u)return!1;var g=fa.CustomEvent,h=fa.Event,k=fa.dispatchEvent;if("undefined"===typeof k)return!0;"function"===typeof g?g=new g("unhandledrejection",{cancelable:!0}):"function"===typeof h?g=new h("unhandledrejection",{cancelable:!0}):(g=fa.document.createEvent("CustomEvent"),g.initCustomEvent("unhandledrejection",!1,!0,g));g.promise=this;g.reason=this.j;return k(g)};
b.prototype.I=function(){if(null!=this.i){for(var g=0;g<this.i.length;++g)f.i(this.i[g]);this.i=null}};
var f=new c;b.prototype.bb=function(g){var h=this.l();g.na(h.resolve,h.reject)};
b.prototype.cb=function(g,h){var k=this.l();try{g.call(h,k.resolve,k.reject)}catch(l){k.reject(l)}};
b.prototype.then=function(g,h){function k(v,p){return"function"==typeof v?function(y){try{l(v(y))}catch(z){n(z)}}:p}
var l,n,q=new b(function(v,p){l=v;n=p});
this.na(k(g,l),k(h,n));return q};
b.prototype.catch=function(g){return this.then(void 0,g)};
b.prototype.na=function(g,h){function k(){switch(l.h){case 1:g(l.j);break;case 2:h(l.j);break;default:throw Error("Unexpected state: "+l.h);}}
var l=this;null==this.i?f.i(k):this.i.push(k);this.u=!0};
b.resolve=d;b.reject=function(g){return new b(function(h,k){k(g)})};
b.race=function(g){return new b(function(h,k){for(var l=t(g),n=l.next();!n.done;n=l.next())d(n.value).na(h,k)})};
b.all=function(g){var h=t(g),k=h.next();return k.done?d([]):new b(function(l,n){function q(y){return function(z){v[y]=z;p--;0==p&&l(v)}}
var v=[],p=0;do v.push(void 0),p++,d(k.value).na(q(v.length-1),n),k=h.next();while(!k.done)})};
return b});
r("WeakMap",function(a){function b(k){this.h=(h+=Math.random()+1).toString();if(k){k=t(k);for(var l;!(l=k.next()).done;)l=l.value,this.set(l[0],l[1])}}
function c(){}
function d(k){var l=typeof k;return"object"===l&&null!==k||"function"===l}
function e(k){if(!ja(k,g)){var l=new c;da(k,g,{value:l})}}
function f(k){var l=Object[k];l&&(Object[k]=function(n){if(n instanceof c)return n;Object.isExtensible(n)&&e(n);return l(n)})}
if(function(){if(!a||!Object.seal)return!1;try{var k=Object.seal({}),l=Object.seal({}),n=new a([[k,2],[l,3]]);if(2!=n.get(k)||3!=n.get(l))return!1;n.delete(k);n.set(l,4);return!n.has(k)&&4==n.get(l)}catch(q){return!1}}())return a;
var g="$jscomp_hidden_"+Math.random();f("freeze");f("preventExtensions");f("seal");var h=0;b.prototype.set=function(k,l){if(!d(k))throw Error("Invalid WeakMap key");e(k);if(!ja(k,g))throw Error("WeakMap key fail: "+k);k[g][this.h]=l;return this};
b.prototype.get=function(k){return d(k)&&ja(k,g)?k[g][this.h]:void 0};
b.prototype.has=function(k){return d(k)&&ja(k,g)&&ja(k[g],this.h)};
b.prototype.delete=function(k){return d(k)&&ja(k,g)&&ja(k[g],this.h)?delete k[g][this.h]:!1};
return b});
r("Map",function(a){function b(){var h={};return h.previous=h.next=h.head=h}
function c(h,k){var l=h.h;return ha(function(){if(l){for(;l.head!=h.h;)l=l.previous;for(;l.next!=l.head;)return l=l.next,{done:!1,value:k(l)};l=null}return{done:!0,value:void 0}})}
function d(h,k){var l=k&&typeof k;"object"==l||"function"==l?f.has(k)?l=f.get(k):(l=""+ ++g,f.set(k,l)):l="p_"+k;var n=h.data_[l];if(n&&ja(h.data_,l))for(h=0;h<n.length;h++){var q=n[h];if(k!==k&&q.key!==q.key||k===q.key)return{id:l,list:n,index:h,entry:q}}return{id:l,list:n,index:-1,entry:void 0}}
function e(h){this.data_={};this.h=b();this.size=0;if(h){h=t(h);for(var k;!(k=h.next()).done;)k=k.value,this.set(k[0],k[1])}}
if(function(){if(!a||"function"!=typeof a||!a.prototype.entries||"function"!=typeof Object.seal)return!1;try{var h=Object.seal({x:4}),k=new a(t([[h,"s"]]));if("s"!=k.get(h)||1!=k.size||k.get({x:4})||k.set({x:4},"t")!=k||2!=k.size)return!1;var l=k.entries(),n=l.next();if(n.done||n.value[0]!=h||"s"!=n.value[1])return!1;n=l.next();return n.done||4!=n.value[0].x||"t"!=n.value[1]||!l.next().done?!1:!0}catch(q){return!1}}())return a;
var f=new WeakMap;e.prototype.set=function(h,k){h=0===h?0:h;var l=d(this,h);l.list||(l.list=this.data_[l.id]=[]);l.entry?l.entry.value=k:(l.entry={next:this.h,previous:this.h.previous,head:this.h,key:h,value:k},l.list.push(l.entry),this.h.previous.next=l.entry,this.h.previous=l.entry,this.size++);return this};
e.prototype.delete=function(h){h=d(this,h);return h.entry&&h.list?(h.list.splice(h.index,1),h.list.length||delete this.data_[h.id],h.entry.previous.next=h.entry.next,h.entry.next.previous=h.entry.previous,h.entry.head=null,this.size--,!0):!1};
e.prototype.clear=function(){this.data_={};this.h=this.h.previous=b();this.size=0};
e.prototype.has=function(h){return!!d(this,h).entry};
e.prototype.get=function(h){return(h=d(this,h).entry)&&h.value};
e.prototype.entries=function(){return c(this,function(h){return[h.key,h.value]})};
e.prototype.keys=function(){return c(this,function(h){return h.key})};
e.prototype.values=function(){return c(this,function(h){return h.value})};
e.prototype.forEach=function(h,k){for(var l=this.entries(),n;!(n=l.next()).done;)n=n.value,h.call(k,n[1],n[0],this)};
e.prototype[Symbol.iterator]=e.prototype.entries;var g=0;return e});
function La(a,b,c){if(null==a)throw new TypeError("The 'this' value for String.prototype."+c+" must not be null or undefined");if(b instanceof RegExp)throw new TypeError("First argument to String.prototype."+c+" must not be a regular expression");return a+""}
r("String.prototype.endsWith",function(a){return a?a:function(b,c){var d=La(this,b,"endsWith");b+="";void 0===c&&(c=d.length);c=Math.max(0,Math.min(c|0,d.length));for(var e=b.length;0<e&&0<c;)if(d[--c]!=b[--e])return!1;return 0>=e}});
r("Array.prototype.find",function(a){return a?a:function(b,c){a:{var d=this;d instanceof String&&(d=String(d));for(var e=d.length,f=0;f<e;f++){var g=d[f];if(b.call(c,g,f,d)){b=g;break a}}b=void 0}return b}});
r("String.prototype.startsWith",function(a){return a?a:function(b,c){var d=La(this,b,"startsWith");b+="";var e=d.length,f=b.length;c=Math.max(0,Math.min(c|0,d.length));for(var g=0;g<f&&c<e;)if(d[c++]!=b[g++])return!1;return g>=f}});
r("Number.isFinite",function(a){return a?a:function(b){return"number"!==typeof b?!1:!isNaN(b)&&Infinity!==b&&-Infinity!==b}});
function Ma(a,b){a instanceof String&&(a+="");var c=0,d=!1,e={next:function(){if(!d&&c<a.length){var f=c++;return{value:b(f,a[f]),done:!1}}d=!0;return{done:!0,value:void 0}}};
e[Symbol.iterator]=function(){return e};
return e}
r("Array.prototype.entries",function(a){return a?a:function(){return Ma(this,function(b,c){return[b,c]})}});
r("Number.isNaN",function(a){return a?a:function(b){return"number"===typeof b&&isNaN(b)}});
r("Object.setPrototypeOf",function(a){return a||sa});
r("Set",function(a){function b(c){this.h=new Map;if(c){c=t(c);for(var d;!(d=c.next()).done;)this.add(d.value)}this.size=this.h.size}
if(function(){if(!a||"function"!=typeof a||!a.prototype.entries||"function"!=typeof Object.seal)return!1;try{var c=Object.seal({x:4}),d=new a(t([c]));if(!d.has(c)||1!=d.size||d.add(c)!=d||1!=d.size||d.add({x:4})!=d||2!=d.size)return!1;var e=d.entries(),f=e.next();if(f.done||f.value[0]!=c||f.value[1]!=c)return!1;f=e.next();return f.done||f.value[0]==c||4!=f.value[0].x||f.value[1]!=f.value[0]?!1:e.next().done}catch(g){return!1}}())return a;
b.prototype.add=function(c){c=0===c?0:c;this.h.set(c,c);this.size=this.h.size;return this};
b.prototype.delete=function(c){c=this.h.delete(c);this.size=this.h.size;return c};
b.prototype.clear=function(){this.h.clear();this.size=0};
b.prototype.has=function(c){return this.h.has(c)};
b.prototype.entries=function(){return this.h.entries()};
b.prototype.values=function(){return this.h.values()};
b.prototype.keys=b.prototype.values;b.prototype[Symbol.iterator]=b.prototype.values;b.prototype.forEach=function(c,d){var e=this;this.h.forEach(function(f){return c.call(d,f,f,e)})};
return b});
r("Object.entries",function(a){return a?a:function(b){var c=[],d;for(d in b)ja(b,d)&&c.push([d,b[d]]);return c}});
r("Array.prototype.keys",function(a){return a?a:function(){return Ma(this,function(b){return b})}});
r("Array.prototype.values",function(a){return a?a:function(){return Ma(this,function(b,c){return c})}});
r("Number.isInteger",function(a){return a?a:function(b){return Number.isFinite(b)?b===Math.floor(b):!1}});
r("Array.from",function(a){return a?a:function(b,c,d){c=null!=c?c:function(h){return h};
var e=[],f="undefined"!=typeof Symbol&&Symbol.iterator&&b[Symbol.iterator];if("function"==typeof f){b=f.call(b);for(var g=0;!(f=b.next()).done;)e.push(c.call(d,f.value,g++))}else for(f=b.length,g=0;g<f;g++)e.push(c.call(d,b[g],g));return e}});
r("Object.is",function(a){return a?a:function(b,c){return b===c?0!==b||1/b===1/c:b!==b&&c!==c}});
r("Array.prototype.includes",function(a){return a?a:function(b,c){var d=this;d instanceof String&&(d=String(d));var e=d.length;c=c||0;for(0>c&&(c=Math.max(c+e,0));c<e;c++){var f=d[c];if(f===b||Object.is(f,b))return!0}return!1}});
r("String.prototype.includes",function(a){return a?a:function(b,c){return-1!==La(this,b,"includes").indexOf(b,c||0)}});
r("Number.MAX_SAFE_INTEGER",function(){return 9007199254740991});
var A=this||self;function B(a,b){a=a.split(".");b=b||A;for(var c=0;c<a.length;c++)if(b=b[a[c]],null==b)return null;return b}
function Na(a){var b=typeof a;b="object"!=b?b:a?Array.isArray(a)?"array":b:"null";return"array"==b||"object"==b&&"number"==typeof a.length}
function Oa(a){var b=typeof a;return"object"==b&&null!=a||"function"==b}
function Pa(a){return Object.prototype.hasOwnProperty.call(a,Qa)&&a[Qa]||(a[Qa]=++Ra)}
var Qa="closure_uid_"+(1E9*Math.random()>>>0),Ra=0;function Sa(a,b,c){return a.call.apply(a.bind,arguments)}
function Ta(a,b,c){if(!a)throw Error();if(2<arguments.length){var d=Array.prototype.slice.call(arguments,2);return function(){var e=Array.prototype.slice.call(arguments);Array.prototype.unshift.apply(e,d);return a.apply(b,e)}}return function(){return a.apply(b,arguments)}}
function Va(a,b,c){Function.prototype.bind&&-1!=Function.prototype.bind.toString().indexOf("native code")?Va=Sa:Va=Ta;return Va.apply(null,arguments)}
function C(a,b){a=a.split(".");var c=A;a[0]in c||"undefined"==typeof c.execScript||c.execScript("var "+a[0]);for(var d;a.length&&(d=a.shift());)a.length||void 0===b?c[d]&&c[d]!==Object.prototype[d]?c=c[d]:c=c[d]={}:c[d]=b}
function Wa(a,b){function c(){}
c.prototype=b.prototype;a.N=b.prototype;a.prototype=new c;a.prototype.constructor=a;a.Mb=function(d,e,f){for(var g=Array(arguments.length-2),h=2;h<arguments.length;h++)g[h-2]=arguments[h];return b.prototype[e].apply(d,g)}}
function Xa(a){return a}
;function Ya(a,b){if(Error.captureStackTrace)Error.captureStackTrace(this,Ya);else{var c=Error().stack;c&&(this.stack=c)}a&&(this.message=String(a));void 0!==b&&(this.fb=b)}
Wa(Ya,Error);Ya.prototype.name="CustomError";function Za(a){a=a.url;var b=/[?&]dsh=1(&|$)/.test(a);this.j=!b&&/[?&]ae=1(&|$)/.test(a);this.l=!b&&/[?&]ae=2(&|$)/.test(a);if((this.h=/[?&]adurl=([^&]*)/.exec(a))&&this.h[1]){try{var c=decodeURIComponent(this.h[1])}catch(d){c=null}this.i=c}}
;function $a(){}
function ab(a){var b=!1,c;return function(){b||(c=a(),b=!0);return c}}
;var bb=Array.prototype.indexOf?function(a,b){return Array.prototype.indexOf.call(a,b,void 0)}:function(a,b){if("string"===typeof a)return"string"!==typeof b||1!=b.length?-1:a.indexOf(b,0);
for(var c=0;c<a.length;c++)if(c in a&&a[c]===b)return c;return-1},D=Array.prototype.forEach?function(a,b,c){Array.prototype.forEach.call(a,b,c)}:function(a,b,c){for(var d=a.length,e="string"===typeof a?a.split(""):a,f=0;f<d;f++)f in e&&b.call(c,e[f],f,a)},cb=Array.prototype.reduce?function(a,b,c){return Array.prototype.reduce.call(a,b,c)}:function(a,b,c){var d=c;
D(a,function(e,f){d=b.call(void 0,d,e,f,a)});
return d};
function db(a,b){b=bb(a,b);var c;(c=0<=b)&&Array.prototype.splice.call(a,b,1);return c}
function eb(a){return Array.prototype.concat.apply([],arguments)}
function gb(a){var b=a.length;if(0<b){for(var c=Array(b),d=0;d<b;d++)c[d]=a[d];return c}return[]}
function hb(a,b){for(var c=1;c<arguments.length;c++){var d=arguments[c];if(Na(d)){var e=a.length||0,f=d.length||0;a.length=e+f;for(var g=0;g<f;g++)a[e+g]=d[g]}else a.push(d)}}
;function ib(a,b){for(var c in a)b.call(void 0,a[c],c,a)}
function jb(a){var b=kb,c;for(c in b)if(a.call(void 0,b[c],c,b))return c}
function lb(a,b){for(var c in a)if(!(c in b)||a[c]!==b[c])return!1;for(var d in b)if(!(d in a))return!1;return!0}
function rb(a){if(!a||"object"!==typeof a)return a;if("function"===typeof a.clone)return a.clone();if("undefined"!==typeof Map&&a instanceof Map)return new Map(a);if("undefined"!==typeof Set&&a instanceof Set)return new Set(a);var b=Array.isArray(a)?[]:"function"!==typeof ArrayBuffer||"function"!==typeof ArrayBuffer.isView||!ArrayBuffer.isView(a)||a instanceof DataView?{}:new a.constructor(a.length),c;for(c in a)b[c]=rb(a[c]);return b}
var sb="constructor hasOwnProperty isPrototypeOf propertyIsEnumerable toLocaleString toString valueOf".split(" ");function tb(a,b){for(var c,d,e=1;e<arguments.length;e++){d=arguments[e];for(c in d)a[c]=d[c];for(var f=0;f<sb.length;f++)c=sb[f],Object.prototype.hasOwnProperty.call(d,c)&&(a[c]=d[c])}}
;var ub;function vb(){}
function wb(a){return new vb(xb,a)}
var xb={};wb("");var yb=String.prototype.trim?function(a){return a.trim()}:function(a){return/^[\s\xa0]*([\s\S]*?)[\s\xa0]*$/.exec(a)[1]},zb=/&/g,Ab=/</g,Bb=/>/g,Cb=/"/g,Db=/'/g,Eb=/\x00/g,Fb=/[\x00&<>"']/;function Gb(){var a=A.navigator;return a&&(a=a.userAgent)?a:""}
function E(a){return-1!=Gb().indexOf(a)}
;function Hb(){return(E("Chrome")||E("CriOS"))&&!E("Edge")||E("Silk")}
;var Ib={};function Jb(a){this.h=Ib===Ib?a:""}
Jb.prototype.toString=function(){return this.h.toString()};var Kb=RegExp("^(?:([^:/?#.]+):)?(?://(?:([^\\\\/?#]*)@)?([^\\\\/?#]*?)(?::([0-9]+))?(?=[\\\\/?#]|$))?([^?#]+)?(?:\\?([^#]*))?(?:#([\\s\\S]*))?$");function Lb(a){return a?decodeURI(a):a}
function Mb(a){return Lb(a.match(Kb)[3]||null)}
function Nb(a){var b=a.match(Kb);a=b[1];var c=b[2],d=b[3];b=b[4];var e="";a&&(e+=a+":");d&&(e+="//",c&&(e+=c+"@"),e+=d,b&&(e+=":"+b));return e}
function Sb(a,b,c){if(Array.isArray(b))for(var d=0;d<b.length;d++)Sb(a,String(b[d]),c);else null!=b&&c.push(a+(""===b?"":"="+encodeURIComponent(String(b))))}
function Tb(a){var b=[],c;for(c in a)Sb(c,a[c],b);return b.join("&")}
var Ub=/#|$/;function Vb(a,b){var c=a.search(Ub);a:{var d=0;for(var e=b.length;0<=(d=a.indexOf(b,d))&&d<c;){var f=a.charCodeAt(d-1);if(38==f||63==f)if(f=a.charCodeAt(d+e),!f||61==f||38==f||35==f)break a;d+=e+1}d=-1}if(0>d)return null;e=a.indexOf("&",d);if(0>e||e>c)e=c;d+=b.length+1;return decodeURIComponent(a.slice(d,-1!==e?e:0).replace(/\+/g," "))}
;function Wb(){return E("iPhone")&&!E("iPod")&&!E("iPad")}
;function Xb(a){Xb[" "](a);return a}
Xb[" "]=function(){};var Yb=E("Opera"),Zb=E("Trident")||E("MSIE"),$b=E("Edge"),ac=E("Gecko")&&!(-1!=Gb().toLowerCase().indexOf("webkit")&&!E("Edge"))&&!(E("Trident")||E("MSIE"))&&!E("Edge"),bc=-1!=Gb().toLowerCase().indexOf("webkit")&&!E("Edge");function cc(){var a=A.document;return a?a.documentMode:void 0}
var dc;a:{var ec="",fc=function(){var a=Gb();if(ac)return/rv:([^\);]+)(\)|;)/.exec(a);if($b)return/Edge\/([\d\.]+)/.exec(a);if(Zb)return/\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/.exec(a);if(bc)return/WebKit\/(\S+)/.exec(a);if(Yb)return/(?:Version)[ \/]?(\S+)/.exec(a)}();
fc&&(ec=fc?fc[1]:"");if(Zb){var gc=cc();if(null!=gc&&gc>parseFloat(ec)){dc=String(gc);break a}}dc=ec}var ic=dc,jc;if(A.document&&Zb){var kc=cc();jc=kc?kc:parseInt(ic,10)||void 0}else jc=void 0;var lc=jc;var mc=Wb()||E("iPod"),nc=E("iPad");!E("Android")||Hb();Hb();var oc=E("Safari")&&!(Hb()||E("Coast")||E("Opera")||E("Edge")||E("Edg/")||E("OPR")||E("Firefox")||E("FxiOS")||E("Silk")||E("Android"))&&!(Wb()||E("iPad")||E("iPod"));var pc={},tc=null;
function uc(a,b){Na(a);void 0===b&&(b=0);if(!tc){tc={};for(var c="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789".split(""),d=["+/=","+/","-_=","-_.","-_"],e=0;5>e;e++){var f=c.concat(d[e].split(""));pc[e]=f;for(var g=0;g<f.length;g++){var h=f[g];void 0===tc[h]&&(tc[h]=g)}}}b=pc[b];c=Array(Math.floor(a.length/3));d=b[64]||"";for(e=f=0;f<a.length-2;f+=3){var k=a[f],l=a[f+1];h=a[f+2];g=b[k>>2];k=b[(k&3)<<4|l>>4];l=b[(l&15)<<2|h>>6];h=b[h&63];c[e++]=""+g+k+l+h}g=0;h=d;switch(a.length-
f){case 2:g=a[f+1],h=b[(g&15)<<2]||d;case 1:a=a[f],c[e]=""+b[a>>2]+b[(a&3)<<4|g>>4]+h+d}return c.join("")}
;var vc="undefined"!==typeof Uint8Array;var wc={};var xc="function"===typeof Symbol&&"symbol"===typeof Symbol()?Symbol(void 0):void 0;function yc(a,b){Object.isFrozen(a)||(xc?a[xc]|=b:void 0!==a.ra?a.ra|=b:Object.defineProperties(a,{ra:{value:b,configurable:!0,writable:!0,enumerable:!1}}))}
function zc(a){var b;xc?b=a[xc]:b=a.ra;return null==b?0:b}
function Ac(a){yc(a,1);return a}
function Bc(a){return Array.isArray(a)?!!(zc(a)&2):!1}
function Cc(a){if(!Array.isArray(a))throw Error("cannot mark non-array as immutable");yc(a,2)}
;function Dc(a){return null!==a&&"object"===typeof a&&!Array.isArray(a)&&a.constructor===Object}
var Ec,Fc=Object.freeze(Ac([]));function Gc(a){if(Bc(a.C))throw Error("Cannot mutate an immutable Message");}
var Hc="undefined"!=typeof Symbol&&"undefined"!=typeof Symbol.hasInstance;function Ic(a){return{value:a,configurable:!1,writable:!1,enumerable:!1}}
;function Jc(a){switch(typeof a){case "number":return isFinite(a)?a:String(a);case "object":if(a&&!Array.isArray(a)&&vc&&null!=a&&a instanceof Uint8Array)return uc(a)}return a}
;function Kc(a,b){b=void 0===b?Lc:b;return Mc(a,b)}
function Nc(a,b){if(null!=a){if(Array.isArray(a))a=Mc(a,b);else if(Dc(a)){var c={},d;for(d in a)c[d]=Nc(a[d],b);a=c}else a=b(a);return a}}
function Mc(a,b){for(var c=a.slice(),d=0;d<c.length;d++)c[d]=Nc(c[d],b);Array.isArray(a)&&zc(a)&1&&Ac(c);return c}
function Oc(a){if(a&&"object"==typeof a&&a.toJSON)return a.toJSON();a=Jc(a);return Array.isArray(a)?Kc(a,Oc):a}
function Lc(a){return vc&&null!=a&&a instanceof Uint8Array?new Uint8Array(a):a}
;function Pc(a,b,c){return-1===b?null:b>=a.l?a.i?a.i[b]:void 0:(void 0===c?0:c)&&a.i&&(c=a.i[b],null!=c)?c:a.C[b+a.j]}
function G(a,b,c,d,e){d=void 0===d?!1:d;(void 0===e?0:e)||Gc(a);b<a.l&&!d?a.C[b+a.j]=c:(a.i||(a.i=a.C[a.l+a.j]={}))[b]=c;return a}
function Qc(a,b,c,d){c=void 0===c?!0:c;d=void 0===d?!1:d;var e=Pc(a,b,d);null==e&&(e=Fc);if(Bc(a.C))c&&(Cc(e),Object.freeze(e));else if(e===Fc||Bc(e))e=Ac(e.slice()),G(a,b,e,d);return e}
function Rc(a,b,c,d){Gc(a);(c=Sc(a,c))&&c!==b&&null!=d&&(a.h&&c in a.h&&(a.h[c]=void 0),G(a,c));return G(a,b,d)}
function Sc(a,b){for(var c=0,d=0;d<b.length;d++){var e=b[d];null!=Pc(a,e)&&(0!==c&&G(a,c,void 0,!1,!0),c=e)}return c}
function Tc(a,b,c,d,e){if(-1===c)return null;a.h||(a.h={});var f=a.h[c];if(f)return f;e=Pc(a,c,void 0===e?!1:e);if(null==e&&!d)return f;b=new b(e);Bc(a.C)&&Cc(b.C);return a.h[c]=b}
function Uc(a,b,c,d){d=void 0===d?!1:d;a.h||(a.h={});var e=Bc(a.C),f=a.h[c];if(!f){d=Qc(a,c,!0,d);f=[];e=e||Bc(d);for(var g=0;g<d.length;g++)f[g]=new b(d[g]),e&&Cc(f[g].C);e&&(Cc(f),Object.freeze(f));a.h[c]=f}return f}
function H(a,b,c,d){d=void 0===d?!1:d;Gc(a);a.h||(a.h={});var e=c?c.C:c;a.h[b]=c;return G(a,b,e,d)}
function Vc(a,b,c,d){Gc(a);a.h||(a.h={});var e=d?d.C:d;a.h[b]=d;Rc(a,b,c,e)}
function Wc(a,b,c,d){var e=void 0===e?!1:e;Gc(a);e=Uc(a,c,b,e);c=d?d:new c;a=Qc(a,b);e.push(c);a.push(c.C)}
function Xc(a,b){a=Pc(a,b);return null==a?"":a}
;function Yc(a,b,c){a||(a=Zc);Zc=null;var d=this.constructor.i;a||(a=d?[d]:[]);this.j=(d?0:-1)-(this.constructor.h||0);this.h=void 0;this.C=a;a:{d=this.C.length;a=d-1;if(d&&(d=this.C[a],Dc(d))){this.l=a-this.j;this.i=d;break a}void 0!==b&&-1<b?(this.l=Math.max(b,a+1-this.j),this.i=void 0):this.l=Number.MAX_VALUE}if(c)for(b=0;b<c.length;b++)if(a=c[b],a<this.l)a+=this.j,(d=this.C[a])?Array.isArray(d)&&Ac(d):this.C[a]=Fc;else{d=this.i||(this.i=this.C[this.l+this.j]={});var e=d[a];e?Array.isArray(e)&&
Ac(e):d[a]=Fc}}
Yc.prototype.toJSON=function(){var a=this.C;return Ec?a:Kc(a,Oc)};
Yc.prototype.clone=function(){var a=Kc(this.C);Zc=a;a=new this.constructor(a);Zc=null;$c(a,this);return a};
Yc.prototype.isMutable=function(a){if(a!==wc)throw Error("requires a valid immutable API token");return!Bc(this.C)};
Yc.prototype.toString=function(){return this.C.toString()};
function ad(a,b){return Jc(b)}
function $c(a,b){b.m&&(a.m=b.m.slice());var c=b.h;if(c){b=b.i;for(var d in c){var e=c[d];if(e){var f=!(!b||!b[d]),g=+d;if(Array.isArray(e)){if(e.length)for(f=Uc(a,e[0].constructor,g,f),g=0;g<Math.min(f.length,e.length);g++)$c(f[g],e[g])}else(f=Tc(a,e.constructor,g,void 0,f))&&$c(f,e)}}}}
var Zc;function bd(){Yc.apply(this,arguments)}
u(bd,Yc);if(Hc){var cd={};Object.defineProperties(bd,(cd[Symbol.hasInstance]=Ic(function(){throw Error("Cannot perform instanceof checks for MutableMessage");}),cd))};function dd(a,b){var c=this.h;if(this.isRepeated){var d=!0;d=void 0===d?!1:d;Gc(a);if(b){var e=Ac([]);for(var f=0;f<b.length;f++)e[f]=b[f].C;a.h||(a.h={});a.h[c]=b}else a.h&&(a.h[c]=void 0),e=Fc;a=G(a,c,e,d)}else a=H(a,c,b,!0);return a}
;function I(){bd.apply(this,arguments)}
u(I,bd);if(Hc){var ed={};Object.defineProperties(I,(ed[Symbol.hasInstance]=Ic(Object[Symbol.hasInstance]),ed))};var fd=window;wb("csi.gstatic.com");wb("googleads.g.doubleclick.net");wb("partner.googleadservices.com");wb("pubads.g.doubleclick.net");wb("securepubads.g.doubleclick.net");wb("tpc.googlesyndication.com");/*

 SPDX-License-Identifier: Apache-2.0
*/
function gd(a,b){this.width=a;this.height=b}
m=gd.prototype;m.clone=function(){return new gd(this.width,this.height)};
m.aspectRatio=function(){return this.width/this.height};
m.isEmpty=function(){return!(this.width*this.height)};
m.ceil=function(){this.width=Math.ceil(this.width);this.height=Math.ceil(this.height);return this};
m.floor=function(){this.width=Math.floor(this.width);this.height=Math.floor(this.height);return this};
m.round=function(){this.width=Math.round(this.width);this.height=Math.round(this.height);return this};
m.scale=function(a,b){this.width*=a;this.height*="number"===typeof b?b:a;return this};function hd(){var a=document;var b="IFRAME";"application/xhtml+xml"===a.contentType&&(b=b.toLowerCase());return a.createElement(b)}
function id(a,b){for(var c=0;a;){if(b(a))return a;a=a.parentNode;c++}return null}
;function jd(a){var b=kd;if(b)for(var c in b)Object.prototype.hasOwnProperty.call(b,c)&&a(b[c],c,b)}
function ld(){var a=[];jd(function(b){a.push(b)});
return a}
var kd={ub:"allow-forms",vb:"allow-modals",wb:"allow-orientation-lock",xb:"allow-pointer-lock",yb:"allow-popups",zb:"allow-popups-to-escape-sandbox",Ab:"allow-presentation",Bb:"allow-same-origin",Cb:"allow-scripts",Db:"allow-top-navigation",Eb:"allow-top-navigation-by-user-activation"},md=ab(function(){return ld()});
function nd(){var a=od(),b={};D(md(),function(c){a.sandbox&&a.sandbox.supports&&a.sandbox.supports(c)&&(b[c]=!0)});
return b}
function od(){var a=void 0===a?document:a;return a.createElement("iframe")}
;var pd=(new Date).getTime();function qd(a){if(!a)return"";if(/^about:(?:blank|srcdoc)$/.test(a))return window.origin||"";a=a.split("#")[0].split("?")[0];a=a.toLowerCase();0==a.indexOf("//")&&(a=window.location.protocol+a);/^[\w\-]*:\/\//.test(a)||(a=window.location.href);var b=a.substring(a.indexOf("://")+3),c=b.indexOf("/");-1!=c&&(b=b.substring(0,c));c=a.substring(0,a.indexOf("://"));if(!c)throw Error("URI is missing protocol: "+a);if("http"!==c&&"https"!==c&&"chrome-extension"!==c&&"moz-extension"!==c&&"file"!==c&&"android-app"!==
c&&"chrome-search"!==c&&"chrome-untrusted"!==c&&"chrome"!==c&&"app"!==c&&"devtools"!==c)throw Error("Invalid URI scheme in origin: "+c);a="";var d=b.indexOf(":");if(-1!=d){var e=b.substring(d+1);b=b.substring(0,d);if("http"===c&&"80"!==e||"https"===c&&"443"!==e)a=":"+e}return c+"://"+b+a}
;var rd="client_dev_mss_url client_dev_regex_map client_dev_root_url client_rollout_override expflag jsfeat jsmode mods".split(" ");ia(rd);function ud(){function a(){e[0]=1732584193;e[1]=4023233417;e[2]=2562383102;e[3]=271733878;e[4]=3285377520;n=l=0}
function b(q){for(var v=g,p=0;64>p;p+=4)v[p/4]=q[p]<<24|q[p+1]<<16|q[p+2]<<8|q[p+3];for(p=16;80>p;p++)q=v[p-3]^v[p-8]^v[p-14]^v[p-16],v[p]=(q<<1|q>>>31)&4294967295;q=e[0];var y=e[1],z=e[2],F=e[3],K=e[4];for(p=0;80>p;p++){if(40>p)if(20>p){var M=F^y&(z^F);var P=1518500249}else M=y^z^F,P=1859775393;else 60>p?(M=y&z|F&(y|z),P=2400959708):(M=y^z^F,P=3395469782);M=((q<<5|q>>>27)&4294967295)+M+K+P+v[p]&4294967295;K=F;F=z;z=(y<<30|y>>>2)&4294967295;y=q;q=M}e[0]=e[0]+q&4294967295;e[1]=e[1]+y&4294967295;e[2]=
e[2]+z&4294967295;e[3]=e[3]+F&4294967295;e[4]=e[4]+K&4294967295}
function c(q,v){if("string"===typeof q){q=unescape(encodeURIComponent(q));for(var p=[],y=0,z=q.length;y<z;++y)p.push(q.charCodeAt(y));q=p}v||(v=q.length);p=0;if(0==l)for(;p+64<v;)b(q.slice(p,p+64)),p+=64,n+=64;for(;p<v;)if(f[l++]=q[p++],n++,64==l)for(l=0,b(f);p+64<v;)b(q.slice(p,p+64)),p+=64,n+=64}
function d(){var q=[],v=8*n;56>l?c(h,56-l):c(h,64-(l-56));for(var p=63;56<=p;p--)f[p]=v&255,v>>>=8;b(f);for(p=v=0;5>p;p++)for(var y=24;0<=y;y-=8)q[v++]=e[p]>>y&255;return q}
for(var e=[],f=[],g=[],h=[128],k=1;64>k;++k)h[k]=0;var l,n;a();return{reset:a,update:c,digest:d,hb:function(){for(var q=d(),v="",p=0;p<q.length;p++)v+="0123456789ABCDEF".charAt(Math.floor(q[p]/16))+"0123456789ABCDEF".charAt(q[p]%16);return v}}}
;function vd(a,b,c){var d=String(A.location.href);return d&&a&&b?[b,wd(qd(d),a,c||null)].join(" "):null}
function wd(a,b,c){var d=[],e=[];if(1==(Array.isArray(c)?2:1))return e=[b,a],D(d,function(h){e.push(h)}),xd(e.join(" "));
var f=[],g=[];D(c,function(h){g.push(h.key);f.push(h.value)});
c=Math.floor((new Date).getTime()/1E3);e=0==f.length?[c,b,a]:[f.join(":"),c,b,a];D(d,function(h){e.push(h)});
a=xd(e.join(" "));a=[c,a];0==g.length||a.push(g.join(""));return a.join("_")}
function xd(a){var b=ud();b.update(a);return b.hb().toLowerCase()}
;var yd={};function zd(a){this.h=a||{cookie:""}}
m=zd.prototype;m.isEnabled=function(){if(!A.navigator.cookieEnabled)return!1;if(!this.isEmpty())return!0;this.set("TESTCOOKIESENABLED","1",{Aa:60});if("1"!==this.get("TESTCOOKIESENABLED"))return!1;this.remove("TESTCOOKIESENABLED");return!0};
m.set=function(a,b,c){var d=!1;if("object"===typeof c){var e=c.Rb;d=c.secure||!1;var f=c.domain||void 0;var g=c.path||void 0;var h=c.Aa}if(/[;=\s]/.test(a))throw Error('Invalid cookie name "'+a+'"');if(/[;\r\n]/.test(b))throw Error('Invalid cookie value "'+b+'"');void 0===h&&(h=-1);c=f?";domain="+f:"";g=g?";path="+g:"";d=d?";secure":"";h=0>h?"":0==h?";expires="+(new Date(1970,1,1)).toUTCString():";expires="+(new Date(Date.now()+1E3*h)).toUTCString();this.h.cookie=a+"="+b+c+g+h+d+(null!=e?";samesite="+
e:"")};
m.get=function(a,b){for(var c=a+"=",d=(this.h.cookie||"").split(";"),e=0,f;e<d.length;e++){f=yb(d[e]);if(0==f.lastIndexOf(c,0))return f.slice(c.length);if(f==a)return""}return b};
m.remove=function(a,b,c){var d=void 0!==this.get(a);this.set(a,"",{Aa:0,path:b,domain:c});return d};
m.isEmpty=function(){return!this.h.cookie};
m.clear=function(){for(var a=(this.h.cookie||"").split(";"),b=[],c=[],d,e,f=0;f<a.length;f++)e=yb(a[f]),d=e.indexOf("="),-1==d?(b.push(""),c.push(e)):(b.push(e.substring(0,d)),c.push(e.substring(d+1)));for(a=b.length-1;0<=a;a--)this.remove(b[a])};
var Ad=new zd("undefined"==typeof document?null:document);function Bd(a){return!!yd.FPA_SAMESITE_PHASE2_MOD||!(void 0===a||!a)}
function Cd(a,b,c,d){(a=A[a])||(a=(new zd(document)).get(b));return a?vd(a,c,d):null}
function Dd(a){var b=void 0===b?!1:b;var c=qd(String(A.location.href)),d=[];var e=b;e=void 0===e?!1:e;var f=A.__SAPISID||A.__APISID||A.__3PSAPISID||A.__OVERRIDE_SID;Bd(e)&&(f=f||A.__1PSAPISID);if(f)e=!0;else{var g=new zd(document);f=g.get("SAPISID")||g.get("APISID")||g.get("__Secure-3PAPISID")||g.get("SID");Bd(e)&&(f=f||g.get("__Secure-1PAPISID"));e=!!f}e&&(e=(c=0==c.indexOf("https:")||0==c.indexOf("chrome-extension:")||0==c.indexOf("moz-extension:"))?A.__SAPISID:A.__APISID,e||(e=new zd(document),
e=e.get(c?"SAPISID":"APISID")||e.get("__Secure-3PAPISID")),(e=e?vd(e,c?"SAPISIDHASH":"APISIDHASH",a):null)&&d.push(e),c&&Bd(b)&&((b=Cd("__1PSAPISID","__Secure-1PAPISID","SAPISID1PHASH",a))&&d.push(b),(a=Cd("__3PSAPISID","__Secure-3PAPISID","SAPISID3PHASH",a))&&d.push(a)));return 0==d.length?null:d.join(" ")}
;function Ed(a){if(Hc){var b={};Object.defineProperties(a,(b[Symbol.hasInstance]=Ic(Object[Symbol.hasInstance]),b))}}
;function Fd(){this.l=this.l;this.v=this.v}
Fd.prototype.l=!1;Fd.prototype.dispose=function(){this.l||(this.l=!0,this.fa())};
Fd.prototype.fa=function(){if(this.v)for(;this.v.length;)this.v.shift()()};function Gd(a,b){this.type=a;this.h=this.target=b;this.defaultPrevented=this.j=!1}
Gd.prototype.stopPropagation=function(){this.j=!0};
Gd.prototype.preventDefault=function(){this.defaultPrevented=!0};function Hd(a){var b=B("window.location.href");null==a&&(a='Unknown Error of type "null/undefined"');if("string"===typeof a)return{message:a,name:"Unknown error",lineNumber:"Not available",fileName:b,stack:"Not available"};var c=!1;try{var d=a.lineNumber||a.line||"Not available"}catch(g){d="Not available",c=!0}try{var e=a.fileName||a.filename||a.sourceURL||A.$googDebugFname||b}catch(g){e="Not available",c=!0}b=Id(a);if(!(!c&&a.lineNumber&&a.fileName&&a.stack&&a.message&&a.name)){c=a.message;if(null==
c){if(a.constructor&&a.constructor instanceof Function){if(a.constructor.name)c=a.constructor.name;else if(c=a.constructor,Jd[c])c=Jd[c];else{c=String(c);if(!Jd[c]){var f=/function\s+([^\(]+)/m.exec(c);Jd[c]=f?f[1]:"[Anonymous]"}c=Jd[c]}c='Unknown Error of type "'+c+'"'}else c="Unknown Error of unknown type";"function"===typeof a.toString&&Object.prototype.toString!==a.toString&&(c+=": "+a.toString())}return{message:c,name:a.name||"UnknownError",lineNumber:d,fileName:e,stack:b||"Not available"}}a.stack=
b;return{message:a.message,name:a.name,lineNumber:a.lineNumber,fileName:a.fileName,stack:a.stack}}
function Id(a,b){b||(b={});b[Kd(a)]=!0;var c=a.stack||"";(a=a.fb)&&!b[Kd(a)]&&(c+="\nCaused by: ",a.stack&&0==a.stack.indexOf(a.toString())||(c+="string"===typeof a?a:a.message+"\n"),c+=Id(a,b));return c}
function Kd(a){var b="";"function"===typeof a.toString&&(b=""+a);return b+a.stack}
var Jd={};var Ld=function(){if(!A.addEventListener||!Object.defineProperty)return!1;var a=!1,b=Object.defineProperty({},"passive",{get:function(){a=!0}});
try{A.addEventListener("test",function(){},b),A.removeEventListener("test",function(){},b)}catch(c){}return a}();function Md(a,b){Gd.call(this,a?a.type:"");this.relatedTarget=this.h=this.target=null;this.button=this.screenY=this.screenX=this.clientY=this.clientX=0;this.key="";this.charCode=this.keyCode=0;this.metaKey=this.shiftKey=this.altKey=this.ctrlKey=!1;this.state=null;this.pointerId=0;this.pointerType="";this.i=null;a&&this.init(a,b)}
Wa(Md,Gd);var Nd={2:"touch",3:"pen",4:"mouse"};
Md.prototype.init=function(a,b){var c=this.type=a.type,d=a.changedTouches&&a.changedTouches.length?a.changedTouches[0]:null;this.target=a.target||a.srcElement;this.h=b;if(b=a.relatedTarget){if(ac){a:{try{Xb(b.nodeName);var e=!0;break a}catch(f){}e=!1}e||(b=null)}}else"mouseover"==c?b=a.fromElement:"mouseout"==c&&(b=a.toElement);this.relatedTarget=b;d?(this.clientX=void 0!==d.clientX?d.clientX:d.pageX,this.clientY=void 0!==d.clientY?d.clientY:d.pageY,this.screenX=d.screenX||0,this.screenY=d.screenY||
0):(this.clientX=void 0!==a.clientX?a.clientX:a.pageX,this.clientY=void 0!==a.clientY?a.clientY:a.pageY,this.screenX=a.screenX||0,this.screenY=a.screenY||0);this.button=a.button;this.keyCode=a.keyCode||0;this.key=a.key||"";this.charCode=a.charCode||("keypress"==c?a.keyCode:0);this.ctrlKey=a.ctrlKey;this.altKey=a.altKey;this.shiftKey=a.shiftKey;this.metaKey=a.metaKey;this.pointerId=a.pointerId||0;this.pointerType="string"===typeof a.pointerType?a.pointerType:Nd[a.pointerType]||"";this.state=a.state;
this.i=a;a.defaultPrevented&&Md.N.preventDefault.call(this)};
Md.prototype.stopPropagation=function(){Md.N.stopPropagation.call(this);this.i.stopPropagation?this.i.stopPropagation():this.i.cancelBubble=!0};
Md.prototype.preventDefault=function(){Md.N.preventDefault.call(this);var a=this.i;a.preventDefault?a.preventDefault():a.returnValue=!1};var Od="closure_listenable_"+(1E6*Math.random()|0);var Pd=0;function Qd(a,b,c,d,e){this.listener=a;this.proxy=null;this.src=b;this.type=c;this.capture=!!d;this.qa=e;this.key=++Pd;this.ha=this.ma=!1}
function Rd(a){a.ha=!0;a.listener=null;a.proxy=null;a.src=null;a.qa=null}
;function Sd(a){this.src=a;this.listeners={};this.h=0}
Sd.prototype.add=function(a,b,c,d,e){var f=a.toString();a=this.listeners[f];a||(a=this.listeners[f]=[],this.h++);var g=Td(a,b,d,e);-1<g?(b=a[g],c||(b.ma=!1)):(b=new Qd(b,this.src,f,!!d,e),b.ma=c,a.push(b));return b};
Sd.prototype.remove=function(a,b,c,d){a=a.toString();if(!(a in this.listeners))return!1;var e=this.listeners[a];b=Td(e,b,c,d);return-1<b?(Rd(e[b]),Array.prototype.splice.call(e,b,1),0==e.length&&(delete this.listeners[a],this.h--),!0):!1};
function Ud(a,b){var c=b.type;c in a.listeners&&db(a.listeners[c],b)&&(Rd(b),0==a.listeners[c].length&&(delete a.listeners[c],a.h--))}
function Td(a,b,c,d){for(var e=0;e<a.length;++e){var f=a[e];if(!f.ha&&f.listener==b&&f.capture==!!c&&f.qa==d)return e}return-1}
;var Vd="closure_lm_"+(1E6*Math.random()|0),Wd={},Xd=0;function Yd(a,b,c,d,e){if(d&&d.once)Zd(a,b,c,d,e);else if(Array.isArray(b))for(var f=0;f<b.length;f++)Yd(a,b[f],c,d,e);else c=$d(c),a&&a[Od]?a.R(b,c,Oa(d)?!!d.capture:!!d,e):ae(a,b,c,!1,d,e)}
function ae(a,b,c,d,e,f){if(!b)throw Error("Invalid event type");var g=Oa(e)?!!e.capture:!!e,h=be(a);h||(a[Vd]=h=new Sd(a));c=h.add(b,c,d,g,f);if(!c.proxy){d=ce();c.proxy=d;d.src=a;d.listener=c;if(a.addEventListener)Ld||(e=g),void 0===e&&(e=!1),a.addEventListener(b.toString(),d,e);else if(a.attachEvent)a.attachEvent(de(b.toString()),d);else if(a.addListener&&a.removeListener)a.addListener(d);else throw Error("addEventListener and attachEvent are unavailable.");Xd++}}
function ce(){function a(c){return b.call(a.src,a.listener,c)}
var b=ee;return a}
function Zd(a,b,c,d,e){if(Array.isArray(b))for(var f=0;f<b.length;f++)Zd(a,b[f],c,d,e);else c=$d(c),a&&a[Od]?a.j.add(String(b),c,!0,Oa(d)?!!d.capture:!!d,e):ae(a,b,c,!0,d,e)}
function fe(a,b,c,d,e){if(Array.isArray(b))for(var f=0;f<b.length;f++)fe(a,b[f],c,d,e);else(d=Oa(d)?!!d.capture:!!d,c=$d(c),a&&a[Od])?a.j.remove(String(b),c,d,e):a&&(a=be(a))&&(b=a.listeners[b.toString()],a=-1,b&&(a=Td(b,c,d,e)),(c=-1<a?b[a]:null)&&ge(c))}
function ge(a){if("number"!==typeof a&&a&&!a.ha){var b=a.src;if(b&&b[Od])Ud(b.j,a);else{var c=a.type,d=a.proxy;b.removeEventListener?b.removeEventListener(c,d,a.capture):b.detachEvent?b.detachEvent(de(c),d):b.addListener&&b.removeListener&&b.removeListener(d);Xd--;(c=be(b))?(Ud(c,a),0==c.h&&(c.src=null,b[Vd]=null)):Rd(a)}}}
function de(a){return a in Wd?Wd[a]:Wd[a]="on"+a}
function ee(a,b){if(a.ha)a=!0;else{b=new Md(b,this);var c=a.listener,d=a.qa||a.src;a.ma&&ge(a);a=c.call(d,b)}return a}
function be(a){a=a[Vd];return a instanceof Sd?a:null}
var he="__closure_events_fn_"+(1E9*Math.random()>>>0);function $d(a){if("function"===typeof a)return a;a[he]||(a[he]=function(b){return a.handleEvent(b)});
return a[he]}
;function J(){Fd.call(this);this.j=new Sd(this);this.wa=this;this.I=null}
Wa(J,Fd);J.prototype[Od]=!0;J.prototype.addEventListener=function(a,b,c,d){Yd(this,a,b,c,d)};
J.prototype.removeEventListener=function(a,b,c,d){fe(this,a,b,c,d)};
function ie(a,b){var c=a.I;if(c){var d=[];for(var e=1;c;c=c.I)d.push(c),++e}a=a.wa;c=b.type||b;"string"===typeof b?b=new Gd(b,a):b instanceof Gd?b.target=b.target||a:(e=b,b=new Gd(c,a),tb(b,e));e=!0;if(d)for(var f=d.length-1;!b.j&&0<=f;f--){var g=b.h=d[f];e=je(g,c,!0,b)&&e}b.j||(g=b.h=a,e=je(g,c,!0,b)&&e,b.j||(e=je(g,c,!1,b)&&e));if(d)for(f=0;!b.j&&f<d.length;f++)g=b.h=d[f],e=je(g,c,!1,b)&&e}
J.prototype.fa=function(){J.N.fa.call(this);if(this.j){var a=this.j,b=0,c;for(c in a.listeners){for(var d=a.listeners[c],e=0;e<d.length;e++)++b,Rd(d[e]);delete a.listeners[c];a.h--}}this.I=null};
J.prototype.R=function(a,b,c,d){return this.j.add(String(a),b,!1,c,d)};
function je(a,b,c,d){b=a.j.listeners[String(b)];if(!b)return!0;b=b.concat();for(var e=!0,f=0;f<b.length;++f){var g=b[f];if(g&&!g.ha&&g.capture==c){var h=g.listener,k=g.qa||g.src;g.ma&&Ud(a.j,g);e=!1!==h.call(k,d)&&e}}return e&&!d.defaultPrevented}
;function ke(a){J.call(this);var b=this;this.A=this.i=0;this.J=null!=a?a:{L:function(e,f){return setTimeout(e,f)},
Y:clearTimeout};var c,d;this.h=null!=(d=null==(c=window.navigator)?void 0:c.onLine)?d:!0;this.m=function(){return x(function(e){return w(e,le(b),0)})};
window.addEventListener("offline",this.m);window.addEventListener("online",this.m);this.A||me(this)}
u(ke,J);function ne(){var a=oe;ke.h||(ke.h=new ke(a));return ke.h}
ke.prototype.dispose=function(){window.removeEventListener("offline",this.m);window.removeEventListener("online",this.m);this.J.Y(this.A);delete ke.h};
ke.prototype.F=function(){return this.h};
function me(a){a.A=a.J.L(function(){var b;return x(function(c){if(1==c.h)return a.h?(null==(b=window.navigator)?0:b.onLine)?c.o(3):w(c,le(a),3):w(c,le(a),3);me(a);c.h=0})},3E4)}
function le(a,b){return a.u?a.u:a.u=new Promise(function(c){var d,e,f,g;return x(function(h){switch(h.h){case 1:return d=window.AbortController?new window.AbortController:void 0,f=null==(e=d)?void 0:e.signal,g=!1,xa(h,2,3),d&&(a.i=a.J.L(function(){d.abort()},b||2E4)),w(h,fetch("/generate_204",{method:"HEAD",
signal:f}),5);case 5:g=!0;case 3:Aa(h);a.u=void 0;a.i&&(a.J.Y(a.i),a.i=0);g!==a.h&&(a.h=g,a.h?ie(a,"networkstatus-online"):ie(a,"networkstatus-offline"));c(g);Ba(h);break;case 2:za(h),g=!1,h.o(3)}})})}
;function pe(){this.data_=[];this.h=-1}
pe.prototype.set=function(a,b){b=void 0===b?!0:b;0<=a&&52>a&&Number.isInteger(a)&&this.data_[a]!==b&&(this.data_[a]=b,this.h=-1)};
pe.prototype.get=function(a){return!!this.data_[a]};
function qe(a){-1===a.h&&(a.h=cb(a.data_,function(b,c,d){return c?b+Math.pow(2,d):b},0));
return a.h}
;function re(a,b){this.j=a;this.l=b;this.i=0;this.h=null}
re.prototype.get=function(){if(0<this.i){this.i--;var a=this.h;this.h=a.next;a.next=null}else a=this.j();return a};
function se(a,b){a.l(b);100>a.i&&(a.i++,b.next=a.h,a.h=b)}
;var te;function ue(){var a=A.MessageChannel;"undefined"===typeof a&&"undefined"!==typeof window&&window.postMessage&&window.addEventListener&&!E("Presto")&&(a=function(){var e=hd();e.style.display="none";document.documentElement.appendChild(e);var f=e.contentWindow;e=f.document;e.open();e.close();var g="callImmediate"+Math.random(),h="file:"==f.location.protocol?"*":f.location.protocol+"//"+f.location.host;e=Va(function(k){if(("*"==h||k.origin==h)&&k.data==g)this.port1.onmessage()},this);
f.addEventListener("message",e,!1);this.port1={};this.port2={postMessage:function(){f.postMessage(g,h)}}});
if("undefined"!==typeof a&&!E("Trident")&&!E("MSIE")){var b=new a,c={},d=c;b.port1.onmessage=function(){if(void 0!==c.next){c=c.next;var e=c.Ia;c.Ia=null;e()}};
return function(e){d.next={Ia:e};d=d.next;b.port2.postMessage(0)}}return function(e){A.setTimeout(e,0)}}
;function ve(a){A.setTimeout(function(){throw a;},0)}
;function we(){this.i=this.h=null}
we.prototype.add=function(a,b){var c=xe.get();c.set(a,b);this.i?this.i.next=c:this.h=c;this.i=c};
we.prototype.remove=function(){var a=null;this.h&&(a=this.h,this.h=this.h.next,this.h||(this.i=null),a.next=null);return a};
var xe=new re(function(){return new ye},function(a){return a.reset()});
function ye(){this.next=this.scope=this.h=null}
ye.prototype.set=function(a,b){this.h=a;this.scope=b;this.next=null};
ye.prototype.reset=function(){this.next=this.scope=this.h=null};function ze(a,b){Ae||Be();Ce||(Ae(),Ce=!0);De.add(a,b)}
var Ae;function Be(){if(A.Promise&&A.Promise.resolve){var a=A.Promise.resolve(void 0);Ae=function(){a.then(Ee)}}else Ae=function(){var b=Ee;
"function"!==typeof A.setImmediate||A.Window&&A.Window.prototype&&!E("Edge")&&A.Window.prototype.setImmediate==A.setImmediate?(te||(te=ue()),te(b)):A.setImmediate(b)}}
var Ce=!1,De=new we;function Ee(){for(var a;a=De.remove();){try{a.h.call(a.scope)}catch(b){ve(b)}se(xe,a)}Ce=!1}
;function Fe(a,b){this.h=a[A.Symbol.iterator]();this.i=b}
Fe.prototype[Symbol.iterator]=function(){return this};
Fe.prototype.next=function(){var a=this.h.next();return{value:a.done?void 0:this.i.call(void 0,a.value),done:a.done}};
function Ge(a,b){return new Fe(a,b)}
;function He(){this.blockSize=-1}
;function Ie(){this.blockSize=-1;this.blockSize=64;this.h=[];this.m=[];this.v=[];this.j=[];this.j[0]=128;for(var a=1;a<this.blockSize;++a)this.j[a]=0;this.l=this.i=0;this.reset()}
Wa(Ie,He);Ie.prototype.reset=function(){this.h[0]=1732584193;this.h[1]=4023233417;this.h[2]=2562383102;this.h[3]=271733878;this.h[4]=3285377520;this.l=this.i=0};
function Je(a,b,c){c||(c=0);var d=a.v;if("string"===typeof b)for(var e=0;16>e;e++)d[e]=b.charCodeAt(c)<<24|b.charCodeAt(c+1)<<16|b.charCodeAt(c+2)<<8|b.charCodeAt(c+3),c+=4;else for(e=0;16>e;e++)d[e]=b[c]<<24|b[c+1]<<16|b[c+2]<<8|b[c+3],c+=4;for(e=16;80>e;e++){var f=d[e-3]^d[e-8]^d[e-14]^d[e-16];d[e]=(f<<1|f>>>31)&4294967295}b=a.h[0];c=a.h[1];var g=a.h[2],h=a.h[3],k=a.h[4];for(e=0;80>e;e++){if(40>e)if(20>e){f=h^c&(g^h);var l=1518500249}else f=c^g^h,l=1859775393;else 60>e?(f=c&g|h&(c|g),l=2400959708):
(f=c^g^h,l=3395469782);f=(b<<5|b>>>27)+f+k+l+d[e]&4294967295;k=h;h=g;g=(c<<30|c>>>2)&4294967295;c=b;b=f}a.h[0]=a.h[0]+b&4294967295;a.h[1]=a.h[1]+c&4294967295;a.h[2]=a.h[2]+g&4294967295;a.h[3]=a.h[3]+h&4294967295;a.h[4]=a.h[4]+k&4294967295}
Ie.prototype.update=function(a,b){if(null!=a){void 0===b&&(b=a.length);for(var c=b-this.blockSize,d=0,e=this.m,f=this.i;d<b;){if(0==f)for(;d<=c;)Je(this,a,d),d+=this.blockSize;if("string"===typeof a)for(;d<b;){if(e[f]=a.charCodeAt(d),++f,++d,f==this.blockSize){Je(this,e);f=0;break}}else for(;d<b;)if(e[f]=a[d],++f,++d,f==this.blockSize){Je(this,e);f=0;break}}this.i=f;this.l+=b}};
Ie.prototype.digest=function(){var a=[],b=8*this.l;56>this.i?this.update(this.j,56-this.i):this.update(this.j,this.blockSize-(this.i-56));for(var c=this.blockSize-1;56<=c;c--)this.m[c]=b&255,b/=256;Je(this,this.m);for(c=b=0;5>c;c++)for(var d=24;0<=d;d-=8)a[b]=this.h[c]>>d&255,++b;return a};function Ke(){}
Ke.prototype.next=function(){return Le};
var Le={done:!0,value:void 0};function Me(a){return{value:a,done:!1}}
Ke.prototype.K=function(){return this};function Ne(a){if(a instanceof Oe||a instanceof Pe||a instanceof Qe)return a;if("function"==typeof a.next)return new Oe(function(){return a});
if("function"==typeof a[Symbol.iterator])return new Oe(function(){return a[Symbol.iterator]()});
if("function"==typeof a.K)return new Oe(function(){return a.K()});
throw Error("Not an iterator or iterable.");}
function Oe(a){this.i=a}
Oe.prototype.K=function(){return new Pe(this.i())};
Oe.prototype[Symbol.iterator]=function(){return new Qe(this.i())};
Oe.prototype.h=function(){return new Qe(this.i())};
function Pe(a){this.i=a}
u(Pe,Ke);Pe.prototype.next=function(){return this.i.next()};
Pe.prototype[Symbol.iterator]=function(){return new Qe(this.i)};
Pe.prototype.h=function(){return new Qe(this.i)};
function Qe(a){Oe.call(this,function(){return a});
this.j=a}
u(Qe,Oe);Qe.prototype.next=function(){return this.j.next()};function Re(a,b){this.i={};this.h=[];this.j=this.size=0;var c=arguments.length;if(1<c){if(c%2)throw Error("Uneven number of arguments");for(var d=0;d<c;d+=2)this.set(arguments[d],arguments[d+1])}else if(a)if(a instanceof Re)for(c=Se(a),d=0;d<c.length;d++)this.set(c[d],a.get(c[d]));else for(d in a)this.set(d,a[d])}
function Se(a){Te(a);return a.h.concat()}
m=Re.prototype;m.has=function(a){return Ue(this.i,a)};
m.equals=function(a,b){if(this===a)return!0;if(this.size!=a.size)return!1;b=b||Ve;Te(this);for(var c,d=0;c=this.h[d];d++)if(!b(this.get(c),a.get(c)))return!1;return!0};
function Ve(a,b){return a===b}
m.isEmpty=function(){return 0==this.size};
m.clear=function(){this.i={};this.j=this.size=this.h.length=0};
m.remove=function(a){return this.delete(a)};
m.delete=function(a){return Ue(this.i,a)?(delete this.i[a],--this.size,this.j++,this.h.length>2*this.size&&Te(this),!0):!1};
function Te(a){if(a.size!=a.h.length){for(var b=0,c=0;b<a.h.length;){var d=a.h[b];Ue(a.i,d)&&(a.h[c++]=d);b++}a.h.length=c}if(a.size!=a.h.length){var e={};for(c=b=0;b<a.h.length;)d=a.h[b],Ue(e,d)||(a.h[c++]=d,e[d]=1),b++;a.h.length=c}}
m.get=function(a,b){return Ue(this.i,a)?this.i[a]:b};
m.set=function(a,b){Ue(this.i,a)||(this.size+=1,this.h.push(a),this.j++);this.i[a]=b};
m.forEach=function(a,b){for(var c=Se(this),d=0;d<c.length;d++){var e=c[d],f=this.get(e);a.call(b,f,e,this)}};
m.clone=function(){return new Re(this)};
m.keys=function(){return Ne(this.K(!0)).h()};
m.values=function(){return Ne(this.K(!1)).h()};
m.entries=function(){var a=this;return Ge(this.keys(),function(b){return[b,a.get(b)]})};
m.K=function(a){Te(this);var b=0,c=this.j,d=this,e=new Ke;e.next=function(){if(c!=d.j)throw Error("The map has changed since the iterator was created");if(b>=d.h.length)return Le;var f=d.h[b++];return Me(a?f:d.i[f])};
return e};
function Ue(a,b){return Object.prototype.hasOwnProperty.call(a,b)}
;var We=A.JSON.stringify;function Xe(){var a=this;this.promise=new Promise(function(b,c){a.resolve=b;a.reject=c})}
;function Ye(a){this.h=0;this.u=void 0;this.l=this.i=this.j=null;this.m=this.v=!1;if(a!=$a)try{var b=this;a.call(void 0,function(c){Ze(b,2,c)},function(c){Ze(b,3,c)})}catch(c){Ze(this,3,c)}}
function $e(){this.next=this.context=this.onRejected=this.i=this.h=null;this.j=!1}
$e.prototype.reset=function(){this.context=this.onRejected=this.i=this.h=null;this.j=!1};
var af=new re(function(){return new $e},function(a){a.reset()});
function bf(a,b,c){var d=af.get();d.i=a;d.onRejected=b;d.context=c;return d}
Ye.prototype.then=function(a,b,c){return cf(this,"function"===typeof a?a:null,"function"===typeof b?b:null,c)};
Ye.prototype.$goog_Thenable=!0;Ye.prototype.cancel=function(a){if(0==this.h){var b=new df(a);ze(function(){ef(this,b)},this)}};
function ef(a,b){if(0==a.h)if(a.j){var c=a.j;if(c.i){for(var d=0,e=null,f=null,g=c.i;g&&(g.j||(d++,g.h==a&&(e=g),!(e&&1<d)));g=g.next)e||(f=g);e&&(0==c.h&&1==d?ef(c,b):(f?(d=f,d.next==c.l&&(c.l=d),d.next=d.next.next):ff(c),gf(c,e,3,b)))}a.j=null}else Ze(a,3,b)}
function hf(a,b){a.i||2!=a.h&&3!=a.h||jf(a);a.l?a.l.next=b:a.i=b;a.l=b}
function cf(a,b,c,d){var e=bf(null,null,null);e.h=new Ye(function(f,g){e.i=b?function(h){try{var k=b.call(d,h);f(k)}catch(l){g(l)}}:f;
e.onRejected=c?function(h){try{var k=c.call(d,h);void 0===k&&h instanceof df?g(h):f(k)}catch(l){g(l)}}:g});
e.h.j=a;hf(a,e);return e.h}
Ye.prototype.I=function(a){this.h=0;Ze(this,2,a)};
Ye.prototype.O=function(a){this.h=0;Ze(this,3,a)};
function Ze(a,b,c){if(0==a.h){a===c&&(b=3,c=new TypeError("Promise cannot resolve to itself"));a.h=1;a:{var d=c,e=a.I,f=a.O;if(d instanceof Ye){hf(d,bf(e||$a,f||null,a));var g=!0}else{if(d)try{var h=!!d.$goog_Thenable}catch(l){h=!1}else h=!1;if(h)d.then(e,f,a),g=!0;else{if(Oa(d))try{var k=d.then;if("function"===typeof k){kf(d,k,e,f,a);g=!0;break a}}catch(l){f.call(a,l);g=!0;break a}g=!1}}}g||(a.u=c,a.h=b,a.j=null,jf(a),3!=b||c instanceof df||lf(a,c))}}
function kf(a,b,c,d,e){function f(k){h||(h=!0,d.call(e,k))}
function g(k){h||(h=!0,c.call(e,k))}
var h=!1;try{b.call(a,g,f)}catch(k){f(k)}}
function jf(a){a.v||(a.v=!0,ze(a.A,a))}
function ff(a){var b=null;a.i&&(b=a.i,a.i=b.next,b.next=null);a.i||(a.l=null);return b}
Ye.prototype.A=function(){for(var a;a=ff(this);)gf(this,a,this.h,this.u);this.v=!1};
function gf(a,b,c,d){if(3==c&&b.onRejected&&!b.j)for(;a&&a.m;a=a.j)a.m=!1;if(b.h)b.h.j=null,Jf(b,c,d);else try{b.j?b.i.call(b.context):Jf(b,c,d)}catch(e){Kf.call(null,e)}se(af,b)}
function Jf(a,b,c){2==b?a.i.call(a.context,c):a.onRejected&&a.onRejected.call(a.context,c)}
function lf(a,b){a.m=!0;ze(function(){a.m&&Kf.call(null,b)})}
var Kf=ve;function df(a){Ya.call(this,a)}
Wa(df,Ya);df.prototype.name="cancel";function L(a){Fd.call(this);this.u=1;this.j=[];this.m=0;this.h=[];this.i={};this.A=!!a}
Wa(L,Fd);m=L.prototype;m.subscribe=function(a,b,c){var d=this.i[a];d||(d=this.i[a]=[]);var e=this.u;this.h[e]=a;this.h[e+1]=b;this.h[e+2]=c;this.u=e+3;d.push(e);return e};
function Lf(a,b,c){var d=Mf;if(a=d.i[a]){var e=d.h;(a=a.find(function(f){return e[f+1]==b&&e[f+2]==c}))&&d.ka(a)}}
m.ka=function(a){var b=this.h[a];if(b){var c=this.i[b];0!=this.m?(this.j.push(a),this.h[a+1]=function(){}):(c&&db(c,a),delete this.h[a],delete this.h[a+1],delete this.h[a+2])}return!!b};
m.ca=function(a,b){var c=this.i[a];if(c){for(var d=Array(arguments.length-1),e=1,f=arguments.length;e<f;e++)d[e-1]=arguments[e];if(this.A)for(e=0;e<c.length;e++){var g=c[e];Nf(this.h[g+1],this.h[g+2],d)}else{this.m++;try{for(e=0,f=c.length;e<f&&!this.l;e++)g=c[e],this.h[g+1].apply(this.h[g+2],d)}finally{if(this.m--,0<this.j.length&&0==this.m)for(;c=this.j.pop();)this.ka(c)}}return 0!=e}return!1};
function Nf(a,b,c){ze(function(){a.apply(b,c)})}
m.clear=function(a){if(a){var b=this.i[a];b&&(b.forEach(this.ka,this),delete this.i[a])}else this.h.length=0,this.i={}};
m.fa=function(){L.N.fa.call(this);this.clear();this.j.length=0};function Of(a){this.h=a}
Of.prototype.set=function(a,b){void 0===b?this.h.remove(a):this.h.set(a,We(b))};
Of.prototype.get=function(a){try{var b=this.h.get(a)}catch(c){return}if(null!==b)try{return JSON.parse(b)}catch(c){throw"Storage: Invalid value was encountered";}};
Of.prototype.remove=function(a){this.h.remove(a)};function Pf(a){this.h=a}
Wa(Pf,Of);function Qf(a){this.data=a}
function Rf(a){return void 0===a||a instanceof Qf?a:new Qf(a)}
Pf.prototype.set=function(a,b){Pf.N.set.call(this,a,Rf(b))};
Pf.prototype.i=function(a){a=Pf.N.get.call(this,a);if(void 0===a||a instanceof Object)return a;throw"Storage: Invalid value was encountered";};
Pf.prototype.get=function(a){if(a=this.i(a)){if(a=a.data,void 0===a)throw"Storage: Invalid value was encountered";}else a=void 0;return a};function Sf(a){this.h=a}
Wa(Sf,Pf);Sf.prototype.set=function(a,b,c){if(b=Rf(b)){if(c){if(c<Date.now()){Sf.prototype.remove.call(this,a);return}b.expiration=c}b.creation=Date.now()}Sf.N.set.call(this,a,b)};
Sf.prototype.i=function(a){var b=Sf.N.i.call(this,a);if(b){var c=b.creation,d=b.expiration;if(d&&d<Date.now()||c&&c>Date.now())Sf.prototype.remove.call(this,a);else return b}};function Tf(){}
;function Uf(){}
Wa(Uf,Tf);Uf.prototype[Symbol.iterator]=function(){return Ne(this.K(!0)).h()};
Uf.prototype.clear=function(){var a=Array.from(this);a=t(a);for(var b=a.next();!b.done;b=a.next())this.remove(b.value)};function Vf(a){this.h=a}
Wa(Vf,Uf);m=Vf.prototype;m.isAvailable=function(){if(!this.h)return!1;try{return this.h.setItem("__sak","1"),this.h.removeItem("__sak"),!0}catch(a){return!1}};
m.set=function(a,b){try{this.h.setItem(a,b)}catch(c){if(0==this.h.length)throw"Storage mechanism: Storage disabled";throw"Storage mechanism: Quota exceeded";}};
m.get=function(a){a=this.h.getItem(a);if("string"!==typeof a&&null!==a)throw"Storage mechanism: Invalid value was encountered";return a};
m.remove=function(a){this.h.removeItem(a)};
m.K=function(a){var b=0,c=this.h,d=new Ke;d.next=function(){if(b>=c.length)return Le;var e=c.key(b++);if(a)return Me(e);e=c.getItem(e);if("string"!==typeof e)throw"Storage mechanism: Invalid value was encountered";return Me(e)};
return d};
m.clear=function(){this.h.clear()};
m.key=function(a){return this.h.key(a)};function Wf(){var a=null;try{a=window.localStorage||null}catch(b){}this.h=a}
Wa(Wf,Vf);function Xf(a,b){this.i=a;this.h=null;var c;if(c=Zb)c=!(9<=Number(lc));if(c){Yf||(Yf=new Re);this.h=Yf.get(a);this.h||(b?this.h=document.getElementById(b):(this.h=document.createElement("userdata"),this.h.addBehavior("#default#userData"),document.body.appendChild(this.h)),Yf.set(a,this.h));try{this.h.load(this.i)}catch(d){this.h=null}}}
Wa(Xf,Uf);var Zf={".":".2E","!":".21","~":".7E","*":".2A","'":".27","(":".28",")":".29","%":"."},Yf=null;function $f(a){return"_"+encodeURIComponent(a).replace(/[.!~*'()%]/g,function(b){return Zf[b]})}
m=Xf.prototype;m.isAvailable=function(){return!!this.h};
m.set=function(a,b){this.h.setAttribute($f(a),b);ag(this)};
m.get=function(a){a=this.h.getAttribute($f(a));if("string"!==typeof a&&null!==a)throw"Storage mechanism: Invalid value was encountered";return a};
m.remove=function(a){this.h.removeAttribute($f(a));ag(this)};
m.K=function(a){var b=0,c=this.h.XMLDocument.documentElement.attributes,d=new Ke;d.next=function(){if(b>=c.length)return Le;var e=c[b++];if(a)return Me(decodeURIComponent(e.nodeName.replace(/\./g,"%")).slice(1));e=e.nodeValue;if("string"!==typeof e)throw"Storage mechanism: Invalid value was encountered";return Me(e)};
return d};
m.clear=function(){for(var a=this.h.XMLDocument.documentElement,b=a.attributes.length;0<b;b--)a.removeAttribute(a.attributes[b-1].nodeName);ag(this)};
function ag(a){try{a.h.save(a.i)}catch(b){throw"Storage mechanism: Quota exceeded";}}
;function bg(a,b){this.i=a;this.h=b+"::"}
Wa(bg,Uf);bg.prototype.set=function(a,b){this.i.set(this.h+a,b)};
bg.prototype.get=function(a){return this.i.get(this.h+a)};
bg.prototype.remove=function(a){this.i.remove(this.h+a)};
bg.prototype.K=function(a){var b=this.i[Symbol.iterator](),c=this,d=new Ke;d.next=function(){var e=b.next();if(e.done)return e;for(e=e.value;e.slice(0,c.h.length)!=c.h;){e=b.next();if(e.done)return e;e=e.value}return Me(a?e.slice(c.h.length):c.i.get(e))};
return d};function cg(a){I.call(this,a)}
u(cg,I);cg.prototype.getKey=function(){return Pc(this,1)};
cg.prototype.W=function(){return Pc(this,2===Sc(this,dg)?2:-1)};
cg.prototype.setValue=function(a){return Rc(this,2,dg,a)};
var dg=[2,3,4,5,6];function eg(a){I.call(this,a)}
u(eg,I);function fg(a){I.call(this,a)}
u(fg,I);function gg(a){I.call(this,a,-1,hg)}
u(gg,I);gg.prototype.getPlayerType=function(){return Pc(this,36)};
gg.prototype.setHomeGroupInfo=function(a){return H(this,81,a)};
var hg=[9,66,24,32,86,100,101];function ig(a){I.call(this,a,-1,jg)}
u(ig,I);var jg=[15,26,28];function kg(a){I.call(this,a)}
u(kg,I);kg.prototype.setToken=function(a){return G(this,2,a)};function lg(a){I.call(this,a,-1,mg)}
u(lg,I);lg.prototype.setSafetyMode=function(a){return G(this,5,a)};
var mg=[12];function ng(a){I.call(this,a,-1,og)}
u(ng,I);var og=[12];function pg(a){I.call(this,a,-1,qg)}
u(pg,I);function rg(a){I.call(this,a)}
u(rg,I);rg.prototype.getKey=function(){return Xc(this,1)};
rg.prototype.W=function(){return Xc(this,2)};
rg.prototype.setValue=function(a){return G(this,2,a)};
var qg=[4,5];function sg(a){I.call(this,a)}
u(sg,I);function tg(a){I.call(this,a)}
u(tg,I);var ug=[2,3];function vg(a){I.call(this,a)}
u(vg,I);function wg(a){I.call(this,a)}
u(wg,I);function xg(a){I.call(this,a)}
u(xg,I);function yg(a){I.call(this,a,-1,zg)}
u(yg,I);var zg=[10,17];function Ag(a){I.call(this,a)}
u(Ag,I);function Bg(a){I.call(this,a)}
u(Bg,I);function Cg(a){I.call(this,a)}
u(Cg,I);function Dg(a){I.call(this,a,431)}
u(Dg,I);
var Eg=[23,24,11,6,7,5,2,3,20,21,28,32,37,229,241,45,59,225,288,72,73,78,208,156,202,215,74,76,79,80,111,85,91,97,100,102,105,119,126,127,136,146,157,158,159,163,164,168,176,222,383,177,178,179,411,184,188,189,190,191,193,194,195,196,198,199,200,201,203,204,205,206,258,259,260,261,209,226,227,232,233,234,240,247,248,251,254,255,270,278,291,293,300,304,308,309,310,311,313,314,319,321,323,324,328,330,331,332,337,338,340,344,348,350,351,352,353,354,355,356,357,358,361,363,364,368,369,370,373,374,375,
378,380,381,388,389,403,412,429,413,414,415,416,417,418,430,423,424,425,426,427,117];function Fg(a){I.call(this,a)}
u(Fg,I);function Gg(a){I.call(this,a)}
u(Gg,I);Gg.prototype.setVideoId=function(a){return Rc(this,1,Hg,a)};
Gg.prototype.getPlaylistId=function(){return Pc(this,2===Sc(this,Hg)?2:-1)};
var Hg=[1,2];function Ig(a){I.call(this,a,-1,Jg)}
u(Ig,I);var Jg=[3];function Kg(a){I.call(this,a,1)}
u(Kg,I);function Lg(a){I.call(this,a)}
u(Lg,I);var Mg;Mg=new function(a,b){this.h=a;this.fieldName=b;this.isRepeated=0;this.i=dd}(406606992,{Ob:0},Lg);function Ng(){Lg.apply(this,arguments)}
u(Ng,Lg);Ed(Ng);var Og=A.window,Pg,Qg,Rg=(null==Og?void 0:null==(Pg=Og.yt)?void 0:Pg.config_)||(null==Og?void 0:null==(Qg=Og.ytcfg)?void 0:Qg.data_)||{},Sg,Tg=(null==Og?void 0:null==(Sg=Og.ytcfg)?void 0:Sg.obfuscatedData_)||[];function Ug(){Kg.apply(this,arguments)}
u(Ug,Kg);Ed(Ug);var Vg=new Ug(Tg),Wg=Rg.EXPERIMENT_FLAGS;if(!Wg||!Wg.jspb_i18n_extension){var Xg=new Ng;Mg.i(Vg,Xg)}C("yt.config_",Rg);C("yt.configJspb_",Tg);function Yg(){var a=arguments;1<a.length?Rg[a[0]]=a[1]:1===a.length&&Object.assign(Rg,a[0])}
function N(a,b){return a in Rg?Rg[a]:b}
function Zg(){return N("LATEST_ECATCHER_SERVICE_TRACKING_PARAMS")}
function $g(){var a=Rg.EXPERIMENT_FLAGS;return a?a.web_disable_gel_stp_ecatcher_killswitch:void 0}
;var ah=[];function bh(a){ah.forEach(function(b){return b(a)})}
function ch(a){return a&&window.yterr?function(){try{return a.apply(this,arguments)}catch(b){dh(b)}}:a}
function dh(a,b,c,d){var e=B("yt.logging.errors.log");e?e(a,"ERROR",b,c,d):(e=N("ERRORS",[]),e.push([a,"ERROR",b,c,d]),Yg("ERRORS",e));bh(a)}
function eh(a,b,c,d){var e=B("yt.logging.errors.log");e?e(a,"WARNING",b,c,d):(e=N("ERRORS",[]),e.push([a,"WARNING",b,c,d]),Yg("ERRORS",e))}
;var fh=0;C("ytDomDomGetNextId",B("ytDomDomGetNextId")||function(){return++fh});var gh={stopImmediatePropagation:1,stopPropagation:1,preventMouseEvent:1,preventManipulation:1,preventDefault:1,layerX:1,layerY:1,screenX:1,screenY:1,scale:1,rotation:1,webkitMovementX:1,webkitMovementY:1};
function hh(a){this.type="";this.state=this.source=this.data=this.currentTarget=this.relatedTarget=this.target=null;this.charCode=this.keyCode=0;this.metaKey=this.shiftKey=this.ctrlKey=this.altKey=!1;this.rotation=this.clientY=this.clientX=0;this.scale=1;this.changedTouches=this.touches=null;try{if(a=a||window.event){this.event=a;for(var b in a)b in gh||(this[b]=a[b]);this.scale=a.scale;this.rotation=a.rotation;var c=a.target||a.srcElement;c&&3==c.nodeType&&(c=c.parentNode);this.target=c;var d=a.relatedTarget;
if(d)try{d=d.nodeName?d:null}catch(e){d=null}else"mouseover"==this.type?d=a.fromElement:"mouseout"==this.type&&(d=a.toElement);this.relatedTarget=d;this.clientX=void 0!=a.clientX?a.clientX:a.pageX;this.clientY=void 0!=a.clientY?a.clientY:a.pageY;this.keyCode=a.keyCode?a.keyCode:a.which;this.charCode=a.charCode||("keypress"==this.type?this.keyCode:0);this.altKey=a.altKey;this.ctrlKey=a.ctrlKey;this.shiftKey=a.shiftKey;this.metaKey=a.metaKey}}catch(e){}}
hh.prototype.preventDefault=function(){this.event&&(this.event.returnValue=!1,this.event.preventDefault&&this.event.preventDefault())};
hh.prototype.stopPropagation=function(){this.event&&(this.event.cancelBubble=!0,this.event.stopPropagation&&this.event.stopPropagation())};
hh.prototype.stopImmediatePropagation=function(){this.event&&(this.event.cancelBubble=!0,this.event.stopImmediatePropagation&&this.event.stopImmediatePropagation())};var kb=A.ytEventsEventsListeners||{};C("ytEventsEventsListeners",kb);var ih=A.ytEventsEventsCounter||{count:0};C("ytEventsEventsCounter",ih);
function jh(a,b,c,d){d=void 0===d?{}:d;a.addEventListener&&("mouseenter"!=b||"onmouseenter"in document?"mouseleave"!=b||"onmouseenter"in document?"mousewheel"==b&&"MozBoxSizing"in document.documentElement.style&&(b="MozMousePixelScroll"):b="mouseout":b="mouseover");return jb(function(e){var f="boolean"===typeof e[4]&&e[4]==!!d,g=Oa(e[4])&&Oa(d)&&lb(e[4],d);return!!e.length&&e[0]==a&&e[1]==b&&e[2]==c&&(f||g)})}
function kh(a){a&&("string"==typeof a&&(a=[a]),D(a,function(b){if(b in kb){var c=kb[b],d=c[0],e=c[1],f=c[3];c=c[4];d.removeEventListener?lh()||"boolean"===typeof c?d.removeEventListener(e,f,c):d.removeEventListener(e,f,!!c.capture):d.detachEvent&&d.detachEvent("on"+e,f);delete kb[b]}}))}
var lh=ab(function(){var a=!1;try{var b=Object.defineProperty({},"capture",{get:function(){a=!0}});
window.addEventListener("test",null,b)}catch(c){}return a});
function mh(a,b,c){var d=void 0===d?{}:d;if(a&&(a.addEventListener||a.attachEvent)){var e=jh(a,b,c,d);if(!e){e=++ih.count+"";var f=!("mouseenter"!=b&&"mouseleave"!=b||!a.addEventListener||"onmouseenter"in document);var g=f?function(h){h=new hh(h);if(!id(h.relatedTarget,function(k){return k==a}))return h.currentTarget=a,h.type=b,c.call(a,h)}:function(h){h=new hh(h);
h.currentTarget=a;return c.call(a,h)};
g=ch(g);a.addEventListener?("mouseenter"==b&&f?b="mouseover":"mouseleave"==b&&f?b="mouseout":"mousewheel"==b&&"MozBoxSizing"in document.documentElement.style&&(b="MozMousePixelScroll"),lh()||"boolean"===typeof d?a.addEventListener(b,g,d):a.addEventListener(b,g,!!d.capture)):a.attachEvent("on"+b,g);kb[e]=[a,b,c,g,d]}}}
;function nh(a,b){"function"===typeof a&&(a=ch(a));return window.setTimeout(a,b)}
function oh(a){"function"===typeof a&&(a=ch(a));return window.setInterval(a,250)}
;var ph=/^[\w.]*$/,qh={q:!0,search_query:!0};function rh(a,b){b=a.split(b);for(var c={},d=0,e=b.length;d<e;d++){var f=b[d].split("=");if(1==f.length&&f[0]||2==f.length)try{var g=sh(f[0]||""),h=sh(f[1]||"");g in c?Array.isArray(c[g])?hb(c[g],h):c[g]=[c[g],h]:c[g]=h}catch(q){var k=q,l=f[0],n=String(rh);k.args=[{key:l,value:f[1],query:a,method:th==n?"unchanged":n}];qh.hasOwnProperty(l)||eh(k)}}return c}
var th=String(rh);function uh(a){var b=[];ib(a,function(c,d){var e=encodeURIComponent(String(d)),f;Array.isArray(c)?f=c:f=[c];D(f,function(g){""==g?b.push(e):b.push(e+"="+encodeURIComponent(String(g)))})});
return b.join("&")}
function vh(a){"?"==a.charAt(0)&&(a=a.substr(1));return rh(a,"&")}
function wh(a,b,c){var d=a.split("#",2);a=d[0];d=1<d.length?"#"+d[1]:"";var e=a.split("?",2);a=e[0];e=vh(e[1]||"");for(var f in b)!c&&null!==e&&f in e||(e[f]=b[f]);b=a;a=Tb(e);a?(c=b.indexOf("#"),0>c&&(c=b.length),f=b.indexOf("?"),0>f||f>c?(f=c,e=""):e=b.substring(f+1,c),b=[b.slice(0,f),e,b.slice(c)],c=b[1],b[1]=a?c?c+"&"+a:a:c,a=b[0]+(b[1]?"?"+b[1]:"")+b[2]):a=b;return a+d}
function xh(a){if(!b)var b=window.location.href;var c=a.match(Kb)[1]||null,d=Mb(a);c&&d?(a=a.match(Kb),b=b.match(Kb),a=a[3]==b[3]&&a[1]==b[1]&&a[4]==b[4]):a=d?Mb(b)==d&&(Number(b.match(Kb)[4]||null)||null)==(Number(a.match(Kb)[4]||null)||null):!0;return a}
function sh(a){return a&&a.match(ph)?a:decodeURIComponent(a.replace(/\+/g," "))}
;function O(a){a=yh(a);return"string"===typeof a&&"false"===a?!1:!!a}
function zh(a,b){a=yh(a);return void 0===a&&void 0!==b?b:Number(a||0)}
function yh(a){var b=N("EXPERIMENTS_FORCED_FLAGS",{});return void 0!==b[a]?b[a]:N("EXPERIMENT_FLAGS",{})[a]}
function Ah(){var a=[],b=N("EXPERIMENTS_FORCED_FLAGS",{});for(c in b)a.push({key:c,value:String(b[c])});var c=N("EXPERIMENT_FLAGS",{});for(var d in c)d.startsWith("force_")&&void 0===b[d]&&a.push({key:d,value:String(c[d])});return a}
;function Bh(a){var b=Ch;a=void 0===a?B("yt.ads.biscotti.lastId_")||"":a;var c=Object,d=c.assign,e={};e.dt=pd;e.flash="0";a:{try{var f=b.h.top.location.href}catch(X){f=2;break a}f=f?f===b.i.location.href?0:1:2}e=(e.frm=f,e);try{e.u_tz=-(new Date).getTimezoneOffset();var g=void 0===g?fd:g;try{var h=g.history.length}catch(X){h=0}e.u_his=h;var k;e.u_h=null==(k=fd.screen)?void 0:k.height;var l;e.u_w=null==(l=fd.screen)?void 0:l.width;var n;e.u_ah=null==(n=fd.screen)?void 0:n.availHeight;var q;e.u_aw=null==
(q=fd.screen)?void 0:q.availWidth;var v;e.u_cd=null==(v=fd.screen)?void 0:v.colorDepth}catch(X){}h=b.h;try{var p=h.screenX;var y=h.screenY}catch(X){}try{var z=h.outerWidth;var F=h.outerHeight}catch(X){}try{var K=h.innerWidth;var M=h.innerHeight}catch(X){}try{var P=h.screenLeft;var fb=h.screenTop}catch(X){}try{K=h.innerWidth,M=h.innerHeight}catch(X){}try{var hc=h.screen.availWidth;var ua=h.screen.availTop}catch(X){}p=[P,fb,p,y,hc,ua,z,F,K,M];y=b.h.top;try{var ma=(y||window).document,Y="CSS1Compat"==
ma.compatMode?ma.documentElement:ma.body;var ba=(new gd(Y.clientWidth,Y.clientHeight)).round()}catch(X){ba=new gd(-12245933,-12245933)}ma=ba;ba={};var ca=void 0===ca?A:ca;Y=new pe;ca.SVGElement&&ca.document.createElementNS&&Y.set(0);y=nd();y["allow-top-navigation-by-user-activation"]&&Y.set(1);y["allow-popups-to-escape-sandbox"]&&Y.set(2);ca.crypto&&ca.crypto.subtle&&Y.set(3);ca.TextDecoder&&ca.TextEncoder&&Y.set(4);ca=qe(Y);ba.bc=ca;ba.bih=ma.height;ba.biw=ma.width;ba.brdim=p.join();b=b.i;b=(ba.vis=
b.prerendering?3:{visible:1,hidden:2,prerender:3,preview:4,unloaded:5}[b.visibilityState||b.webkitVisibilityState||b.mozVisibilityState||""]||0,ba.wgl=!!fd.WebGLRenderingContext,ba);c=d.call(c,e,b);c.ca_type="image";a&&(c.bid=a);return c}
var Ch=new function(){var a=window.document;this.h=window;this.i=a};
C("yt.ads_.signals_.getAdSignalsString",function(a){return uh(Bh(a))});Date.now();var Dh="XMLHttpRequest"in A?function(){return new XMLHttpRequest}:null;
function Eh(){if(!Dh)return null;var a=Dh();return"open"in a?a:null}
;var Fh={Authorization:"AUTHORIZATION","X-Goog-EOM-Visitor-Id":"EOM_VISITOR_DATA","X-Goog-Visitor-Id":"SANDBOXED_VISITOR_ID","X-Youtube-Domain-Admin-State":"DOMAIN_ADMIN_STATE","X-Youtube-Chrome-Connected":"CHROME_CONNECTED_HEADER","X-YouTube-Client-Name":"INNERTUBE_CONTEXT_CLIENT_NAME","X-YouTube-Client-Version":"INNERTUBE_CONTEXT_CLIENT_VERSION","X-YouTube-Delegation-Context":"INNERTUBE_CONTEXT_SERIALIZED_DELEGATION_CONTEXT","X-YouTube-Device":"DEVICE","X-Youtube-Identity-Token":"ID_TOKEN","X-YouTube-Page-CL":"PAGE_CL",
"X-YouTube-Page-Label":"PAGE_BUILD_LABEL","X-YouTube-Variants-Checksum":"VARIANTS_CHECKSUM"},Gh="app debugcss debugjs expflag force_ad_params force_ad_encrypted force_viral_ad_response_params forced_experiments innertube_snapshots innertube_goldens internalcountrycode internalipoverride absolute_experiments conditional_experiments sbb sr_bns_address".split(" ").concat(ia(rd)),Hh=!1;
function Ih(a,b){b=void 0===b?{}:b;var c=xh(a),d=O("web_ajax_ignore_global_headers_if_set"),e;for(e in Fh){var f=N(Fh[e]);!f||!c&&Mb(a)||d&&void 0!==b[e]||!O("enable_web_eom_visitor_data")&&"X-Goog-EOM-Visitor-Id"===e||(b[e]=f)}"X-Goog-EOM-Visitor-Id"in b&&"X-Goog-Visitor-Id"in b&&delete b["X-Goog-Visitor-Id"];if(c||!Mb(a))b["X-YouTube-Utc-Offset"]=String(-(new Date).getTimezoneOffset());if(c||!Mb(a)){try{var g=(new Intl.DateTimeFormat).resolvedOptions().timeZone}catch(h){}g&&(b["X-YouTube-Time-Zone"]=
g)}if(c||!Mb(a))b["X-YouTube-Ad-Signals"]=uh(Bh());return b}
function Jh(a){var b=window.location.search,c=Mb(a);O("debug_handle_relative_url_for_query_forward_killswitch")||c||!xh(a)||(c=document.location.hostname);var d=Lb(a.match(Kb)[5]||null);d=(c=c&&(c.endsWith("youtube.com")||c.endsWith("youtube-nocookie.com")))&&d&&d.startsWith("/api/");if(!c||d)return a;var e=vh(b),f={};D(Gh,function(g){e[g]&&(f[g]=e[g])});
return wh(a,f||{},!1)}
function Kh(a,b){var c=b.format||"JSON";a=Lh(a,b);var d=Mh(a,b),e=!1,f=Nh(a,function(k){if(!e){e=!0;h&&window.clearTimeout(h);a:switch(k&&"status"in k?k.status:-1){case 200:case 201:case 202:case 203:case 204:case 205:case 206:case 304:var l=!0;break a;default:l=!1}var n=null,q=400<=k.status&&500>k.status,v=500<=k.status&&600>k.status;if(l||q||v)n=Oh(a,c,k,b.convertToSafeHtml);if(l)a:if(k&&204==k.status)l=!0;else{switch(c){case "XML":l=0==parseInt(n&&n.return_code,10);break a;case "RAW":l=!0;break a}l=
!!n}n=n||{};q=b.context||A;l?b.onSuccess&&b.onSuccess.call(q,k,n):b.onError&&b.onError.call(q,k,n);b.onFinish&&b.onFinish.call(q,k,n)}},b.method,d,b.headers,b.responseType,b.withCredentials);
d=b.timeout||0;if(b.onTimeout&&0<d){var g=b.onTimeout;var h=nh(function(){e||(e=!0,f.abort(),window.clearTimeout(h),g.call(b.context||A,f))},d)}}
function Lh(a,b){b.includeDomain&&(a=document.location.protocol+"//"+document.location.hostname+(document.location.port?":"+document.location.port:"")+a);var c=N("XSRF_FIELD_NAME");if(b=b.urlParams)b[c]&&delete b[c],a=wh(a,b||{},!0);return a}
function Mh(a,b){var c=N("XSRF_FIELD_NAME"),d=N("XSRF_TOKEN"),e=b.postBody||"",f=b.postParams,g=N("XSRF_FIELD_NAME"),h;b.headers&&(h=b.headers["Content-Type"]);b.excludeXsrf||Mb(a)&&!b.withCredentials&&Mb(a)!=document.location.hostname||"POST"!=b.method||h&&"application/x-www-form-urlencoded"!=h||b.postParams&&b.postParams[g]||(f||(f={}),f[c]=d);f&&"string"===typeof e&&(e=vh(e),tb(e,f),e=b.postBodyFormat&&"JSON"==b.postBodyFormat?JSON.stringify(e):Tb(e));if(!(a=e)&&(a=f)){a:{for(var k in f){f=!1;
break a}f=!0}a=!f}!Hh&&a&&"POST"!=b.method&&(Hh=!0,dh(Error("AJAX request with postData should use POST")));return e}
function Oh(a,b,c,d){var e=null;switch(b){case "JSON":try{var f=c.responseText}catch(g){throw d=Error("Error reading responseText"),d.params=a,eh(d),g;}a=c.getResponseHeader("Content-Type")||"";f&&0<=a.indexOf("json")&&(")]}'\n"===f.substring(0,5)&&(f=f.substring(5)),e=JSON.parse(f));break;case "XML":if(a=(a=c.responseXML)?Ph(a):null)e={},D(a.getElementsByTagName("*"),function(g){e[g.tagName]=Qh(g)})}d&&Rh(e);
return e}
function Rh(a){if(Oa(a))for(var b in a){var c;(c="html_content"==b)||(c=b.length-5,c=0<=c&&b.indexOf("_html",c)==c);if(c){c=b;wb("HTML that is escaped and sanitized server-side and passed through yt.net.ajax");var d=a[b];if(void 0===ub){var e=null;var f=A.trustedTypes;if(f&&f.createPolicy){try{e=f.createPolicy("goog#html",{createHTML:Xa,createScript:Xa,createScriptURL:Xa})}catch(g){A.console&&A.console.error(g.message)}ub=e}else ub=e}d=(e=ub)?e.createHTML(d):d;a[c]=new Jb(d)}else Rh(a[b])}}
function Ph(a){return a?(a=("responseXML"in a?a.responseXML:a).getElementsByTagName("root"))&&0<a.length?a[0]:null:null}
function Qh(a){var b="";D(a.childNodes,function(c){b+=c.nodeValue});
return b}
function Nh(a,b,c,d,e,f,g){function h(){4==(k&&"readyState"in k?k.readyState:0)&&b&&ch(b)(k)}
c=void 0===c?"GET":c;d=void 0===d?"":d;var k=Eh();if(!k)return null;"onloadend"in k?k.addEventListener("loadend",h,!1):k.onreadystatechange=h;O("debug_forward_web_query_parameters")&&(a=Jh(a));k.open(c,a,!0);f&&(k.responseType=f);g&&(k.withCredentials=!0);c="POST"==c&&(void 0===window.FormData||!(d instanceof FormData));if(e=Ih(a,e))for(var l in e)k.setRequestHeader(l,e[l]),"content-type"==l.toLowerCase()&&(c=!1);c&&k.setRequestHeader("Content-Type","application/x-www-form-urlencoded");k.send(d);
return k}
;var Sh={Jb:"WEB_DISPLAY_MODE_UNKNOWN",Fb:"WEB_DISPLAY_MODE_BROWSER",Hb:"WEB_DISPLAY_MODE_MINIMAL_UI",Ib:"WEB_DISPLAY_MODE_STANDALONE",Gb:"WEB_DISPLAY_MODE_FULLSCREEN"};function Th(){if(!A.matchMedia)return"WEB_DISPLAY_MODE_UNKNOWN";try{return A.matchMedia("(display-mode: standalone)").matches?"WEB_DISPLAY_MODE_STANDALONE":A.matchMedia("(display-mode: minimal-ui)").matches?"WEB_DISPLAY_MODE_MINIMAL_UI":A.matchMedia("(display-mode: fullscreen)").matches?"WEB_DISPLAY_MODE_FULLSCREEN":A.matchMedia("(display-mode: browser)").matches?"WEB_DISPLAY_MODE_BROWSER":"WEB_DISPLAY_MODE_UNKNOWN"}catch(a){return"WEB_DISPLAY_MODE_UNKNOWN"}}
;C("ytglobal.prefsUserPrefsPrefs_",B("ytglobal.prefsUserPrefsPrefs_")||{});var Uh={bluetooth:"CONN_DISCO",cellular:"CONN_CELLULAR_UNKNOWN",ethernet:"CONN_WIFI",none:"CONN_NONE",wifi:"CONN_WIFI",wimax:"CONN_CELLULAR_4G",other:"CONN_UNKNOWN",unknown:"CONN_UNKNOWN","slow-2g":"CONN_CELLULAR_2G","2g":"CONN_CELLULAR_2G","3g":"CONN_CELLULAR_3G","4g":"CONN_CELLULAR_4G"},Vh={CONN_DEFAULT:0,CONN_UNKNOWN:1,CONN_NONE:2,CONN_WIFI:3,CONN_CELLULAR_2G:4,CONN_CELLULAR_3G:5,CONN_CELLULAR_4G:6,CONN_CELLULAR_UNKNOWN:7,CONN_DISCO:8,CONN_CELLULAR_5G:9,CONN_WIFI_METERED:10,CONN_CELLULAR_5G_SA:11,
CONN_CELLULAR_5G_NSA:12,CONN_INVALID:31},Wh={EFFECTIVE_CONNECTION_TYPE_UNKNOWN:0,EFFECTIVE_CONNECTION_TYPE_OFFLINE:1,EFFECTIVE_CONNECTION_TYPE_SLOW_2G:2,EFFECTIVE_CONNECTION_TYPE_2G:3,EFFECTIVE_CONNECTION_TYPE_3G:4,EFFECTIVE_CONNECTION_TYPE_4G:5},Xh={"slow-2g":"EFFECTIVE_CONNECTION_TYPE_SLOW_2G","2g":"EFFECTIVE_CONNECTION_TYPE_2G","3g":"EFFECTIVE_CONNECTION_TYPE_3G","4g":"EFFECTIVE_CONNECTION_TYPE_4G"};function Yh(){var a=A.navigator;return a?a.connection:void 0}
;function Zh(){return"INNERTUBE_API_KEY"in Rg&&"INNERTUBE_API_VERSION"in Rg}
function $h(){return{innertubeApiKey:N("INNERTUBE_API_KEY"),innertubeApiVersion:N("INNERTUBE_API_VERSION"),za:N("INNERTUBE_CONTEXT_CLIENT_CONFIG_INFO"),Na:N("INNERTUBE_CONTEXT_CLIENT_NAME","WEB"),kb:N("INNERTUBE_CONTEXT_CLIENT_NAME",1),innertubeContextClientVersion:N("INNERTUBE_CONTEXT_CLIENT_VERSION"),Pa:N("INNERTUBE_CONTEXT_HL"),Oa:N("INNERTUBE_CONTEXT_GL"),lb:N("INNERTUBE_HOST_OVERRIDE")||"",nb:!!N("INNERTUBE_USE_THIRD_PARTY_AUTH",!1),mb:!!N("INNERTUBE_OMIT_API_KEY_WHEN_AUTH_HEADER_IS_PRESENT",
!1),appInstallData:N("SERIALIZED_CLIENT_CONFIG_DATA")}}
function ai(a){var b={client:{hl:a.Pa,gl:a.Oa,clientName:a.Na,clientVersion:a.innertubeContextClientVersion,configInfo:a.za}};navigator.userAgent&&(b.client.userAgent=String(navigator.userAgent));var c=A.devicePixelRatio;c&&1!=c&&(b.client.screenDensityFloat=String(c));c=N("EXPERIMENTS_TOKEN","");""!==c&&(b.client.experimentsToken=c);c=Ah();0<c.length&&(b.request={internalExperimentFlags:c});bi(a,void 0,b);ci(void 0,b);di(a,void 0,b);ei(void 0,b);N("DELEGATED_SESSION_ID")&&!O("pageid_as_header_web")&&
(b.user={onBehalfOfUser:N("DELEGATED_SESSION_ID")});a=Object;c=a.assign;for(var d=b.client,e={},f=t(Object.entries(vh(N("DEVICE","")))),g=f.next();!g.done;g=f.next()){var h=t(g.value);g=h.next().value;h=h.next().value;"cbrand"===g?e.deviceMake=h:"cmodel"===g?e.deviceModel=h:"cbr"===g?e.browserName=h:"cbrver"===g?e.browserVersion=h:"cos"===g?e.osName=h:"cosver"===g?e.osVersion=h:"cplatform"===g&&(e.platform=h)}b.client=c.call(a,d,e);return b}
function fi(a){var b=new ng,c=new gg;G(c,1,a.Pa);G(c,2,a.Oa);G(c,16,a.kb);G(c,17,a.innertubeContextClientVersion);if(a.za){var d=a.za,e=new eg;d.coldConfigData&&G(e,1,d.coldConfigData);d.appInstallData&&G(e,6,d.appInstallData);d.coldHashData&&G(e,3,d.coldHashData);d.hotHashData&&G(e,5,d.hotHashData);H(c,62,e)}(d=A.devicePixelRatio)&&1!=d&&G(c,65,d);d=N("EXPERIMENTS_TOKEN","");""!==d&&G(c,54,d);d=Ah();if(0<d.length){e=new ig;for(var f=0;f<d.length;f++){var g=new cg;G(g,1,d[f].key);g.setValue(d[f].value);
Wc(e,15,cg,g)}H(b,5,e)}bi(a,c);ci(c);di(a,c);ei(c);N("DELEGATED_SESSION_ID")&&!O("pageid_as_header_web")&&(a=new lg,G(a,3,N("DELEGATED_SESSION_ID")));a=t(Object.entries(vh(N("DEVICE",""))));for(d=a.next();!d.done;d=a.next())e=t(d.value),d=e.next().value,e=e.next().value,"cbrand"===d?G(c,12,e):"cmodel"===d?G(c,13,e):"cbr"===d?G(c,87,e):"cbrver"===d?G(c,88,e):"cos"===d?G(c,18,e):"cosver"===d?G(c,19,e):"cplatform"===d&&G(c,42,e);H(b,1,c);return b}
function bi(a,b,c){a=a.Na;if("WEB"===a||"MWEB"===a||1===a||2===a)if(b){c=Tc(b,fg,96)||new fg;var d=Th();d=Object.keys(Sh).indexOf(d);d=-1===d?null:d;null!==d&&G(c,3,d);H(b,96,c)}else c&&(c.client.mainAppWebInfo=null!=(d=c.client.mainAppWebInfo)?d:{},c.client.mainAppWebInfo.webDisplayMode=Th())}
function ci(a,b){var c;if(O("web_log_memory_total_kbytes")&&(null==(c=A.navigator)?0:c.deviceMemory)){var d;c=null==(d=A.navigator)?void 0:d.deviceMemory;a?G(a,95,1E6*c):b&&(b.client.memoryTotalKbytes=""+1E6*c)}}
function di(a,b,c){if(a.appInstallData)if(b){var d;c=null!=(d=Tc(b,eg,62))?d:new eg;G(c,6,a.appInstallData);H(b,62,c)}else c&&(c.client.configInfo=c.client.configInfo||{},c.client.configInfo.appInstallData=a.appInstallData)}
function ei(a,b){a:{var c=Yh();if(c){var d=Uh[c.type||"unknown"]||"CONN_UNKNOWN";c=Uh[c.effectiveType||"unknown"]||"CONN_UNKNOWN";"CONN_CELLULAR_UNKNOWN"===d&&"CONN_UNKNOWN"!==c&&(d=c);if("CONN_UNKNOWN"!==d)break a;if("CONN_UNKNOWN"!==c){d=c;break a}}d=void 0}d&&(a?G(a,61,Vh[d]):b&&(b.client.connectionType=d));O("web_log_effective_connection_type")&&(d=Yh(),d=null!=d&&d.effectiveType?Xh.hasOwnProperty(d.effectiveType)?Xh[d.effectiveType]:"EFFECTIVE_CONNECTION_TYPE_UNKNOWN":void 0,d&&(a?G(a,94,Wh[d]):
b&&(b.client.effectiveConnectionType=d)))}
function gi(a,b,c){c=void 0===c?{}:c;var d={};O("enable_web_eom_visitor_data")&&N("EOM_VISITOR_DATA")?d={"X-Goog-EOM-Visitor-Id":N("EOM_VISITOR_DATA")}:d={"X-Goog-Visitor-Id":c.visitorData||N("VISITOR_DATA","")};if(b&&b.includes("www.youtube-nocookie.com"))return d;(b=c.Lb||N("AUTHORIZATION"))||(a?b="Bearer "+B("gapi.auth.getToken")().Kb:b=Dd([]));b&&(d.Authorization=b,d["X-Goog-AuthUser"]=N("SESSION_INDEX",0),O("pageid_as_header_web")&&(d["X-Goog-PageId"]=N("DELEGATED_SESSION_ID")));return d}
;function hi(a){a=Object.assign({},a);delete a.Authorization;var b=Dd();if(b){var c=new Ie;c.update(N("INNERTUBE_API_KEY"));c.update(b);a.hash=uc(c.digest(),3)}return a}
;function ii(a){var b=new Wf;(b=b.isAvailable()?a?new bg(b,a):b:null)||(a=new Xf(a||"UserDataSharedStore"),b=a.isAvailable()?a:null);this.h=(a=b)?new Sf(a):null;this.i=document.domain||window.location.hostname}
ii.prototype.set=function(a,b,c,d){c=c||31104E3;this.remove(a);if(this.h)try{this.h.set(a,b,Date.now()+1E3*c);return}catch(f){}var e="";if(d)try{e=escape(We(b))}catch(f){return}else e=escape(b);b=this.i;Ad.set(""+a,e,{Aa:c,path:"/",domain:void 0===b?"youtube.com":b,secure:!1})};
ii.prototype.get=function(a,b){var c=void 0,d=!this.h;if(!d)try{c=this.h.get(a)}catch(e){d=!0}if(d&&(c=Ad.get(""+a,void 0))&&(c=unescape(c),b))try{c=JSON.parse(c)}catch(e){this.remove(a),c=void 0}return c};
ii.prototype.remove=function(a){this.h&&this.h.remove(a);var b=this.i;Ad.remove(""+a,"/",void 0===b?"youtube.com":b)};var ji=window,Q=ji.ytcsi&&ji.ytcsi.now?ji.ytcsi.now:ji.performance&&ji.performance.timing&&ji.performance.now&&ji.performance.timing.navigationStart?function(){return ji.performance.timing.navigationStart+ji.performance.now()}:function(){return(new Date).getTime()};var ki;function li(){ki||(ki=new ii("yt.innertube"));return ki}
function mi(a,b,c,d){if(d)return null;d=li().get("nextId",!0)||1;var e=li().get("requests",!0)||{};e[d]={method:a,request:b,authState:hi(c),requestTime:Math.round(Q())};li().set("nextId",d+1,86400,!0);li().set("requests",e,86400,!0);return d}
function ni(a){var b=li().get("requests",!0)||{};delete b[a];li().set("requests",b,86400,!0)}
function oi(a){var b=li().get("requests",!0);if(b){for(var c in b){var d=b[c];if(!(6E4>Math.round(Q())-d.requestTime)){var e=d.authState,f=hi(gi(!1));lb(e,f)&&(e=d.request,"requestTimeMs"in e&&(e.requestTimeMs=Math.round(Q())),pi(a,d.method,e,{}));delete b[c]}}li().set("requests",b,86400,!0)}}
;function qi(){}
function ri(a,b){return si(a,0,b)}
qi.prototype.L=function(a,b){return si(a,1,b)};
function ti(a,b){si(a,2,b)}
;function ui(){qi.apply(this,arguments)}
u(ui,qi);function vi(){ui.h||(ui.h=new ui);return ui.h}
function si(a,b,c){void 0!==c&&Number.isNaN(Number(c))&&(c=void 0);var d=B("yt.scheduler.instance.addJob");return d?d(a,b,c):void 0===c?(a(),NaN):nh(a,c||0)}
ui.prototype.Y=function(a){if(void 0===a||!Number.isNaN(Number(a))){var b=B("yt.scheduler.instance.cancelJob");b?b(a):window.clearTimeout(a)}};
ui.prototype.start=function(){var a=B("yt.scheduler.instance.start");a&&a()};var oe=vi();var wi=mc||nc;var xi=function(){var a;return function(){a||(a=new ii("ytidb"));return a}}();
function yi(){var a;return null==(a=xi())?void 0:a.get("LAST_RESULT_ENTRY_KEY",!0)}
;var zi=[],Ai=!1;function Bi(a){Ai||(zi.push({type:"ERROR",payload:a}),10<zi.length&&zi.shift())}
function Ci(a,b){Ai||(zi.push({type:"EVENT",eventType:a,payload:b}),10<zi.length&&zi.shift())}
;function Di(a){var b=Ka.apply(1,arguments);var c=Error.call(this,a);this.message=c.message;"stack"in c&&(this.stack=c.stack);this.args=[].concat(ia(b))}
u(Di,Error);function Ei(){try{return Fi(),!0}catch(a){return!1}}
function Fi(){if(void 0!==N("DATASYNC_ID"))return N("DATASYNC_ID");throw new Di("Datasync ID not set","unknown");}
;function Gi(a){if(0<=a.indexOf(":"))throw Error("Database name cannot contain ':'");}
function Hi(a){return a.substr(0,a.indexOf(":"))||a}
;var Ii={},Ji=(Ii.AUTH_INVALID="No user identifier specified.",Ii.EXPLICIT_ABORT="Transaction was explicitly aborted.",Ii.IDB_NOT_SUPPORTED="IndexedDB is not supported.",Ii.MISSING_INDEX="Index not created.",Ii.MISSING_OBJECT_STORES="Object stores not created.",Ii.DB_DELETED_BY_MISSING_OBJECT_STORES="Database is deleted because expected object stores were not created.",Ii.DB_REOPENED_BY_MISSING_OBJECT_STORES="Database is reopened because expected object stores were not created.",Ii.UNKNOWN_ABORT="Transaction was aborted for unknown reasons.",
Ii.QUOTA_EXCEEDED="The current transaction exceeded its quota limitations.",Ii.QUOTA_MAYBE_EXCEEDED="The current transaction may have failed because of exceeding quota limitations.",Ii.EXECUTE_TRANSACTION_ON_CLOSED_DB="Can't start a transaction on a closed database",Ii.INCOMPATIBLE_DB_VERSION="The binary is incompatible with the database version",Ii),Ki={},Li=(Ki.AUTH_INVALID="ERROR",Ki.EXECUTE_TRANSACTION_ON_CLOSED_DB="WARNING",Ki.EXPLICIT_ABORT="IGNORED",Ki.IDB_NOT_SUPPORTED="ERROR",Ki.MISSING_INDEX=
"WARNING",Ki.MISSING_OBJECT_STORES="ERROR",Ki.DB_DELETED_BY_MISSING_OBJECT_STORES="WARNING",Ki.DB_REOPENED_BY_MISSING_OBJECT_STORES="WARNING",Ki.QUOTA_EXCEEDED="WARNING",Ki.QUOTA_MAYBE_EXCEEDED="WARNING",Ki.UNKNOWN_ABORT="WARNING",Ki.INCOMPATIBLE_DB_VERSION="WARNING",Ki),Mi={},Ni=(Mi.AUTH_INVALID=!1,Mi.EXECUTE_TRANSACTION_ON_CLOSED_DB=!1,Mi.EXPLICIT_ABORT=!1,Mi.IDB_NOT_SUPPORTED=!1,Mi.MISSING_INDEX=!1,Mi.MISSING_OBJECT_STORES=!1,Mi.DB_DELETED_BY_MISSING_OBJECT_STORES=!1,Mi.DB_REOPENED_BY_MISSING_OBJECT_STORES=
!1,Mi.QUOTA_EXCEEDED=!1,Mi.QUOTA_MAYBE_EXCEEDED=!0,Mi.UNKNOWN_ABORT=!0,Mi.INCOMPATIBLE_DB_VERSION=!1,Mi);function T(a,b,c,d,e){b=void 0===b?{}:b;c=void 0===c?Ji[a]:c;d=void 0===d?Li[a]:d;e=void 0===e?Ni[a]:e;Di.call(this,c,Object.assign({},{name:"YtIdbKnownError",isSw:void 0===self.document,isIframe:self!==self.top,type:a},b));this.type=a;this.message=c;this.level=d;this.h=e;Object.setPrototypeOf(this,T.prototype)}
u(T,Di);function Oi(a,b){T.call(this,"MISSING_OBJECT_STORES",{expectedObjectStores:b,foundObjectStores:a},Ji.MISSING_OBJECT_STORES);Object.setPrototypeOf(this,Oi.prototype)}
u(Oi,T);function Pi(a,b){var c=Error.call(this);this.message=c.message;"stack"in c&&(this.stack=c.stack);this.index=a;this.objectStore=b;Object.setPrototypeOf(this,Pi.prototype)}
u(Pi,Error);var Qi=["The database connection is closing","Can't start a transaction on a closed database","A mutation operation was attempted on a database that did not allow mutations"];
function Ri(a,b,c,d){b=Hi(b);var e=a instanceof Error?a:Error("Unexpected error: "+a);if(e instanceof T)return e;a={objectStoreNames:c,dbName:b,dbVersion:d};if("QuotaExceededError"===e.name)return new T("QUOTA_EXCEEDED",a);if(oc&&"UnknownError"===e.name)return new T("QUOTA_MAYBE_EXCEEDED",a);if(e instanceof Pi)return new T("MISSING_INDEX",Object.assign({},a,{objectStore:e.objectStore,index:e.index}));if("InvalidStateError"===e.name&&Qi.some(function(f){return e.message.includes(f)}))return new T("EXECUTE_TRANSACTION_ON_CLOSED_DB",
a);
if("AbortError"===e.name)return new T("UNKNOWN_ABORT",a,e.message);e.args=[Object.assign({},a,{name:"IdbError",Qb:e.name})];e.level="WARNING";return e}
function Si(a,b,c){var d=yi();return new T("IDB_NOT_SUPPORTED",{context:{caller:a,publicName:b,version:c,hasSucceededOnce:null==d?void 0:d.hasSucceededOnce}})}
;function Ti(a){if(!a)throw Error();throw a;}
function Ui(a){return a}
function Vi(a){this.h=a}
function U(a){function b(e){if("PENDING"===d.state.status){d.state={status:"REJECTED",reason:e};e=t(d.onRejected);for(var f=e.next();!f.done;f=e.next())f=f.value,f()}}
function c(e){if("PENDING"===d.state.status){d.state={status:"FULFILLED",value:e};e=t(d.h);for(var f=e.next();!f.done;f=e.next())f=f.value,f()}}
var d=this;this.state={status:"PENDING"};this.h=[];this.onRejected=[];a=a.h;try{a(c,b)}catch(e){b(e)}}
U.all=function(a){return new U(new Vi(function(b,c){var d=[],e=a.length;0===e&&b(d);for(var f={Z:0};f.Z<a.length;f={Z:f.Z},++f.Z)Wi(U.resolve(a[f.Z]).then(function(g){return function(h){d[g.Z]=h;e--;0===e&&b(d)}}(f)),function(g){c(g)})}))};
U.resolve=function(a){return new U(new Vi(function(b,c){a instanceof U?a.then(b,c):b(a)}))};
U.reject=function(a){return new U(new Vi(function(b,c){c(a)}))};
U.prototype.then=function(a,b){var c=this,d=null!=a?a:Ui,e=null!=b?b:Ti;return new U(new Vi(function(f,g){"PENDING"===c.state.status?(c.h.push(function(){Xi(c,c,d,f,g)}),c.onRejected.push(function(){Yi(c,c,e,f,g)})):"FULFILLED"===c.state.status?Xi(c,c,d,f,g):"REJECTED"===c.state.status&&Yi(c,c,e,f,g)}))};
function Wi(a,b){a.then(void 0,b)}
function Xi(a,b,c,d,e){try{if("FULFILLED"!==a.state.status)throw Error("calling handleResolve before the promise is fulfilled.");var f=c(a.state.value);f instanceof U?Zi(a,b,f,d,e):d(f)}catch(g){e(g)}}
function Yi(a,b,c,d,e){try{if("REJECTED"!==a.state.status)throw Error("calling handleReject before the promise is rejected.");var f=c(a.state.reason);f instanceof U?Zi(a,b,f,d,e):d(f)}catch(g){e(g)}}
function Zi(a,b,c,d,e){b===c?e(new TypeError("Circular promise chain detected.")):c.then(function(f){f instanceof U?Zi(a,b,f,d,e):d(f)},function(f){e(f)})}
;function $i(a,b,c){function d(){c(a.error);f()}
function e(){b(a.result);f()}
function f(){try{a.removeEventListener("success",e),a.removeEventListener("error",d)}catch(g){}}
a.addEventListener("success",e);a.addEventListener("error",d)}
function aj(a){return new Promise(function(b,c){$i(a,b,c)})}
function V(a){return new U(new Vi(function(b,c){$i(a,b,c)}))}
;function bj(a,b){return new U(new Vi(function(c,d){function e(){var f=a?b(a):null;f?f.then(function(g){a=g;e()},d):c()}
e()}))}
;function cj(a,b){this.h=a;this.options=b;this.transactionCount=0;this.j=Math.round(Q());this.i=!1}
m=cj.prototype;m.add=function(a,b,c){return dj(this,[a],{mode:"readwrite",H:!0},function(d){return d.objectStore(a).add(b,c)})};
m.clear=function(a){return dj(this,[a],{mode:"readwrite",H:!0},function(b){return b.objectStore(a).clear()})};
m.close=function(){this.h.close();var a;(null==(a=this.options)?0:a.closed)&&this.options.closed()};
m.count=function(a,b){return dj(this,[a],{mode:"readonly",H:!0},function(c){return c.objectStore(a).count(b)})};
function ej(a,b,c){a=a.h.createObjectStore(b,c);return new fj(a)}
m.delete=function(a,b){return dj(this,[a],{mode:"readwrite",H:!0},function(c){return c.objectStore(a).delete(b)})};
m.get=function(a,b){return dj(this,[a],{mode:"readonly",H:!0},function(c){return c.objectStore(a).get(b)})};
function gj(a,b){return dj(a,["LogsRequestsStore"],{mode:"readwrite",H:!0},function(c){c=c.objectStore("LogsRequestsStore");return V(c.h.put(b,void 0))})}
m.objectStoreNames=function(){return Array.from(this.h.objectStoreNames)};
function dj(a,b,c,d){var e,f,g,h,k,l,n,q,v,p,y,z;return x(function(F){switch(F.h){case 1:var K={mode:"readonly",H:!1,tag:"IDB_TRANSACTION_TAG_UNKNOWN"};"string"===typeof c?K.mode=c:Object.assign(K,c);e=K;a.transactionCount++;f=e.H?3:1;g=0;case 2:if(h){F.o(3);break}g++;k=Math.round(Q());xa(F,4);l=a.h.transaction(b,e.mode);K=new hj(l);K=ij(K,d);return w(F,K,6);case 6:return n=F.i,q=Math.round(Q()),jj(a,k,q,g,void 0,b.join(),e),F.return(n);case 4:v=za(F);p=Math.round(Q());y=Ri(v,a.h.name,b.join(),a.h.version);
if((z=y instanceof T&&!y.h)||g>=f)jj(a,k,p,g,y,b.join(),e),h=y;F.o(2);break;case 3:return F.return(Promise.reject(h))}})}
function jj(a,b,c,d,e,f,g){b=c-b;e?(e instanceof T&&("QUOTA_EXCEEDED"===e.type||"QUOTA_MAYBE_EXCEEDED"===e.type)&&Ci("QUOTA_EXCEEDED",{dbName:Hi(a.h.name),objectStoreNames:f,transactionCount:a.transactionCount,transactionMode:g.mode}),e instanceof T&&"UNKNOWN_ABORT"===e.type&&(c-=a.j,0>c&&c>=Math.pow(2,31)&&(c=0),Ci("TRANSACTION_UNEXPECTEDLY_ABORTED",{objectStoreNames:f,transactionDuration:b,transactionCount:a.transactionCount,dbDuration:c}),a.i=!0),kj(a,!1,d,f,b,g.tag),Bi(e)):kj(a,!0,d,f,b,g.tag)}
function kj(a,b,c,d,e,f){Ci("TRANSACTION_ENDED",{objectStoreNames:d,connectionHasUnknownAbortedTransaction:a.i,duration:e,isSuccessful:b,tryCount:c,tag:void 0===f?"IDB_TRANSACTION_TAG_UNKNOWN":f})}
m.getName=function(){return this.h.name};
function fj(a){this.h=a}
m=fj.prototype;m.add=function(a,b){return V(this.h.add(a,b))};
m.autoIncrement=function(){return this.h.autoIncrement};
m.clear=function(){return V(this.h.clear()).then(function(){})};
m.count=function(a){return V(this.h.count(a))};
function lj(a,b){return mj(a,{query:b},function(c){return c.delete().then(function(){return c.continue()})}).then(function(){})}
m.delete=function(a){return a instanceof IDBKeyRange?lj(this,a):V(this.h.delete(a))};
m.get=function(a){return V(this.h.get(a))};
m.index=function(a){try{return new nj(this.h.index(a))}catch(b){if(b instanceof Error&&"NotFoundError"===b.name)throw new Pi(a,this.h.name);throw b;}};
m.getName=function(){return this.h.name};
m.keyPath=function(){return this.h.keyPath};
function mj(a,b,c){a=a.h.openCursor(b.query,b.direction);return oj(a).then(function(d){return bj(d,c)})}
function hj(a){var b=this;this.h=a;this.j=new Map;this.i=!1;this.done=new Promise(function(c,d){b.h.addEventListener("complete",function(){c()});
b.h.addEventListener("error",function(e){e.currentTarget===e.target&&d(b.h.error)});
b.h.addEventListener("abort",function(){var e=b.h.error;if(e)d(e);else if(!b.i){e=T;for(var f=b.h.objectStoreNames,g=[],h=0;h<f.length;h++){var k=f.item(h);if(null===k)throw Error("Invariant: item in DOMStringList is null");g.push(k)}e=new e("UNKNOWN_ABORT",{objectStoreNames:g.join(),dbName:b.h.db.name,mode:b.h.mode});d(e)}})})}
function ij(a,b){var c=new Promise(function(d,e){try{Wi(b(a).then(function(f){d(f)}),e)}catch(f){e(f),a.abort()}});
return Promise.all([c,a.done]).then(function(d){return t(d).next().value})}
hj.prototype.abort=function(){this.h.abort();this.i=!0;throw new T("EXPLICIT_ABORT");};
hj.prototype.objectStore=function(a){a=this.h.objectStore(a);var b=this.j.get(a);b||(b=new fj(a),this.j.set(a,b));return b};
function nj(a){this.h=a}
m=nj.prototype;m.count=function(a){return V(this.h.count(a))};
m.delete=function(a){return dk(this,{query:a},function(b){return b.delete().then(function(){return b.continue()})})};
m.get=function(a){return V(this.h.get(a))};
m.getKey=function(a){return V(this.h.getKey(a))};
m.keyPath=function(){return this.h.keyPath};
m.unique=function(){return this.h.unique};
function dk(a,b,c){a=a.h.openCursor(void 0===b.query?null:b.query,void 0===b.direction?"next":b.direction);return oj(a).then(function(d){return bj(d,c)})}
function ek(a,b){this.request=a;this.cursor=b}
function oj(a){return V(a).then(function(b){return b?new ek(a,b):null})}
m=ek.prototype;m.advance=function(a){this.cursor.advance(a);return oj(this.request)};
m.continue=function(a){this.cursor.continue(a);return oj(this.request)};
m.delete=function(){return V(this.cursor.delete()).then(function(){})};
m.getKey=function(){return this.cursor.key};
m.W=function(){return this.cursor.value};
m.update=function(a){return V(this.cursor.update(a))};function fk(a,b,c){return new Promise(function(d,e){function f(){v||(v=new cj(g.result,{closed:q}));return v}
var g=void 0!==b?self.indexedDB.open(a,b):self.indexedDB.open(a);var h=c.blocked,k=c.blocking,l=c.sb,n=c.upgrade,q=c.closed,v;g.addEventListener("upgradeneeded",function(p){try{if(null===p.newVersion)throw Error("Invariant: newVersion on IDbVersionChangeEvent is null");if(null===g.transaction)throw Error("Invariant: transaction on IDbOpenDbRequest is null");p.dataLoss&&"none"!==p.dataLoss&&Ci("IDB_DATA_CORRUPTED",{reason:p.dataLossMessage||"unknown reason",dbName:Hi(a)});var y=f(),z=new hj(g.transaction);
n&&n(y,function(F){return p.oldVersion<F&&p.newVersion>=F},z);
z.done.catch(function(F){e(F)})}catch(F){e(F)}});
g.addEventListener("success",function(){var p=g.result;k&&p.addEventListener("versionchange",function(){k(f())});
p.addEventListener("close",function(){Ci("IDB_UNEXPECTEDLY_CLOSED",{dbName:Hi(a),dbVersion:p.version});l&&l()});
d(f())});
g.addEventListener("error",function(){e(g.error)});
h&&g.addEventListener("blocked",function(){h()})})}
function gk(a,b,c){c=void 0===c?{}:c;return fk(a,b,c)}
function hk(a,b){b=void 0===b?{}:b;var c,d,e,f;return x(function(g){if(1==g.h)return xa(g,2),c=self.indexedDB.deleteDatabase(a),d=b,(e=d.blocked)&&c.addEventListener("blocked",function(){e()}),w(g,aj(c),4);
if(2!=g.h)return ya(g,0);f=za(g);throw Ri(f,a,"",-1);})}
;function ik(a){return new Promise(function(b){ti(function(){b()},a)})}
function jk(a,b){this.name=a;this.options=b;this.l=!0;this.v=this.m=0;this.i=500}
jk.prototype.j=function(a,b,c){c=void 0===c?{}:c;return gk(a,b,c)};
jk.prototype.delete=function(a){a=void 0===a?{}:a;return hk(this.name,a)};
function kk(a,b){return new T("INCOMPATIBLE_DB_VERSION",{dbName:a.name,oldVersion:a.options.version,newVersion:b})}
function lk(a,b){if(!b)throw Si("openWithToken",Hi(a.name));return a.open()}
jk.prototype.open=function(){function a(){var f,g,h,k,l,n,q,v,p,y;return x(function(z){switch(z.h){case 1:return g=null!=(f=Error().stack)?f:"",xa(z,2),w(z,c.j(c.name,c.options.version,e),4);case 4:h=z.i;for(var F=c.options,K=[],M=t(Object.keys(F.ga)),P=M.next();!P.done;P=M.next()){P=P.value;var fb=F.ga[P],hc=void 0===fb.qb?Number.MAX_VALUE:fb.qb;!(h.h.version>=fb.xa)||h.h.version>=hc||h.h.objectStoreNames.contains(P)||K.push(P)}k=K;if(0===k.length){z.o(5);break}l=Object.keys(c.options.ga);n=h.objectStoreNames();
if(c.v<zh("ytidb_reopen_db_retries",0))return c.v++,h.close(),Bi(new T("DB_REOPENED_BY_MISSING_OBJECT_STORES",{dbName:c.name,expectedObjectStores:l,foundObjectStores:n})),z.return(a());if(!(c.m<zh("ytidb_remake_db_retries",1))){z.o(6);break}c.m++;if(!O("ytidb_remake_db_enable_backoff_delay")){z.o(7);break}return w(z,ik(c.i),8);case 8:c.i*=2;case 7:return w(z,c.delete(),9);case 9:return Bi(new T("DB_DELETED_BY_MISSING_OBJECT_STORES",{dbName:c.name,expectedObjectStores:l,foundObjectStores:n})),z.return(a());
case 6:throw new Oi(n,l);case 5:return z.return(h);case 2:q=za(z);if(q instanceof DOMException?"VersionError"!==q.name:"DOMError"in self&&q instanceof DOMError?"VersionError"!==q.name:!(q instanceof Object&&"message"in q)||"An attempt was made to open a database using a lower version than the existing version."!==q.message){z.o(10);break}return w(z,c.j(c.name,void 0,Object.assign({},e,{upgrade:void 0})),11);case 11:v=z.i;p=v.h.version;if(void 0!==c.options.version&&p>c.options.version+1)throw v.close(),
c.l=!1,kk(c,p);return z.return(v);case 10:throw b(),q instanceof Error&&!O("ytidb_async_stack_killswitch")&&(q.stack=q.stack+"\n"+g.substring(g.indexOf("\n")+1)),Ri(q,c.name,"",null!=(y=c.options.version)?y:-1);}})}
function b(){c.h===d&&(c.h=void 0)}
var c=this;if(!this.l)throw kk(this);if(this.h)return this.h;var d,e={blocking:function(f){f.close()},
closed:b,sb:b,upgrade:this.options.upgrade};return this.h=d=a()};var mk=new jk("YtIdbMeta",{ga:{databases:{xa:1}},upgrade:function(a,b){b(1)&&ej(a,"databases",{keyPath:"actualName"})}});
function nk(a,b){var c;return x(function(d){if(1==d.h)return w(d,lk(mk,b),2);c=d.i;return d.return(dj(c,["databases"],{H:!0,mode:"readwrite"},function(e){var f=e.objectStore("databases");return f.get(a.actualName).then(function(g){if(g?a.actualName!==g.actualName||a.publicName!==g.publicName||a.userIdentifier!==g.userIdentifier:1)return V(f.h.put(a,void 0)).then(function(){})})}))})}
function ok(a,b){var c;return x(function(d){if(1==d.h)return a?w(d,lk(mk,b),2):d.return();c=d.i;return d.return(c.delete("databases",a))})}
function pk(a,b){var c,d;return x(function(e){return 1==e.h?(c=[],w(e,lk(mk,b),2)):3!=e.h?(d=e.i,w(e,dj(d,["databases"],{H:!0,mode:"readonly"},function(f){c.length=0;return mj(f.objectStore("databases"),{},function(g){a(g.W())&&c.push(g.W());return g.continue()})}),3)):e.return(c)})}
function qk(a){return pk(function(b){return"LogsDatabaseV2"===b.publicName&&void 0!==b.userIdentifier},a)}
;var rk,sk=new function(){}(new function(){});
function tk(){var a,b,c,d;return x(function(e){switch(e.h){case 1:a=yi();if(null==(b=a)?0:b.hasSucceededOnce)return e.return(!0);var f;if(f=wi)f=/WebKit\/([0-9]+)/.exec(Gb()),f=!!(f&&600<=parseInt(f[1],10));f&&(f=/WebKit\/([0-9]+)/.exec(Gb()),f=!(f&&602<=parseInt(f[1],10)));if(f||$b)return e.return(!1);try{if(c=self,!(c.indexedDB&&c.IDBIndex&&c.IDBKeyRange&&c.IDBObjectStore))return e.return(!1)}catch(g){return e.return(!1)}if(!("IDBTransaction"in self&&"objectStoreNames"in IDBTransaction.prototype))return e.return(!1);
xa(e,2);d={actualName:"yt-idb-test-do-not-use",publicName:"yt-idb-test-do-not-use",userIdentifier:void 0};return w(e,nk(d,sk),4);case 4:return w(e,ok("yt-idb-test-do-not-use",sk),5);case 5:return e.return(!0);case 2:return za(e),e.return(!1)}})}
function uk(){if(void 0!==rk)return rk;Ai=!0;return rk=tk().then(function(a){Ai=!1;var b;if(null!=(b=xi())&&b.h){var c;b={hasSucceededOnce:(null==(c=yi())?void 0:c.hasSucceededOnce)||a};var d;null==(d=xi())||d.set("LAST_RESULT_ENTRY_KEY",b,2592E3,!0)}return a})}
function vk(){return B("ytglobal.idbToken_")||void 0}
function wk(){var a=vk();return a?Promise.resolve(a):uk().then(function(b){(b=b?sk:void 0)&&C("ytglobal.idbToken_",b);return b})}
;new Xe;function xk(a){if(!Ei())throw a=new T("AUTH_INVALID",{dbName:a}),Bi(a),a;var b=Fi();return{actualName:a+":"+b,publicName:a,userIdentifier:b}}
function yk(a,b,c,d){var e,f,g,h,k,l;return x(function(n){switch(n.h){case 1:return f=null!=(e=Error().stack)?e:"",w(n,wk(),2);case 2:g=n.i;if(!g)throw h=Si("openDbImpl",a,b),O("ytidb_async_stack_killswitch")||(h.stack=h.stack+"\n"+f.substring(f.indexOf("\n")+1)),Bi(h),h;Gi(a);k=c?{actualName:a,publicName:a,userIdentifier:void 0}:xk(a);xa(n,3);return w(n,nk(k,g),5);case 5:return w(n,gk(k.actualName,b,d),6);case 6:return n.return(n.i);case 3:return l=za(n),xa(n,7),w(n,ok(k.actualName,g),9);case 9:ya(n,
8);break;case 7:za(n);case 8:throw l;}})}
function zk(a,b,c){c=void 0===c?{}:c;return yk(a,b,!1,c)}
function Ak(a,b,c){c=void 0===c?{}:c;return yk(a,b,!0,c)}
function Bk(a,b){b=void 0===b?{}:b;var c,d;return x(function(e){if(1==e.h)return w(e,wk(),2);if(3!=e.h){c=e.i;if(!c)return e.return();Gi(a);d=xk(a);return w(e,hk(d.actualName,b),3)}return w(e,ok(d.actualName,c),0)})}
function Ck(a,b,c){a=a.map(function(d){return x(function(e){return 1==e.h?w(e,hk(d.actualName,b),2):w(e,ok(d.actualName,c),0)})});
return Promise.all(a).then(function(){})}
function Dk(){var a=void 0===a?{}:a;var b,c;return x(function(d){if(1==d.h)return w(d,wk(),2);if(3!=d.h){b=d.i;if(!b)return d.return();Gi("LogsDatabaseV2");return w(d,qk(b),3)}c=d.i;return w(d,Ck(c,a,b),0)})}
function Ek(a,b){b=void 0===b?{}:b;var c;return x(function(d){if(1==d.h)return w(d,wk(),2);if(3!=d.h){c=d.i;if(!c)return d.return();Gi(a);return w(d,hk(a,b),3)}return w(d,ok(a,c),0)})}
;function Fk(a){this.h=!1;this.potentialEsfErrorCounter=this.i=0;this.handleError=function(){};
this.ba=function(){};
this.now=Date.now;this.ea=!1;var b;this.Ya=null!=(b=a.Ya)?b:100;var c;this.Xa=null!=(c=a.Xa)?c:1;var d;this.Va=null!=(d=a.Va)?d:2592E6;var e;this.Ua=null!=(e=a.Ua)?e:12E4;var f;this.Wa=null!=(f=a.Wa)?f:5E3;var g;this.s=null!=(g=a.s)?g:void 0;this.pa=!!a.pa;var h;this.oa=null!=(h=a.oa)?h:.1;var k;this.ta=null!=(k=a.ta)?k:10;a.handleError&&(this.handleError=a.handleError);a.ba&&(this.ba=a.ba);a.ea&&(this.ea=a.ea);this.B=a.B;this.J=a.J;this.D=a.D;this.G=a.G;this.T=a.T;this.Da=a.Da;this.Ca=a.Ca;this.s&&
(!this.B||this.B("networkless_logging"))&&Gk(this)}
function Gk(a){a.s&&!a.ea&&(a.h=!0,a.pa&&Math.random()<=a.oa&&a.D.gb(a.s),Hk(a),a.G.F()&&a.ja(),a.G.R(a.Da,a.ja.bind(a)),a.G.R(a.Ca,a.Ha.bind(a)))}
m=Fk.prototype;m.writeThenSend=function(a,b){var c=this;b=void 0===b?{}:b;if(this.s&&this.h){var d={url:a,options:b,timestamp:this.now(),status:"NEW",sendCount:0};this.D.set(d,this.s).then(function(e){d.id=e;c.G.F()&&Ik(c,d)}).catch(function(e){Ik(c,d);
Jk(c,e)})}else this.T(a,b)};
m.sendThenWrite=function(a,b,c){var d=this;b=void 0===b?{}:b;if(this.s&&this.h){var e={url:a,options:b,timestamp:this.now(),status:"NEW",sendCount:0};this.B&&this.B("nwl_skip_retry")&&(e.skipRetry=c);if(this.G.F()||this.B&&this.B("nwl_aggressive_send_then_write")&&!e.skipRetry){if(!e.skipRetry){var f=b.onError?b.onError:function(){};
b.onError=function(g,h){return x(function(k){if(1==k.h)return w(k,d.D.set(e,d.s).catch(function(l){Jk(d,l)}),2);
f(g,h);k.h=0})}}this.T(a,b,e.skipRetry)}else this.D.set(e,this.s).catch(function(g){d.T(a,b,e.skipRetry);
Jk(d,g)})}else this.T(a,b,this.B&&this.B("nwl_skip_retry")&&c)};
m.sendAndWrite=function(a,b){var c=this;b=void 0===b?{}:b;if(this.s&&this.h){var d={url:a,options:b,timestamp:this.now(),status:"NEW",sendCount:0},e=!1,f=b.onSuccess?b.onSuccess:function(){};
d.options.onSuccess=function(g,h){void 0!==d.id?c.D.aa(d.id,c.s):e=!0;c.G.S&&c.B&&c.B("vss_network_hint")&&c.G.S(!0);f(g,h)};
this.T(d.url,d.options);this.D.set(d,this.s).then(function(g){d.id=g;e&&c.D.aa(d.id,c.s)}).catch(function(g){Jk(c,g)})}else this.T(a,b)};
m.ja=function(){var a=this;if(!this.s)throw Si("throttleSend");this.i||(this.i=this.J.L(function(){var b;return x(function(c){if(1==c.h)return w(c,a.D.Ma("NEW",a.s),2);if(3!=c.h)return b=c.i,b?w(c,Ik(a,b),3):(a.Ha(),c.return());a.i&&(a.i=0,a.ja());c.h=0})},this.Ya))};
m.Ha=function(){this.J.Y(this.i);this.i=0};
function Ik(a,b){var c,d;return x(function(e){switch(e.h){case 1:if(!a.s)throw c=Si("immediateSend"),c;if(void 0===b.id){e.o(2);break}return w(e,a.D.ob(b.id,a.s),3);case 3:(d=e.i)?b=d:a.ba(Error("The request cannot be found in the database."));case 2:if(Kk(a,b,a.Va)){e.o(4);break}a.ba(Error("Networkless Logging: Stored logs request expired age limit"));if(void 0===b.id){e.o(5);break}return w(e,a.D.aa(b.id,a.s),5);case 5:return e.return();case 4:b.skipRetry||(b=Lk(a,b));if(!b){e.o(0);break}if(!b.skipRetry||
void 0===b.id){e.o(8);break}return w(e,a.D.aa(b.id,a.s),8);case 8:a.T(b.url,b.options,!!b.skipRetry),e.h=0}})}
function Lk(a,b){if(!a.s)throw Si("updateRequestHandlers");var c=b.options.onError?b.options.onError:function(){};
b.options.onError=function(e,f){var g,h,k;return x(function(l){switch(l.h){case 1:g=Mk(f);if(!(a.B&&a.B("nwl_consider_error_code")&&g||a.B&&!a.B("nwl_consider_error_code")&&a.potentialEsfErrorCounter<=a.ta)){l.o(2);break}if(!a.G.U){l.o(3);break}return w(l,a.G.U(),3);case 3:if(a.G.F()){l.o(2);break}c(e,f);if(!a.B||!a.B("nwl_consider_error_code")||void 0===(null==(h=b)?void 0:h.id)){l.o(6);break}return w(l,a.D.Ea(b.id,a.s,!1),6);case 6:return l.return();case 2:if(a.B&&a.B("nwl_consider_error_code")&&
!g&&a.potentialEsfErrorCounter>a.ta)return l.return();a.potentialEsfErrorCounter++;if(void 0===(null==(k=b)?void 0:k.id)){l.o(8);break}return b.sendCount<a.Xa?w(l,a.D.Ea(b.id,a.s),12):w(l,a.D.aa(b.id,a.s),8);case 12:a.J.L(function(){a.G.F()&&a.ja()},a.Wa);
case 8:c(e,f),l.h=0}})};
var d=b.options.onSuccess?b.options.onSuccess:function(){};
b.options.onSuccess=function(e,f){var g;return x(function(h){if(1==h.h)return void 0===(null==(g=b)?void 0:g.id)?h.o(2):w(h,a.D.aa(b.id,a.s),2);a.G.S&&a.B&&a.B("vss_network_hint")&&a.G.S(!0);d(e,f);h.h=0})};
return b}
function Kk(a,b,c){b=b.timestamp;return a.now()-b>=c?!1:!0}
function Hk(a){if(!a.s)throw Si("retryQueuedRequests");a.D.Ma("QUEUED",a.s).then(function(b){b&&!Kk(a,b,a.Ua)?a.J.L(function(){return x(function(c){if(1==c.h)return void 0===b.id?c.o(2):w(c,a.D.Ea(b.id,a.s),2);Hk(a);c.h=0})}):a.G.F()&&a.ja()})}
function Jk(a,b){a.Za&&!a.G.F()?a.Za(b):a.handleError(b)}
function Mk(a){var b;return(a=null==a?void 0:null==(b=a.error)?void 0:b.code)&&400<=a&&599>=a?!1:!0}
;var Nk=B("ytPubsub2Pubsub2Instance")||new L;L.prototype.subscribe=L.prototype.subscribe;L.prototype.unsubscribeByKey=L.prototype.ka;L.prototype.publish=L.prototype.ca;L.prototype.clear=L.prototype.clear;C("ytPubsub2Pubsub2Instance",Nk);C("ytPubsub2Pubsub2SubscribedKeys",B("ytPubsub2Pubsub2SubscribedKeys")||{});C("ytPubsub2Pubsub2TopicToKeys",B("ytPubsub2Pubsub2TopicToKeys")||{});C("ytPubsub2Pubsub2IsAsync",B("ytPubsub2Pubsub2IsAsync")||{});C("ytPubsub2Pubsub2SkipSubKey",null);function Ok(a,b){jk.call(this,a,b);this.options=b;Gi(a)}
u(Ok,jk);function Pk(a,b){var c;return function(){c||(c=new Ok(a,b));return c}}
Ok.prototype.j=function(a,b,c){c=void 0===c?{}:c;return(this.options.Fa?Ak:zk)(a,b,Object.assign({},c))};
Ok.prototype.delete=function(a){a=void 0===a?{}:a;return(this.options.Fa?Ek:Bk)(this.name,a)};
function Qk(a,b){return Pk(a,b)}
;var Rk;
function Sk(){if(Rk)return Rk();var a={};Rk=Qk("LogsDatabaseV2",{ga:(a.LogsRequestsStore={xa:2},a),Fa:!1,upgrade:function(b,c,d){c(2)&&ej(b,"LogsRequestsStore",{keyPath:"id",autoIncrement:!0});c(3);c(5)&&(d=d.objectStore("LogsRequestsStore"),d.h.indexNames.contains("newRequest")&&d.h.deleteIndex("newRequest"),d.h.createIndex("newRequestV2",["status","interface","timestamp"],{unique:!1}));c(7)&&b.h.objectStoreNames.contains("sapisid")&&b.h.deleteObjectStore("sapisid");c(9)&&b.h.objectStoreNames.contains("SWHealthLog")&&b.h.deleteObjectStore("SWHealthLog")},
version:9});return Rk()}
;function Tk(a){return lk(Sk(),a)}
function Uk(a,b){var c,d,e,f;return x(function(g){if(1==g.h)return c={startTime:Q(),transactionType:"YT_IDB_TRANSACTION_TYPE_WRITE"},w(g,Tk(b),2);if(3!=g.h)return d=g.i,e=Object.assign({},a,{options:JSON.parse(JSON.stringify(a.options)),interface:N("INNERTUBE_CONTEXT_CLIENT_NAME",0)}),w(g,gj(d,e),3);f=g.i;c.tb=Q();Vk(c);return g.return(f)})}
function Wk(a,b){var c,d,e,f,g,h,k;return x(function(l){if(1==l.h)return c={startTime:Q(),transactionType:"YT_IDB_TRANSACTION_TYPE_READ"},w(l,Tk(b),2);if(3!=l.h)return d=l.i,e=N("INNERTUBE_CONTEXT_CLIENT_NAME",0),f=[a,e,0],g=[a,e,Q()],h=IDBKeyRange.bound(f,g),k=void 0,w(l,dj(d,["LogsRequestsStore"],{mode:"readwrite",H:!0},function(n){return dk(n.objectStore("LogsRequestsStore").index("newRequestV2"),{query:h,direction:"prev"},function(q){q.W()&&(k=q.W(),"NEW"===a&&(k.status="QUEUED",q.update(k)))})}),
3);
c.tb=Q();Vk(c);return l.return(k)})}
function Xk(a,b){var c;return x(function(d){if(1==d.h)return w(d,Tk(b),2);c=d.i;return d.return(dj(c,["LogsRequestsStore"],{mode:"readwrite",H:!0},function(e){var f=e.objectStore("LogsRequestsStore");return f.get(a).then(function(g){if(g)return g.status="QUEUED",V(f.h.put(g,void 0)).then(function(){return g})})}))})}
function Yk(a,b,c){c=void 0===c?!0:c;var d;return x(function(e){if(1==e.h)return w(e,Tk(b),2);d=e.i;return e.return(dj(d,["LogsRequestsStore"],{mode:"readwrite",H:!0},function(f){var g=f.objectStore("LogsRequestsStore");return g.get(a).then(function(h){return h?(h.status="NEW",c&&(h.sendCount+=1),V(g.h.put(h,void 0)).then(function(){return h})):U.resolve(void 0)})}))})}
function Zk(a,b){var c;return x(function(d){if(1==d.h)return w(d,Tk(b),2);c=d.i;return d.return(c.delete("LogsRequestsStore",a))})}
function $k(a){var b,c;return x(function(d){if(1==d.h)return w(d,Tk(a),2);b=d.i;c=Q()-2592E6;return w(d,dj(b,["LogsRequestsStore"],{mode:"readwrite",H:!0},function(e){return mj(e.objectStore("LogsRequestsStore"),{},function(f){if(f.W().timestamp<=c)return f.delete().then(function(){return f.continue()})})}),0)})}
function al(){x(function(a){return w(a,Dk(),0)})}
function Vk(a){if(!O("nwl_csi_killswitch")&&.01>=Math.random()){var b=B("ytPubsub2Pubsub2Instance");b&&b.publish.call(b,"nwl_transaction_latency_payload".toString(),"nwl_transaction_latency_payload",a)}}
;var bl={},cl=Qk("ServiceWorkerLogsDatabase",{ga:(bl.SWHealthLog={xa:1},bl),Fa:!0,upgrade:function(a,b){b(1)&&ej(a,"SWHealthLog",{keyPath:"id",autoIncrement:!0}).h.createIndex("swHealthNewRequest",["interface","timestamp"],{unique:!1})},
version:1});function dl(a){return lk(cl(),a)}
function el(a){var b,c;x(function(d){if(1==d.h)return w(d,dl(a),2);b=d.i;c=Q()-2592E6;return w(d,dj(b,["SWHealthLog"],{mode:"readwrite",H:!0},function(e){return mj(e.objectStore("SWHealthLog"),{},function(f){if(f.W().timestamp<=c)return f.delete().then(function(){return f.continue()})})}),0)})}
function fl(a){var b;return x(function(c){if(1==c.h)return w(c,dl(a),2);b=c.i;return w(c,b.clear("SWHealthLog"),0)})}
;var gl={},hl=0;function il(a){var b=void 0===b?"":b;if(a)if(b)Nh(a,void 0,"POST",b);else if(N("USE_NET_AJAX_FOR_PING_TRANSPORT",!1))Nh(a,void 0,"GET","");else{b:{try{var c=new Za({url:a});if(c.j&&c.i||c.l){var d=Lb(a.match(Kb)[5]||null);var e=!(!d||!d.endsWith("/aclk")||"1"!==Vb(a,"ri"));break b}}catch(g){}e=!1}if(e){b:{try{if(window.navigator&&window.navigator.sendBeacon&&window.navigator.sendBeacon(a,"")){var f=!0;break b}}catch(g){}f=!1}b=f?!0:!1}else b=!1;b||jl(a)}}
function jl(a){var b=new Image,c=""+hl++;gl[c]=b;b.onload=b.onerror=function(){delete gl[c]};
b.src=a}
;function W(){this.h=new Map;this.i=!1}
function kl(){if(!W.h){var a=B("yt.networkRequestMonitor.instance")||new W;C("yt.networkRequestMonitor.instance",a);W.h=a}return W.h}
W.prototype.requestComplete=function(a,b){b&&(this.i=!0);a=this.removeParams(a);this.h.get(a)||this.h.set(a,b)};
W.prototype.isEndpointCFR=function(a){a=this.removeParams(a);return(a=this.h.get(a))?!1:!1===a&&this.i?!0:null};
W.prototype.removeParams=function(a){return a.split("?")[0]};
W.prototype.removeParams=W.prototype.removeParams;W.prototype.isEndpointCFR=W.prototype.isEndpointCFR;W.prototype.requestComplete=W.prototype.requestComplete;W.getInstance=kl;var ll;function ml(){ll||(ll=new ii("yt.offline"));return ll}
function nl(a){if(O("offline_error_handling")){var b=ml().get("errors",!0)||{};b[a.message]={name:a.name,stack:a.stack};a.level&&(b[a.message].level=a.level);ml().set("errors",b,2592E3,!0)}}
function ol(){if(O("offline_error_handling")){var a=ml().get("errors",!0);if(a){for(var b in a)if(a[b]){var c=new Di(b,"sent via offline_errors");c.name=a[b].name;c.stack=a[b].stack;c.level=a[b].level;dh(c)}ml().set("errors",{},2592E3,!0)}}}
;var pl=zh("network_polling_interval",3E4);function Z(){J.call(this);var a=this;this.la=0;this.A=this.m=!1;this.i=this.ya();O("use_shared_nsm")?(this.h=ne(),O("use_shared_nsm_and_keep_yt_online_updated")&&(this.h.R("networkstatus-online",function(){a.i=!0;a.A&&ol()}),this.h.R("networkstatus-offline",function(){a.i=!1}))):(ql(this),rl(this))}
u(Z,J);function sl(){if(!Z.h){var a=B("yt.networkStatusManager.instance")||new Z;C("yt.networkStatusManager.instance",a);Z.h=a}return Z.h}
m=Z.prototype;m.F=function(){if(O("use_shared_nsm")&&this.h){var a;return null==(a=this.h)?void 0:a.F()}return this.i};
m.S=function(a){if(O("use_shared_nsm")&&this.h){var b;null!=(b=this.h)&&(b.h=a)}else a!==this.i&&(this.i=a)};
m.pb=function(a){!O("use_shared_nsm")&&(this.m=!0,void 0===a?0:a)&&(this.la||tl(this))};
m.ya=function(){var a=window.navigator.onLine;return void 0===a?!0:a};
m.ib=function(){this.A=!0};
m.R=function(a,b){return O("use_shared_nsm")&&this.h?this.h.R(a,b):J.prototype.R.call(this,a,b)};
function rl(a){window.addEventListener("online",function(){return x(function(b){if(1==b.h)return w(b,a.U(),2);a.A&&ol();b.h=0})})}
function ql(a){window.addEventListener("offline",function(){return x(function(b){return w(b,a.U(),0)})})}
function tl(a){a.la=ri(function(){return x(function(b){if(1==b.h)return a.i?a.ya()||!a.m?b.o(3):w(b,a.U(),3):w(b,a.U(),3);tl(a);b.h=0})},pl)}
m.U=function(a){var b=this;if(O("use_shared_nsm")&&this.h){var c=le(this.h,a);c.then(function(d){O("use_cfr_monitor")&&kl().requestComplete("generate_204",d)});
return c}return this.u?this.u:this.u=new Promise(function(d){var e,f,g,h;return x(function(k){switch(k.h){case 1:return e=window.AbortController?new window.AbortController:void 0,g=null==(f=e)?void 0:f.signal,h=!1,xa(k,2,3),e&&(b.O=oe.L(function(){e.abort()},a||2E4)),w(k,fetch("/generate_204",{method:"HEAD",
signal:g}),5);case 5:h=!0;case 3:Aa(k);O("use_cfr_monitor")&&kl().requestComplete("generate_204",h);b.u=void 0;b.O&&oe.Y(b.O);h!==b.i&&(b.i=h,b.i&&b.m?ie(b,"ytnetworkstatus-online"):b.m&&ie(b,"ytnetworkstatus-offline"));d(h);Ba(k);break;case 2:za(k),h=!1,k.o(3)}})})};
Z.prototype.sendNetworkCheckRequest=Z.prototype.U;Z.prototype.listen=Z.prototype.R;Z.prototype.enableErrorFlushing=Z.prototype.ib;Z.prototype.getWindowStatus=Z.prototype.ya;Z.prototype.monitorNetworkStatusChange=Z.prototype.pb;Z.prototype.networkStatusHint=Z.prototype.S;Z.prototype.isNetworkAvailable=Z.prototype.F;Z.getInstance=sl;function ul(a){a=void 0===a?{}:a;J.call(this);var b=this;this.i=this.O=0;this.m="ytnetworkstatus-offline";this.u="ytnetworkstatus-online";O("use_shared_nsm")&&(this.m="networkstatus-offline",this.u="networkstatus-online");this.h=sl();var c=B("yt.networkStatusManager.instance.monitorNetworkStatusChange").bind(this.h);c&&c(a.Ka);a.Ra&&(c=B("yt.networkStatusManager.instance.enableErrorFlushing").bind(this.h))&&c();if(c=B("yt.networkStatusManager.instance.listen").bind(this.h))a.va?(this.va=a.va,c(this.u,
function(){vl(b,"publicytnetworkstatus-online")}),c(this.m,function(){vl(b,"publicytnetworkstatus-offline")})):(c(this.u,function(){ie(b,"publicytnetworkstatus-online")}),c(this.m,function(){ie(b,"publicytnetworkstatus-offline")}))}
u(ul,J);ul.prototype.F=function(){var a=B("yt.networkStatusManager.instance.isNetworkAvailable");return a?a.bind(this.h)():!0};
ul.prototype.S=function(a){var b=B("yt.networkStatusManager.instance.networkStatusHint").bind(this.h);b&&b(a)};
ul.prototype.U=function(a){var b=this,c;return x(function(d){c=B("yt.networkStatusManager.instance.sendNetworkCheckRequest").bind(b.h);return O("skip_network_check_if_cfr")&&kl().isEndpointCFR("generate_204")?d.return(new Promise(function(e){var f;b.S((null==(f=window.navigator)?void 0:f.onLine)||!0);e(b.F())})):c?d.return(c(a)):d.return(!0)})};
function vl(a,b){a.va?a.i?(oe.Y(a.O),a.O=oe.L(function(){a.A!==b&&(ie(a,b),a.A=b,a.i=Q())},a.va-(Q()-a.i))):(ie(a,b),a.A=b,a.i=Q()):ie(a,b)}
;var wl;function xl(){Fk.call(this,{D:{gb:$k,aa:Zk,Ma:Wk,ob:Xk,Ea:Yk,set:Uk},G:yl(),handleError:dh,ba:eh,T:zl,now:Q,Za:nl,J:vi(),Da:"publicytnetworkstatus-online",Ca:"publicytnetworkstatus-offline",pa:!0,oa:.1,ta:zh("potential_esf_error_limit",10),B:O,ea:!(Ei()&&(O("embeds_web_nwl_disable_nocookie")?"www.youtube-nocookie.com"!==Mb(document.location.toString()):1))});this.j=new Xe;O("networkless_immediately_drop_all_requests")&&al();Ek("LogsDatabaseV2")}
u(xl,Fk);function Al(){var a=B("yt.networklessRequestController.instance");a||(a=new xl,C("yt.networklessRequestController.instance",a),O("networkless_logging")&&wk().then(function(b){a.s=b;Gk(a);a.j.resolve();a.pa&&Math.random()<=a.oa&&a.s&&el(a.s);O("networkless_immediately_drop_sw_health_store")&&Bl(a)}));
return a}
xl.prototype.writeThenSend=function(a,b){b||(b={});Ei()||(this.h=!1);Fk.prototype.writeThenSend.call(this,a,b)};
xl.prototype.sendThenWrite=function(a,b,c){b||(b={});Ei()||(this.h=!1);Fk.prototype.sendThenWrite.call(this,a,b,c)};
xl.prototype.sendAndWrite=function(a,b){b||(b={});Ei()||(this.h=!1);Fk.prototype.sendAndWrite.call(this,a,b)};
xl.prototype.awaitInitialization=function(){return this.j.promise};
function Bl(a){var b;x(function(c){if(!a.s)throw b=Si("clearSWHealthLogsDb"),b;return c.return(fl(a.s).catch(function(d){a.handleError(d)}))})}
function zl(a,b,c){O("use_cfr_monitor")&&Cl(a,b);var d;if(null==(d=b.postParams)?0:d.requestTimeMs)b.postParams.requestTimeMs=Math.round(Q());c&&0===Object.keys(b).length?il(a):Kh(a,b)}
function yl(){wl||(wl=new ul({Ra:!0,Ka:!0}));return wl}
function Cl(a,b){var c=b.onError?b.onError:function(){};
b.onError=function(e,f){kl().requestComplete(a,!1);c(e,f)};
var d=b.onSuccess?b.onSuccess:function(){};
b.onSuccess=function(e,f){kl().requestComplete(a,!0);d(e,f)}}
;var Dl=0,El=0,Fl,Gl=A.ytNetworklessLoggingInitializationOptions||{isNwlInitialized:!1,potentialEsfErrorCounter:El};C("ytNetworklessLoggingInitializationOptions",Gl);function Hl(a,b){function c(d){var e=Il().F();if(!Jl()||!d||e&&O("vss_networkless_bypass_write"))Kl(a,b);else{var f={url:a,options:b,timestamp:Q(),status:"NEW",sendCount:0};Uk(f,d).then(function(g){f.id=g;Il().F()&&Ll(f)}).catch(function(g){Ll(f);
Il().F()?dh(g):nl(g)})}}
b=void 0===b?{}:b;O("skip_is_supported_killswitch")?wk().then(function(d){c(d)}):c(vk())}
function Ml(a,b){function c(d){if(Jl()&&d){var e={url:a,options:b,timestamp:Q(),status:"NEW",sendCount:0},f=!1,g=b.onSuccess?b.onSuccess:function(){};
e.options.onSuccess=function(k,l){O("use_cfr_monitor")&&kl().requestComplete(e.url,!0);void 0!==e.id?Zk(e.id,d):f=!0;O("vss_network_hint")&&Il().S(!0);g(k,l)};
if(O("use_cfr_monitor")){var h=b.onError?b.onError:function(){};
e.options.onError=function(k,l){kl().requestComplete(e.url,!1);h(k,l)}}Kl(e.url,e.options);
Uk(e,d).then(function(k){e.id=k;f&&Zk(e.id,d)}).catch(function(k){Il().F()?dh(k):nl(k)})}else Kl(a,b)}
b=void 0===b?{}:b;O("skip_is_supported_killswitch")?wk().then(function(d){c(d)}):c(vk())}
function Nl(){var a=vk();if(!a)throw Si("throttleSend");Dl||(Dl=oe.L(function(){var b;return x(function(c){if(1==c.h)return w(c,Wk("NEW",a),2);if(3!=c.h)return b=c.i,b?w(c,Ll(b),3):(oe.Y(Dl),Dl=0,c.return());Dl&&(Dl=0,Nl());c.h=0})},100))}
function Ll(a){var b,c,d;return x(function(e){switch(e.h){case 1:b=vk();if(!b)throw c=Si("immediateSend"),c;if(void 0===a.id){e.o(2);break}return w(e,Xk(a.id,b),3);case 3:(d=e.i)?a=d:eh(Error("The request cannot be found in the database."));case 2:var f=a.timestamp;if(!(2592E6<=Q()-f)){e.o(4);break}eh(Error("Networkless Logging: Stored logs request expired age limit"));if(void 0===a.id){e.o(5);break}return w(e,Zk(a.id,b),5);case 5:return e.return();case 4:a.skipRetry||(a=Ol(a));f=a;var g,h;if(null==
f?0:null==(g=f.options)?0:null==(h=g.postParams)?0:h.requestTimeMs)f.options.postParams.requestTimeMs=Math.round(Q());a=f;if(!a){e.o(0);break}if(!a.skipRetry||void 0===a.id){e.o(8);break}return w(e,Zk(a.id,b),8);case 8:Kl(a.url,a.options,!!a.skipRetry),e.h=0}})}
function Ol(a){var b=vk();if(!b)throw Si("updateRequestHandlers");var c=a.options.onError?a.options.onError:function(){};
a.options.onError=function(e,f){var g,h,k;return x(function(l){switch(l.h){case 1:O("use_cfr_monitor")&&kl().requestComplete(a.url,!1);g=Mk(f);if(!(O("nwl_consider_error_code")&&g||!O("nwl_consider_error_code")&&Pl()<=zh("potential_esf_error_limit",10))){l.o(2);break}if(O("skip_checking_network_on_cfr_failure")&&(!O("skip_checking_network_on_cfr_failure")||kl().isEndpointCFR(a.url))){l.o(3);break}return w(l,Il().U(),3);case 3:if(Il().F()){l.o(2);break}c(e,f);if(!O("nwl_consider_error_code")||void 0===
(null==(h=a)?void 0:h.id)){l.o(6);break}return w(l,Yk(a.id,b,!1),6);case 6:return l.return();case 2:if(O("nwl_consider_error_code")&&!g&&Pl()>zh("potential_esf_error_limit",10))return l.return();B("ytNetworklessLoggingInitializationOptions")&&Gl.potentialEsfErrorCounter++;El++;if(void 0===(null==(k=a)?void 0:k.id)){l.o(8);break}return 1>a.sendCount?w(l,Yk(a.id,b),12):w(l,Zk(a.id,b),8);case 12:oe.L(function(){Il().F()&&Nl()},5E3);
case 8:c(e,f),l.h=0}})};
var d=a.options.onSuccess?a.options.onSuccess:function(){};
a.options.onSuccess=function(e,f){var g;return x(function(h){if(1==h.h)return O("use_cfr_monitor")&&kl().requestComplete(a.url,!0),void 0===(null==(g=a)?void 0:g.id)?h.o(2):w(h,Zk(a.id,b),2);O("vss_network_hint")&&Il().S(!0);d(e,f);h.h=0})};
return a}
function Il(){if(O("use_new_nwl"))return yl();Fl||(Fl=new ul({Ra:!0,Ka:!0}));return Fl}
function Kl(a,b,c){c&&0===Object.keys(b).length?il(a):Kh(a,b)}
function Jl(){return B("ytNetworklessLoggingInitializationOptions")?Gl.isNwlInitialized:!1}
function Pl(){return B("ytNetworklessLoggingInitializationOptions")?Gl.potentialEsfErrorCounter:El}
;function Ql(a){var b=this;this.config_=null;a?this.config_=a:Zh()&&(this.config_=$h());ri(function(){oi(b)},5E3)}
Ql.prototype.isReady=function(){!this.config_&&Zh()&&(this.config_=$h());return!!this.config_};
function pi(a,b,c,d){function e(y){y=void 0===y?!1:y;var z;if(d.retry&&"www.youtube-nocookie.com"!=h&&(y||O("skip_ls_gel_retry")||"application/json"!==g.headers["Content-Type"]||(z=mi(b,c,l,k)),z)){var F=g.onSuccess,K=g.onFetchSuccess;g.onSuccess=function(M,P){ni(z);F(M,P)};
c.onFetchSuccess=function(M,P){ni(z);K(M,P)}}try{y&&d.retry&&!d.Sa.bypassNetworkless?(g.method="POST",d.Sa.writeThenSend?O("use_new_nwl_wts")?Al().writeThenSend(p,g):Hl(p,g):O("use_new_nwl_saw")?Al().sendAndWrite(p,g):Ml(p,g)):(g.method="POST",g.postParams||(g.postParams={}),Kh(p,g))}catch(M){if("InvalidAccessError"==M.name)z&&(ni(z),z=0),eh(Error("An extension is blocking network request."));
else throw M;}z&&ri(function(){oi(a)},5E3)}
!N("VISITOR_DATA")&&"visitor_id"!==b&&.01>Math.random()&&eh(new Di("Missing VISITOR_DATA when sending innertube request.",b,c,d));if(!a.isReady()){var f=new Di("innertube xhrclient not ready",b,c,d);dh(f);throw f;}var g={headers:d.headers||{},method:"POST",postParams:c,postBody:d.postBody,postBodyFormat:d.postBodyFormat||"JSON",onTimeout:function(){d.onTimeout()},
onFetchTimeout:d.onTimeout,onSuccess:function(y,z){if(d.onSuccess)d.onSuccess(z)},
onFetchSuccess:function(y){if(d.onSuccess)d.onSuccess(y)},
onError:function(y,z){if(d.onError)d.onError(z)},
onFetchError:function(y){if(d.onError)d.onError(y)},
timeout:d.timeout,withCredentials:!0};g.headers["Content-Type"]||(g.headers["Content-Type"]="application/json");var h="";(f=a.config_.lb)&&(h=f);var k=a.config_.nb||!1,l=gi(k,h,d);Object.assign(g.headers,l);(f=g.headers.Authorization)&&!h&&(g.headers["x-origin"]=window.location.origin);var n="/youtubei/"+a.config_.innertubeApiVersion+"/"+b,q={alt:"json"},v=a.config_.mb&&f;v=v&&f.startsWith("Bearer");v||(q.key=a.config_.innertubeApiKey);var p=wh(""+h+n,q||{},!0);O("use_new_nwl")&&Al().h||!O("use_new_nwl")&&
Jl()?uk().then(function(y){e(y)}):e(!1)}
;var Rl={appSettingsCaptured:!0,visualElementAttached:!0,visualElementGestured:!0,visualElementHidden:!0,visualElementShown:!0,flowEvent:!0,visualElementStateChanged:!0,playbackAssociated:!0,youThere:!0,accountStateChangeSignedIn:!0,accountStateChangeSignedOut:!0},Sl={latencyActionBaselined:!0,latencyActionInfo:!0,latencyActionTicked:!0,bedrockRepetitiveActionTimed:!0,adsClientStateChange:!0,streamzIncremented:!0,mdxDialAdditionalDataUpdateEvent:!0,tvhtml5WatchKeyEvent:!0,tvhtml5VideoSeek:!0,tokenRefreshEvent:!0,
adNotify:!0,adNotifyFilled:!0,tvhtml5LaunchUrlComponentChanged:!0,bedrockResourceConsumptionSnapshot:!0,deviceStartupMetrics:!0,mdxSignIn:!0,tvhtml5KeyboardLogging:!0,tvhtml5StartupSoundEvent:!0,tvhtml5LiveChatStatus:!0,tvhtml5DeviceStorageStatus:!0,tvhtml5LocalStorage:!0,directSignInEvent:!0,finalPayload:!0,tvhtml5SearchCompleted:!0,tvhtml5KeyboardPerformance:!0,adNotifyFailure:!0,latencyActionSpan:!0,tvhtml5AccountDialogOpened:!0,tvhtml5ApiTest:!0};function Tl(){var a=B("_lact",window);return null==a?-1:Math.max(Date.now()-a,0)}
;var Ul=A.ytPubsubPubsubInstance||new L,Vl=A.ytPubsubPubsubSubscribedKeys||{},Wl=A.ytPubsubPubsubTopicToKeys||{},Xl=A.ytPubsubPubsubIsSynchronous||{};L.prototype.subscribe=L.prototype.subscribe;L.prototype.unsubscribeByKey=L.prototype.ka;L.prototype.publish=L.prototype.ca;L.prototype.clear=L.prototype.clear;C("ytPubsubPubsubInstance",Ul);C("ytPubsubPubsubTopicToKeys",Wl);C("ytPubsubPubsubIsSynchronous",Xl);C("ytPubsubPubsubSubscribedKeys",Vl);var Yl=zh("initial_gel_batch_timeout",2E3),Zl=Math.pow(2,16)-1,$l=void 0;function am(){this.j=this.h=this.i=0}
var bm=new am,cm=new am,dm=!0,em=A.ytLoggingTransportGELQueue_||new Map;C("ytLoggingTransportGELQueue_",em);var fm=A.ytLoggingTransportGELProtoQueue_||new Map;C("ytLoggingTransportGELProtoQueue_",fm);var gm=A.ytLoggingTransportTokensToCttTargetIds_||{};C("ytLoggingTransportTokensToCttTargetIds_",gm);var hm=A.ytLoggingTransportTokensToJspbCttTargetIds_||{};C("ytLoggingTransportTokensToJspbCttTargetIds_",hm);
function im(a,b){if("log_event"===a.endpoint){var c=jm(a),d=em.get(c)||[];em.set(c,d);d.push(a.payload);km(b,d,c)}}
function lm(a,b){if("log_event"===a.endpoint){var c=jm(a,!0),d=fm.get(c)||[];fm.set(c,d);a=a.payload.toJSON();d.push(a);km(b,d,c,!0)}}
function km(a,b,c,d){d=void 0===d?!1:d;a&&($l=new a);a=zh("tvhtml5_logging_max_batch")||zh("web_logging_max_batch")||100;var e=Q(),f=d?cm.j:bm.j;b.length>=a?mm({writeThenSend:!0},O("flush_only_full_queue")?c:void 0,d):10<=e-f&&(nm(d),d?cm.j=e:bm.j=e)}
function om(a,b){if("log_event"===a.endpoint){var c=jm(a),d=new Map;d.set(c,[a.payload]);b&&($l=new b);return new Ye(function(e){$l&&$l.isReady()?pm(d,e,{bypassNetworkless:!0},!0):e()})}}
function qm(a,b){if("log_event"===a.endpoint){var c=jm(a,!0),d=new Map;d.set(c,[a.payload.toJSON()]);b&&($l=new b);return new Ye(function(e){$l&&$l.isReady()?rm(d,e,{bypassNetworkless:!0},!0):e()})}}
function jm(a,b){var c="";if(a.da)c="visitorOnlyApprovedKey";else if(a.P){if(void 0===b?0:b){b=a.P.token;c=a.P;var d=new Gg;c.videoId?d.setVideoId(c.videoId):c.playlistId&&Rc(d,2,Hg,c.playlistId);hm[b]=d}else b=a.P,c={},b.videoId?c.videoId=b.videoId:b.playlistId&&(c.playlistId=b.playlistId),gm[a.P.token]=c;c=a.P.token}return c}
function mm(a,b,c){a=void 0===a?{}:a;c=void 0===c?!1:c;new Ye(function(d){c?(window.clearTimeout(cm.i),window.clearTimeout(cm.h),cm.h=0):(window.clearTimeout(bm.i),window.clearTimeout(bm.h),bm.h=0);if($l&&$l.isReady())if(void 0!==b)if(c){var e=new Map,f=fm.get(b)||[];e.set(b,f);rm(e,d,a);fm.delete(b)}else e=new Map,f=em.get(b)||[],e.set(b,f),pm(e,d,a),em.delete(b);else c?(rm(fm,d,a),fm.clear()):(pm(em,d,a),em.clear());else nm(c),d()})}
function nm(a){a=void 0===a?!1:a;if(O("web_gel_timeout_cap")&&(!a&&!bm.h||a&&!cm.h)){var b=nh(function(){mm({writeThenSend:!0},void 0,a)},6E4);
a?cm.h=b:bm.h=b}window.clearTimeout(a?cm.i:bm.i);b=N("LOGGING_BATCH_TIMEOUT",zh("web_gel_debounce_ms",1E4));O("shorten_initial_gel_batch_timeout")&&dm&&(b=Yl);b=nh(function(){mm({writeThenSend:!0},void 0,a)},b);
a?cm.i=b:bm.i=b}
function pm(a,b,c,d){var e=$l;c=void 0===c?{}:c;var f=Math.round(Q()),g=a.size;a=t(a);for(var h=a.next();!h.done;h=a.next()){var k=t(h.value);h=k.next().value;var l=k=k.next().value;k=rb({context:ai(e.config_||$h())});k.events=l;(l=gm[h])&&sm(k,h,l);delete gm[h];h="visitorOnlyApprovedKey"===h;tm(k,f,h);um(c);pi(e,"log_event",k,vm(c,h,function(){g--;g||b()},function(){g--;
g||b()},d));
dm=!1}}
function rm(a,b,c,d){var e=$l;c=void 0===c?{}:c;var f=Math.round(Q()),g=a.size;a=t(a);for(var h=a.next();!h.done;h=a.next()){var k=t(h.value);h=k.next().value;var l=k=k.next().value;k=new Ig;var n=fi(e.config_||$h());H(k,1,n);l=wm(l);for(n=0;n<l.length;n++)Wc(k,3,Dg,l[n]);(l=hm[h])&&xm(k,h,l);delete hm[h];h="visitorOnlyApprovedKey"===h;ym(k,f,h);um(c);a:{Ec=!0;try{var q=JSON.stringify(k.toJSON(),ad);break a}finally{Ec=!1}q=void 0}k=q;h=vm(c,h,function(){g--;g||b()},function(){g--;
g||b()},d);
h.headers={"Content-Type":"application/json+protobuf"};h.postBodyFormat="JSPB";h.postBody=k;pi(e,"log_event","",h);dm=!1}}
function um(a){O("always_send_and_write")&&(a.writeThenSend=!1)}
function vm(a,b,c,d,e){return{retry:!0,onSuccess:c,onError:d,Sa:a,da:b,Nb:!!e,headers:{},postBodyFormat:"",postBody:""}}
function tm(a,b,c){a.requestTimeMs=String(b);O("unsplit_gel_payloads_in_logs")&&(a.unsplitGelPayloadsInLogs=!0);!c&&(b=N("EVENT_ID"))&&(c=zm(),a.serializedClientEventId={serializedEventId:b,clientCounter:String(c)})}
function ym(a,b,c){G(a,2,b);if(!c&&(b=N("EVENT_ID"))){c=zm();var d=new Fg;G(d,1,b);G(d,2,c);H(a,5,d)}}
function zm(){var a=N("BATCH_CLIENT_COUNTER")||0;a||(a=Math.floor(Math.random()*Zl/2));a++;a>Zl&&(a=1);Yg("BATCH_CLIENT_COUNTER",a);return a}
function sm(a,b,c){if(c.videoId)var d="VIDEO";else if(c.playlistId)d="PLAYLIST";else return;a.credentialTransferTokenTargetId=c;a.context=a.context||{};a.context.user=a.context.user||{};a.context.user.credentialTransferTokens=[{token:b,scope:d}]}
function xm(a,b,c){if(Pc(c,1===Sc(c,Hg)?1:-1))var d=1;else if(c.getPlaylistId())d=2;else return;H(a,4,c);a=Tc(a,ng,1)||new ng;c=Tc(a,lg,3)||new lg;var e=new kg;e.setToken(b);G(e,1,d);Wc(c,12,kg,e);H(a,3,c)}
function wm(a){for(var b=[],c=0;c<a.length;c++)try{b.push(new Dg(a[c]))}catch(d){dh(new Di("Transport failed to deserialize "+String(a[c])))}return b}
;var Am=A.ytLoggingGelSequenceIdObj_||{};C("ytLoggingGelSequenceIdObj_",Am);function Bm(a){Am[a]=a in Am?Am[a]+1:0;return Am[a]}
;function Cm(a,b){var c=void 0===c?{}:c;var d=Ql;N("ytLoggingEventsDefaultDisabled",!1)&&Ql==Ql&&(d=null);a:{c=void 0===c?{}:c;if(O("lr_drop_other_and_business_payloads")){if(Sl[a]||Rl[a])break a}else if(O("lr_drop_other_payloads")&&Sl[a])break a;var e={},f=Math.round(c.timestamp||Q());e.eventTimeMs=f<Number.MAX_SAFE_INTEGER?f:0;e[a]=b;a=Tl();e.context={lastActivityMs:String(c.timestamp||!isFinite(a)?-1:a)};O("log_sequence_info_on_gel_web")&&c.ia&&(a=e.context,b=c.ia,b={index:Bm(b),groupKey:b},a.sequence=
b,c.jb&&delete Am[c.ia]);(c.rb?om:im)({endpoint:"log_event",payload:e,P:c.P,da:c.da},d)}}
;var Dm=[{Ba:function(a){return"Cannot read property '"+a.key+"'"},
sa:{Error:[{regexp:/(Permission denied) to access property "([^']+)"/,groups:["reason","key"]}],TypeError:[{regexp:/Cannot read property '([^']+)' of (null|undefined)/,groups:["key","value"]},{regexp:/\u65e0\u6cd5\u83b7\u53d6\u672a\u5b9a\u4e49\u6216 (null|undefined) \u5f15\u7528\u7684\u5c5e\u6027\u201c([^\u201d]+)\u201d/,groups:["value","key"]},{regexp:/\uc815\uc758\ub418\uc9c0 \uc54a\uc74c \ub610\ub294 (null|undefined) \ucc38\uc870\uc778 '([^']+)' \uc18d\uc131\uc744 \uac00\uc838\uc62c \uc218 \uc5c6\uc2b5\ub2c8\ub2e4./,
groups:["value","key"]},{regexp:/No se puede obtener la propiedad '([^']+)' de referencia nula o sin definir/,groups:["key"]},{regexp:/Unable to get property '([^']+)' of (undefined or null) reference/,groups:["key","value"]},{regexp:/(null) is not an object \(evaluating '(?:([^.]+)\.)?([^']+)'\)/,groups:["value","base","key"]}]}},{Ba:function(a){return"Cannot call '"+a.key+"'"},
sa:{TypeError:[{regexp:/(?:([^ ]+)?\.)?([^ ]+) is not a function/,groups:["base","key"]},{regexp:/([^ ]+) called on (null or undefined)/,groups:["key","value"]},{regexp:/Object (.*) has no method '([^ ]+)'/,groups:["base","key"]},{regexp:/Object doesn't support property or method '([^ ]+)'/,groups:["key"]},{regexp:/\u30aa\u30d6\u30b8\u30a7\u30af\u30c8\u306f '([^']+)' \u30d7\u30ed\u30d1\u30c6\u30a3\u307e\u305f\u306f\u30e1\u30bd\u30c3\u30c9\u3092\u30b5\u30dd\u30fc\u30c8\u3057\u3066\u3044\u307e\u305b\u3093/,
groups:["key"]},{regexp:/\uac1c\uccb4\uac00 '([^']+)' \uc18d\uc131\uc774\ub098 \uba54\uc11c\ub4dc\ub97c \uc9c0\uc6d0\ud558\uc9c0 \uc54a\uc2b5\ub2c8\ub2e4./,groups:["key"]}]}},{Ba:function(a){return a.key+" is not defined"},
sa:{ReferenceError:[{regexp:/(.*) is not defined/,groups:["key"]},{regexp:/Can't find variable: (.*)/,groups:["key"]}]}}];var Fm={X:[],V:[{eb:Em,weight:500}]};function Em(a){if("JavaException"===a.name)return!0;a=a.stack;return a.includes("chrome://")||a.includes("chrome-extension://")||a.includes("moz-extension://")}
;function Gm(){this.V=[];this.X=[]}
var Hm;function Im(){if(!Hm){var a=Hm=new Gm;a.X.length=0;a.V.length=0;Fm.X&&a.X.push.apply(a.X,Fm.X);Fm.V&&a.V.push.apply(a.V,Fm.V)}return Hm}
;var Jm=new L;function Km(a){function b(){return a.charCodeAt(d++)}
var c=a.length,d=0;do{var e=Lm(b);if(Infinity===e)break;var f=e>>3;switch(e&7){case 0:e=Lm(b);if(2===f)return e;break;case 1:if(2===f)return;d+=8;break;case 2:e=Lm(b);if(2===f)return a.substr(d,e);d+=e;break;case 5:if(2===f)return;d+=4;break;default:return}}while(d<c)}
function Lm(a){var b=a(),c=b&127;if(128>b)return c;b=a();c|=(b&127)<<7;if(128>b)return c;b=a();c|=(b&127)<<14;if(128>b)return c;b=a();return 128>b?c|(b&127)<<21:Infinity}
;function Mm(a,b,c,d){if(a)if(Array.isArray(a)){var e=d;for(d=0;d<a.length&&!(a[d]&&(e+=Nm(d,a[d],b,c),500<e));d++);d=e}else if("object"===typeof a)for(e in a){if(a[e]){var f=a[e];var g=b;var h=c;g="string"!==typeof f||"clickTrackingParams"!==e&&"trackingParams"!==e?0:(f=Km(atob(f.replace(/-/g,"+").replace(/_/g,"/"))))?Nm(e+".ve",f,g,h):0;d+=g;d+=Nm(e,a[e],b,c);if(500<d)break}}else c[b]=Om(a),d+=c[b].length;else c[b]=Om(a),d+=c[b].length;return d}
function Nm(a,b,c,d){c+="."+a;a=Om(b);d[c]=a;return c.length+a.length}
function Om(a){try{return("string"===typeof a?a:String(JSON.stringify(a))).substr(0,500)}catch(b){return"unable to serialize "+typeof a+" ("+b.message+")"}}
;var Pm=A.ytLoggingGelSequenceIdObj_||{};C("ytLoggingGelSequenceIdObj_",Pm);function Qm(a){var b=void 0;b=void 0===b?{}:b;var c=!1;N("ytLoggingEventsDefaultDisabled",!1)&&Ql===Ql&&(c=!0);c=c?null:Ql;b=void 0===b?{}:b;var d=Math.round(b.timestamp||Q());G(a,1,d<Number.MAX_SAFE_INTEGER?d:0);var e=Tl();d=new Cg;G(d,1,b.timestamp||!isFinite(e)?-1:e);if(O("log_sequence_info_on_gel_web")&&b.ia){e=b.ia;var f=Bm(e),g=new Bg;G(g,2,f);G(g,1,e);H(d,3,g);b.jb&&delete Pm[b.ia]}H(a,33,d);(b.rb?qm:lm)({endpoint:"log_event",payload:a,P:b.P,da:b.da},c)}
;var Rm=new Set,Sm=0,Tm=0,Um=0,Vm=[],Wm=["PhantomJS","Googlebot","TO STOP THIS SECURITY SCAN go/scan"];function Xm(){for(var a=t(Wm),b=a.next();!b.done;b=a.next()){var c=Gb();if(c&&0<=c.toLowerCase().indexOf(b.value.toLowerCase()))return!0}return!1}
;var Ym={};function Zm(a){return Ym[a]||(Ym[a]=String(a).replace(/\-([a-z])/g,function(b,c){return c.toUpperCase()}))}
;var $m={},an=[],Mf=new L,bn={};function cn(){for(var a=t(an),b=a.next();!b.done;b=a.next())b=b.value,b()}
function dn(a,b){var c;"yt:"===a.tagName.toLowerCase().substr(0,3)?c=a.getAttribute(b):c=a?a.dataset?a.dataset[Zm(b)]:a.getAttribute("data-"+b):null;return c}
function en(a){Mf.ca.apply(Mf,arguments)}
;function fn(a){this.h=a||{};a=[this.h,window.YTConfig||{}];for(var b=0;b<a.length;b++)a[b].host&&(a[b].host=a[b].host.toString().replace("http://","https://"))}
function gn(a,b){a=[a.h,window.YTConfig||{}];for(var c=0;c<a.length;c++){var d=a[c][b];if(void 0!==d)return d}return null}
function hn(a,b,c){jn||(jn={},mh(window,"message",function(d){a:{if(d.origin===gn(a,"host")){try{var e=JSON.parse(d.data)}catch(f){e=void 0;break a}if(d=jn[e.id])d.u=!0,d.u&&(D(d.v,d.sendMessage,d),d.v.length=0),d.Ga(e)}e=void 0}return e}));
jn[c]=b}
var jn=null;var kn=window;function ln(a,b,c){this.m=this.h=this.i=null;this.j=0;this.u=!1;this.v=[];this.l=null;this.I={};if(!a)throw Error("YouTube player element ID required.");this.id=Pa(this);this.A=c;this.setup(a,b)}
m=ln.prototype;m.setSize=function(a,b){this.h.width=a.toString();this.h.height=b.toString();return this};
m.getIframe=function(){return this.h};
m.Ga=function(a){mn(this,a.event,a)};
m.addEventListener=function(a,b){var c=b;"string"===typeof b&&(c=function(){window[b].apply(window,arguments)});
if(!c)return this;this.l.subscribe(a,c);nn(this,a);return this};
function on(a,b){b=b.split(".");if(2===b.length){var c=b[1];a.A===b[0]&&nn(a,c)}}
m.destroy=function(){this.h&&this.h.id&&($m[this.h.id]=null);var a=this.l;a&&"function"==typeof a.dispose&&a.dispose();if(this.m){a=this.h;var b=a.parentNode;b&&b.replaceChild(this.m,a)}else(a=this.h)&&a.parentNode&&a.parentNode.removeChild(a);jn&&(jn[this.id]=null);this.i=null;a=this.h;for(var c in kb)kb[c][0]==a&&kh(c);this.m=this.h=null};
m.Ja=function(){return{}};
function pn(a,b,c){c=c||[];c=Array.prototype.slice.call(c);b={event:"command",func:b,args:c};a.u?a.sendMessage(b):a.v.push(b)}
function mn(a,b,c){a.l.l||(c={target:a,data:c},a.l.ca(b,c),en(a.A+"."+b,c))}
function qn(a,b){var c=document.createElement("iframe");b=b.attributes;for(var d=0,e=b.length;d<e;d++){var f=b[d].value;null!=f&&""!==f&&"null"!==f&&c.setAttribute(b[d].name,f)}c.setAttribute("frameBorder","0");c.setAttribute("allowfullscreen","1");c.setAttribute("allow","accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture");c.setAttribute("title","YouTube "+gn(a.i,"title"));(b=gn(a.i,"width"))&&c.setAttribute("width",b.toString());(b=gn(a.i,"height"))&&c.setAttribute("height",
b.toString());var g=a.Ja();g.enablejsapi=window.postMessage?1:0;window.location.host&&(g.origin=window.location.protocol+"//"+window.location.host);g.widgetid=a.id;window.location.href&&D(["debugjs","debugcss"],function(h){var k=Vb(window.location.href,h);null!==k&&(g[h]=k)});
kn.yt_embedsTokenValue&&(g.embedsTokenValue=encodeURIComponent(kn.yt_embedsTokenValue),delete kn.yt_embedsTokenValue);c.src=gn(a.i,"host")+("/embed/"+gn(a.i,"videoId"))+"?"+Tb(g);return c}
m.Ta=function(){this.h&&this.h.contentWindow?this.sendMessage({event:"listening"}):window.clearInterval(this.j)};
function rn(a){hn(a.i,a,a.id);a.j=oh(a.Ta.bind(a));mh(a.h,"load",function(){window.clearInterval(a.j);a.j=oh(a.Ta.bind(a))})}
m.setup=function(a,b){var c=document;if(a="string"===typeof a?c.getElementById(a):a)if(c="iframe"===a.tagName.toLowerCase(),b.host||(b.host=c?Nb(a.src):"https://www.youtube.com"),this.i=new fn(b),c||(b=qn(this,a),this.m=a,(c=a.parentNode)&&c.replaceChild(b,a),a=b),this.h=a,this.h.id||(this.h.id="widget"+Pa(this.h)),$m[this.h.id]=this,window.postMessage){this.l=new L;rn(this);b=gn(this.i,"events");for(var d in b)b.hasOwnProperty(d)&&this.addEventListener(d,b[d]);for(var e in bn)bn.hasOwnProperty(e)&&
on(this,e)}};
function nn(a,b){a.I[b]||(a.I[b]=!0,pn(a,"addEventListener",[b]))}
m.sendMessage=function(a){a.id=this.id;a.channel="widget";var b=We(a),c=[Nb(this.h.src||"").replace("http:","https:")];if(this.h.contentWindow)for(var d=0;d<c.length;d++)try{this.h.contentWindow.postMessage(b,c[d])}catch(Ob){if(Ob.name&&"SyntaxError"===Ob.name){if(!(Ob.message&&0<Ob.message.indexOf("target origin ''"))){var e=void 0,f=Ob;e=void 0===e?{}:e;e.name=N("INNERTUBE_CONTEXT_CLIENT_NAME",1);e.version=N("INNERTUBE_CONTEXT_CLIENT_VERSION");var g=e||{},h="WARNING";h=void 0===h?"ERROR":h;if(f){f.hasOwnProperty("level")&&
f.level&&(h=f.level);if(O("console_log_js_exceptions")){var k=f,l=[];l.push("Name: "+k.name);l.push("Message: "+k.message);k.hasOwnProperty("params")&&l.push("Error Params: "+JSON.stringify(k.params));k.hasOwnProperty("args")&&l.push("Error args: "+JSON.stringify(k.args));l.push("File name: "+k.fileName);l.push("Stacktrace: "+k.stack);window.console.log(l.join("\n"),k)}if(!(5<=Sm)){var n=void 0,q=void 0,v=f,p=g,y=Hd(v),z=y.message||"Unknown Error",F=y.name||"UnknownError",K=y.stack||v.i||"Not available";
if(K.startsWith(F+": "+z)){var M=K.split("\n");M.shift();K=M.join("\n")}var P=y.lineNumber||"Not available",fb=y.fileName||"Not available",hc=K,ua=0;if(v.hasOwnProperty("args")&&v.args&&v.args.length)for(var ma=0;ma<v.args.length&&!(ua=Mm(v.args[ma],"params."+ma,p,ua),500<=ua);ma++);else if(v.hasOwnProperty("params")&&v.params){var Y=v.params;if("object"===typeof v.params)for(q in Y){if(Y[q]){var ba="params."+q,ca=Om(Y[q]);p[ba]=ca;ua+=ba.length+ca.length;if(500<ua)break}}else p.params=Om(Y)}if(Vm.length)for(var X=
0;X<Vm.length&&!(ua=Mm(Vm[X],"params.context."+X,p,ua),500<=ua);X++);navigator.vendor&&!p.hasOwnProperty("vendor")&&(p["device.vendor"]=navigator.vendor);var S={message:z,name:F,lineNumber:P,fileName:fb,stack:hc,params:p,sampleWeight:1},pj=Number(v.columnNumber);isNaN(pj)||(S.lineNumber=S.lineNumber+":"+pj);if("IGNORED"===v.level)n=0;else a:{for(var qj=Im(),rj=t(qj.X),mf=rj.next();!mf.done;mf=rj.next()){var sj=mf.value;if(S.message&&S.message.match(sj.Pb)){n=sj.weight;break a}}for(var tj=t(qj.V),
nf=tj.next();!nf.done;nf=tj.next()){var uj=nf.value;if(uj.eb(S)){n=uj.weight;break a}}n=1}S.sampleWeight=n;for(var vj=t(Dm),of=vj.next();!of.done;of=vj.next()){var pf=of.value;if(pf.sa[S.name])for(var wj=t(pf.sa[S.name]),qf=wj.next();!qf.done;qf=wj.next()){var xj=qf.value,sd=S.message.match(xj.regexp);if(sd){S.params["params.error.original"]=sd[0];for(var rf=xj.groups,yj={},Pb=0;Pb<rf.length;Pb++)yj[rf[Pb]]=sd[Pb+1],S.params["params.error."+rf[Pb]]=sd[Pb+1];S.message=pf.Ba(yj);break}}}S.params||(S.params=
{});var zj=Im();S.params["params.errorServiceSignature"]="msg="+zj.X.length+"&cb="+zj.V.length;S.params["params.serviceWorker"]="false";A.document&&A.document.querySelectorAll&&(S.params["params.fscripts"]=String(document.querySelectorAll("script:not([nonce])").length));wb("sample").constructor!==vb&&(S.params["params.fconst"]="true");var qa=S;window.yterr&&"function"===typeof window.yterr&&window.yterr(qa);if(0!==qa.sampleWeight&&!Rm.has(qa.message)){if("ERROR"===h){Jm.ca("handleError",qa);if(O("record_app_crashed_web")&&
0===Um&&1===qa.sampleWeight)if(Um++,O("errors_via_jspb")){var sf=new Ag;G(sf,1,1);if(!O("report_client_error_with_app_crash_ks")){var Aj=new vg;G(Aj,1,qa.message);var Bj=new wg;H(Bj,3,Aj);var Cj=new xg;H(Cj,5,Bj);var Dj=new yg;H(Dj,9,Cj);H(sf,4,Dj)}var xn=sf,Ej=new Dg;Vc(Ej,20,Eg,xn);Qm(Ej)}else{var Fj={appCrashType:"APP_CRASH_TYPE_BREAKPAD"};O("report_client_error_with_app_crash_ks")||(Fj.systemHealth={crashData:{clientError:{logMessage:{message:qa.message}}}});Cm("appCrashed",Fj)}Tm++}else"WARNING"===
h&&Jm.ca("handleWarning",qa);if(O("kevlar_gel_error_routing"))a:{var tf=void 0,uf=void 0,qc=h,R=qa;if(O("errors_via_jspb")){if(Xm())uf=void 0;else{var Qb=new sg;G(Qb,1,R.stack);R.fileName&&G(Qb,4,R.fileName);var Ha=R.lineNumber&&R.lineNumber.split?R.lineNumber.split(":"):[];0!==Ha.length&&(1!==Ha.length||isNaN(Number(Ha[0]))?2!==Ha.length||isNaN(Number(Ha[0]))||isNaN(Number(Ha[1]))||(G(Qb,2,Number(Ha[0])),G(Qb,3,Number(Ha[1]))):G(Qb,2,Number(Ha[0])));var mb=new vg;G(mb,1,R.message);G(mb,3,R.name);
G(mb,6,R.sampleWeight);"ERROR"===qc?G(mb,2,2):"WARNING"===qc?G(mb,2,1):G(mb,2,0);var vf=new tg;G(vf,1,!0);Vc(vf,3,ug,Qb);var nb=new pg;G(nb,3,window.location.href);for(var Gj=N("FEXP_EXPERIMENTS",[]),wf=0;wf<Gj.length;wf++){var Hj=nb,yn=Gj[wf];Gc(Hj);Qc(Hj,5).push(yn)}var xf=Zg();if(!$g()&&xf)for(var Ij=t(Object.keys(xf)),ob=Ij.next();!ob.done;ob=Ij.next()){var Jj=ob.value,yf=new rg;G(yf,1,Jj);yf.setValue(String(xf[Jj]));Wc(nb,4,rg,yf)}var zf=R.params;if(zf){var Kj=t(Object.keys(zf));for(ob=Kj.next();!ob.done;ob=
Kj.next()){var Lj=ob.value,Af=new rg;G(Af,1,"client."+Lj);Af.setValue(String(zf[Lj]));Wc(nb,4,rg,Af)}}var Mj=N("SERVER_NAME"),Nj=N("SERVER_VERSION");if(Mj&&Nj){var Bf=new rg;G(Bf,1,"server.name");Bf.setValue(Mj);Wc(nb,4,rg,Bf);var Cf=new rg;G(Cf,1,"server.version");Cf.setValue(Nj);Wc(nb,4,rg,Cf)}var td=new wg;H(td,1,nb);H(td,2,vf);H(td,3,mb);uf=td}var Oj=uf;if(!Oj)break a;var Pj=new Dg;Vc(Pj,163,Eg,Oj);Qm(Pj)}else{if(Xm())tf=void 0;else{var rc={stackTrace:R.stack};R.fileName&&(rc.filename=R.fileName);
var Ia=R.lineNumber&&R.lineNumber.split?R.lineNumber.split(":"):[];0!==Ia.length&&(1!==Ia.length||isNaN(Number(Ia[0]))?2!==Ia.length||isNaN(Number(Ia[0]))||isNaN(Number(Ia[1]))||(rc.lineNumber=Number(Ia[0]),rc.columnNumber=Number(Ia[1])):rc.lineNumber=Number(Ia[0]));var Df={level:"ERROR_LEVEL_UNKNOWN",message:R.message,errorClassName:R.name,sampleWeight:R.sampleWeight};"ERROR"===qc?Df.level="ERROR_LEVEL_ERROR":"WARNING"===qc&&(Df.level="ERROR_LEVEL_WARNNING");var zn={isObfuscated:!0,browserStackInfo:rc},
Rb={pageUrl:window.location.href,kvPairs:[]};N("FEXP_EXPERIMENTS")&&(Rb.experimentIds=N("FEXP_EXPERIMENTS"));var Ef=Zg();if(!$g()&&Ef)for(var Qj=t(Object.keys(Ef)),pb=Qj.next();!pb.done;pb=Qj.next()){var Rj=pb.value;Rb.kvPairs.push({key:Rj,value:String(Ef[Rj])})}var Ff=R.params;if(Ff){var Sj=t(Object.keys(Ff));for(pb=Sj.next();!pb.done;pb=Sj.next()){var Tj=pb.value;Rb.kvPairs.push({key:"client."+Tj,value:String(Ff[Tj])})}}var Uj=N("SERVER_NAME"),Vj=N("SERVER_VERSION");Uj&&Vj&&(Rb.kvPairs.push({key:"server.name",
value:Uj}),Rb.kvPairs.push({key:"server.version",value:Vj}));tf={errorMetadata:Rb,stackTrace:zn,logMessage:Df}}var Wj=tf;if(!Wj)break a;Cm("clientError",Wj)}("ERROR"===qc||O("errors_flush_gel_always_killswitch"))&&mm(void 0,void 0,!1)}if(!O("suppress_error_204_logging")){var qb=qa,sc=qb.params||{},Ua={urlParams:{a:"logerror",t:"jserror",type:qb.name,msg:qb.message.substr(0,250),line:qb.lineNumber,level:h,"client.name":sc.name},postParams:{url:N("PAGE_NAME",window.location.href),file:qb.fileName},
method:"POST"};sc.version&&(Ua["client.version"]=sc.version);if(Ua.postParams){qb.stack&&(Ua.postParams.stack=qb.stack);for(var Xj=t(Object.keys(sc)),Gf=Xj.next();!Gf.done;Gf=Xj.next()){var Yj=Gf.value;Ua.postParams["client."+Yj]=sc[Yj]}var Hf=Zg();if(Hf)for(var Zj=t(Object.keys(Hf)),If=Zj.next();!If.done;If=Zj.next()){var ak=If.value;Ua.postParams[ak]=Hf[ak]}var bk=N("SERVER_NAME"),ck=N("SERVER_VERSION");bk&&ck&&(Ua.postParams["server.name"]=bk,Ua.postParams["server.version"]=ck)}Kh(N("ECATCHER_REPORT_HOST",
"")+"/error_204",Ua)}try{Rm.add(qa.message)}catch(En){}Sm++}}}}}else throw Ob;}else console&&console.warn&&console.warn("The YouTube player is not attached to the DOM. API calls should be made after the onReady event. See more: https://developers.google.com/youtube/iframe_api_reference#Events")};function sn(a){return(0===a.search("cue")||0===a.search("load"))&&"loadModule"!==a}
function tn(a){return 0===a.search("get")||0===a.search("is")}
;function un(a,b){ln.call(this,a,Object.assign({title:"video player",videoId:"",width:640,height:360},b||{}),"player");this.M={};this.playerInfo={}}
u(un,ln);m=un.prototype;m.Ja=function(){var a=gn(this.i,"playerVars");if(a){var b={},c;for(c in a)b[c]=a[c];a=b}else a={};window!==window.top&&document.referrer&&(a.widget_referrer=document.referrer.substring(0,256));if(c=gn(this.i,"embedConfig")){if(Oa(c))try{c=JSON.stringify(c)}catch(d){console.error("Invalid embed config JSON",d)}a.embed_config=c}return a};
m.Ga=function(a){var b=a.event;a=a.info;switch(b){case "apiInfoDelivery":if(Oa(a))for(var c in a)a.hasOwnProperty(c)&&(this.M[c]=a[c]);break;case "infoDelivery":vn(this,a);break;case "initialDelivery":Oa(a)&&(window.clearInterval(this.j),this.playerInfo={},this.M={},wn(this,a.apiInterface),vn(this,a));break;default:mn(this,b,a)}};
function vn(a,b){if(Oa(b))for(var c in b)b.hasOwnProperty(c)&&(a.playerInfo[c]=b[c])}
function wn(a,b){D(b,function(c){this[c]||("getCurrentTime"===c?this[c]=function(){var d=this.playerInfo.currentTime;if(1===this.playerInfo.playerState){var e=(Date.now()/1E3-this.playerInfo.currentTimeLastUpdated_)*this.playerInfo.playbackRate;0<e&&(d+=Math.min(e,1))}return d}:sn(c)?this[c]=function(){this.playerInfo={};
this.M={};pn(this,c,arguments);return this}:tn(c)?this[c]=function(){var d=0;
0===c.search("get")?d=3:0===c.search("is")&&(d=2);return this.playerInfo[c.charAt(d).toLowerCase()+c.substr(d+1)]}:this[c]=function(){pn(this,c,arguments);
return this})},a)}
m.getVideoEmbedCode=function(){var a=gn(this.i,"host")+("/embed/"+gn(this.i,"videoId")),b=Number(gn(this.i,"width")),c=Number(gn(this.i,"height"));if(isNaN(b)||isNaN(c))throw Error("Invalid width or height property");b=Math.floor(b);c=Math.floor(c);Fb.test(a)&&(-1!=a.indexOf("&")&&(a=a.replace(zb,"&amp;")),-1!=a.indexOf("<")&&(a=a.replace(Ab,"&lt;")),-1!=a.indexOf(">")&&(a=a.replace(Bb,"&gt;")),-1!=a.indexOf('"')&&(a=a.replace(Cb,"&quot;")),-1!=a.indexOf("'")&&(a=a.replace(Db,"&#39;")),-1!=a.indexOf("\x00")&&
(a=a.replace(Eb,"&#0;")));return'<iframe width="'+b+'" height="'+c+'" src="'+a+'" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'};
m.getOptions=function(a){return this.M.namespaces?a?this.M[a]?this.M[a].options||[]:[]:this.M.namespaces||[]:[]};
m.getOption=function(a,b){if(this.M.namespaces&&a&&b&&this.M[a])return this.M[a][b]};
function An(a){if("iframe"!==a.tagName.toLowerCase()){var b=dn(a,"videoid");b&&(b={videoId:b,width:dn(a,"width"),height:dn(a,"height")},new un(a,b))}}
;C("YT.PlayerState.UNSTARTED",-1);C("YT.PlayerState.ENDED",0);C("YT.PlayerState.PLAYING",1);C("YT.PlayerState.PAUSED",2);C("YT.PlayerState.BUFFERING",3);C("YT.PlayerState.CUED",5);C("YT.get",function(a){return $m[a]});
C("YT.scan",cn);C("YT.subscribe",function(a,b,c){Mf.subscribe(a,b,c);bn[a]=!0;for(var d in $m)$m.hasOwnProperty(d)&&on($m[d],a)});
C("YT.unsubscribe",function(a,b,c){Lf(a,b,c)});
C("YT.Player",un);ln.prototype.destroy=ln.prototype.destroy;ln.prototype.setSize=ln.prototype.setSize;ln.prototype.getIframe=ln.prototype.getIframe;ln.prototype.addEventListener=ln.prototype.addEventListener;un.prototype.getVideoEmbedCode=un.prototype.getVideoEmbedCode;un.prototype.getOptions=un.prototype.getOptions;un.prototype.getOption=un.prototype.getOption;
an.push(function(a){var b=a;b||(b=document);a=gb(b.getElementsByTagName("yt:player"));var c=b||document;if(c.querySelectorAll&&c.querySelector)b=c.querySelectorAll(".yt-player");else{var d;c=document;b=b||c;if(b.querySelectorAll&&b.querySelector)b=b.querySelectorAll(".yt-player");else if(b.getElementsByClassName){var e=b.getElementsByClassName("yt-player");b=e}else{e=b.getElementsByTagName("*");var f={};for(c=d=0;b=e[c];c++){var g=b.className,h;if(h="function"==typeof g.split)h=0<=bb(g.split(/\s+/),
"yt-player");h&&(f[d++]=b)}f.length=d;b=f}}b=gb(b);D(eb(a,b),An)});
"undefined"!=typeof YTConfig&&YTConfig.parsetags&&"onload"!=YTConfig.parsetags||cn();var Bn=A.onYTReady;Bn&&Bn();var Cn=A.onYouTubeIframeAPIReady;Cn&&Cn();var Dn=A.onYouTubePlayerAPIReady;Dn&&Dn();}).call(this);
