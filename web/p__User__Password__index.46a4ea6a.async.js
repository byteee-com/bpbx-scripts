"use strict";(self.webpackChunkant_design_pro=self.webpackChunkant_design_pro||[]).push([[307],{5966:function(j,i,e){var P=e(1413),p=e(91),c=e(67294),a=e(19323),E=e(85893),m=["fieldProps","proFieldProps"],M=["fieldProps","proFieldProps"],l="text",O=function(s){var _=s.fieldProps,t=s.proFieldProps,u=(0,p.Z)(s,m);return(0,E.jsx)(a.Z,(0,P.Z)({valueType:l,fieldProps:_,filedConfig:{valueType:l},proFieldProps:t},u))},d=function(s){var _=s.fieldProps,t=s.proFieldProps,u=(0,p.Z)(s,M);return(0,E.jsx)(a.Z,(0,P.Z)({valueType:"password",fieldProps:_,proFieldProps:t,filedConfig:{valueType:l}},u))},n=O;n.Password=d,n.displayName="ProFormComponent",i.Z=n},23659:function(j,i,e){e.r(i);var P=e(27424),p=e.n(P),c=e(17061),a=e.n(c),E=e(17156),m=e.n(E),M=e(2618),l=e(11774),O=e(34994),d=e(5966),n=e(9927),C=e(45360),s=e(67294),_=e(85893),t=function(){var U=m()(a()().mark(function f(v){return a()().wrap(function(r){for(;;)switch(r.prev=r.next){case 0:return r.prev=0,r.next=3,(0,M.ZU)(v);case 3:C.ZP.success("\u66F4\u65B0\u6210\u529F"),localStorage.removeItem("token"),n.history.push("/user/login"),r.next=10;break;case 8:r.prev=8,r.t0=r.catch(0);case 10:case"end":return r.stop()}},f,null,[[0,8]])}));return function(v){return U.apply(this,arguments)}}(),u=function(){var f=(0,n.useIntl)(),v=(0,s.useState)(!1),h=p()(v,2),r=h[0],A=h[1];return(0,_.jsx)(l._z,{children:(0,_.jsxs)(O.A,{onFinish:function(){var T=m()(a()().mark(function D(b){return a()().wrap(function(o){for(;;)switch(o.prev=o.next){case 0:t(b);case 1:case"end":return o.stop()}},D)}));return function(D){return T.apply(this,arguments)}}(),children:[(0,_.jsx)(d.Z.Password,{width:"md",name:"oldPassword",required:!0,label:"\u539F\u5BC6\u7801",rules:[{required:!0,message:"\u8BF7\u8F93\u5165\u539F\u5BC6\u7801"}]}),(0,_.jsx)(d.Z.Password,{width:"md",name:"newPassword",required:!0,label:"\u65B0\u5BC6\u7801",rules:[{required:!0,message:"\u8BF7\u8F93\u5165\u65B0\u5BC6\u7801"},{min:6,message:"\u5BC6\u7801\u4E0D\u5F97\u5C11\u4E8E6\u4F4D"}]}),(0,_.jsx)(d.Z.Password,{width:"md",name:"newPasswordConfirm",required:!0,label:"\u786E\u8BA4\u5BC6\u7801",rules:[{required:!0,message:"\u8BF7\u8F93\u5165\u5BC6\u7801"},function(T){var D=T.getFieldValue;return{validator:function(B,o){return!o||D("newPassword")===o?Promise.resolve():Promise.reject("\u4E24\u6B21\u5BC6\u7801\u8F93\u5165\u4E0D\u4E00\u81F4")}}}]})]})})};i.default=u}}]);
