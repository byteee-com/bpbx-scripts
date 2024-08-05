"use strict";(self.webpackChunkant_design_pro=self.webpackChunkant_design_pro||[]).push([[326],{56717:function(S,P,n){var M=n(1413),o=n(67294),b=n(93696),m=n(91146),D=function(R,p){return o.createElement(m.Z,(0,M.Z)((0,M.Z)({},R),{},{ref:p,icon:b.Z}))};D.displayName="InfoCircleOutlined",P.Z=o.forwardRef(D)},95461:function(S,P,n){n.r(P);var M=n(27424),o=n.n(M),b=n(42122),m=n.n(b),D=n(17061),t=n.n(D),R=n(17156),p=n.n(R),L=n(2618),K=n(56717),W=n(90930),Z=n(18562),y=n(37476),w=n(9927),F=n(67757),u=n(2453),z=n(86738),N=n(14726),v=n(67294),_=n(85893),$=F.Z.Dragger,G={name:"file",multiple:!1,action:"/api/sound/upload",accept:".gsm,.wav,.mp3",headers:{authorization:"Bearer "+localStorage.getItem("token")},onChange:function(){var i=p()(t()().mark(function s(r){var d;return t()().wrap(function(h){for(;;)switch(h.prev=h.next){case 0:d=r.file.status,d!=="uploading"&&console.log(r.file,r.fileList),d==="done"?r.file.response.success?u.ZP.success("\u4E0A\u4F20\u6210\u529F"):u.ZP.error(r.file.response.msg):d==="error"&&u.ZP.error("".concat(r.file.name," file upload failed."));case 3:case"end":return h.stop()}},s)}));function a(s){return i.apply(this,arguments)}return a}(),onDrop:function(a){console.log("Dropped files",a.dataTransfer.files)}},V=function(){var i=p()(t()().mark(function a(s){var r;return t()().wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return r=u.ZP.loading("\u6B63\u5728\u6DFB\u52A0"),e.prev=1,e.next=4,uaNodeSubscription(m()({},s));case 4:return r(),u.ZP.success("\u6DFB\u52A0\u6210\u529F"),e.abrupt("return",!0);case 9:return e.prev=9,e.t0=e.catch(1),r(),u.ZP.error("\u6DFB\u52A0\u5931\u8D25"),e.abrupt("return",!1);case 14:case"end":return e.stop()}},a,null,[[1,9]])}));return function(s){return i.apply(this,arguments)}}(),re=null,Y=function(){var i=p()(t()().mark(function a(s){var r;return t()().wrap(function(e){for(;;)switch(e.prev=e.next){case 0:return r=u.ZP.loading("\u6B63\u5728\u5220\u9664"),e.prev=1,e.next=4,removeExtension(s);case 4:return r(),u.ZP.success("\u5220\u9664\u6210\u529F"),e.abrupt("return",!0);case 9:return e.prev=9,e.t0=e.catch(1),r(),u.ZP.error("\u5220\u9664\u5931\u8D25"),e.abrupt("return",!1);case 14:case"end":return e.stop()}},a,null,[[1,9]])}));return function(s){return i.apply(this,arguments)}}(),H=function(){var a=(0,v.useState)(!1),s=o()(a,2),r=s[0],d=s[1],e=(0,v.useRef)(),h=(0,v.useState)(),T=o()(h,2),O=T[0],J=T[1],Q=(0,v.useState)(!1),U=o()(Q,2),X=U[0],j=U[1],k=(0,v.useState)([]),B=o()(k,2),ae=B[0],se=B[1],q=(0,v.useState)(!1),A=o()(q,2),te=A[0],ee=A[1],x=(0,w.useIntl)(),ne=[{title:"\u6587\u4EF6\u540D\u79F0",dataIndex:"name",search:!1},{title:"\u6587\u4EF6\u5927\u5C0F",dataIndex:"size",search:!1},{title:"\u6700\u540E\u4FEE\u6539\u65F6\u95F4",dataIndex:"lastModified",search:!1},{title:"\u64CD\u4F5C",dataIndex:"option",valueType:"option",render:function(c,f){return[(0,_.jsx)(z.Z,{title:"\u786E\u8BA4\u5220\u9664",description:"\u6570\u636E\u5220\u9664\u540E\u5C06\u65E0\u6CD5\u6062\u590D",onConfirm:p()(t()().mark(function g(){var I,l;return t()().wrap(function(E){for(;;)switch(E.prev=E.next){case 0:if(f!=null&&f.id){E.next=2;break}return E.abrupt("return");case 2:return E.next=4,Y(f.id);case 4:I=E.sent,I?(u.ZP.success("\u5220\u9664\u6210\u529F"),(l=e.current)===null||l===void 0||l.reload()):u.ZP.error("\u5220\u9664");case 6:case"end":return E.stop()}},g)})),okText:x.formatMessage({id:"pages.confirm",defaultMessage:"\u786E\u5B9A"}),cancelText:x.formatMessage({id:"pages.cancel",defaultMessage:"\u53D6\u6D88"}),children:(0,_.jsx)("a",{className:"text-danger",children:"\u5220\u9664"},"delete")})]}}];return(0,_.jsxs)(W._z,{children:[(0,_.jsx)(Z.Z,{headerTitle:"\u6587\u4EF6\u5217\u8868",actionRef:e,rowKey:"uuid",search:!1,toolBarRender:function(){return[(0,_.jsx)(N.ZP,{type:"primary",onClick:function(){j(!0)},children:"\u4E0A\u4F20"},"primary")]},request:L.Tk,pagination:!1,columns:ne}),(0,_.jsx)(y.Y,{title:"\u4E0A\u4F20\u6587\u4EF6",width:"600px",open:X,onOpenChange:j,modalProps:{destroyOnClose:!0,onCancel:function(){var c;e==null||(c=e.current)===null||c===void 0||c.reload()}},initialValues:O,onFinish:function(){var C=p()(t()().mark(function c(f){var g;return t()().wrap(function(l){for(;;)switch(l.prev=l.next){case 0:return f.serverId=O==null?void 0:O.serverId,l.next=3,V(f);case 3:g=l.sent,g&&(J(void 0),ee(!1),e.current&&e.current.reload());case 5:case"end":return l.stop()}},c)}));return function(c){return C.apply(this,arguments)}}(),children:(0,_.jsxs)($,m()(m()({},G),{},{children:[(0,_.jsx)("p",{className:"ant-upload-drag-icon",children:(0,_.jsx)(K.Z,{})}),(0,_.jsx)("p",{className:"ant-upload-text",children:"\u70B9\u51FB\u6587\u4EF6\u4E0A\u4F20\u6216\u62D6\u62FD\u6587\u4EF6\u5230\u6B64"}),(0,_.jsx)("p",{className:"ant-upload-hint",children:"\u4EC5\u652F\u6301GSM/WAV/MP3\u6587\u4EF6,\u5355\u6587\u4EF6\u4E0D\u8D85\u8FC78Mb."})]}))})]})};P.default=H}}]);