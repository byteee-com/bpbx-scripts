"use strict";(self.webpackChunkant_design_pro=self.webpackChunkant_design_pro||[]).push([[366],{5966:function(ee,O,e){var E=e(1413),h=e(91),Y=e(67294),p=e(19323),A=e(85893),j=["fieldProps","proFieldProps"],U=["fieldProps","proFieldProps"],x="text",b=function(s){var Z=s.fieldProps,T=s.proFieldProps,F=(0,h.Z)(s,j);return(0,A.jsx)(p.Z,(0,E.Z)({valueType:x,fieldProps:Z,filedConfig:{valueType:x},proFieldProps:T},F))},z=function(s){var Z=s.fieldProps,T=s.proFieldProps,F=(0,h.Z)(s,U);return(0,A.jsx)(p.Z,(0,E.Z)({valueType:"password",fieldProps:Z,proFieldProps:T,filedConfig:{valueType:x}},F))},C=b;C.Password=z,C.displayName="ProFormComponent",O.Z=C},78147:function(ee,O,e){e.r(O),e.d(O,{default:function(){return pe}});var E=e(17061),h=e.n(E),Y=e(42122),p=e.n(Y),A=e(17156),j=e.n(A),U=e(27424),x=e.n(U),b=e(99702),z=e(2618),C=e(87547),u=e(1413),s=e(67294),Z={icon:{tag:"svg",attrs:{viewBox:"64 64 896 896",focusable:"false"},children:[{tag:"path",attrs:{d:"M832 464h-68V240c0-70.7-57.3-128-128-128H388c-70.7 0-128 57.3-128 128v224h-68c-17.7 0-32 14.3-32 32v384c0 17.7 14.3 32 32 32h640c17.7 0 32-14.3 32-32V496c0-17.7-14.3-32-32-32zM332 240c0-30.9 25.1-56 56-56h248c30.9 0 56 25.1 56 56v224H332V240zm460 600H232V536h560v304zM484 701v53c0 4.4 3.6 8 8 8h40c4.4 0 8-3.6 8-8v-53a48.01 48.01 0 10-56 0z"}}]},name:"lock",theme:"outlined"},T=Z,F=e(91146),$=function(r,n){return s.createElement(F.Z,(0,u.Z)((0,u.Z)({},r),{},{ref:n,icon:T}))};$.displayName="LockOutlined";var te=s.forwardRef($),ne=e(91),re=e(10915),J=e(94740),ae=e(94184),oe=e.n(ae),ie=e(34994),H=e(4942),se=e(98082),le=function(r){var n;return n={},(0,H.Z)(n,r.componentCls,{"&-container":{display:"flex",flex:"1",flexDirection:"column",height:"100%",paddingInline:32,paddingBlock:24,overflow:"auto",background:"inherit"},"&-top":{textAlign:"center"},"&-header":{display:"flex",alignItems:"center",justifyContent:"center",height:"44px",lineHeight:"44px",a:{textDecoration:"none"}},"&-title":{position:"relative",insetBlockStart:"2px",color:"@heading-color",fontWeight:"600",fontSize:"33px"},"&-logo":{width:"44px",height:"44px",marginInlineEnd:"16px",verticalAlign:"top",img:{width:"100%"}},"&-desc":{marginBlockStart:"12px",marginBlockEnd:"40px",color:r.colorTextSecondary,fontSize:r.fontSize},"&-main":{minWidth:"328px",maxWidth:"580px",margin:"0 auto","&-other":{marginBlockStart:"24px",lineHeight:"22px",textAlign:"start"}}}),(0,H.Z)(n,"@media (min-width: @screen-md-min)",(0,H.Z)({},"".concat(r.componentCls,"-container"),{paddingInline:0,paddingBlockStart:32,paddingBlockEnd:24,backgroundRepeat:"no-repeat",backgroundPosition:"center 110px",backgroundSize:"100%"})),n};function ue(a){return(0,se.Xj)("LoginForm",function(r){var n=(0,u.Z)((0,u.Z)({},r),{},{componentCls:".".concat(a)});return[le(n)]})}var t=e(85893),ce=["logo","message","contentStyle","title","subTitle","actions","children","containerStyle","otherStyle"];function de(a){var r,n=a.logo,g=a.message,K=a.contentStyle,L=a.title,B=a.subTitle,M=a.actions,_=a.children,N=a.containerStyle,P=a.otherStyle,c=(0,ne.Z)(a,ce),V=(0,re.YB)(),k=c.submitter===!1?!1:(0,u.Z)((0,u.Z)({searchConfig:{submitText:V.getMessage("loginForm.submitText","\u767B\u5F55")}},c.submitter),{},{submitButtonProps:(0,u.Z)({size:"large",style:{width:"100%"}},(r=c.submitter)===null||r===void 0?void 0:r.submitButtonProps),render:function(i,v){var f,o=v.pop();if(typeof(c==null||(f=c.submitter)===null||f===void 0?void 0:f.render)=="function"){var R,X;return c==null||(R=c.submitter)===null||R===void 0||(X=R.render)===null||X===void 0?void 0:X.call(R,i,v)}return o}}),w=(0,s.useContext)(J.ZP.ConfigContext),D=w.getPrefixCls("pro-form-login"),W=ue(D),G=W.wrapSSR,I=W.hashId,l=function(i){return"".concat(D,"-").concat(i," ").concat(I)},d=(0,s.useMemo)(function(){return n?typeof n=="string"?(0,t.jsx)("img",{src:n}):n:null},[n]);return G((0,t.jsxs)("div",{className:oe()(l("container"),I),style:N,children:[(0,t.jsxs)("div",{className:"".concat(l("top")," ").concat(I).trim(),children:[L||d?(0,t.jsxs)("div",{className:"".concat(l("header")),children:[d?(0,t.jsx)("span",{className:l("logo"),children:d}):null,L?(0,t.jsx)("span",{className:l("title"),children:L}):null]}):null,B?(0,t.jsx)("div",{className:l("desc"),children:B}):null]}),(0,t.jsxs)("div",{className:l("main"),style:(0,u.Z)({width:328},K),children:[(0,t.jsxs)(ie.A,(0,u.Z)((0,u.Z)({isKeyPressSubmit:!0},c),{},{submitter:k,children:[g,_]})),M?(0,t.jsx)("div",{className:l("main-other"),style:P,children:M}):null]})]}))}var Q=e(5966),ve=e(28906),y=e(9927),ge=e(38925),q=e(45360),S=e(67610),me=e(73935),xe=function(){var r=useEmotionCss(function(n){var g=n.token;return{marginLeft:"8px",color:"rgba(0, 0, 0, 0.2)",fontSize:"24px",verticalAlign:"middle",cursor:"pointer",transition:"color 0.3s","&:hover":{color:g.colorPrimaryActive}}});return _jsxs(_Fragment,{children:[_jsx(AlipayCircleOutlined,{className:r},"AlipayCircleOutlined"),_jsx(TaobaoCircleOutlined,{className:r},"TaobaoCircleOutlined"),_jsx(WeiboCircleOutlined,{className:r},"WeiboCircleOutlined")]})},ye=function(){var r=useEmotionCss(function(n){var g=n.token;return{width:42,height:42,lineHeight:"42px",position:"fixed",right:16,borderRadius:g.borderRadius,":hover":{backgroundColor:g.colorBgTextHover}}});return _jsx("div",{className:r,"data-lang":!0,children:SelectLang&&_jsx(SelectLang,{})})},fe=function(r){var n=r.content;return(0,t.jsx)(ge.Z,{style:{marginBottom:24},message:n,type:"error",showIcon:!0})},he=function(){var r=(0,s.useState)({}),n=x()(r,2),g=n[0],K=n[1],L=(0,s.useState)("account"),B=x()(L,2),M=B[0],_=B[1],N=(0,y.useModel)("@@initialState"),P=N.initialState,c=N.setInitialState,V=(0,ve.l)(function(){return{display:"flex",flexDirection:"column",height:"100vh",overflow:"auto",backgroundImage:"url('./login_bg.jpg')",backgroundSize:"100% 100%"}}),k=(0,y.useIntl)(),w=function(){var l=j()(h()().mark(function d(){var m,i;return h()().wrap(function(f){for(;;)switch(f.prev=f.next){case 0:return f.next=2,P==null||(m=P.fetchUserInfo)===null||m===void 0?void 0:m.call(P);case 2:i=f.sent,i&&(0,me.flushSync)(function(){c(function(o){return p()(p()({},o),{},{currentUser:i})})});case 4:case"end":return f.stop()}},d)}));return function(){return l.apply(this,arguments)}}(),D=function(){var l=j()(h()().mark(function d(m){var i,v;return h()().wrap(function(o){for(;;)switch(o.prev=o.next){case 0:return o.prev=0,o.next=3,(0,z.x4)(p()(p()({},m),{},{type:M}));case 3:if(i=o.sent,i.status!=="ok"){o.next=12;break}return q.ZP.success("\u767B\u5F55\u6210\u529F"),i.accessToken&&localStorage.setItem("token",i.accessToken),o.next=9,w();case 9:return v=new URL(window.location.href).searchParams,y.history.push(v.get("redirect")||"/"),o.abrupt("return");case 12:console.log(i),K(i),o.next=20;break;case 16:o.prev=16,o.t0=o.catch(0),console.log(o.t0),q.ZP.error("\u767B\u5F55\u5931\u8D25");case 20:case"end":return o.stop()}},d,null,[[0,16]])}));return function(m){return l.apply(this,arguments)}}(),W=g.status,G=g.type,I=g.error;return(0,t.jsx)(J.ZP,{theme:S.Z.colorPrimary?{token:{colorPrimary:S.Z.colorPrimary}}:void 0,children:(0,t.jsxs)("div",{className:V,children:[(0,t.jsx)(y.Helmet,{children:(0,t.jsxs)("title",{children:[k.formatMessage({id:"menu.login",defaultMessage:"\u767B\u5F55\u9875"}),"- ",S.Z.title]})}),(0,t.jsx)("div",{style:{flex:"1",padding:"200px 0"},children:(0,t.jsxs)(de,{contentStyle:{minWidth:280,maxWidth:"75vw"},logo:(0,t.jsx)("img",{alt:"logo",src:"./logo_white.svg"}),title:S.Z===null||S.Z===void 0?void 0:S.Z.title,subTitle:"\u8F7B\u91CF\u7EA7\u7684PBX\u89E3\u51B3\u65B9\u6848",initialValues:{autoLogin:!0},onFinish:function(){var l=j()(h()().mark(function d(m){return h()().wrap(function(v){for(;;)switch(v.prev=v.next){case 0:return v.next=2,D(m);case 2:case"end":return v.stop()}},d)}));return function(d){return l.apply(this,arguments)}}(),children:[W==="error"&&G==="account"&&(0,t.jsx)(fe,{content:I||""}),M==="account"&&(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(Q.Z,{name:"username",fieldProps:{size:"large",prefix:(0,t.jsx)(C.Z,{})},placeholder:"\u7528\u6237\u540D",rules:[{required:!0,message:(0,t.jsx)(y.FormattedMessage,{id:"pages.login.username.required",defaultMessage:"\u8BF7\u8F93\u5165\u7528\u6237\u540D!"})}]}),(0,t.jsx)(Q.Z.Password,{name:"password",fieldProps:{size:"large",prefix:(0,t.jsx)(te,{})},placeholder:"\u5BC6\u7801",rules:[{required:!0,message:(0,t.jsx)(y.FormattedMessage,{id:"pages.login.password.required",defaultMessage:"\u8BF7\u8F93\u5165\u5BC6\u7801\uFF01"})}]})]})]})}),(0,t.jsx)(b.Z,{})]})})},pe=he}}]);
