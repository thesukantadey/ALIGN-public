(function(t){function e(e){for(var s,i,r=e[0],l=e[1],c=e[2],v=0,h=[];v<r.length;v++)i=r[v],a[i]&&h.push(a[i][0]),a[i]=0;for(s in l)Object.prototype.hasOwnProperty.call(l,s)&&(t[s]=l[s]);u&&u(e);while(h.length)h.shift()();return o.push.apply(o,c||[]),n()}function n(){for(var t,e=0;e<o.length;e++){for(var n=o[e],s=!0,r=1;r<n.length;r++){var l=n[r];0!==a[l]&&(s=!1)}s&&(o.splice(e--,1),t=i(i.s=n[0]))}return t}var s={},a={app:0},o=[];function i(e){if(s[e])return s[e].exports;var n=s[e]={i:e,l:!1,exports:{}};return t[e].call(n.exports,n,n.exports,i),n.l=!0,n.exports}i.m=t,i.c=s,i.d=function(t,e,n){i.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},i.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},i.t=function(t,e){if(1&e&&(t=i(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(i.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var s in t)i.d(n,s,function(e){return t[e]}.bind(null,s));return n},i.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return i.d(e,"a",e),e},i.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},i.p="/";var r=window["webpackJsonp"]=window["webpackJsonp"]||[],l=r.push.bind(r);r.push=e,r=r.slice();for(var c=0;c<r.length;c++)e(r[c]);var u=l;o.push([0,"chunk-vendors"]),n()})({0:function(t,e,n){t.exports=n("56d7")},"034f":function(t,e,n){"use strict";var s=n("64a9"),a=n.n(s);a.a},"56d7":function(t,e,n){"use strict";n.r(e);n("cadf"),n("551c"),n("097d");var s=n("2b0e"),a=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"app"}},[n("router-view")],1)},o=[],i=(n("034f"),n("2877")),r={},l=Object(i["a"])(r,a,o,!1,null,null,null);l.options.__file="App.vue";var c=l.exports,u=n("8c4f"),v=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",[n("h1",[t._v("SVG-Based Placement Editor/Visualizer")]),n("div",{staticClass:"container"},[n("div",{staticClass:"row"},[n("div",{staticClass:"col-sm-12"},[n("vue-slider",{ref:"slider",attrs:{min:0,max:t.leaves_array.length-1,width:"960px",interval:.001,speed:0},model:{value:t.theta_timeline,callback:function(e){t.theta_timeline=e},expression:"theta_timeline"}})],1)]),n("div",{staticClass:"row"},[n("div",{staticClass:"col-sm-6"},[n("div",{staticClass:"load-save-buttons"},[n("button",{staticClass:"load-save-buttons",on:{click:t.getContent}},[t._v("Load")]),n("button",{staticClass:"load-save-buttons",on:{click:t.postContent}},[t._v("Save")]),n("label",{attrs:{for:"index"}},[t._v("Index:")]),n("input",{directives:[{name:"model",rawName:"v-model",value:t.leaves_idx,expression:"leaves_idx"}],staticClass:"small-num",attrs:{id:"index"},domProps:{value:t.leaves_idx},on:{input:function(e){e.target.composing||(t.leaves_idx=e.target.value)}}}),n("label",{attrs:{for:"scale"}},[t._v("Scale:")]),n("input",{directives:[{name:"model",rawName:"v-model",value:t.scale_factor,expression:"scale_factor"}],staticClass:"small-num",attrs:{id:"scale"},domProps:{value:t.scale_factor},on:{input:function(e){e.target.composing||(t.scale_factor=e.target.value)}}}),n("label",{attrs:{for:"sch"}},[t._v("ScrollH:")]),n("input",{directives:[{name:"model",rawName:"v-model",value:t.sch,expression:"sch"}],staticClass:"small-num",attrs:{id:"sch"},domProps:{value:t.sch},on:{input:function(e){e.target.composing||(t.sch=e.target.value)}}}),n("label",{attrs:{for:"scv"}},[t._v("ScrollV:")]),n("input",{directives:[{name:"model",rawName:"v-model",value:t.scv,expression:"scv"}],staticClass:"small-num",attrs:{id:"scv"},domProps:{value:t.scv},on:{input:function(e){e.target.composing||(t.scv=e.target.value)}}}),n("button",{staticClass:"load-save-buttons",on:{click:t.animatePlacementChange}},[t._v("\n            Animate\n          ")]),n("span",[t._v(t._s(t.theta_rounded))]),n("button",{staticClass:"load-save-buttons",on:{click:t.resetPlacementChange}},[t._v("\n            Reset\n          ")])]),t._l(t.leaves,function(e,s){return n("div",{key:"i-"+s,staticClass:"value-tbl"},[n("span",{staticClass:"value-span"},[t._v(t._s(e.nm))]),n("input",{directives:[{name:"model",rawName:"v-model",value:e.w,expression:"c.w"}],domProps:{value:e.w},on:{input:function(n){n.target.composing||t.$set(e,"w",n.target.value)}}}),n("input",{directives:[{name:"model",rawName:"v-model",value:e.h,expression:"c.h"}],domProps:{value:e.h},on:{input:function(n){n.target.composing||t.$set(e,"h",n.target.value)}}}),n("input",{directives:[{name:"model",rawName:"v-model",value:e.transformation.oX,expression:"c.transformation.oX"}],domProps:{value:e.transformation.oX},on:{input:function(n){n.target.composing||t.$set(e.transformation,"oX",n.target.value)}}}),n("input",{directives:[{name:"model",rawName:"v-model",value:e.transformation.oY,expression:"c.transformation.oY"}],domProps:{value:e.transformation.oY},on:{input:function(n){n.target.composing||t.$set(e.transformation,"oY",n.target.value)}}}),n("input",{directives:[{name:"model",rawName:"v-model",value:e.transformation.sX,expression:"c.transformation.sX"}],domProps:{value:e.transformation.sX},on:{input:function(n){n.target.composing||t.$set(e.transformation,"sX",n.target.value)}}}),n("input",{directives:[{name:"model",rawName:"v-model",value:e.transformation.sY,expression:"c.transformation.sY"}],domProps:{value:e.transformation.sY},on:{input:function(n){n.target.composing||t.$set(e.transformation,"sY",n.target.value)}}})])})],2),n("div",{staticClass:"col-sm-5 col-sm-offset-1"},[n("svg",{attrs:{width:t.width,height:t.height},on:{mousemove:function(e){t.doMove(e)},mouseup:function(e){t.doEnd(e)}}},[n("g",{attrs:{transform:"matrix("+t.scale+" 0 0 "+-t.scale+" "+t.sch*t.width+" "+(1-t.scv)*t.height+")"}},[t._l(t.hgridlines,function(t,e){return n("g",{key:"h-"+e},[n("line",{attrs:{x1:t.x0,y1:t.cy,x2:t.x1,y2:t.cy,stroke:"black","stroke-dasharray":"10 4"}})])}),t._l(t.vgridlines,function(t,e){return n("g",{key:"v-"+e},[n("line",{attrs:{x1:t.cx,y1:t.y0,x2:t.cx,y2:t.y1,stroke:"black","stroke-dasharray":"10 4"}})])}),t._l(t.leaves,function(e,s){return n("g",{key:"d-"+s,attrs:{transform:"translate("+e.transformation.oX+" "+e.transformation.oY+") scale("+e.transformation.sX+" "+e.transformation.sY+")"},on:{mousedown:function(n){t.doStart(n,e,s,2)}}},[n("path",{attrs:{d:"M 0 0 h "+e.w+" v "+e.h+" h "+-e.w+" v "+-e.h,stroke:"black",fill:e.fill}}),n("g",{attrs:{transform:"matrix(1 0 0 -1 0 "+(e.h/2+0)+")"}},[n("g",{attrs:{transform:"`matrix(1 0 0 1 0 0)`"}},[n("text",{staticStyle:{font:"48px sans-serif"},attrs:{x:40,y:100}},[t._v("\n                    "+t._s(e.nm)+"\n                  ")])]),n("g",{attrs:{transform:"matrix(0 -1 1 0 45 0)"}},[n("text",{staticStyle:{font:"36px sans-serif"},attrs:{x:0,y:0}},[t._v("\n                    "+t._s(e.hasOwnProperty("formal_actual_map")?e.formal_actual_map.s:"no_map")+"\n                  ")])]),n("g",{attrs:{transform:"matrix(0 -1 1 0 "+(e.w-30)+" 0)"}},[n("text",{staticStyle:{font:"36px sans-serif"},attrs:{x:0,y:0}},[t._v("\n                    "+t._s(e.hasOwnProperty("formal_actual_map")?e.formal_actual_map.d:"no_map")+"\n                  ")])])])])})],2)])])])])])},h=[],f=n("be94"),d=(n("84b4"),n("bc3a")),m=n.n(d),p=n("cffa"),g=n("6f79"),x=n.n(g),_={components:{vueSlider:x.a},data:function(){var t=640,e=640;return{width:t,height:e,stepx:void 0,stepy:void 0,ny:void 0,nx:void 0,moving:!1,moving_idx:void 0,code:void 0,offx:void 0,offy:void 0,leaves_array:[],hgridlines:[],vgridlines:[],errors:[],leaves_idx:0,theta:0,theta_percent:0,scale_factor:1,sch:0,scv:0}},computed:{scale:function(){return this.stepy*this.ny*this.width>this.stepx*this.nx*this.height?this.scale_factor*this.height/(this.ny*this.stepy):this.scale_factor*this.width/(this.nx*this.stepx)},theta_timeline:{get:function(){return this.theta+this.leaves_idx},set:function(t){this.leaves_idx=Math.trunc(t),this.theta=t-this.leaves_idx}},leaves_idx_next:function(){return this.leaves_idx+1},theta_rounded:function(){return this.theta.toFixed(3)},leaves:function(){var t=this.leaves_array[this.leaves_idx];if(0==this.theta)return t;for(var e=t.map(function(t){return Object(f["a"])({},t)}),n=this.leaves_array[this.leaves_idx_next],s=0;s<t.length;s+=1){var a=Object(f["a"])({},e[s].transformation),o=t[s].transformation,i=n[s].transformation,r=this.theta,l=1-this.theta;a.oX=l*o.oX+r*i.oX,a.oY=l*o.oY+r*i.oY,a.sX=l*o.sX+r*i.sX,a.sY=l*o.sY+r*i.sY,e[s].transformation=a}return e}},methods:{setupGridlines:function(){for(var t=0;t<=this.ny;t+=1)this.hgridlines.push({cy:this.stepy*t,x0:0,x1:this.stepx*this.nx});for(var e=0;e<=this.nx;e+=1)this.vgridlines.push({cx:this.stepx*e,y0:0,y1:this.stepy*this.ny})},resetPlacementChange:function(){this.theta=0,this.leaves_idx=0},animatePlacementChange:function(){var t=p["b"].easeInOut,e=1,n=new p["c"];console.log(this.leaves_array.length);for(var s=0;s<this.leaves_array.length-1;s+=1)console.log("Setting up:",s),n.set(this,{theta:0,leaves_idx:s,leaves_idx_next:s+1}),n.to(this,e,{theta:1,ease:t})},getContent:function(){var t=this;m.a.get("http://localhost:5000/get").then(function(e){var n=e["data"];t.leaves_array=n["placements_for_animation"],t.nx=n["nx"],t.ny=n["ny"],t.stepx=n["stepx"],t.stepy=n["stepy"],t.setupGridlines()}).catch(function(e){t.errors.push(e)})},postContent:function(){var t=this,e={placements_for_animation:this.leaves_array,nx:this.nx,ny:this.ny,stepx:this.stepx,stepy:this.stepy};m.a.post("http://localhost:5000/post",e,{headers:{"Content-Type":"application/json"}}).then(function(t){console.log("Saved: ",t)}).catch(function(e){t.errors.push(e)})},roundNearestGridX:function(t){return Math.round(t/this.stepx)*this.stepx},roundNearestGridY:function(t){return Math.round(t/this.stepy)*this.stepy},getEventX:function(t){return t.offsetX/this.scale},getEventY:function(t){return(this.height-t.offsetY)/this.scale},doMove:function(t){if(this.moving){var e=this.leaves[this.moving_idx];2==this.code&&(e.transformation.oX=this.getEventX(t)-this.offx,e.transformation.oY=this.getEventY(t)-this.offy)}},doKeyup:function(t){console.log("event",t)},doStart:function(t,e,n,s){console.log("Start: ",t,e,n,s),this.code=s,this.moving=!0,this.moving_idx=n;var a=this.leaves[this.moving_idx];this.offx=this.getEventX(t)-a.transformation.oX,this.offy=this.getEventY(t)-a.transformation.oY},doEnd:function(){if(this.moving){var t=p["a"].easeOut.config(1,.3),e=.5,n=this.leaves[this.moving_idx];if(2==this.code){var s=this.roundNearestGridX(n.transformation.oX),a=this.roundNearestGridY(n.transformation.oY);p["d"].to(n.transformation,e,{oX:s,oY:a,ease:t})}this.moving=!1,this.moving_idx=void 0,this.code=void 0,this.offset=void 0}}}},y=_,b=(n("e07e"),Object(i["a"])(y,v,h,!1,null,"fd4794c4",null));b.options.__file="EditSVG.vue";var w=b.exports;s["a"].use(u["a"]);var C=new u["a"]({mode:"history",base:"/",routes:[{path:"/",name:"edit-svg",component:w}]}),X=n("2f62");s["a"].use(X["a"]);var Y=new X["a"].Store({state:{},mutations:{},actions:{}});n("ab8b");s["a"].config.productionTip=!1,new s["a"]({router:C,store:Y,render:function(t){return t(c)}}).$mount("#app")},"64a9":function(t,e,n){},"78e1":function(t,e,n){},e07e:function(t,e,n){"use strict";var s=n("78e1"),a=n.n(s);a.a}});
//# sourceMappingURL=app.7a28a558.js.map