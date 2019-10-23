Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8122FE146B
	for <lists+linux-clk@lfdr.de>; Wed, 23 Oct 2019 10:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732361AbfJWIho (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 23 Oct 2019 04:37:44 -0400
Received: from mailgate1.rohmeurope.com ([178.15.145.194]:54474 "EHLO
        mailgate1.rohmeurope.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390353AbfJWIho (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Oct 2019 04:37:44 -0400
X-AuditID: c0a8fbf4-199ff70000001fa6-e8-5db0115480f2
Received: from smtp.reu.rohmeu.com (will-cas001.reu.rohmeu.com [192.168.251.177])
        by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id DC.5B.08102.45110BD5; Wed, 23 Oct 2019 10:37:40 +0200 (CEST)
Received: from WILL-MAIL002.REu.RohmEu.com ([fe80::e0c3:e88c:5f22:d174]) by
 WILL-CAS001.REu.RohmEu.com ([fe80::d57e:33d0:7a5d:f0a6%16]) with mapi id
 14.03.0439.000; Wed, 23 Oct 2019 10:37:35 +0200
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "dmurphy@ti.com" <dmurphy@ti.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>
Subject: Re: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Thread-Topic: [RFC PATCH 11/13] led: bd71828: Support LED outputs on ROHM
 BD71828 PMIC
Thread-Index: AQHVhNDGb/Fi3H2tI0CugiKcGY+PyKdevIMAgAXjkICAALrQAIABJcIAgABTx4CAAPqlgA==
Date:   Wed, 23 Oct 2019 08:37:34 +0000
Message-ID: <8974a3974377d0623ed968563b035e701191440e.camel@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <af1fb3e010d5f34502d354369b88fa28639f587d.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
         <c1e41315-42ad-fb9b-c9db-8b07d4293166@ti.com>
         <fbd4960b219099b7a48ef24019ba829f866edb3b.camel@fi.rohmeurope.com>
         <4570db9c-7bc8-f131-269a-248b87e25e38@gmail.com>
         <201df0f7319b94eb581a040a2b1b07dbfed12e94.camel@fi.rohmeurope.com>
         <c5761d78-3334-adaa-b871-cb6da356483b@gmail.com>
In-Reply-To: <c5761d78-3334-adaa-b871-cb6da356483b@gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.255.186.46]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4438D9B668411C498E8BFE5617E538DF@de.rohmeurope.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUwUVxTNm5mdeaBjHyu4T/yonbQ1thHF0vT9QCXRJmOaNk1qpDXZwihT
        diPM4swi2iYuRogIRtH4ORGwCpQIsutWIiIkZgFr11BFETVqm9XVVKKsBpEgBN1hVPj1zr3n
        nnPuj/sgbQ2zidCpuGVVkXIENpa5UDdyeuHqOJ99cb9/PqnuvsGRHf21HHlREWTIgVCYJVUd
        /1hI2eUzFnKnyceQ/wY7AXnZU0KR/aN/UOT5rn8t5M+qUUCutxxlSdOTRkAu1vewpOZmN0WO
        1lxiSHfwa3Iv2MmS4rYOjoz1nmbSEsSGygYgRm4Vc2Jlw2/iOf0eJ/pP7mTFu72trPjXrbOU
        eKhymBLr6oc4ccA/9/vYtVNS10nuTT84s5VFyzKnOLzXA0zeq0dgs397JVUIikKgFMRAjFLw
        QHsRVQpioRX1AlxdEabN4hLAw8/aLKUAQhal4tLbnNGPR0cAbuk8ZTEKGrVy+HB1cNxqOkrH
        A3qEM3A8+hFf9O2mTbwG1w6GxvsM+gTvqj3IGqY8+g7f3575NozGzT0RizETg5biO+33x7UA
        zcE7C/spA9PIhv2Phizm2ghXt16hTZyAHz8Ye9sXcNtwiDH8abQAe1sWmdI03NU1zJr4I7y/
        zFyHR3H47yNhphzM0Ccl6BNqfZJan6TWJ6mPActJgHMlZ0625JaTk1Q5P0l1OXKjz3pXrh+Y
        V/OiGbwOrAoACoIAmAkpIYGXg167ddo6V9YWh6Q5MtT8HFkLAAxpIZ6/u/iU3cpnSVt+lVXX
        O2oWZAQbPz+0125FRtYGWc6T1XfsbAgFzCcjn90ap8rZ8uZfnDnuCZqCMYZ5bGK8JitZsirl
        ux0ZxolkaNEbMaip0dyFhpzX8qTcaNeUBsHnsPxxxXEadlTUHKetjOJS5EQbn2KMImPUka+8
        D+oDNgiE6fw1g50a/TrvffqiEVQ0Yu4HXiPCLU1QiYVgief/mKXfRvLOrvgmfVtzseeCNrT2
        i2uZHzsLhJ8/lJMeDo4EyxtTD7Z4nup6HEUOnag7X6V9CX0nCn6f+WDeyt49ZWIEKis8oZs3
        an9KKjpw5RhVP290hlbcXrLx091XnzZ6v2pXnOF9jZdXdS1fvhXYDnfY+tKfPzuXoHma6LQS
        gdEcUvJntKpJbwDGST9x9wMAAA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

TW9ybmluZyBKYWNlaywNCg0KVGhhbmtzIGZvciB0aGUgcmVwbHkgYWdhaW4uIEkgZGlkIHNvbWUg
Y2xlYW5pbmcgdG8gdGhpcyBtYWlsIGFzIGl0IHdhcw0KZ2V0dGluZyBsZW5ndGh5Lg0KDQpPbiBU
dWUsIDIwMTktMTAtMjIgYXQgMTk6NDAgKzAyMDAsIEphY2VrIEFuYXN6ZXdza2kgd3JvdGU6DQo+
IE1hdHRpLA0KPiANCj4gT24gMTAvMjIvMTkgMjo0MCBQTSwgVmFpdHRpbmVuLCBNYXR0aSB3cm90
ZToNCj4gPiBIZWxsbyBKYWNlaywNCj4gPiANCj4gPiBUaGFua3MgZm9yIHRoZSBjbGFyaWZpY2F0
aW9ucy4gSSB0aGluayBJIG5vdyB1bmRlcnN0YW5kIHRoZSBMRUQNCj4gPiBzdWJzeXN0ZW0gYSBi
aXQgYmV0dGVyIDopDQo+ID4gDQo+ID4gT24gTW9uLCAyMDE5LTEwLTIxIGF0IDIxOjA5ICswMjAw
LCBKYWNlayBBbmFzemV3c2tpIHdyb3RlOg0KPiA+ID4gSGkgTWF0dGksDQo+ID4gPiANCj4gPiA+
IE9uIDEwLzIxLzE5IDEwOjAwIEFNLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOg0KPiA+ID4gPiBI
ZWxsbyBEYW4sDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0
byBjaGVjayBteSBkcml2ZXIgOikgSSB0cnVseQ0KPiA+ID4gPiBhcHByZWNpYXRlDQo+ID4gPiA+
IGFsbA0KPiA+ID4gPiB0aGUgaGVscCENCj4gPiA+ID4gDQo+ID4gPiA+IEEgImZ1bmRhbWVudGFs
IHF1ZXN0aW9uIiByZWdhcmRpbmcgdGhlc2UgcmV2aWV3IGNvbW1lbnRzIGlzDQo+ID4gPiA+IHdo
ZXRoZXINCj4gPiA+ID4gSQ0KPiA+ID4gPiBzaG91bGQgYWRkIERUIGVudHJpZXMgZm9yIHRoZXNl
IExFRHMgb3Igbm90LiBJIHRob3VnaHQgSQ0KPiA+ID4gPiBzaG91bGRuJ3QNCj4gPiA+ID4gYnV0
DQo+ID4gPiA+IEkgd291bGQgbGlrZSB0byBnZXQgYSBjb21tZW50IGZyb20gUm9iIHJlZ2FyZGlu
ZyBpdC4NCj4gPiA+IA0KPiA+ID4gSWYgdGhlIExFRCBjb250cm9sbGVyIGlzIGEgcGFydCBvZiBN
RkQgZGV2aWNlIHByb2JlZCBmcm9tIERUIHRoZW4NCj4gPiA+IHRoZXJlIGlzIG5vIGRvdWJ0IGl0
IHNob3VsZCBoYXZlIGNvcnJlc3BvbmRpbmcgRFQgc3ViLW5vZGUuDQo+ID4gDQo+ID4gU29ycnkg
YnV0IEkgc3RpbGwgc2VlIG5vIG11Y2ggYmVuZWZpdCBmcm9tIGFkZGluZyB0aGlzIGluZm9ybWF0
aW9uDQo+ID4gaW4NCj4gPiBEVC4gV2h5IHNob3VsZCBpdCBoYXZlIGNvcnJlc3BvbmRpbmcgRFQt
bm9kZSBpZiB0aGUgTEVEIHByb3BlcnRpZXMNCj4gPiBhcmUNCj4gPiBmaXhlZCBhbmQgaWYgd2Ug
b25seSB3aXNoIHRvIGFsbG93IHVzZXItc3BhY2UgY29udHJvbCBhbmQgaGF2ZSBubw0KPiA+IGRl
cGVuZGVuY2llcyB0byBvdGhlciBkZXZpY2VzIGluIERUPyANCj4gPiANCj4gPiBJbiB0aGlzIHNw
ZWNpZmljIGNhc2UgdGhlIGluZm9ybWF0aW9uIHdlIGNhbiBwcm92aWRlIGZyb20gRFQgaXMNCj4g
PiBzdXBwb3NlZCB0byBiZSBmaXhlZC4gTm8gYm9hcmQgYmFzZWQgdmFyaWF0aW9uLiBGdXJ0aGVy
bW9yZSwgdGhlcmUNCj4gPiBpcw0KPiA+IG5vdCBtdWNoIGdlbmVyaWMgZHJpdmVyL2xlZCBjb3Jl
IGZ1bmN0aW9uYWxpdHkgd2hpY2ggd291bGQgYmUgYWJsZQ0KPiA+IHRvDQo+ID4gcGFyc2UgYW5k
IHV0aWxpemUgcmVsZXZhbnQgaW5mb3JtYXRpb24gZnJvbSBEVC4gSSB0aGluayB3ZSBjYW4gb25s
eQ0KPiA+IGdpdmUgdGhlIG5hbWUgKGZ1bmN0aW9uKSBhbmQgY29sb3VyLiBBbmQgdGhleSBhcmUg
c3VwcG9zZWQgdG8gYmUNCj4gPiBmaXhlZA0KPiA+IGFuZCB0aHVzIGNvdWxkIGJlIGp1c3QgaGFy
ZC1jb2RlZCBpbiBkcml2ZXIuIEhhcmQtY29kaW5nIHRoZXNlDQo+ID4gd291bGQgYmUNCj4gPiBz
aW1wbGVyIGFuZCBsZXNzIGVycm9yIHByb25lIGZvciB1c2VycyAobm8gRFQgYmluZGluZ3MgdG8g
d3JpdGUpDQo+ID4gYW5kDQo+ID4gc2ltcGxlciB0byBjcmVhdGUgYW5kIHByb2JhYmx5IGFsc28g
dG8gbWFpbnRhaW4gKG5vIHNlcGFyYXRlDQo+ID4gYmluZGluZw0KPiA+IGRvY3VtZW50cyBuZWVk
ZWQgZm9yIExFRHMpLg0KPiANCj4gQUZBSUNTIGl0IGlzIHBvc3NpYmxlIHRvIGNvbm5lY3QgTEVE
IG9mIGFyYml0cmFyeSBjb2xvciB0byB0aGUgaW91dHMNCj4gb2YgdGhpcyBkZXZpY2UuIElmIHRo
aXMgaXMgdGhlIGNhc2UgdGhlbiBpdCBpcyBqdXN0aWZpZWQgdG8gaGF2ZSBEVA0KPiBub2RlIG9u
bHkgdG8gYWxsb3cgZm9yIExFRCBuYW1lIGN1c3RvbWl6YXRpb24uDQoNCkluIHRoZW9yeSwgeWVz
LiBJbiBwcmFjdGljZSAoaWYgSSB1bmRlcnN0YW5kIGl0IGNvcnJlY3RseSkgdGhlIGNvbG9yIGlu
DQp0aGlzIGNhc2UgaXMgb25seSB2aXNpYmxlIGluIHN5c2ZzIHBhdGggbmFtZS4gSSBhbSBub3Qg
YXQgYWxsIHN1cmUgdGhhdA0KcmVmbGVjdGluZyB0aGUgKHVubGlrZWx5KSBjb2xvciBjaGFuZ2Ug
aW4gcGF0aCBuYW1lIGlzIHdvcnRoIHRoZQ0KaGFzc2xlLiBCZXNpZGVzIC0gaWYgdGhpcyBoYXBw
ZW5zLCB0aGVuIHRoZSBkcml2ZXIgYW5kIERUIGNhbiBiZQ0KY2hhbmdlZC4gSXQgaXMgZWFzaWVy
IHRvIGFkZCBEVCBlbnRyaWVzIHRoYW4gcmVtb3ZlIHRoZW0uIElmIHlvdSBzZWUNCnRoZSBjb2xv
ciBjaGFuZ2Ugc3VwcG9ydCBhcyByZWFsbHkgY3J1Y2lhbCAtIHRoZW4gSSBjb3VsZCBldmVuIGNv
bnNpZGVyDQpkZWZhdWx0aW5nIHRoZSBjb2xvdXJzIHRvIGFtYmVyIGFuZCBncmVlbiBpZiBubyBj
b2xvdXIgcHJvcGVydHkgaXMNCnByZXNlbnQgaW4gRFQuIEkgc2VlIG5vIHBvaW50IGluIF9yZXF1
aXJpbmdfIHRoZSBEVCBlbnRyeSB0byBiZSB0aGVyZS4NCklmIHdlIGxpa2UgYmVpbmcgcHJlcGFy
ZWQgZm9yIHRoZSB0aGVvcmV0aWNhbCBwb3NzaWJpbGl0aWVzIC0gd2hhdCBpZg0KeDg2IGlzIHVz
ZWQgdG8gY29udHJvbCB0aGlzIFBNSUM/IEkgZ3Vlc3Mgd2Ugd291bGRuJ3QgaGF2ZSBEVCB0aGVy
ZQ0KdGhlbiAoQW5kIG5vIC0gSSBkb24ndCBzZWUgc3VjaCB1c2UtY2FzZSkuDQoNCj4gPiBCdXQg
YXNzdW1pbmcgdGhpcyBpcyBPayB0byBEVC1mb2xrcyBhbmQgaWYgeW91IGluc2lzdCAtIEkgd2ls
bCBhZGQNCj4gPiBMRUQNCj4gPiBpbmZvcm1hdGlvbiB0byBEVCBmb3IgdGhlIG5leHQgcGF0Y2hl
cy4gSG9wZWZ1bGx5IHRoaXMgZXh0cmENCj4gPiBjb21wbGV4aXR5DQo+ID4gaGVscHMgaW4gc29t
ZSBvZGRiYWxsIHVzZS1jYXNlIHdoaWNoIEkgY2FuJ3QgZm9yZXNlZSA9KQ0KPiA+IA0KPiA+IFRo
ZW4gd2hhdCBjb21lcyB0byB0aGUgRFQgZm9ybWF0Lg0KPiA+IA0KPiA+IERvIHlvdSB0aGluayBM
RUQgc3Vic3lzdGVtIHNob3VsZCB0cnkgdG8gZm9sbG93IHRoZSBjb252ZW50aW9uIHdpdGgNCj4g
PiBvdGhlciBzdWItc3lzdGVtcyBhbmQgbm90IGludHJvZHVjZSBtdWx0aXBsZSBjb21wYXRpYmxl
cyBmb3Igc2luZ2xlDQo+ID4gZGV2aWNlPyBNRkQgY2FuIGhhbmRsZSBpbnN0YW50aWF0aW5nIHRo
ZSBzdWItZGV2aWNlcyBqdXN0IGZpbmUgZXZlbg0KPiA+IHdoZW4gc3ViLWRldmljZXMgaGF2ZSBu
byBvd24gY29tcGF0aWJsZSBwcm9wZXJ0eSBvciBvZl9tYXRjaC4gTWF5YmUNCj4gPiB3ZQ0KPiA+
IHNob3VsZCBhbHNvIGF2b2lkIHVubmVjZXNzYXJ5IHN1Yi1ub2RlcyB3aGVuIHRoZXkgYXJlIG5v
dCByZWFsbHkNCj4gPiByZXF1aXJlZC4NCj4gDQo+IFRoaXMgaXMgYmV5b25kIG15IHNjb3BlIG9m
IHJlc3BvbnNpYmlsaXR5LiBJdCBpcyBNRkQgc3Vic3lzdGVtIHRoaW5nDQo+IHRvDQo+IGNob29z
ZSB0aGUgd2F5IG9mIExFRCBjbGFzcyBkcml2ZXIgaW5zdGFudGlhdGlvbi4gV2hlbiBpdCBjb21l
cyB0bw0KPiBMRUQgc3Vic3lzdGVtIC0gaXQgZXhwZWN0cyBzaW5nbGUgY29tcGF0aWJsZSBwZXJ0
YWluaW5nIHRvIGEgcGh5c2ljYWwNCj4gZGV2aWNlLg0KDQpTb3JyeSBidXQgSSBkb24ndCBxdWl0
ZSBmb2xsb3cuIFdoYXQgdGhlIExFRCBzdWJzeXN0ZW0gZG9lcyB3aXRoIHRoZQ0KY29tcGF0aWJs
ZSBwcm9wZXJ0eT8gSG93IGRvZXMgaXQgZXhwZWN0IHRoaXM/DQoNCj4gTm9uZXRoZWxlc3MsIHNv
IGZhciB3ZSB1c2VkIHRvIGhhdmUgc2VwYXJhdGUgY29tcGF0aWJsZXMgZm9yIGRyaXZlcnMNCj4g
b2YNCj4gTUZEIGRldmljZXMnIExFRCBjZWxscy4gSWYgd2UgYXJlIGdvaW5nIHRvIGNoYW5nZSB0
aGF0IEknZCBsaWtlIHRvDQo+IHNlZQ0KPiBleHBsaWNpdCBEVCBtYWludGFpbmVyJ3Mgc3RhdGVt
ZW50IGNvbmZpcm1pbmcgdGhhdC4NCg0KSSBkb24ndCBleHBlY3QgdGhhdCBleGlzdGluZyBEVHMg
d291bGQgYmUgY2hhbmdlZC4gQnV0IGFzIEkgc2FpZCwgdGhlDQpjb25zZW5zdXMgYW1vbmdzdCBt
b3N0IG9mIHRoZSBzdWJzeXN0ZW5tIG1haW50YWluZXJzIGFuZCBEVCBtYWludGFpbmVycw0Kc2Vl
bXMgdG8gYmUgdGhhdCBzdWItZGV2aWNlcyBzaG91bGQgbm90IGhhdmUgb3duIGNvbXBhdGlibGVz
LiBJIGhvcGUNClJvYiBhY2tzIHRoaXMgaGVyZSAtIGJ1dCBrbm93aW5nIGhlIGlzIGEgYnVzeSBn
dXkgSSBhZGQgc29tZSBvbGQNCmRpc2N1c3Npb25zIGZyb20gd2hpY2ggSSBoYXZlIGdhdGhlcmVk
IG15IHVuZGVyc3RhbmRpbmc6DQoNCkJENzE4MzcgLSBmaXJzdCBwYXRjaCB3aGVyZSByZWd1bGF0
b3JzIGhhZCBjb21wYXRpYmxlIC0gTWFyayAocmVndWxhdG9yDQptYWludGFpbmVyIGluc3RydWN0
ZWQgbWUgdG8gZHJvcCBpdCk6DQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jbGsvMjAx
ODA1MjQxNDAxMTguR1M0ODI4QHNpcmVuYS5vcmcudWsvDQoNCkFuZCBoZXJlIFN0ZXBoZW4gKHRo
ZSBjbGsgc3Vic3lzdGVtIG1haW50YWluZXIpIHRvbGQgbWUgdG8gZHJvcCB3aG9sZQ0KY2xvY2tz
IHN1Yi1ub2RlIChpbmNsdWRpbmcgdGhlIGNvbXBhdGlibGUpOg0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtY2xrLzE1Mjc3Nzg2NzM5Mi4xNDQwMzguMTgxODg0NTIzODk5NzI4MzQ2ODlA
c3dib3lkLm10di5jb3JwLmdvb2dsZS5jb20vDQoNCg0KPiBBbmQgb25lIGJlbmVmaXQgb2YgaGF2
aW5nIHNlcGFyYXRlIG5vZGVzIHBlciBNRkQgY2VsbHMgaXMgdGhhdCB3ZSBjYW4NCj4gZWFzaWx5
IGRpc2Nlcm4gdGhlIHN1cHBvcnQgZm9yIHdoaWNoIGNlbGxzIGlzIHRvIGJlIHR1cm5lZCBvbi4N
Cg0KV2UgZG9uJ3Qgd2FudCB0byBkbyBEVCBtb2RpZmljYXRpb25zIHRvIGRyb3Agc29tZSBzdWIt
ZGV2aWNlIHN1cHBvcnQNCm91dC4gVGhlIERUIGlzIEhXIGRlc2NyaXB0aW9uIGFuZCBzdWItYmxv
Y2tzIGFyZSBzdGlsbCB0aGVyZS4gV2UgZHJvcA0KdGhlIHN1cHBvcnQgYnkgS0NvbmZpZy4gT25s
eSAnY29uZmlndXJhdGlvbicgd2UgY291bGQgYnJpbmcgZnJvbSBEVCBpcw0KdGhlIGFtb3VudCBv
ZiBjb25uZWN0ZWQgTEVEcyAoYXMgeW91IHNhaWQpLiBCdXQgb24gdGhlIG90aGVyIGhhbmQgLQ0K
d2hldGhlciBwcmVwYXJpbmcgZm9yIHN1Y2ggdW5saWtlbHkgZGVzaWduIGlzIHJlYXNvbmFibGUg
KG9yIG5lZWRlZCkgaXMNCnF1ZXN0aW9uYWJsZS4NCg0KPiA+IAlwbWljOiBwbWljQDRiIHsNCj4g
PiAJCWNvbXBhdGlibGUgPSAicm9obSxiZDcxODI4IjsNCj4gPiAJCXJlZyA9IDwweDRiPjsNCj4g
PiAJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8xPjsNCj4gPiAJCWludGVycnVwdHMgPSA8Mjkg
R1BJT19BQ1RJVkVfTE9XPjsNCj4gPiAJCWNsb2NrcyA9IDwmb3NjIDA+Ow0KPiA+IAkJI2Nsb2Nr
LWNlbGxzID0gPDA+Ow0KPiA+IAkJY2xvY2stb3V0cHV0LW5hbWVzID0gImJkNzE4MjgtMzJrLW91
dCI7DQo+ID4gCQlncGlvLWNvbnRyb2xsZXI7DQo+ID4gCQkjZ3Bpby1jZWxscyA9IDwyPjsNCj4g
PiAJCW5ncGlvcyA9IDw0PjsNCj4gPiAJCWdwaW8tcmVzZXJ2ZWQtcmFuZ2VzID0gPDAgMSAyIDE+
Ow0KPiA+IAkJZ3Bpby1saW5lLW5hbWVzID0gIkVQREVOIjsNCj4gPiAJCXJvaG0sZHZzLXZzZWwt
Z3Bpb3MgPSA8JmdwaW8xIDEyIDA+LA0KPiA+IAkJCQkgICAgICA8JmdwaW8xIDEzIDA+Ow0KPiA+
IAkJcmVndWxhdG9ycyB7DQo+ID4gCQkJLi4uDQo+ID4gCQl9Ow0KPiA+IAkJDQo+ID4gCQljaGct
bGVkIHsNCj4gPiAJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9DSEFSR0lORzsNCj4gPiAJCQlj
b2xvciA9IExFRF9DT0xPUl9JRF9BTUJFUjsNCj4gPiAJCX07DQo+ID4gDQo+ID4gCQlwd3ItbGVk
IHsNCj4gPiAJCQlmdW5jdGlvbiA9IExFRF9GVU5DVElPTl9QT1dFUjsNCj4gPiAJCQljb2xvciA9
IExFRF9DT0xPUl9JRF9HUkVFTjsNCj4gPiAJCX07DQo+IA0KPiBUaGlzIHdheSB5b3Ugd291bGQg
cHJvYmFibHkgbmVlZCB0byBwcm9iZSBMRUQgY2xhc3MgZHJpdmVyIHR3aWNlLA0KPiBpbnN0ZWFk
IG9mIGxldHRpbmcgaXQgYmVoYXZlIGluIGEgc3RhbmRhcmQgd2F5IGFuZCBwYXJzZSBjaGlsZCBM
RUQNCj4gbm9kZXMuDQoNCk5vLiBQbGVhc2Ugbm90ZSB0aGF0IHByb2JpbmcgdGhlIE1GRCBzdWIt
ZHJpdmVycyBpcyBfbm90XyBib3VuZCB0bw0KZGV2aWNlLXRyZWUgbm9kZXMuIE1GRCBzdWItZGV2
aWNlcyBjYW4gYmUgcHJvYmVkIGp1c3QgZmluZSBldmVuIGlmIHRoZXkNCmhhdmUgbm8gRFQgZW50
cmllcy4gV2hlbiB3ZSBhZGQgTUZEIGNlbGwgZm9yIExFRCBkcml2ZXIsIHRoZQ0KY29ycmVzcG9u
ZGluZyBMRUQgZHJpdmVyIGlzIHByb2JlZC4gTm8gRFQgbWFnaWMgbmVlZGVkIGZvciB0aGlzLg0K
DQpXaGF0IHRoZSBMRUQgZHJpdmVyIChhcyBvdGhlciBzdWItZGV2aWNlIGRyaXZlcnMpIGlzIHJl
cXVpcmVkIHRvIGRvIGlzDQp0byBvYnRhaW4gdGhlIHBvaW50ZXIgdG8gcGFyZW50IGRldmljZSdz
IERUIG5vZGUgYW5kIGZpbmQgaW5mb3JtYXRpb24NCndoaWNoIGlzIHJlbGV2YW50IGZvciBpdC4g
SWRlYWxseSwgdGhlIHN1YnN5c3RlbSBmcmFtZXdvcmsgY2FuIGV4dHJhY3QNCnRoZSBwcm9wZXJ0
aWVzIHdoaWNoIGFyZSBjb21tb24gZm9yIHdob2xlIHN1YnN5c3RlbSAobGlrZSBjb2xvciBhbmQN
CmZ1bmN0aW9uIGluIGNhc2Ugb2YgTEVEcykgYW5kIGRyaXZlciBvbmx5IHBhcnNlcyB0aGUgRFQg
aWYgaXQgaGFzIHNvbWUNCmN1c3RvbSBwcm9wZXJ0aWVzLiBBZ2FpbiwgaWRlYWxseSB0aGUgZHJp
dmVyIGhhcyBzYW5lIGRlZmF1bHRzIC0gb3INCnNvbWUgb3RoZXIgJ3BsYXRmb3JtIGRhdGEnIG1l
Y2hhbmlzbSBpZiBubyBEVCBpbmZvcm1hdGlvbiBpcyBmb3VuZC4NClRoZXJlIGlzIGFyY2hpdGVj
dHVyZXMgd2hpY2ggZG8gbm90IHN1cHBvcnQgRFQuDQoNCkluIGNhc2Ugb2YgQkQ3MTgyOCBMRURz
IG15IGZpcnN0IGlkZWEgd2FzIHRvIGdvIHdpdGggb25seSB0aGUgJ3NhbmUNCmRlZmF1bHRzJyBv
cHRpb24gYXMgSSBzYXcgbm8gbXVjaCBjb25maWd1cmFiaWxpdHkuIFRoZSBEVCBzbmlwcGV0IGFi
b3ZlDQpjb250YWlucyBMRUQgaW5mb3JtYXRpb24gYXMgcGVyIHlvdXIgc3VnZ2VzdGlvbi4NCg0K
V2hhdCB0aGUgTEVEIHN1YiBkcml2ZXIgZm9yIEJENzE4Mjggd291bGQgbm93IGRvIGlzIGNhbGxp
bmcgDQpkZXZtX2xlZF9jbGFzc2Rldl9yZWdpc3Rlcl9leHQgd2l0aCB0aGUgRFQgaW5mb3JtYXRp
b24gb2YgQkQ3MTgyOA0KZGV2aWNlLiBFZywgaXQgc2hvdWxkIHVzZSB0aGUgTUZEIGR0IG5vZGUg
KGJlY2F1c2UgdGhpcyBpcyB0aGUgcmVhbA0KZGV2aWNlKSBhbmQgbm90IGp1c3QgcGFydCBvZiBp
dC4gZGV2bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXJfZXh0IHNob3VsZA0KdGhlbiBleHRyYWN0IHRo
ZSBMRUQgc3BlY2lmaWMgaW5mb3JtYXRpb24uIEkgaGF2ZSBub3QgY2hlY2tlZCB0aGUNCmltcGxl
bWVudGF0aW9uIG9mIGRldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyX2V4dCBpbiBkZXRhaWxzIC0g
YnV0IGl0DQpzaG91bGQgaWdub3JlIG5vbiBsZWQgcHJvcGVydGllcyBhbmQganVzdCB3YWxrIHRo
cm91Z2ggdGhlIExFRA0KaW5mb3JtYXRpb24gYW5kIGNyZWF0ZSB0aGUgc3lzZnMgaW50ZXJmYWNl
cyBldGMuIGZvciBhbGwgTEVEcyBpdCBmaW5kcy4NCihJbiBteSBleGFtcGxlIHRoaXMgaXMgdGhl
IGNoZy1sZWQgYW5kIHB3ci1sZWQgc3ViLW5vZGVzKS4gRnVydGhlcm1vcmUsDQppZiBubyBMRUQg
aW5mb3JtYXRpb24gaXMgZm91bmQgZnJvbSBEVCBJIHdvdWxkIGV4cGVjdA0KZGV2bV9sZWRfY2xh
c3NkZXZfcmVnaXN0ZXJfZXh0IHRvIGZhaWwgd2l0aCB3ZWxsLWRlZmluZWQgcmV0dXJuIHZhbHVl
DQpzbyB0aGF0IHRoZSBkcml2ZXIgY291bGQgZG8gd2hhdCBpdCBub3cgZG9lcyAtIEVnLCB1c2Ug
InNhbmUgZGVmYXVsdHMiDQp0byByZWdpc3RlciB0aGUgZGVmYXVsdCBjbGFzcy1kZXZpY2VzIGZv
ciBncmVlbiBhbmQgYW1iZXIgTEVEcy4gVGhlDQpkZWZhdWx0IGxlZCBjbGFzcyBkZXYgbmFtaW5n
IHNob3VsZCBvZiBjb3Vyc2UgYmUgc2FtZSBmb3JtYXQgYXMgaXQNCndvdWxkIGJlIGlmIERUIHdh
cyBwb3B1bGF0ZWQgd2l0aCBncmVlbiBhbmQgYW1iZXIgbGVkIGluZm9ybWF0aW9uLiANCg0KPiA+
IAl9Ow0KPiA+IA0KPiA+IEhvdyBkbyB5b3Ugc2VlIHRoaXM/IE9yIGRvIHlvdSByZWFsbHkgd2lz
aCB0byBoYXZlIHRoaXMgb25lIGV4dHJhDQo+ID4gbm9kZToNCj4gPiANCj4gPiAJcG1pYzogcG1p
Y0A0YiB7DQo+ID4gCQljb21wYXRpYmxlID0gInJvaG0sYmQ3MTgyOCI7DQo+ID4gCQkNCj4gPiBy
ZWcgPSA8MHg0Yj47DQo+ID4gCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvMT47DQo+ID4gCQlp
bnRlcnJ1DQo+ID4gcHRzID0gPDI5IEdQSU9fQUNUSVZFX0xPVz47DQo+ID4gCQljbG9ja3MgPSA8
Jm9zYyAwPjsNCj4gPiAJCQ0KPiA+ICNjbG9jay1jZWxscyA9IDwwPjsNCj4gPiAJCWNsb2NrLW91
dHB1dC1uYW1lcyA9ICJiZDcxODI4LTMyay1vdXQiOw0KPiA+IAkJZ3Bpby1jb250cm9sbGVyOw0K
PiA+IAkJI2dwaW8tY2VsbHMgPSA8Mj47DQo+ID4gCQ0KPiA+IAluZ3Bpb3MgPSA8ND47DQo+ID4g
CQlncGlvLXJlc2VydmVkLXJhbmdlcyA9IDwwIDEgMiAxPjsNCj4gPiAJDQo+ID4gCWdwaW8tbGlu
ZS1uYW1lcyA9ICJFUERFTiI7DQo+ID4gCQlyb2htLGR2cy12c2VsLWdwaW9zID0NCj4gPiA8Jmdw
aW8xIDEyIDA+LA0KPiA+IAkJCQkgICAgICA8JmdwaW8xIDEzIDA+Ow0KPiA+IAkJDQo+ID4gcmVn
dWxhdG9ycyB7DQo+ID4gCQkJLi4uDQo+ID4gCQl9Ow0KPiA+IAkJDQo+ID4gCQlsZWRzLWR1bW15
IHsNCj4gDQo+IFdoeSBsZWRzLWR1bW15ID8NCg0KQmVjYXVzZSB0aGVyZSBpcyBubyByZWFsIGxl
ZCBjb250cm9sbGVyIGRldmljZSBpbiBhbnkgIk1GRCBidXMiLiBJdCBpcw0KanVzdCBvbmUgTUZE
IGRldmljZSB3aXRoIGNvbnRyb2xzIGZvciB0d28gTEVEcy4gDQoNCj4gVGhlIGNvbnZlbnRpb24g
aXMgdG8gaGF2ZSBsZWQtY29udHJvbGxlckB1bml0LWFkZHJlc3MgYXMgdGhlIHBhcmVudA0KPiBM
RUQNCj4gY29udHJvbGxlciBub2RlLg0KDQpXaGF0IGlzIHRoZSB1bml0IGFkZHJlc3MgaGVyZT8g
MHg0YiBpcyB0aGUgSTJDIHNsYXZlIGFkZHJlc3MgYW5kIGl0IGlzDQp0aGUgTUZEIG5vZGUgYWRk
cmVzcy4gVGhlcmUgaXMgbm8gYWRkcmVzc2luZyBmb3IgTEVEIGNvbnRyb2xsZXIgYXMNCnRoZXJl
IGlzIG5vIHNlcGFyYXRlIExFRCBjb250cm9sbGVyIGRldmljZS4gVGhlcmUgaXMgb25seSBvbmUg
ZGV2aWNlLA0KdGhlIFBNSUMgd2hpY2ggaXMgTUZEIGRldmljZSBhcyBpdCBoYXMgbXVsdGlwbGUg
ZnVuY3Rpb25zIG1lbGQgaW4uIE9uZQ0Kb2YgdGhlc2UgZnVuY3Rpb25zIGlzIExFRCBjb250cm9s
IGFuZCByZXF1aXJlcyBMRUQgZHJpdmVyLg0KDQo+ID4gCQkJY2hnLWxlZCB7DQo+IHMvY2hnLWxl
ZC9sZWQwLw0KPiANCj4gPiAJCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05fQ0hBUkdJTkc7DQo+
ID4gCQkJCWNvbG9yID0gTEVEX0NPTE9SX0lEX0FNQkVSOw0KPiA+IAkJCX07DQo+ID4gDQo+ID4g
CQkJcHdyLWxlZCB7DQo+IA0KPiBzL3B3ci1sZWQvbGVkMS8NCj4gDQo+IFRoaXMgaXMgZVBBUFIg
cmVxdWlyZW1lbnQgdGhhdCBEVCBub2RlIG5hbWUgc2hvdWxkIGRlc2NyaWJlIHRoZQ0KPiBnZW5l
cmFsIGNsYXNzIG9mIGRldmljZS4NCg0KVGhhbmtzLiBJIGhhZCBzb21lIHByb2JsZW1zIHdpdGgg
dGhlc2Ugbm9kZSBuYW1lcyBhcyBJIHdhbnRlZCB0byBtYWtlDQp0aGVtIGdlbmVyaWMgKGxlZCkg
YnV0IGFsc28gdG8gaW5jbHVkZSBzb21lIGluZm9ybWF0aW9uIHdoYXQgbGVkcyB0aGV5DQphcmUu
IEEgYml0IHNhbWUgaWRlYSBhcyBJIHNlZSBpbiBub2RlIG5hbWVzIGxpa2UgImNoYW4xIiBhbmQg
ImNoYW4zNDUiDQp0aGF0IGFyZSB1c2VkIGluIHRpLWxtdSBiaW5kaW5ncyBJIGNoZWNrZWQgZm9y
IHRoZSBleGFtcGxlLiBCdXQgSSBhbQ0KZmluZSB3aXRoIHJlbmFtaW5nIHRoZW0gaW4gdGhpcyBl
eGFtcGxlISBJIGp1c3QgZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkDQpoYXZlIHRoaXMgZXh0cmEgbm9k
ZSBhcyBJIG1lbnRpb25lZC4NCg0KPiANCj4gPiAJCQkJZnVuY3Rpb24gPSBMRURfRlVOQ1RJT05f
UE9XRVI7DQo+ID4gCQkJCWNvbG9yID0gTEVEX0NPTE9SX0lEX0dSRUVOOw0KPiA+IAkJCX07DQo+
IA0KPiBDb21tb24gTEVEIGJpbmRpbmdzIHNheSB0aGlzIGlzIHRoZSBwcm9wZXIgd2F5IHRvIGdv
LiBIb3dldmVyIHlvdQ0KPiB3b3VsZCBuZWVkIGNvbXBhdGlibGUgdG8gcHJvYmUgTEVEIGNsYXNz
IGRyaXZlciBpbiBEVCBiYXNlZCB3YXkuDQoNCk5vLiBJIGRvbid0LiBNRkQgd2lsbCBwcm9iZSB0
aGUgTEVEIGNsYXNzIGRyaXZlciBhcyBsb25nIGFzIHRoZSBuYW1lIG9mDQp0aGUgZHJpdmVyIG1h
dGNoZXMgdG8gTUZEIGNlbGwgbmFtZS4gU28gd2Ugb25seSBuZWVkIE1GRCBkcml2ZXIgdG8gYmUN
CnByb2JlZCBiYXNlZCBvbiB0aGUgY29tcGF0aWJsZS4gUmVzdCBvZiB0aGUgc3ViLWRldmljZSBk
cml2ZXJzIHdpbGwgYmUNCnByb2JlZCBieSBNRkQuIFdoYXQgSSBhbSBtaXNzaW5nIGlzIE1PRFVM
RV9BTElBUyBpbiBMRUQgZHJpdmVyIGZvcg0KbG9hZGluZyB0aGUgbW9kdWxlIHdoZW4gTUZEIGlz
IHNlYXJjaGluZyBmb3IgaXQgaWYgaXQgaXMgbm90IG1vZHByb2JlZA0KdmlhIHNjcmlwdHMgb3Ig
YnVpbHQgaW4ta2VybmVsLiBJIGhhdmUgdW5kZXJzdG9vZCB0aGlzIGlzIHRoZSBzdGFuZGFyZA0K
d2F5IHdpdGggTUZEIG5vd2FkYXlzIC0gSSBhbSBwb3NpdGl2ZSBMZWUgd2lsbCBraWNrIG1lIGlm
IEkgYW0gd3JvbmcgOykNCihJIHRoaW5rIEkgaGF2ZSBidWxsaWVkIGhpbSB0aGF0IG11Y2ggaW4g
dGhlIHBhc3QgOi8gKQ0KDQo+IElmIHlvdSBwbGFuIHRvIGRvIGl0IG90aGVyd2lzZSB0aGVuIGl0
IG1ha2VzIG5vIHNlbnNlIHRvIGhhdmUNCj4gRFQgbm9kZXMgZm9yIExFRHMuDQoNClRoYXQgd2Fz
IG15IHBvaW50LiBUaGlzIGlzIHdoeSBJIGRpZCBub3QgaGF2ZSBMRURzIGluIERUIGluIGZpcnN0
DQpwbGFjZS4gQnV0IGFzIEkgc2FpZCBhYm92ZSAtIGFzIGEgcmVzdWx0IG9mIHRoaXMgZGlzY3Vz
c2lvbiBJIGhhdmUNCnN0YXJ0ZWQgdGhpbmtpbmcgdGhhdCBtYXliZSBJIGNvdWxkIGNoZWNrIGlm
IEkgY2FuIGVhc2lseSBhZGQgc3VwcG9ydA0KZm9yIHByb3ZpZGluZyBMRUQgaW5mb3JtYXRpb24g
YWxzbyB2aWEgRFQgYW5kIGZhbGwgYmFjayB0byBkZWZhdWx0cyBpZg0Kbm8gTEVEIGluZm9ybWF0
aW9uIGlzIGZvdW5kLiAodG8gYWxsb3cgY29sb3IgY2hhbmdlIG9yIHRvIG9taXQgb25lIG9mDQp0
aGUgTEVEcyBhcyB5b3Ugc3VnZ2VzdGVkKQ0KDQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9sZWRzL0tjb25maWcgYi9kcml2ZXJzL2xlZHMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gaW5k
ZXggYjBmZGVlZjEwYmQ5Li5lYzU5ZjI4YmNiMzkgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS9k
cml2ZXJzL2xlZHMvS2NvbmZpZw0KPiA+ID4gPiA+ID4gKysrIGIvZHJpdmVycy9sZWRzL0tjb25m
aWcNCj4gPiA+ID4gPiA+IEBAIC01MjksNiArNTI5LDE2IEBAIGNvbmZpZyBMRURTX0JEMjgwMg0K
PiA+ID4gPiA+ID4gICAJICBUaGlzIG9wdGlvbiBlbmFibGVzIHN1cHBvcnQgZm9yIEJEMjgwMkdV
IFJHQiBMRUQNCj4gPiA+ID4gPiA+IGRyaXZlciBjaGlwcw0KPiA+ID4gPiA+ID4gICAJICBhY2Nl
c3NlZCB2aWEgdGhlIEkyQyBidXMuDQo+ID4gPiA+ID4gPiAgIA0KPiA+ID4gPiA+ID4gK2NvbmZp
ZyBMRURTX0JENzE4MjgNCj4gPiA+ID4gPiA+ICsJdHJpc3RhdGUgIkxFRCBkcml2ZXIgZm9yIExF
RCBwaW5zIG9uIFJPSE0gQkQ3MTgyOCBQTUlDIg0KPiA+ID4gPiA+ID4gKwlkZXBlbmRzIG9uIExF
RFNfQ0xBU1MNCj4gPiA+ID4gPiBkb2Vzbid0IHRoaXMgaGF2ZSBhIGRlcGVuZGVuY3kgb24gTUZE
X1JPSE1fQkQ3MTgyOA0KPiA+ID4gPiA+ID4gKwlkZXBlbmRzIG9uIEkyQw0KPiA+ID4gPiA+ID4g
KwloZWxwDQo+ID4gPiA+ID4gPiArCSAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZvciBM
RUQgb3V0cHV0cyBsb2NhdGVkDQo+ID4gPiA+ID4gPiBvbiBST0hNDQo+ID4gPiA+ID4gPiArCSAg
IEJENzE4MjggcG93ZXIgbWFuYWdlbWVudCBJQy4gUk9ITSBCRDcxODI4IGhhcyB0d28NCj4gPiA+
ID4gPiA+IGxlZCBvdXRwdXQNCj4gPiA+ID4gPiA+IHBpbnMNCj4gPiA+ID4gPiA+ICsJICAgd2hp
Y2ggY2FuIGJlIGxlZnQgdG8gaW5kaWNhdGUgSFcgc3RhdGVzIG9yDQo+ID4gPiA+ID4gPiBjb250
cm9sbGVkIGJ5IFNXLg0KPiA+ID4gPiA+ID4gU2F5DQo+ID4gPiA+ID4gPiArCSAgIHllcyBoZXJl
IGlmIHlvdSB3YW50IHRvIGVuYWJsZSBTVyBjb250cm9sIGZvciB0aGVzZQ0KPiA+ID4gPiA+ID4g
TEVEcy4NCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBBZGQgbW9kdWxlIHN0
YXRlbWVudA0KPiA+ID4gPiANCj4gPiA+ID4gV2hhdCBpcyB0aGUgbW9kdWxlIHN0YXRlbWVudD8g
RG8geW91IG1lYW4gdGhlICdpZiB5b3UgY29tcGlsZQ0KPiA+ID4gPiB0aGlzDQo+ID4gPiA+IGFz
IGENCj4gPiA+ID4gbW9kdWxlIGl0IHdpbGwgYmUgY2FsbGVkIGJsYWhibGFoJyBvciAnY2hvb3Nl
IE0gdG8gYmxhaGJsYWgnPw0KPiA+ID4gPiANCj4gPiA+ID4gSSd2ZSBuZXZlciB1bmRlcnN0b29k
IHdoeSBzb21lIGVudHJpZXMgaGF2ZSB0aG9zZSBzdGF0ZW1lbnRzLg0KPiA+ID4gPiAnQ2hvb3Nl
DQo+ID4gPiA+IE0nIHN0dWZmIGlzIGhlbHAgZm9yIGNvbmZpZyBzeXN0ZW0gLSB3aHkgc2hvdWxk
IGVhY2ggbW9kdWxlDQo+ID4gPiA+IGV4cGxhaW4NCj4gPiA+ID4gaG93DQo+ID4gPiA+IHRvIHVz
ZSBjb25maWdzPyBUaGlzIGluZm9ybWF0aW9uIHNob3VsZCBiZSBpbiBtb3JlIGdlbmVyaWMNCj4g
PiA+ID4gZG9jdW1lbnRhdGlvbi4gRnVydGhlcm1vcmUsIHRoZSAndHJpc3RhdGUnIHRoZXJlIGFs
cmVhZHkgc2F5cw0KPiA+ID4gPiB5b3UNCj4gPiA+ID4gY2FuDQo+ID4gPiA+IGNvbXBpbGUgdGhp
cyBhcyBhIG1vZHVsZS4gTW9kdWxlIG5hbWUgb24gdGhlIG90aGVyIGhhbmQgcmVhbGx5DQo+ID4g
PiA+IGlzDQo+ID4gPiA+IG1vZHVsZSdzIHByb3BlcnR5IGJ1dCBpdCBtYXkgd2VsbCBjaGFuZ2Ug
aWYgb25lIGNoYW5nZXMgdGhlDQo+ID4gPiA+IG5hbWUgb2YNCj4gPiA+ID4gdGhlDQo+ID4gPiA+
IGZpbGUuIFRoYXQgc2hvdWxkIG5vdCByZXF1aXJlIGNoYW5nZSBpbiBLQ29uZmlnLiBGdXJ0aGVy
bW9yZSwNCj4gPiA+ID4gd2hlcmUNCj4gPiA+ID4gZG8NCj4gPiA+ID4geW91IG5lZWQgdGhlIG1v
ZHVsZSBuYW1lPyBBbmQgaWYgeW91IHJlYWxseSBuZWVkIHRoZSBtb2R1bGUNCj4gPiA+ID4gbmFt
ZQ0KPiA+ID4gPiB5b3UNCj4gPiA+ID4gc2hvdWxkIGNoZWNrIHRoZSBjb25maWcgbmFtZSBmcm9t
IE1ha2VmaWxlIHRvIGJlIHN1cmUgLQ0KPiA+ID4gPiBtb2R1bGUvZmlsZQ0KPiA+ID4gPiBuYW1l
cyBpbiBjb21tZW50cyBvciBkb2NzIHRlbmQgdG8gZ2V0IG91dGRhdGVkLg0KPiA+ID4gPiANCj4g
PiA+ID4gQWZ0ZXIgYWxsIHRoaXMgYmVpbmcgc2FpZCAtIEkgY2FuIGFkZCBhbnkgYm9pbGVycGxh
dGUgdGV4dCBpbg0KPiA+ID4gPiBLQ29uZmlnDQo+ID4gPiA+IGlmIG5lY2Vzc2FyeSAtIEkganVz
dCBzZWUgemVybyBiZW5lZml0IGZyb20gdGhpcy4gQW5kIGlmIHlvdQ0KPiA+ID4gPiBkaWRuJ3QN
Cj4gPiA+ID4gbWVhbiB0aGlzIC0gY2FuIHlvdSB0aGVuIHBsZWFzZSB0ZWxsIG1lIHdoYXQgaXMg
dGhlIG1vZHVsZQ0KPiA+ID4gPiBzdGF0ZW1lbnQ/DQo+ID4gPiANCj4gPiA+IFllcywgbGlrZSB5
b3Ugbm90aWNlZCwgdGhpcyBpcyBib2lsZXJwbGF0ZSBzbyBwbGVhc2UgZm9sbG93IHRoZQ0KPiA+
ID4gY29udmVudGlvbi4gSWYgeW91J2QgbGlrZSB0byBkaXNjdXNzIGl0cyByZWxldmFuY2UgcGxl
YXNlIHN1Ym1pdA0KPiA+ID4gYSBtZXNzYWdlIHRvIGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5l
bC5vcmcuDQo+ID4gDQo+ID4gSSBkaWQgZm9sbG93IHRoZSBjb252ZW50aW9uLiBUaGVyZSBpcyA2
NyB0cmlzdGF0ZWQgTEVEIGRyaXZlcnMNCj4gPiB3aGljaCBkbw0KPiA+IE5PVCBhZGQgdGhpcyBt
b2R1bGUgYnVpbGRpbmcgYmFiYmxpbmcgaW4gZGVzY3JpcHRpb24uIFRoZW4gdGhlcmUgaXMNCj4g
PiAxNA0KPiA+IGRyaXZlcnMgd2hpY2ggZG8uIFNvIGNvbW1vbiBjb252ZW50aW9uIGV2ZW4gaW4g
TEVEIHN1YnN5c3RlbSBpcyB0bw0KPiA+IE5PVA0KPiA+IGluY2x1ZGUgbWVhbmluZ2xlc3MgbXVt
Ym9qdW1ibyB0aGVyZS4NCj4gPiANCj4gPiBTbyBldmVuIHJlZ2FyZGluZyBjb252ZW50aW9uIGl0
IGlzIGJldHRlciB0byBoYXZlIHNob3J0IGRlc2NyaXB0aW9uDQo+ID4gdG8NCj4gPiB0aGUgcG9p
bnQuIFRoYXQgYWN0dWFsbHkgbWFrZXMgdGhlIHJlcXVpcmluZyBib2lsZXJwbGF0ZSBldmVuIG1v
cmUNCj4gPiB1c2VsZXNzLiBCdXQgYXMgSSBzYWlkLCBJIGNhbiBwdXQgYW55IG1lYW5pbmdsZXNz
IGxldHRlcnMgdGhlcmUuDQo+ID4gKGFnYWluLCBpZiBJIGNhbid0IGNvbnZpbmNlIHlvdSB0byBy
ZWNvbnNpZGVyIGhvdyB5b3UgbGlrZSB0aGUgTEVEDQo+ID4gc3Vic3lzdGVtIHRvIGFwcGVhciBs
aWtlKS4gS25vd2luZyBob3cgaGFyZCBpdCBpcyB0byBoZWxwIHBlb3BsZQ0KPiA+IHJlZHVjaW5n
IHdhc3RlIC0gaXQncyBtYXkgYmUgZWFzaWVyIGZvciBtZSB0aGFuIGRpc2N1c3NpbmcgdGhpcw0K
PiA+IGZ1cnRoZXINCj4gPiA6KA0KPiANCj4gSSB3aWxsIG5vdCBpbnNpc3QgLSBpdCdzIHVwIHRv
IHlvdS4gVW5sZXNzIERhbiB3aG8gcmFpc2VkIHRoZQ0KPiBpc3N1ZSBzZWVzIHRoYXQgZGlmZmVy
ZW50bHkuDQoNClRoYW5rcyA6KSBEYW4sIEkgd291bGQgbGlrZSB0byBoZWFyIHlvdXIgdGhvdWdo
dHMgb24gdGhpcyAtIGRvIHlvdQ0Kc3RpbGwgdGhpbmsgdGhpcyBpcyBhIGZhdGFsIGlzc3VlIGZv
ciB5b3U/DQoNCj4gPiA+ID4gPiA+ICsjZGVmaW5lIEJENzE4MjhfTEVEX1RPX0RBVEEobCkgKChs
KS0+aWQgPT0gSURfR1JFRU5fTEVEID8NCj4gPiA+ID4gPiA+IFwNCj4gPiA+ID4gPiA+ICsJY29u
dGFpbmVyX29mKChsKSwgc3RydWN0IGJkNzE4MjhfbGVkcywgZ3JlZW4pIDogXA0KPiA+ID4gPiA+
ID4gKwljb250YWluZXJfb2YoKGwpLCBzdHJ1Y3QgYmQ3MTgyOF9sZWRzLCBhbWJlcikpDQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgYmUgZGVmaW5pbmcgdGhl
IGNvbG9yIGFzIHRoZQ0KPiA+ID4gPiA+IHZhcmlhYmxlLg0KPiA+ID4gPiA+IFRoZSANCj4gPiA+
ID4gPiBvdXRwdXRzIGNhbiBkcml2ZSBhbnkgY29sb3IgTEVELg0KPiA+ID4gPiANCj4gPiA+ID4g
SSB1c2VkIHRoZSBjb2xvcnMgbWVudGlvbmVkIGluIEJENzE4MjggZGF0YS1zaGVldC4gSXQgaXMg
dHJ1ZQ0KPiA+ID4gPiBzb21lb25lDQo+ID4gPiA+IG1pZ2h0IHVzZSBkaWZmZXJlbnQgTEVEcyBv
biB0aGVpciBib2FyZCBidXQgYXQgbGVhc3QgdGhpcw0KPiA+ID4gPiBuYW1pbmcNCj4gPiA+ID4g
YWxsb3dzDQo+ID4gPiA+IG9uZSB0byBtYXRjaCB0aGUgb3V0cHV0IHRvIG9uZSBpbiBkYXRhLXNo
ZWV0LiBJIGNhbiBhZGQgY29tbWVudA0KPiA+ID4gPiBleHBsYWluaW5nIHRoaXMgaWYgeW91IHRo
aW4gaXQncyB3b3J0aCBtZW50aW9uaW5nLg0KPiA+ID4gDQo+ID4gPiBJIHNlZSB5b3UndmUgY29t
ZSB1cCB3aXRoIGJlbG93IGRlZmluaXRpb25zIGluIHJvaG0tYmQ3MTgyOC5oOg0KPiA+ID4gDQo+
ID4gPiAjZGVmaW5lIEJENzE4MjhfTUFTS19MRURfQU1CRVIJCTB4ODANCj4gPiA+ICNkZWZpbmUg
QkQ3MTgyOF9NQVNLX0xFRF9HUkVFTgkJMHg0MA0KPiA+ID4gDQo+ID4gPiBJcyB0aGlzIGhvdyB0
aG9zZSBiaXQgZmllbGRzIGFyZSBuYW1lZCBpbiB0aGUgZGF0YSBzaGVldD8NCj4gPiANCj4gPiBU
aGUgbGVkcyBhcmUgdGhyb3VnaCB0aGUgZG9jdW1lbnQgcmVmZXJyZWQgYXMgIkdSTkxFRCIgYW5k
DQo+ID4gIkFNQkxFRCIuDQo+ID4gVGhlc2Ugc3BlY2lmaWMgYml0cyBhcmUgbmFtZWQgIkFNQkxF
RF9GT1JDRV9PTiIgYW5kDQo+ID4gIkdSTkxFRF9GT1JDRV9PTiIuDQo+IA0KPiBPSywgc28gdGhl
biBpdCdzIHJlYXNvbmFibGUgdG8gdXNlIHRob3NlIG5hbWVzIGluIHRoZSBkcml2ZXIuDQo+IEkg
d291bGQgb25seSBhZGQgYSBjb21tZW50IG5leHQgdG8gdGhlIGRlZmluaXRpb25zLCBoaWdobGln
aHRpbmcNCj4gdGhhdCB0aGVpciBuYW1lcyBkb24ndCBpbXBseSB0aGUgc2NvcGUgb2Ygc3VwcG9y
dGVkIGNvbG9ycyBhcyB0aGlzIGlzDQo+IGVudGlyZWx5IGlycmVsZXZhbnQuDQoNCkknbGwgYWRk
IGEgbm90ZSBoZXJlLiANCg0KPiANCj4gPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiA+ICsJYmQ3MTgy
OCA9IGRldl9nZXRfZHJ2ZGF0YShwZGV2LT5kZXYucGFyZW50KTsNCj4gPiA+ID4gPiA+ICsJbCA9
IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmwpLCBHRlBfS0VSTkVMKTsNCj4gPiA+
ID4gPiA+ICsJaWYgKCFsKQ0KPiA+ID4gPiA+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gPiA+
ID4gPiArCWwtPmJkNzE4MjggPSBiZDcxODI4Ow0KPiA+ID4gPiA+ID4gKwlhID0gJmwtPmFtYmVy
Ow0KPiA+ID4gPiA+ID4gKwlnID0gJmwtPmdyZWVuOw0KPiA+ID4gPiA+ID4gKwlhLT5pZCA9IElE
X0FNQkVSX0xFRDsNCj4gPiA+ID4gPiA+ICsJZy0+aWQgPSBJRF9HUkVFTl9MRUQ7DQo+ID4gPiA+
ID4gPiArCWEtPmZvcmNlX21hc2sgPSBCRDcxODI4X01BU0tfTEVEX0FNQkVSOw0KPiA+ID4gPiA+
ID4gKwlnLT5mb3JjZV9tYXNrID0gQkQ3MTgyOF9NQVNLX0xFRF9HUkVFTjsNCj4gPiA+ID4gPiA+
ICsNCj4gPiA+ID4gPiA+ICsJYS0+bC5uYW1lID0gQU5BTUU7DQo+ID4gPiA+ID4gPiArCWctPmwu
bmFtZSA9IEdOQU1FOw0KPiA+ID4gPiA+ID4gKwlhLT5sLmJyaWdodG5lc3Nfc2V0X2Jsb2NraW5n
ID0NCj4gPiA+ID4gPiA+IGJkNzE4MjhfbGVkX2JyaWdodG5lc3Nfc2V0Ow0KPiA+ID4gPiA+ID4g
KwlnLT5sLmJyaWdodG5lc3Nfc2V0X2Jsb2NraW5nID0NCj4gPiA+ID4gPiA+IGJkNzE4MjhfbGVk
X2JyaWdodG5lc3Nfc2V0Ow0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKwlyZXQgPSBkZXZt
X2xlZF9jbGFzc2Rldl9yZWdpc3RlcigmcGRldi0+ZGV2LCAmZy0+bCk7DQo+ID4gPiA+ID4gPiAr
CWlmIChyZXQpDQo+ID4gPiA+ID4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+ID4gPiA+ID4gKw0KPiA+
ID4gPiA+ID4gKwlyZXR1cm4gZGV2bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXIoJnBkZXYtPmRldiwg
JmEtPmwpOw0KPiA+ID4gDQo+ID4gPiBUaGlzIHdheSB5b3UgZm9yY2UgdXNlcnMgdG8gYWx3YXlz
IHJlZ2lzdGVyIHR3byBMRUQgY2xhc3MgZGV2aWNlcw0KPiA+ID4gd2hlcmVhcyB0aGV5IG1pZ2h0
IG5lZWQgb25seSBvbmUuIFBsZWFzZSBjb21wYXJlIGhvdyBvdGhlciBMRUQNCj4gPiA+IGNsYXNz
DQo+ID4gPiBkcml2ZXJzIGhhbmRsZSBEVCBwYXJzaW5nIGFuZCBMRUQgY2xhc3MgZGV2aWNlIHJl
Z2lzdHJhdGlvbi4NCj4gPiANCj4gPiBJIGFtIG5vdCBzdXJlIGlmIEkgdW5kZXJzdGFuZCBjb3Jy
ZWN0bHkgd2hhdCB5b3UgbWVhbiBieSB1c2luZyBvbmx5DQo+ID4gb25lDQo+ID4gY2xhc3MgZGV2
aWNlLiBBcyBJIChob3BlZnVsbHkpIHNvbWV3aGVyZSBzYWlkIC0gdXNlcnMgY2FuJ3QgY29udHJv
bA0KPiA+IG9ubHkgb25lIG9mIHRoZXNlIExFRHMuIElmIHRoZXkgZGVjaWRlIHRvIGVuYWJsZSBv
bmUgbGVkIGJ5IFNXLA0KPiA+IHRoZW4NCj4gPiB0aGV5IGluZXZpdGFibHkgY29udHJvbCBhbHNv
IHRoZSBvdGhlci4gVGh1cyBpdCBpcyBiZXR0ZXIgdGhhdCB1c2VyDQo+ID4gZ2V0cyBjb250cm9s
IHRvIGJvdGggb2YgdGhlIExFRHMgaWYgdGhleSB0YWtlIHRoZSBjb250cm9sIGZvciBvbmUuDQo+
ID4gDQo+ID4gT3IgZG8geW91IG1lYW4gSSBjb3VsZCBhY2hpZXZlIHRoZSBjb250cm9sIGZvciBi
b3RoIG9mIHRoZXNlIExFRHMNCj4gPiB2aWENCj4gPiBvbmx5IG9uZSBjbGFzcyBkZXZpY2U/DQo+
IA0KPiBBRkFJVSB0aGUgTEVEcywgd2hlbiBpbiBTVyBtb2RlLCBjYW4gYmUgY29udHJvbGxlZCBp
bmRlcGVuZGVudGx5LA0KPiByaWdodD8NCg0KWWVzIGFuZCBuby4gQm90aCBvZiB0aGUgTEVEcyBj
YW4gYmUgZm9yY2VkIG9uL29mZiBpbmRpdmlkdWFsbHkgLSBhcw0KbG9uZyBhcyBvbmUgb2YgdGhl
bSBpcyBmb3JjZWQgT04uIElmIGJvdGggTEVEcyBhcmUgdHJpZWQgdG8gYmUgZm9yY2VkDQpPRkYg
LSB0aGVuIGJvdGggTEVEcyBhcmUgY29udHJvbGxlZCBieSBIVy4gSWYgYm90aCBhcmUgY29udHJv
bGxlZCBieSBIVw0KYW5kIHRoZW4gb25lIGlzIGZvcmNlZCBPTiAtIHRoZSBvdGhlciBpcyBhbHNv
IG5vIGxvbmdlciBjb250cm9sbGVkIGJ5DQpIVyBhbmQgaXMgZm9yY2VkIE9GRi4NCg0KRWcsIGJp
dHMgMHg4MCBhbmQgMHg0MCBhcmUgY29ucm9scyBmb3IgdGhlc2UgTEVEcy4gMHg4MCBmb3Igb25l
LCAweDQwDQpmb3IgdGhlIG90aGVyLiBTZXR0aW5nIGJpdCBtZWFucyBMRUQgaXMgb24sIGNsZWFy
aW5nIG1lYW5zIExFRCBpcyBvZmYgLQ0Kd2l0aCB0aGUgSFcgY29udHJvbCB0d2lzdC4uLiBJZiBl
aXRoZXIgb2YgdGhlIGJpdHMgaXMgc2V0IC0gdGhlbiBib3RoDQpsZWRzIGFyZSBjb250cm9sbGVk
IGJ5IHRoZXNlIGJpdHMgKFNXIGNvbnRyb2wpLiBJZiBib3RoIGJpdHMgYXJlDQpjbGVhcmVkLCB0
aGVuIExFRHMgYXJlIGNvbnRyb2xsZWQgYnkgSFcgKGxpa2VseSB0byBiZSBvZmYgYnV0IG5vdCBm
b3INCnN1cmUpLg0KDQo+IEJlY2F1c2UgaWYgbm90IHRoZW4gdGhlcmUgaXMgbm8gcG9pbnQgaW4g
aGF2aW5nIHNlcGFyYXRlIExFRCBjbGFzcw0KPiBkZXZpY2VzLg0KPiANCj4gQnV0IGlmIEkgZ2V0
IGl0IHJpZ2h0LCB0aGVuIGFsbG93aW5nIGZvciByZWdpc3RlcmluZyBvbmx5IG9uZSBMRUQNCj4g
Y2xhc3MNCj4gZGV2aWNlIGlzIGVudGlyZWx5IGp1c3RpZmlhYmxlIC0gdGhpbmsgb2YgYSBzaXR1
YXRpb24gd2hlbiB0aGUgaW91dA0KPiByZW1haW5zIG5vdCBjb25uZWN0ZWQgb24gdGhlIGJvYXJk
Lg0KDQpZZXMuIFRoaXMgbWlnaHQgYmUgdW5saWtlbHkgLSBidXQgdGhpcyBpcyB0aGUgcmVhc29u
IHdoeSBJIGNvbnNpZGVyDQphZGRpbmcgdGhlIERUIHN1cHBvcnQuIEkganVzdCBhbSBub3Qgc3Vy
ZSBpZiBjb3ZlcmluZyB0aGlzIHNjZW5hcmlvIG5vdw0KaXMgd29ydGggdGhlIGhhc3NsZS4gSSB0
ZW5kIHRvIHRoaW5rIHdlIHNob3VsZCBvbmx5IGFkZCB0aGUgRFQgc3VwcG9ydA0KaWYgc29tZW9u
ZSBhY3R1YWxseSBwcm9kdWNlcyBhIGJvYXJkIHdoZXJlIHRoaXMgTEVEIGlzIG5vdCBjb25uZWN0
ZWQuDQoNCj4gPiBZZXQgYW5vdGhlciB0aGluZyBmb3IgbWUgdG8gbGVhcm4gPSkgSSBsb29rZWQg
YXQgdGhlIHRyaWdnZXINCj4gPiBwcm9wZXJ0aWVzDQo+ID4gaW4gRFQuIFRoYXQgbG9va2VkIGxp
a2UgYSB3YXkgdG8gbWFrZSB0aGUgTEVEIGZyYW1ld29yayB0byAiYmluZCINCj4gPiB0aGUNCj4g
PiBMRUQgc3RhdGUgdG8gc29tZSB0cmlnZ2VyLiAoRm9yIGV4YW1wbGUgbWFrZSB0aGUgTEVEIGZy
YW1ld29yayB0bw0KPiA+IHRvZ2dsZSBzcGVjaWZpYyBMRUQgc3RhdGUgd2hlbiBVU0IgZGV2aWNl
IGlzIHBsdWdnZWQ/KQ0KPiA+IA0KPiA+IElmIHRoaXMgaXMgdGhlIGNhc2UgdGhlbiBpdCBtaWdo
dCBub3QgYmUgcmVsZXZhbnQgZm9yIEJENzE4MjguIEhlcmUNCj4gPiB0aGUNCj4gPiBMRUQgaXMg
YnktZGVmYXVsdCBjb250cm9sbGVkIGJ5IEhXLiBFZywgd2hlbiBjaGFyZ2VyIHN0YXJ0cw0KPiA+
IGNoYXJnaW5nDQo+ID4gdGhlIGJhdHRlcnksIHRoZSBQTUlDIHdpbGwgbGl0IHRoZSBMRUQuIEl0
IHdpbGwgZG8gc28gYWxzbyB3aGVuDQo+ID4gcG93ZXINCj4gPiBidXR0b24gaXMgcHJlc3NlZCBv
ciBjZXJ0YWluIHByb2JsZW1zIGFyZSBkZXRlY3RlZC4gVGhpcyByZXFpcmVzIG5vDQo+ID4gU1cN
Cj4gPiBpbnRlcmFjdGlvbi4NCj4gDQo+IFRoZSB0cmlnZ2VyIGNhbiBiZSBhbHdheXMgZGVhY3Rp
dmF0ZWQgZnJvbSBzeXNmcyBhcyB3ZWxsIGFzIHNldCB1cA0KPiBhZ2Fpbi4NCj4gDQo+ID4gV2hh
dCB0aGlzIGRyaXZlciBpbnRlbmRzIHRvIGRvIGlzIHRvIGFsbG93IFNXIHRvIHRha2Ugb3ZlciB0
aGlzLg0KPiA+IEVnLCBpZg0KPiA+IHN5c3RlbSBpcyBkZXNpZ25lZCBzbyB0aGF0IGl0IGlzIHBy
ZWZlcmFibHkgdG8gdXNlIHRoZXNlIExFRHMgZm9yDQo+ID4gc29tZQ0KPiA+IG90aGVyIHB1cnBv
c2UgaXQgY2FuIGJlIGRvbmUgYnkgbG9hZGluZyB0aGlzIExFRCBkcml2ZXIgYW5kDQo+ID4gYWxs
b3dpbmcNCj4gPiB1c2VyLXNwYWNlIHRvIGNvbnRyb2wgdGhlc2UgTEVEcyB2aWEgc3lzZnMuDQo+
IA0KPiBTbyB0aGUgTEVEIHRyaWdnZXIgaW50ZXJmYWNlIHdvdWxkIGhlbHAgdG8gc2lnbmFsaXpl
IGluIHdoaWNoIHN0YXRlDQo+IHRoZSBMRUQgaXMuIElmIHRoZSB0cmlnZ2VyIGlzIHNldCB0aGVu
IGl0IG1lYW5zIHRoZSBMRUQgaXMgdW5kZXIgaHcNCj4gY29udHJvbC4NCg0KVGhpcyBtaWdodCBi
ZSBoYW5keS4gSSBuZWVkIHRvIGNoZWNrIHRoZSBkYXRhLXNoZWV0IGJlY2F1c2UgSSB0aGluaw0K
dGhlcmUgd2FzIG93biBjb250cm9sIGZvciB1c2luZyBvbmUgb2YgdGhlIExFRHMgZm9yIGNoYXJn
ZSBpbmRpY2F0b3IuDQpJdCBtaWdodCBiZSB0aGF0IGJ5LWRlZmF1bHQgdGhlIEhXIGNvbnRyb2wg
b2YgTEVEcyBtZWFucyB0aGF0IG9ubHkgdGhlDQpwb3dlciBidXR0b24gcHJlc3NlcyBhcmUgc2ln
bmFsZWQgdmlhIHRoZXNlIExFRHMuIFRoaXMgdHJpZ2dlciB0aGluZw0KY291bGQgYmUgaGFuZHkg
Zm9yIGVuYWJsaW5nL2Rpc2FibGluZyBhbHNvIHRoZSBjaGFyZ2UgaW5kaWNhdGlvbiBhcw0Kd2Vs
bCBhcyBmb3IgY2hlY2tpbmcgaWYgTEVEcyBhcmUgaW4gZm9yY2VkIHN0YXRlIC0gYWx0aG91Z2gg
dGhpcyBtaWdodA0KYmUgc29tZXdoYXQgY29tcGxpY2F0ZWQgYmVjYXVzZSB0aGUgJ3R1cm4gbGVk
IG9uJyBiaXQgaXMgY29ubmVjdGVkIHRvDQp0aGUgJ3RyaWdnZXInLiBFZywgZXZlbiBpZiB0aGUg
dHJpZ2dlciBzYXlzIHRoYXQgU1cgaXMgY29udHJvbGxpbmcgTEVELA0KdHVybmluZyBvZmYgdGhl
IExFRCBtYXkgbWVhbiB0aGF0IHRyaWdnZXIgY2hhbmdlcy4gQnV0IHdlbGwsIHRoaXMgaXMNCnRo
ZSBIVyBkZXNpZ24gd2UgYXJlIGRlYWxpbmcgd2l0aCBhdCB0aGlzIHRpbWUgOi8gSW4gYW55IGNh
c2UsIEknbGwNCmxlYXZlIHRoaXMgYXMgZnVydGhlciBkZXYgaXRlbSBmb3Igbm93Lg0KDQpBZ2Fp
biwgdGhhbmtzIGZvciBhbGwgdGhlIGhlbHAhDQoNCkJyLA0KCU1hdHRpIFZhaXR0aW5lbg0KDQo=
