"use strict";(self.webpackChunkant_design_pro=self.webpackChunkant_design_pro||[]).push([[222],{59591:function(M,o,t){t.r(o);var s=t(2618),d=t(11774),c=t(49100),E=t(9927),f=t(42075),D=t(67294),n=t(85893),h=function(e){var u=Math.floor(e/3600),l=Math.floor(e%3600/60),r=e%60,a="";return u>0&&(a+=u+"h"),l>0&&(a+=l+"m"),(r>0||a==="")&&(a+=r+"s"),a},v=function(){var e=(0,D.useRef)(),u={ANSWERED:{text:"\u5DF2\u63A5\u901A",status:"Success"},"NO ANSWER":{text:"\u672A\u63A5\u901A",status:"Error"},BUSY:{text:"\u5FD9\u788C\u4E2D",status:"Warning"}},l=(0,E.useIntl)(),r=[{title:"\u6A21\u5757\u540D\u79F0",dataIndex:"name"},{title:"\u6A21\u5757\u63CF\u8FF0",dataIndex:"description",search:!1},{title:"\u6A21\u5757\u7EA7\u522B",dataIndex:"support_level"},{title:"\u4F7F\u7528\u6570\u91CF",dataIndex:"use_count",search:!1},{title:"\u72B6\u6001",dataIndex:"status",search:!1},{title:"\u64CD\u4F5C",dataIndex:"option",valueType:"option",render:function(m,i){return i.status==="Running"?(0,n.jsxs)(f.Z,{children:[(0,n.jsx)("a",{onClick:function(){return(0,s.dJ)(i.name)},style:{color:"red"},children:"\u5378\u8F7D"},"unload"),(0,n.jsx)("a",{onClick:function(){return(0,s.VM)(i.name)},children:"\u91CD\u8F7D"},"reload")]}):(0,n.jsx)("a",{onClick:function(){return(0,s.$y)(i.name)},children:"\u52A0\u8F7D"},"load")}}];return(0,n.jsx)(d._z,{children:(0,n.jsx)(c.Z,{headerTitle:"\u7CFB\u7EDF\u6A21\u5757",actionRef:e,rowKey:"id",pagination:!1,search:{labelWidth:120},request:s.in,columns:r})})};o.default=v}}]);