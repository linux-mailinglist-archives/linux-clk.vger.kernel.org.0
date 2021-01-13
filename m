Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C43252F4517
	for <lists+linux-clk@lfdr.de>; Wed, 13 Jan 2021 08:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbhAMHTQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 13 Jan 2021 02:19:16 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:33868 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726768AbhAMHTP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jan 2021 02:19:15 -0500
X-UUID: 11dfeb5b414845e692c9f1dccb385c43-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=V2QY4ISr3FU5R+e8pjEwcvT9G7BlJkDWriZVo+1cfW8=;
        b=au+cPOGxgv494QqrxMGvCMzB5XIih8xmfZlOKKIVEGDIZeqaEVfBMJBBrMFcWjBk8/zA0BHlMZZqwkSO77JdcdyF2mLtvtUy0ZDSvieFsZGlJWo6yj6RIA13SHKna1BATd+QJaYhOw6jp0+70cJWSnSJzYulKICUcVP9GFgmBko=;
X-UUID: 11dfeb5b414845e692c9f1dccb385c43-20210113
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <jamesjj.liao@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1500703524; Wed, 13 Jan 2021 15:18:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 15:18:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Jan 2021 15:18:23 +0800
Message-ID: <1610522303.5827.2.camel@mtksdaap41>
Subject: Re: [PATCH v6 00/22] Mediatek MT8192 clock support
From:   James Liao <jamesjj.liao@mediatek.com>
To:     Weiyi Lu <weiyi.lu@mediatek.com>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Date:   Wed, 13 Jan 2021 15:18:23 +0800
In-Reply-To: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

T24gVHVlLCAyMDIwLTEyLTIyIGF0IDIxOjA5ICswODAwLCBXZWl5aSBMdSB3cm90ZToNCj4gVGhp
cyBzZXJpZXMgaXMgYmFzZWQgb24gdjUuMTAtcmMxLg0KPiANCj4gY2hhbmdlIHNpbmNlIHY1Og0K
PiAtIHJlbW92ZSB1bnVzZWQgY2xvY2tzIGJ5IHJvbGxpbmcgVGluZ2hhbidzIHBhdGNoZXNbMV1b
Ml0gaW50byBzZXJpZXMNCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1tZWRpYXRlay9saXN0Lz9zZXJpZXM9Mzk4NzgxDQo+IFsyXSBodHRwczovL3BhdGNo
d29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTQwNTE0
Mw0KPiAtIHJlbW92ZSBkdHMgcmVsYXRlZCBwYXRjaGVzIGZyb20gc2VyaWVzDQo+IA0KPiBjaGFu
Z2Ugc2luY2UgdjQ6DQo+IC0gbWVyZ2Ugc29tZSBzdWJzeXN0ZW0gaW50byBzYW1lIGRyaXZlcg0K
PiAtIGFkZCBhIGdlbmVyaWMgcHJvYmUgZnVuY3Rpb24gdG8gcmVkdWNlIGR1cGxpY2F0ZWQgY29k
ZQ0KPiANCj4gY2hhbmdlcyBzaW5jZSB2MzoNCj4gLSBhZGQgY3JpdGljYWwgY2xvY2tzDQo+IC0g
c3BsaXQgbGFyZ2UgcGF0Y2hlcyBpbnRvIHNtYWxsIG9uZXMNCj4gDQo+IGNoYW5nZXMgc2luY2Ug
djI6DQo+IC0gdXBkYXRlIGFuZCBzcGxpdCBkdC1iaW5kaW5nIGRvY3VtZW50cyBieSBmdW5jdGlv
bmFsaXRpZXMNCj4gLSBhZGQgZXJyb3IgY2hlY2tpbmcgaW4gcHJvYmUoKSBmdW5jdGlvbg0KPiAt
IGZpeCBpbmNvcnJlY3QgY2xvY2sgcmVsYXRpb24gYW5kIGFkZCBjcml0aWNhbCBjbG9ja3MNCj4g
LSB1cGRhdGUgbGljZW5zZSBpZGVudGlmaWVyIGFuZCBtaW5vciBmaXggb2YgY29kaW5nIHN0eWxl
DQo+IA0KPiBjaGFuZ2VzIHNpbmNlIHYxOg0KPiAtIGZpeCBhc3ltbWV0cmljYWwgY29udHJvbCBv
ZiBQTEwNCj4gLSBoYXZlIGVuX21hc2sgdXNlZCBhcyBkaXZpZGVyIGVuYWJsZSBtYXNrIG9uIGFs
bCBNZWRpYVRlayBTb0MNCj4gDQo+IFdlaXlpIEx1ICgyMik6DQo+ICAgZHQtYmluZGluZ3M6IEFS
TTogTWVkaWF0ZWs6IEFkZCBuZXcgZG9jdW1lbnQgYmluZGluZ3Mgb2YgaW1wIGkyYw0KPiAgICAg
d3JhcHBlciBjb250cm9sbGVyDQo+ICAgZHQtYmluZGluZ3M6IEFSTTogTWVkaWF0ZWs6IEFkZCBu
ZXcgZG9jdW1lbnQgYmluZGluZ3Mgb2YgbWRwc3lzDQo+ICAgICBjb250cm9sbGVyDQo+ICAgZHQt
YmluZGluZ3M6IEFSTTogTWVkaWF0ZWs6IEFkZCBuZXcgZG9jdW1lbnQgYmluZGluZ3Mgb2YgbXNk
Yw0KPiAgICAgY29udHJvbGxlcg0KPiAgIGR0LWJpbmRpbmdzOiBBUk06IE1lZGlhdGVrOiBBZGQg
bmV3IGRvY3VtZW50IGJpbmRpbmdzIG9mIHNjcCBhZHNwDQo+ICAgICBjb250cm9sbGVyDQo+ICAg
ZHQtYmluZGluZ3M6IEFSTTogTWVkaWF0ZWs6IERvY3VtZW50IGJpbmRpbmdzIG9mIE1UODE5MiBj
bG9jaw0KPiAgICAgY29udHJvbGxlcnMNCj4gICBjbGs6IG1lZGlhdGVrOiBBZGQgZHQtYmluZGlu
Z3Mgb2YgTVQ4MTkyIGNsb2Nrcw0KPiAgIGNsazogbWVkaWF0ZWs6IEZpeCBhc3ltbWV0cmljYWwg
UExMIGVuYWJsZSBhbmQgZGlzYWJsZSBjb250cm9sDQo+ICAgY2xrOiBtZWRpYXRlazogQWRkIGNv
bmZpZ3VyYWJsZSBlbmFibGUgY29udHJvbCB0byBtdGtfcGxsX2RhdGENCj4gICBjbGs6IG1lZGlh
dGVrOiBBZGQgbXRrX2Nsa19zaW1wbGVfcHJvYmUoKSB0byBzaW1wbGlmeSBjbG9jayBwcm92aWRl
cnMNCj4gICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIGJhc2ljIGNsb2NrcyBzdXBwb3J0DQo+
ICAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiBhdWRpbyBjbG9jayBzdXBwb3J0DQo+ICAgY2xr
OiBtZWRpYXRlazogQWRkIE1UODE5MiBjYW1zeXMgY2xvY2sgc3VwcG9ydA0KPiAgIGNsazogbWVk
aWF0ZWs6IEFkZCBNVDgxOTIgaW1nc3lzIGNsb2NrIHN1cHBvcnQNCj4gICBjbGs6IG1lZGlhdGVr
OiBBZGQgTVQ4MTkyIGltcCBpMmMgd3JhcHBlciBjbG9jayBzdXBwb3J0DQo+ICAgY2xrOiBtZWRp
YXRlazogQWRkIE1UODE5MiBpcGVzeXMgY2xvY2sgc3VwcG9ydA0KPiAgIGNsazogbWVkaWF0ZWs6
IEFkZCBNVDgxOTIgbWRwc3lzIGNsb2NrIHN1cHBvcnQNCj4gICBjbGs6IG1lZGlhdGVrOiBBZGQg
TVQ4MTkyIG1mZ2NmZyBjbG9jayBzdXBwb3J0DQo+ICAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5
MiBtbXN5cyBjbG9jayBzdXBwb3J0DQo+ICAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiBtc2Rj
IGNsb2NrIHN1cHBvcnQNCj4gICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIHNjcCBhZHNwIGNs
b2NrIHN1cHBvcnQNCj4gICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIHZkZWNzeXMgY2xvY2sg
c3VwcG9ydA0KPiAgIGNsazogbWVkaWF0ZWs6IEFkZCBNVDgxOTIgdmVuY3N5cyBjbG9jayBzdXBw
b3J0DQo+IA0KPiAgLi4uL2FybS9tZWRpYXRlay9tZWRpYXRlayxhcG1peGVkc3lzLnR4dCAgICAg
IHwgICAgMSArDQo+ICAuLi4vYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLGF1ZHN5cy50
eHQgfCAgICAxICsNCj4gIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssY2Ftc3lz
LnR4dCB8ICAgMjIgKw0KPiAgLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxpbWdz
eXMudHh0IHwgICAgMiArDQo+ICAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLGltcF9paWNfd3Jh
cC55YW1sICAgfCAgIDc4ICsNCj4gIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW5mcmFjZmcu
dHh0ICAgICAgICB8ICAgIDEgKw0KPiAgLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRl
ayxpcGVzeXMudHh0IHwgICAgMSArDQo+ICAuLi4vYXJtL21lZGlhdGVrL21lZGlhdGVrLG1kcHN5
cy55YW1sICAgICAgICAgfCAgIDM4ICsNCj4gIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVk
aWF0ZWssbWZnY2ZnLnR4dCB8ICAgIDEgKw0KPiAgLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9t
ZWRpYXRlayxtbXN5cy50eHQgIHwgICAgMSArDQo+ICAuLi4vYmluZGluZ3MvYXJtL21lZGlhdGVr
L21lZGlhdGVrLG1zZGMueWFtbCAgfCAgIDQ2ICsNCj4gIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWsscGVyaWNmZy55YW1sICAgICAgICB8ICAgIDEgKw0KPiAgLi4uL2FybS9tZWRpYXRlay9tZWRp
YXRlayxzY3AtYWRzcC55YW1sICAgICAgIHwgICAzOCArDQo+ICAuLi4vYXJtL21lZGlhdGVrL21l
ZGlhdGVrLHRvcGNrZ2VuLnR4dCAgICAgICAgfCAgICAxICsNCj4gIC4uLi9hcm0vbWVkaWF0ZWsv
bWVkaWF0ZWssdmRlY3N5cy50eHQgICAgICAgICB8ICAgIDggKw0KPiAgLi4uL2FybS9tZWRpYXRl
ay9tZWRpYXRlayx2ZW5jc3lzLnR4dCAgICAgICAgIHwgICAgMSArDQo+ICBkcml2ZXJzL2Nsay9t
ZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDgwICsNCj4gIGRyaXZlcnMvY2xr
L21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMTMgKw0KPiAgZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1hdWQuYyAgICAgICAgIHwgIDExOCArKw0KPiAgZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1jYW0uYyAgICAgICAgIHwgIDEwNyArKw0KPiAgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1pbWcuYyAgICAgICAgIHwgICA3MCArDQo+ICAu
Li4vY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItaW1wX2lpY193cmFwLmMgICAgfCAgMTE5ICsrDQo+
ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWlwZS5jICAgICAgICAgfCAgIDU3ICsN
Cj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItbWRwLmMgICAgICAgICB8ICAgODIg
Kw0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1tZmcuYyAgICAgICAgIHwgICA1
MCArDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLW1tLmMgICAgICAgICAgfCAg
MTA4ICsrDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLW1zZGMuYyAgICAgICAg
fCAgIDg1ICsrDQo+ICBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLXNjcF9hZHNwLmMg
ICAgfCAgIDUwICsNCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItdmRlYy5jICAg
ICAgICB8ICAgOTQgKysNCj4gIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItdmVuYy5j
ICAgICAgICB8ICAgNTMgKw0KPiAgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi5jICAg
ICAgICAgICAgIHwgMTMyNiArKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9jbGsvbWVkaWF0
ZWsvY2xrLW10ay5jICAgICAgICAgICAgICAgIHwgICAyMyArDQo+ICBkcml2ZXJzL2Nsay9tZWRp
YXRlay9jbGstbXRrLmggICAgICAgICAgICAgICAgfCAgIDEwICsNCj4gIGRyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdXguaCAgICAgICAgICAgICAgICB8ICAgMTUgKw0KPiAgZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLXBsbC5jICAgICAgICAgICAgICAgIHwgICAzMSArLQ0KPiAgaW5jbHVkZS9k
dC1iaW5kaW5ncy9jbG9jay9tdDgxOTItY2xrLmggICAgICAgIHwgIDU4NSArKysrKysrKw0KPiAg
MzYgZmlsZXMgY2hhbmdlZCwgMzMxMCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssaW1wX2lpY193cmFwLnlhbWwNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVr
LG1kcHN5cy55YW1sDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtc2RjLnlhbWwNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVr
L21lZGlhdGVrLHNjcC1hZHNwLnlhbWwNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Ns
ay9tZWRpYXRlay9jbGstbXQ4MTkyLWF1ZC5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1jYW0uYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItaW1nLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWltcF9paWNfd3JhcC5jDQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1pcGUuYw0KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItbWRwLmMN
Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLW1m
Zy5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1tbS5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10
ODE5Mi1tc2RjLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9j
bGstbXQ4MTkyLXNjcF9hZHNwLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ4MTkyLXZkZWMuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDgxOTItdmVuYy5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi5jDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9kdC1iaW5kaW5ncy9jbG9jay9tdDgxOTItY2xrLmgNCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0DQo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0KDQpBbGwgcGF0
Y2hlcyBpbiB0aGlzIHNlcmllczoNCg0KUmV2aWV3ZWQtYnk6IEphbWVzIExpYW8gPGphbWVzamou
bGlhb0BtZWRpYXRlay5jb20+DQoNCg==

