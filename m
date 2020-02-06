Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1D51541F6
	for <lists+linux-clk@lfdr.de>; Thu,  6 Feb 2020 11:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgBFKht (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 6 Feb 2020 05:37:49 -0500
Received: from skedge03.snt-world.com ([91.208.41.68]:53756 "EHLO
        skedge03.snt-world.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728261AbgBFKht (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Feb 2020 05:37:49 -0500
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by skedge03.snt-world.com (Postfix) with ESMTPS id 9E20267A900;
        Thu,  6 Feb 2020 11:37:45 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 6 Feb 2020
 11:37:45 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Thu, 6 Feb 2020 11:37:45 +0100
From:   Schrempf Frieder <frieder.schrempf@kontron.de>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        "Sascha Hauer" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "Anson Huang" <anson.huang@nxp.com>, Jacky Bai <ping.bai@nxp.com>
CC:     Peng Fan <peng.fan@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] clk: imx8mm: Switch to platform driver
Thread-Topic: [PATCH v2] clk: imx8mm: Switch to platform driver
Thread-Index: AQHV3Nj/eAC8KOmHpke/9mSCMhEqHagN6HgA
Date:   Thu, 6 Feb 2020 10:37:44 +0000
Message-ID: <c2a9d048-6a33-f357-ac88-4eb81002fe93@kontron.de>
References: <1562682003-20951-1-git-send-email-abel.vesa@nxp.com>
 <2df024c3-ab46-4e33-f961-5ef994aea145@kontron.de>
In-Reply-To: <2df024c3-ab46-4e33-f961-5ef994aea145@kontron.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B288547C4D22B45890B1242951194EE@snt-world.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 9E20267A900.A127B
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: abel.vesa@nxp.com, anson.huang@nxp.com,
        fabio.estevam@nxp.com, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, mturquette@baylibre.com, peng.fan@nxp.com,
        ping.bai@nxp.com, sboyd@kernel.org, shawnguo@kernel.org
X-Spam-Status: No
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gMDYuMDIuMjAgMTE6MzQsIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6DQo+IEhpLA0KPiANCj4g
T24gMDkuMDcuMTkgMTY6MjAsIEFiZWwgVmVzYSB3cm90ZToNCj4+IFRoZXJlIGlzIG5vIHN0cm9u
ZyByZWFzb24gZm9yIHRoaXMgdG8gdXNlIENMS19PRl9ERUNMQVJFIGluc3RlYWQNCj4+IG9mIGJl
aW5nIGEgcGxhdGZvcm0gZHJpdmVyLiBQbHVzLCB0aGlzIHdpbGwgbm93IGJlIGFsaWduZWQgd2l0
aCB0aGUNCj4+IG90aGVyIGkuTVg4TSBjbG9jayBkcml2ZXJzIHdoaWNoIGFyZSBwbGF0Zm9ybSBk
cml2ZXJzLg0KPj4NCj4+IEluIG9yZGVyIHRvIG1ha2UgdGhlIGNsb2NrIHByb3ZpZGVyIGEgcGxh
dGZvcm0gZHJpdmVyDQo+PiBhbGwgdGhlIGRhdGEgYW5kIGNvZGUgbmVlZHMgdG8gYmUgb3V0c2lk
ZSBvZiAuaW5pdCBzZWN0aW9uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFiZWwgVmVzYSA8YWJl
bC52ZXNhQG54cC5jb20+DQo+PiBBY2tlZC1ieTogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwu
b3JnPg0KPiANCj4gVGhpcyBoYXMgYmVlbiB1cHN0cmVhbSBmb3IgcXVpdGUgc29tZSB0aW1lIG5v
dywgYnV0IHNvbWVob3cgSSBoYXZlIGFuDQo+IGlzc3VlIHdpdGggU1BJIG9uIHRoZSBpLk1YOE1N
IHRoYXQgZ2V0cyByZXNvbHZlZCB3aGVuIEkgcmV2ZXJ0IHRoaXMgcGF0Y2guDQo+IA0KPiBXaGVu
IEkgdHJ5IHRvIHByb2JlIGFuIFNQSSBOT1IgZmxhc2ggd2l0aCBsYXRlc3QgNS40IG9yIGV2ZW4g
NS41Og0KPiANCj4gCXNwaV9pbXggMzA4MjAwMDAuc3BpOiBkbWEgc2V0dXAgZXJyb3IgLTE5LCB1
c2UgcGlvDQo+IAlzcGktbm9yIHNwaTAuMDogdW5yZWNvZ25pemVkIEpFREVDIGlkIGJ5dGVzOiAw
MCAwMCAwMCAwMCAwMCAwMA0KPiAJc3BpX2lteCAzMDgyMDAwMC5zcGk6IHByb2JlZA0KPiANCj4g
V2hlbiBJIHJldmVydCB0aGlzIHBhdGNoOg0KPiANCj4gCXNwaV9pbXggMzA4MjAwMDAuc3BpOiBk
bWEgc2V0dXAgZXJyb3IgLTE5LCB1c2UgcGlvDQo+IAlzcGktbm9yIHNwaTAuMDogbXgyNXIxNjM1
ZiAoMjA0OCBLYnl0ZXMpDQo+IAlzcGlfaW14IDMwODIwMDAwLnNwaTogcHJvYmVkDQo+IA0KPiBQ
bGVhc2Ugbm90ZSwgdGhhdCBpbiBib3RoIGNhc2VzIEkgaGF2ZSBkaXNhYmxlZCBETUEsIGFzIHRo
aXMgY2F1c2VzIGV2ZW4NCj4gbW9yZSB0cm91YmxlIChzZWUgWzFdKS4gQnV0IGV2ZW4gd2l0aCBE
TUEgZW5hYmxlZCBhbmQgaWdub3JpbmcgdGhlIERNQQ0KPiBlcnJvcnMsIHRoZSBpc3N1ZSBkZXNj
cmliZWQgYWJvdmUgb2NjdXJzLg0KPiANCj4gRG9lcyBzb21lb25lIGhhdmUgYW4gaWRlYSB3aGF0
J3Mgd3Jvbmc/DQo+IEFtIEkgdGhlIG9ubHkgdXNlciBvZiBTUEkgb24gaS5NWDhNTSBhcyB0aGlz
IGlzc3VlIHNlZW1zIHRvIGV4aXN0DQo+IHVwc3RyZWFtIHNpbmNlIHY1LjQtcmMxPw0KPiANCj4g
VGhhbmtzLA0KPiBGcmllZGVyDQoNClNvcnJ5IGZvcmdvdCB0aGUgbGluazoNCg0KWzFdOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTA4NjQ1OS8NCg0KPiANCj4+IC0t
LQ0KPj4NCj4+IENoYW5nZXMgc2luY2UgdjE6DQo+PiAgICAqIFN3aXRjaGVkIHRvIHBsYXRmb3Jt
IGRyaXZlciBtZW1vcnkgbWFwcGluZyBBUEkNCj4+ICAgICogUmVtb3ZlZCBleHRyYSBuZXdsaW5l
DQo+PiAgICAqIEFkZGVkIGFuIGV4cGxhbmF0aW9uIG9mIHdoeSB0aGlzIGNoYW5nZSBpcyBkb25l
DQo+PiAgICAgIGluIHRoZSBjb21taXQgbWVzc2FnZQ0KPj4NCj4+ICAgIGRyaXZlcnMvY2xrL2lt
eC9jbGstaW14OG1tLmMgfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDIxIGRlbGV0
aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9pbXgvY2xrLWlteDhtbS5j
IGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4bW0uYw0KPj4gaW5kZXggNmI4ZTc1ZC4uN2E4ZTcx
MyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OG1tLmMNCj4+ICsrKyBi
L2RyaXZlcnMvY2xrL2lteC9jbGstaW14OG1tLmMNCj4+IEBAIC02OCw0MyArNjgsNDMgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpbXhfcGxsMTR4eF9yYXRlX3RhYmxlIGlteDhtbV9kcmFtcGxsX3Ri
bFtdID0gew0KPj4gICAgCVBMTF8xNDQzWF9SQVRFKDY1MDAwMDAwMFUsIDMyNSwgMywgMiwgMCks
DQo+PiAgICB9Ow0KPj4gICAgDQo+PiAtc3RhdGljIHN0cnVjdCBpbXhfcGxsMTR4eF9jbGsgaW14
OG1tX2F1ZGlvX3BsbCBfX2luaXRkYXRhID0gew0KPj4gK3N0YXRpYyBzdHJ1Y3QgaW14X3BsbDE0
eHhfY2xrIGlteDhtbV9hdWRpb19wbGwgPSB7DQo+PiAgICAJCS50eXBlID0gUExMXzE0NDNYLA0K
Pj4gICAgCQkucmF0ZV90YWJsZSA9IGlteDhtbV9hdWRpb3BsbF90YmwsDQo+PiAgICAJCS5yYXRl
X2NvdW50ID0gQVJSQVlfU0laRShpbXg4bW1fYXVkaW9wbGxfdGJsKSwNCj4+ICAgIH07DQo+PiAg
ICANCj4+IC1zdGF0aWMgc3RydWN0IGlteF9wbGwxNHh4X2NsayBpbXg4bW1fdmlkZW9fcGxsIF9f
aW5pdGRhdGEgPSB7DQo+PiArc3RhdGljIHN0cnVjdCBpbXhfcGxsMTR4eF9jbGsgaW14OG1tX3Zp
ZGVvX3BsbCA9IHsNCj4+ICAgIAkJLnR5cGUgPSBQTExfMTQ0M1gsDQo+PiAgICAJCS5yYXRlX3Rh
YmxlID0gaW14OG1tX3ZpZGVvcGxsX3RibCwNCj4+ICAgIAkJLnJhdGVfY291bnQgPSBBUlJBWV9T
SVpFKGlteDhtbV92aWRlb3BsbF90YmwpLA0KPj4gICAgfTsNCj4+ICAgIA0KPj4gLXN0YXRpYyBz
dHJ1Y3QgaW14X3BsbDE0eHhfY2xrIGlteDhtbV9kcmFtX3BsbCBfX2luaXRkYXRhID0gew0KPj4g
K3N0YXRpYyBzdHJ1Y3QgaW14X3BsbDE0eHhfY2xrIGlteDhtbV9kcmFtX3BsbCA9IHsNCj4+ICAg
IAkJLnR5cGUgPSBQTExfMTQ0M1gsDQo+PiAgICAJCS5yYXRlX3RhYmxlID0gaW14OG1tX2RyYW1w
bGxfdGJsLA0KPj4gICAgCQkucmF0ZV9jb3VudCA9IEFSUkFZX1NJWkUoaW14OG1tX2RyYW1wbGxf
dGJsKSwNCj4+ICAgIH07DQo+PiAgICANCj4+IC1zdGF0aWMgc3RydWN0IGlteF9wbGwxNHh4X2Ns
ayBpbXg4bW1fYXJtX3BsbCBfX2luaXRkYXRhID0gew0KPj4gK3N0YXRpYyBzdHJ1Y3QgaW14X3Bs
bDE0eHhfY2xrIGlteDhtbV9hcm1fcGxsID0gew0KPj4gICAgCQkudHlwZSA9IFBMTF8xNDE2WCwN
Cj4+ICAgIAkJLnJhdGVfdGFibGUgPSBpbXg4bW1fcGxsMTQxNnhfdGJsLA0KPj4gICAgCQkucmF0
ZV9jb3VudCA9IEFSUkFZX1NJWkUoaW14OG1tX3BsbDE0MTZ4X3RibCksDQo+PiAgICB9Ow0KPj4g
ICAgDQo+PiAtc3RhdGljIHN0cnVjdCBpbXhfcGxsMTR4eF9jbGsgaW14OG1tX2dwdV9wbGwgX19p
bml0ZGF0YSA9IHsNCj4+ICtzdGF0aWMgc3RydWN0IGlteF9wbGwxNHh4X2NsayBpbXg4bW1fZ3B1
X3BsbCA9IHsNCj4+ICAgIAkJLnR5cGUgPSBQTExfMTQxNlgsDQo+PiAgICAJCS5yYXRlX3RhYmxl
ID0gaW14OG1tX3BsbDE0MTZ4X3RibCwNCj4+ICAgIAkJLnJhdGVfY291bnQgPSBBUlJBWV9TSVpF
KGlteDhtbV9wbGwxNDE2eF90YmwpLA0KPj4gICAgfTsNCj4+ICAgIA0KPj4gLXN0YXRpYyBzdHJ1
Y3QgaW14X3BsbDE0eHhfY2xrIGlteDhtbV92cHVfcGxsIF9faW5pdGRhdGEgPSB7DQo+PiArc3Rh
dGljIHN0cnVjdCBpbXhfcGxsMTR4eF9jbGsgaW14OG1tX3ZwdV9wbGwgPSB7DQo+PiAgICAJCS50
eXBlID0gUExMXzE0MTZYLA0KPj4gICAgCQkucmF0ZV90YWJsZSA9IGlteDhtbV9wbGwxNDE2eF90
YmwsDQo+PiAgICAJCS5yYXRlX2NvdW50ID0gQVJSQVlfU0laRShpbXg4bW1fcGxsMTQxNnhfdGJs
KSwNCj4+ICAgIH07DQo+PiAgICANCj4+IC1zdGF0aWMgc3RydWN0IGlteF9wbGwxNHh4X2NsayBp
bXg4bW1fc3lzX3BsbCBfX2luaXRkYXRhID0gew0KPj4gK3N0YXRpYyBzdHJ1Y3QgaW14X3BsbDE0
eHhfY2xrIGlteDhtbV9zeXNfcGxsID0gew0KPj4gICAgCQkudHlwZSA9IFBMTF8xNDE2WCwNCj4+
ICAgIAkJLnJhdGVfdGFibGUgPSBpbXg4bW1fcGxsMTQxNnhfdGJsLA0KPj4gICAgCQkucmF0ZV9j
b3VudCA9IEFSUkFZX1NJWkUoaW14OG1tX3BsbDE0MTZ4X3RibCksDQo+PiBAQCAtMzc0LDcgKzM3
NCw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICppbXg4bW1fY2xrbzFfc2Vsc1tdID0geyJvc2NfMjRt
IiwgInN5c19wbGwxXzgwMG0iLCAib3NjXzI3bSIsDQo+PiAgICBzdGF0aWMgc3RydWN0IGNsayAq
Y2xrc1tJTVg4TU1fQ0xLX0VORF07DQo+PiAgICBzdGF0aWMgc3RydWN0IGNsa19vbmVjZWxsX2Rh
dGEgY2xrX2RhdGE7DQo+PiAgICANCj4+IC1zdGF0aWMgc3RydWN0IGNsayAqKiBjb25zdCB1YXJ0
X2Nsa3NbXSBfX2luaXRjb25zdCA9IHsNCj4+ICtzdGF0aWMgc3RydWN0IGNsayAqKiBjb25zdCB1
YXJ0X2Nsa3NbXSA9IHsNCj4+ICAgIAkmY2xrc1tJTVg4TU1fQ0xLX1VBUlQxX1JPT1RdLA0KPj4g
ICAgCSZjbGtzW0lNWDhNTV9DTEtfVUFSVDJfUk9PVF0sDQo+PiAgICAJJmNsa3NbSU1YOE1NX0NM
S19VQVJUM19ST09UXSwNCj4+IEBAIC0zODIsMTkgKzM4MiwyMCBAQCBzdGF0aWMgc3RydWN0IGNs
ayAqKiBjb25zdCB1YXJ0X2Nsa3NbXSBfX2luaXRjb25zdCA9IHsNCj4+ICAgIAlOVUxMDQo+PiAg
ICB9Ow0KPj4gICAgDQo+PiAtc3RhdGljIGludCBfX2luaXQgaW14OG1tX2Nsb2Nrc19pbml0KHN0
cnVjdCBkZXZpY2Vfbm9kZSAqY2NtX25vZGUpDQo+PiArc3RhdGljIGludCBpbXg4bW1fY2xvY2tz
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiAgICB7DQo+PiAtCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnA7DQo+PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7
DQo+PiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7DQo+PiAgICAJdm9p
ZCBfX2lvbWVtICpiYXNlOw0KPj4gICAgCWludCByZXQ7DQo+PiAgICANCj4+ICAgIAljbGtzW0lN
WDhNTV9DTEtfRFVNTVldID0gaW14X2Nsa19maXhlZCgiZHVtbXkiLCAwKTsNCj4+IC0JY2xrc1tJ
TVg4TU1fQ0xLXzI0TV0gPSBvZl9jbGtfZ2V0X2J5X25hbWUoY2NtX25vZGUsICJvc2NfMjRtIik7
DQo+PiAtCWNsa3NbSU1YOE1NX0NMS18zMktdID0gb2ZfY2xrX2dldF9ieV9uYW1lKGNjbV9ub2Rl
LCAib3NjXzMyayIpOw0KPj4gLQljbGtzW0lNWDhNTV9DTEtfRVhUMV0gPSBvZl9jbGtfZ2V0X2J5
X25hbWUoY2NtX25vZGUsICJjbGtfZXh0MSIpOw0KPj4gLQljbGtzW0lNWDhNTV9DTEtfRVhUMl0g
PSBvZl9jbGtfZ2V0X2J5X25hbWUoY2NtX25vZGUsICJjbGtfZXh0MiIpOw0KPj4gLQljbGtzW0lN
WDhNTV9DTEtfRVhUM10gPSBvZl9jbGtfZ2V0X2J5X25hbWUoY2NtX25vZGUsICJjbGtfZXh0MyIp
Ow0KPj4gLQljbGtzW0lNWDhNTV9DTEtfRVhUNF0gPSBvZl9jbGtfZ2V0X2J5X25hbWUoY2NtX25v
ZGUsICJjbGtfZXh0NCIpOw0KPj4gKwljbGtzW0lNWDhNTV9DTEtfMjRNXSA9IG9mX2Nsa19nZXRf
YnlfbmFtZShucCwgIm9zY18yNG0iKTsNCj4+ICsJY2xrc1tJTVg4TU1fQ0xLXzMyS10gPSBvZl9j
bGtfZ2V0X2J5X25hbWUobnAsICJvc2NfMzJrIik7DQo+PiArCWNsa3NbSU1YOE1NX0NMS19FWFQx
XSA9IG9mX2Nsa19nZXRfYnlfbmFtZShucCwgImNsa19leHQxIik7DQo+PiArCWNsa3NbSU1YOE1N
X0NMS19FWFQyXSA9IG9mX2Nsa19nZXRfYnlfbmFtZShucCwgImNsa19leHQyIik7DQo+PiArCWNs
a3NbSU1YOE1NX0NMS19FWFQzXSA9IG9mX2Nsa19nZXRfYnlfbmFtZShucCwgImNsa19leHQzIik7
DQo+PiArCWNsa3NbSU1YOE1NX0NMS19FWFQ0XSA9IG9mX2Nsa19nZXRfYnlfbmFtZShucCwgImNs
a19leHQ0Iik7DQo+PiAgICANCj4+ICAgIAlucCA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5V
TEwsIE5VTEwsICJmc2wsaW14OG1tLWFuYXRvcCIpOw0KPj4gICAgCWJhc2UgPSBvZl9pb21hcChu
cCwgMCk7DQo+PiBAQCAtNDgwLDEwICs0ODEsMTAgQEAgc3RhdGljIGludCBfX2luaXQgaW14OG1t
X2Nsb2Nrc19pbml0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqY2NtX25vZGUpDQo+PiAgICAJY2xrc1tJ
TVg4TU1fU1lTX1BMTDJfNTAwTV0gPSBpbXhfY2xrX2ZpeGVkX2ZhY3Rvcigic3lzX3BsbDJfNTAw
bSIsICJzeXNfcGxsMl9vdXQiLCAxLCAyKTsNCj4+ICAgIAljbGtzW0lNWDhNTV9TWVNfUExMMl8x
MDAwTV0gPSBpbXhfY2xrX2ZpeGVkX2ZhY3Rvcigic3lzX3BsbDJfMTAwMG0iLCAic3lzX3BsbDJf
b3V0IiwgMSwgMSk7DQo+PiAgICANCj4+IC0JbnAgPSBjY21fbm9kZTsNCj4+IC0JYmFzZSA9IG9m
X2lvbWFwKG5wLCAwKTsNCj4+IC0JaWYgKFdBUk5fT04oIWJhc2UpKQ0KPj4gLQkJcmV0dXJuIC1F
Tk9NRU07DQo+PiArCW5wID0gZGV2LT5vZl9ub2RlOw0KPj4gKwliYXNlID0gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOw0KPj4gKwlpZiAoV0FSTl9PTihJU19FUlIoYmFz
ZSkpKQ0KPj4gKwkJcmV0dXJuIFBUUl9FUlIoYmFzZSk7DQo+PiAgICANCj4+ICAgIAkvKiBDb3Jl
IFNsaWNlICovDQo+PiAgICAJY2xrc1tJTVg4TU1fQ0xLX0E1M19TUkNdID0gaW14X2Nsa19tdXgy
KCJhcm1fYTUzX3NyYyIsIGJhc2UgKyAweDgwMDAsIDI0LCAzLCBpbXg4bW1fYTUzX3NlbHMsIEFS
UkFZX1NJWkUoaW14OG1tX2E1M19zZWxzKSk7DQo+PiBAQCAtNjgyLDQgKzY4MywxOCBAQCBzdGF0
aWMgaW50IF9faW5pdCBpbXg4bW1fY2xvY2tzX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpjY21f
bm9kZSkNCj4+ICAgIA0KPj4gICAgCXJldHVybiAwOw0KPj4gICAgfQ0KPj4gLUNMS19PRl9ERUNM
QVJFX0RSSVZFUihpbXg4bW0sICJmc2wsaW14OG1tLWNjbSIsIGlteDhtbV9jbG9ja3NfaW5pdCk7
DQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgaW14OG1tX2Nsa19v
Zl9tYXRjaFtdID0gew0KPj4gKwl7IC5jb21wYXRpYmxlID0gImZzbCxpbXg4bW0tY2NtIiB9LA0K
Pj4gKwl7IC8qIFNlbnRpbmVsICovIH0sDQo+PiArfTsNCj4+ICtNT0RVTEVfREVWSUNFX1RBQkxF
KG9mLCBpbXg4bW1fY2xrX29mX21hdGNoKTsNCj4+ICsNCj4+ICtzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBpbXg4bW1fY2xrX2RyaXZlciA9IHsNCj4+ICsJLnByb2JlID0gaW14OG1tX2Ns
b2Nrc19wcm9iZSwNCj4+ICsJLmRyaXZlciA9IHsNCj4+ICsJCS5uYW1lID0gImlteDhtbS1jY20i
LA0KPj4gKwkJLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKGlteDhtbV9jbGtfb2ZfbWF0
Y2gpLA0KPj4gKwl9LA0KPj4gK307DQo+PiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihpbXg4bW1f
Y2xrX2RyaXZlcik7DQo+Pg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdA0KPiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsDQo+IA==
