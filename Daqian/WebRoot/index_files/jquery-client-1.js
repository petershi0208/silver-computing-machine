// /////////////////////////////////////////////////////hai//////////////////////////////////////////////
var j_domain = window.location.host; // 访问地址
(function() {
	$(document)
			.ready(
					function() {

						var stringify = (function() {
							var f = {
								"\b" : "\\b",
								"\t" : "\\t",
								"\n" : "\\n",
								"\f" : "\\f",
								"\r" : "\\r",
								'"' : '\\"',
								"\\" : "\\\\"
							};
							function g(a) {
								if (/["\\\x00-\x1f]/.test(a)) {
									a = a
											.replace(
													/["\\\x00-\x1f]/g,
													function(c) {
														var b = f[c];
														if (b) {
															return b;
														}
														b = c.charCodeAt();
														return "\\u00"
																+ Math
																		.floor(
																				b / 16)
																		.toString(
																				16)
																+ (b % 16)
																		.toString(16);
													});
								}
								return '"' + a + '"';
							}
							function i(a) {
								var e = [ "[" ], d = a.length, l, c, b;
								for (c = 0; c < d; c++) {
									b = a[c];
									switch (typeof b) {
									case "undefined":
									case "function":
									case "unknown":
										break;
									default:
										if (l) {
											e.push(",")
										}
										e.push(stringify(b));
										l = 1
									}
								}
								e.push("]");
								return e.join("");
							}
							function j(a) {
								return a < 10 ? "0" + a : a;
							}
							function h(a) {
								return '"' + a.getFullYear() + "-"
										+ j(a.getMonth() + 1) + "-"
										+ j(a.getDate()) + "T"
										+ j(a.getHours()) + ":"
										+ j(a.getMinutes()) + ":"
										+ j(a.getSeconds()) + '"';
							}
							return function(a) {
								switch (typeof a) {
								case "undefined":
									return "undefined";
								case "number":
									return isFinite(a) ? String(a) : "null";
								case "string":
									return g(a);
								case "boolean":
									return String(a);
								default:
									if (a === null) {
										return "null";
									} else {
										if (a instanceof Array) {
											return i(a);
										} else {
											if (a instanceof Date) {
												return h(a);
											} else {
												var e = [ "{" ], b = stringify, l, c;
												for ( var d in a) {
													if (Object.prototype.hasOwnProperty
															.call(a, d)) {
														c = a[d];
														switch (typeof c) {
														case "undefined":
														case "unknown":
														case "function":
															break;
														default:
															if (l) {
																e.push(",");
															}
															l = 1;
															e.push(b(d) + ":"
																	+ b(c));
														}
													}
												}
												e.push("}");
												return e.join("");
											}
										}
									}
								}
							};
						})();
						/* detect a dollar object or create one if not found */
						$ = window.jQuery || window.$
								|| (window.$ = {});

						/* check for a JSON handling support */
						if (/* @cc_on!@ */0) {
							JSON = {
								parse : function(b) {
									return (new Function("return " + b))();
								},
								stringify : stringify
							};
						} else {
							JSON = {
								parse : window.JSON
										&& (window.JSON.parse || window.JSON.decode)
										|| String.prototype.evalJSON
										&& function(str) {
											return String(str).evalJSON();
										} || $.parseJSON
										|| $.evalJSON,
								stringify : Object.toJSON
										|| window.JSON
										&& (window.JSON.stringify || window.JSON.encode)
										|| stringify
							};
						}

						var userAgent = "",
						/* 组织userAgent的数据集 */
						userAgent_Data = {},

						/* 正则表达式 */
						reg_Exp = "",

						/* 是否是移动终端 */
						is_mobile = false,

						/* 移动终端的类型集合 */
						mobile_type_arr = [ "ipad", "ipod", "iphone", "ios",
								"ios", "android", "backerry", "webos",
								"symbian", "windows phone", "phone",
								"blackberry" ],

						/* 移动终端浏览器集合 */
						mobile_pc_browser_json = {
							micromessenger : "微信",
							ucbrowser : "UC",
							qqbrowser : "QQ",
							opera : "Opera",
							baidubrowser : "百度",
							firefox : "火狐",
							maxthon : "傲游",
							xiaomi : "小米手机",
							android : "android内置",
							iphone : "iphone内置 ",
							ipod : "opod内置",
							ipad : "ipad内置"
						},

						/* PC终端浏览器集合 */
						pc_browser_json = {
							opera : "Opera",
							maxthon : "傲游",
							tencenttraveler : "TT",
							theworld : "天天",
							lbbrowser : "猎豹",
							chrome : "Chrome",
							firefox : "Firefox",
							msie : "IE",
							safari : "Safari"
						};

						// is_Mobile
						function is_Mobile() {
							reg_Exp = /(iPhone|iPod|Android|ios|iOS|iPad|Backerry|WebOS|Symbian|Windows Phone|Phone|BlackBerry)/i;
							if (userAgent.match(reg_Exp) != null) {
								is_mobile = true;
							} else {
								is_mobile = false;
							}
						}

						// 检查terminal是移动还是pc
						function _checkoutterminal() {
							if (is_mobile) {
								userAgent_Data["terminal_Type"] = "移动";
							} else {
								userAgent_Data["terminal_Type"] = "PC";
							}
						}
						;

						// 判断移动终端类型的判断
						function _mobileType() {
							if (is_mobile) {
								for ( var i = 0; i < mobile_type_arr.length; i++) {
									if (userAgent.indexOf(mobile_type_arr[i]) > -1) {
										userAgent_Data["terminal_system"] = mobile_type_arr[i];
										break;
									}
								}
								if (null == userAgent_Data["terminal_system"]
										|| "" == userAgent_Data["terminal_system"]) {
									userAgent_Data["terminal_system"] = "未知";
								}
							}
						}
						;

						// 获取PC终端系统版本
						function _pc_os() {
							if (!is_mobile) {
								var isWin = (navigator.platform == "Win32")
										|| (navigator.platform == "Windows");
								var isMac = (navigator.platform == "Mac68K")
										|| (navigator.platform == "MacPPC")
										|| (navigator.platform == "Macintosh")
										|| (navigator.platform == "MacIntel");
								if (isMac)
									return "Mac";
								var isUnix = (navigator.platform == "X11")
										&& !isWin && !isMac;
								if (isUnix)
									return "Unix";
								var isLinux = (String(navigator.platform)
										.indexOf("Linux") > -1);
								if (isLinux)
									return "Linux";
								if (isWin) {
									var isWin2K = userAgent
											.indexOf("windows nt 5.0") > -1
											|| userAgent
													.indexOf("windows 2000") > -1;
									if (isWin2K)
										return "Win2000";
									var isWinXP = userAgent
											.indexOf("windows nt 5.1") > -1
											|| userAgent.indexOf("windows xp") > -1;
									if (isWinXP)
										return "WinXP";
									var isWin2003 = userAgent
											.indexOf("windows nt 5.2") > -1
											|| userAgent
													.indexOf("windows 2003") > -1;
									if (isWin2003)
										return "Win2003";
									var isWinVista = userAgent
											.indexOf("windows nt 6.0") > -1
											|| userAgent
													.indexOf("windows vista") > -1;
									if (isWinVista)
										return "WinVista";
									var isWin7 = userAgent
											.indexOf("windows nt 6.1") > -1
											|| userAgent.indexOf("windows 7") > -1;
									if (isWin7)
										return "Win7";
									var isWin8 = userAgent
											.indexOf("windows nt 6.2") > -1
											|| userAgent.indexOf("windows 7") > -1;
									if (isWin8)
										return "Win8";
								}
								return "未知";
							}
						}
						;

						function _pc_Os() {
							if (!is_mobile) {
								userAgent_Data["terminal_system"] = _pc_os();
							}
						}

						// 判断pc浏览器类型
						function _pc_browser() {
							if (!is_mobile) {
								for ( var i in pc_browser_json) {
									if (userAgent.indexOf(i) > -1) {
										userAgent_Data["browser_type"] = pc_browser_json[i];
										break;
									}
								}
								if (null == userAgent_Data["browser_type"]
										|| "" == userAgent_Data["browser_type"]) {
									userAgent_Data["browser_type"] = "未知";
								}
							}
						}

						// 判断moblie浏览器类型
						function _moblie_browser() {
							if (is_mobile) {
								for ( var i in mobile_pc_browser_json) {
									if (userAgent.indexOf(i) > -1) {
										userAgent_Data["browser_type"] = mobile_pc_browser_json[i];
										break;
									}
								}
								if (null == userAgent_Data["browser_type"]
										|| "" == userAgent_Data["browser_type"]) {
									userAgent_Data["browser_type"] = "未知";
								}
							}
						}

						// 获取Flash版本
						function _getFlash_version() {
							var f = "-", n = navigator;
							if (n.plugins && n.plugins.length) {
								for ( var ii = 0; ii < n.plugins.length; ii++) {
									if (n.plugins[ii].name
											.indexOf('Shockwave Flash') != -1) {
										f = n.plugins[ii].description
												.split('Shockwave Flash ')[1];
										break;
									}
								}
							} else if (window.ActiveXObject) {
								for ( var ii = 10; ii >= 2; ii--) {
									try {
										var fl = eval("new ActiveXObject('ShockwaveFlash.ShockwaveFlash."
												+ ii + "');");
										if (fl) {
											f = ii + '.0';
											break;
										}
									} catch (e) {
									}
								}
							}
							userAgent_Data["flash_version"] = f;
						}
						function getFunObj() {
							var _jStorage = {};
							var _f = {};
							var ie = !!window.ActiveXObject;
							var ie6 = ie && !window.XMLHttpRequest;
							if (ie6) { // 如果是IE6
								_f = {
									get : function(k) {
										_jStorage = document.cookie.split("; ");
										for ( var i = 0; i < _jStorage.length; i++) {
											var aCrumb = _jStorage[i]
													.split("=");
											if (k == aCrumb[0])
												return decodeURIComponent(aCrumb[1]);
										}
										return null;
										;
									},
									set : function(k, v) {
										var expires = new Date();
										expires.setTime(expires.getTime()
												+ 3600 * 24 * 365 * 1000);
										document.cookie = k + "="
												+ encodeURIComponent(v)
												+ "; expires="
												+ expires.toGMTString()
												+ "; path=/";
									}
								};

							} else {

								if (window["localStorage"]) {
									_jStorage = window["localStorage"];
									_f = {
										get : function(k) {
											var itemVal;
											if (_jStorage.getItem(k)) {
												itemVal = decodeURIComponent(_jStorage
														.getItem(k));
											}
											return itemVal;

										},
										set : function(k, v) {
											_jStorage.setItem(k,
													encodeURIComponent(v));
										}
									};
								} else {
									_f = {
										get : function(k) {
											_jStorage = document.cookie
													.split("; ");
											for ( var i = 0; i < _jStorage.length; i++) {
												var aCrumb = _jStorage[i]
														.split("=");
												if (k == aCrumb[0]) {
													if (aCrumb[1]) {
														return decodeURIComponent(aCrumb[1]);
													}
												}

											}
											return null;
											;
										},
										set : function(k, v) {
											var expires = new Date();
											expires.setTime(expires.getTime()
													+ 3600 * 24 * 365 * 1000);
											document.cookie = k + "="
													+ encodeURIComponent(v)
													+ "; expires="
													+ expires.toGMTString()
													+ "; path=/";
										}
									};
								}
							}

							return _f;
						}

						/**
						 * 读取cookie
						 */
						function readCookie(name) {
							var nameEQ = name + "=";
							var ca = document.cookie.split(';');
							for ( var i = 0; i < ca.length; i++) {
								var c = ca[i];
								while (c.charAt(0) == ' ')
									c = c.substring(1, c.length);
								if (c.indexOf(nameEQ) == 0)
									return c.substring(nameEQ.length, c.length);
							}
							return null;
						}

						/* js对外的接口 */
						$.agentManager = {
							getLocalUserAgentMsg : function() {
								userAgent_Data = {};
								userAgent = navigator.userAgent.toLowerCase();
								_init();
								return userAgent_Data;
							},
							getUserAgentByStr : function(str) {
								userAgent_Data = {};
								userAgent = str;
								_init();
								return userAgent_Data;
							}
						};

						$.jStorage = {
							get : function(k) {
								var _get = getFunObj();
								return _get.get(k);
							},
							set : function(k, v) {
								var _set = getFunObj();
								_set.set(k, v);
							}
						};

						// 初始化数据
						function _init() {
							is_Mobile();
							_checkoutterminal();
							_mobileType();
							_pc_Os();
							_pc_browser();
							_moblie_browser();
							_getFlash_version();

						}
						;
						var
						/* 唯一标识 */
						pageId = "",
						/* 操作系统 */
						system = "",
						/* 系统分辨率 */
						sysResolution = "",
						/* 浏览器 */
						browser = "",
						/* 用户id */
						visitorId = "",
						/* 当前页面 */
						currentPage = window.location.href.replace(/[&]/g,
								"%26"),
						/* 来源页面url */
						fromPage = document.referrer.replace(/[&]/g, "%26"),
						/* 关键字 */
						keyWords = "",
						/* 搜索引擎 */
						searchEngine = "",
						/* 当前页面标题 */
						title = document.title,
						/* flash版本 */
						flashVersions = "",
						/* 终端类型 */
						terminal = "",
						/* 网站cookie */
						websiteCookie = document.cookie;

						// 获取系统时间
						function getSysTime() {
							var sysTime = new Date(), year = sysTime
									.getFullYear(), month = sysTime.getMonth() + 1, day = sysTime
									.getDate(), hours = sysTime.getHours(), minutes = sysTime
									.getMinutes(), seconds = sysTime
									.getSeconds(), timeStr = year + "-" + month
									+ "-" + day + " " + hours + ":" + minutes
									+ ":" + seconds;
							return timeStr;
						}
						// 获取uid
						function getUid() {
							var time = new Date();
							pageId = visitorId + "_" + time.getTime();
						}
						// 获取系统信息
						function _systemInfo() {
							var agentData = $.agentManager
									.getLocalUserAgentMsg();
							system = agentData.terminal_system;
							sysResolution = window.screen.width + "×"
									+ window.screen.height;
							browser = agentData.browser_type;
							flashVersions = agentData.flash_version;
							terminal = agentData.terminal_Type;
						}

						// 获取索搜引擎
						function _gesearchEngine() {
							var searchEngineobj = {
								baidu : "百度",
								google : "谷歌",
								sogou : "搜狗",
								soso : "腾讯soso",
								yahoo : "雅虎",
								youdao : "网易有道",
								bing : "必应"
							}, keyword_pram = {
								baidu : "wd",
								google : "q",
								sogou : "query",
								soso : "query",
								yahoo : "p",
								youdao : "q",
								bing : "q"
							}, referrer = decodeURI(document.referrer), referrer_arr = referrer
									.split("&"), referrer_ = referrer
									.split("?")[0];
							for ( var i in searchEngineobj) {
								if (referrer_.indexOf(i) > -1) {
									searchEngine = searchEngineobj[i];
									for ( var j = 0; j < referrer_arr.length; j++) {
										if (referrer_arr[j]
												.indexOf(keyword_pram[i]) > -1) {
											keyWords = referrer_arr[j]
													.split("=")[1];
											break;
										}
									}
								}
							}
						}
						function UUID() {
							this.id = this.createUUID();
						}
						UUID.prototype.valueOf = function() {
							return this.id;
						};
						UUID.prototype.toString = function() {
							return this.id;
						};

						//
						// INSTANCE SPECIFIC METHODS
						//
						UUID.prototype.createUUID = function() {
							//
							// Loose interpretation of the specification DCE
							// 1.1: Remote Procedure
							// Call
							// since JavaScript doesn't allow access to internal
							// systems, the last
							// 48 bits
							// of the node section is made up using a series of
							// random numbers (6
							// octets long).
							// 
							var dg = new Date(1582, 10, 15, 0, 0, 0, 0);
							var dc = new Date();
							var t = dc.getTime() - dg.getTime();
							var tl = UUID.getIntegerBits(t, 0, 31);
							var tm = UUID.getIntegerBits(t, 32, 47);
							var thv = UUID.getIntegerBits(t, 48, 59) + '1'; // version
							// 1,
							// security
							// version is 2
							var csar = UUID.getIntegerBits(UUID.rand(4095), 0,
									7);
							var csl = UUID
									.getIntegerBits(UUID.rand(4095), 0, 7);

							// since detection of anything about the
							// machine/browser is far to
							// buggy,
							// include some more random numbers here
							// if NIC or an IP can be obtained reliably, that
							// should be put in
							// here instead.
							var n = UUID.getIntegerBits(UUID.rand(8191), 0, 7)
									+ UUID.getIntegerBits(UUID.rand(8191), 8,
											15)
									+ UUID
											.getIntegerBits(UUID.rand(8191), 0,
													7)
									+ UUID.getIntegerBits(UUID.rand(8191), 8,
											15)
									+ UUID.getIntegerBits(UUID.rand(8191), 0,
											15); // this last
							// number is two
							// octets long
							return tl + tm + thv + csar + csl + n;
						};

						// Pull out only certain bits from a very large integer,
						// used to get the
						// time
						// code information for the first part of a UUID. Will
						// return zero's if
						// there
						// aren't enough bits to shift where it needs to.
						UUID.getIntegerBits = function(val, start, end) {
							var base16 = UUID.returnBase(val, 16);
							var quadArray = new Array();
							var quadString = '';
							var i = 0;
							for (i = 0; i < base16.length; i++) {
								quadArray.push(base16.substring(i, i + 1));
							}
							for (i = Math.floor(start / 4); i <= Math
									.floor(end / 4); i++) {
								if (!quadArray[i] || quadArray[i] == '')
									quadString += '0';
								else
									quadString += quadArray[i];
							}
							return quadString;
						};

						// Replaced from the original function to leverage the
						// built in methods in
						// JavaScript. Thanks to Robert Kieffer for pointing
						// this one out
						UUID.returnBase = function(number, base) {
							return (number).toString(base).toUpperCase();
						};

						// pick a random number within a range of numbers
						// int b rand(int a); where 0 <= b <= a
						UUID.rand = function(max) {
							return Math.floor(Math.random() * (max + 1));
						};
						// 获取访客信息
						function getVisitorInfoStr() {
							visitorId = $.jStorage.get("visitorId");
							if (visitorId) {
								// getUid(); // 初始化uid（当前页面唯一id）信息
								// sendMsg(getParam()); // 发送信息
							} else { // 维持心跳
								visitorId = new UUID();
								$.jStorage.set("visitorId",
										visitorId);
							}
							getUid(); // 初始化uid（当前页面唯一id）信息
							sendMsg(getParam()); //每个页面只加载一次
							/*setInterval(function() {
								sendMsg(getParam());
							}, 30000);*/

						}

						// 获取发送的参数
						function getParam() {
							var systemInfo = {}, pageInfo = {}, visitorInfo = {};
							/* 系统信息 */
							systemInfo["system"] = system;
							systemInfo["sysResolution"] = sysResolution;
							systemInfo["browser"] = browser;
							systemInfo = encodeURI(JSON.stringify(systemInfo));
							/* 页面信息 */
							pageInfo["currentPage"] = currentPage;
							pageInfo["fromPage"] = fromPage;
							pageInfo["keyWords"] = keyWords;
							pageInfo["searchEngine"] = searchEngine;
							pageInfo["title"] = title;
							pageInfo["flashVersions"] = flashVersions;
							pageInfo["terminal"] = terminal;
							pageInfo["websiteCookie"] = websiteCookie;
							pageInfo = encodeURI(JSON.stringify(pageInfo));
							/* 访客信息 */
							visitorInfo["visitorId"] = visitorId;
							visitorInfo = JSON.stringify(visitorInfo);

							var param = "pageId=" + pageId + "&visitorId="
									+ visitorId + "&systemInfo=" + systemInfo
									+ "&pageInfo=" + pageInfo + "&visitorInfo="
									+ visitorInfo;
							return encodeURI(param);
						}

						// 发送消息
						function sendMsg(param) {
							if (null != visitorId && "" != visitorId) {
								try {
									$.ajax({
												timeout : 3000,
												type : "post",
												async : false,
												url : 'http://'
														+ j_domain
														+ '/webApplicationUserData/monitorService',
												data: param,
												dataType : "jsonp",
												jsonp : "monitor", // 服务端用于接收callback调用的function名的参数
												jsonpCallback : "success_jsonpCallback"// callback的function名称
											});
								} catch (e) {

								}
							}

						}

						// 将监控信息保存至flashCookie
						function saveMonitorInfo() {
							var monitorInfo = {};
							monitorInfo["system"] = system;
							monitorInfo["sysResolution"] = sysResolution;
							monitorInfo["browser"] = browser;
							monitorInfo["visitorId"] = visitorId;
							monitorInfo["currentPage"] = currentPage;
							monitorInfo["fromPage"] = fromPage;
							monitorInfo["keyWords"] = keyWords;
							monitorInfo["system"] = system;
							monitorInfo["searchEngine"] = searchEngine;
							monitorInfo["title"] = title;
							monitorInfo["flashVersions"] = flashVersions;
							monitorInfo["terminal"] = terminal;
							$.jStorage.set("monitorInfo", JSON
									.stringify(monitorInfo));
						}

						function init() { // init初始化又先后顺序
							_systemInfo(); // 初始化系统信息
							_gesearchEngine(); // 初始化搜索引擎及关键字信息
							getVisitorInfoStr(); // 初始化访客ID信息
							saveMonitorInfo(); // 保存访客信息
						}

						init();

					});

})();
