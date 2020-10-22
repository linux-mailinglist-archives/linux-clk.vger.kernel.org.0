Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116C8295EAA
	for <lists+linux-clk@lfdr.de>; Thu, 22 Oct 2020 14:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2898312AbgJVMhz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 22 Oct 2020 08:37:55 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:33534 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2898293AbgJVMhy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Oct 2020 08:37:54 -0400
X-UUID: 5335655f22e94439be81c85860620fc2-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NXtnk5V4ItBOGYeN/Z9GlZO1uWYyaw+gCkpcnBe52MI=;
        b=Yew5/s22j9AknGmnonJud9brFLo3IhHdjJ+Aff4WLSCWRWXJ7nHw/gxJPAAItsg+UmI9FbSGNfmbTrnDkjT5jKbZS3JHmukmUC0bbp34WSjjmNBq89gkxQ/w+Xpo6DB/RRcmTA42g5MXnUEIL9luCvAM8vwUA9f9XbD7A0kGZTg=;
X-UUID: 5335655f22e94439be81c85860620fc2-20201022
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 307378200; Thu, 22 Oct 2020 20:37:46 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:37:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 20:37:44 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v4 00/34] Mediatek MT8192 clock support 
Date:   Thu, 22 Oct 2020 20:36:53 +0800
Message-ID: <1603370247-30437-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Y2hhbmdlcyBzaW5jZSB2MzoNCi0gYWRkIGNyaXRpY2FsIGNsb2Nrcw0KLSBzcGxpdCBsYXJnZSBw
YXRjaGVzIGludG8gc21hbGwgb25lcw0KDQpjaGFuZ2VzIHNpbmNlIHYyOg0KLSB1cGRhdGUgYW5k
IHNwbGl0IGR0LWJpbmRpbmcgZG9jdW1lbnRzIGJ5IGZ1bmN0aW9uYWxpdGllcw0KLSBhZGQgZXJy
b3IgY2hlY2tpbmcgaW4gcHJvYmUoKSBmdW5jdGlvbg0KLSBmaXggaW5jb3JyZWN0IGNsb2NrIHJl
bGF0aW9uIGFuZCBhZGQgY3JpdGljYWwgY2xvY2tzDQotIHVwZGF0ZSBsaWNlbnNlIGlkZW50aWZp
ZXIgYW5kIG1pbm9yIGZpeCBvZiBjb2Rpbmcgc3R5bGUNCg0KY2hhbmdlcyBzaW5jZSB2MToNCi0g
Zml4IGFzeW1tZXRyaWNhbCBjb250cm9sIG9mIFBMTA0KLSBoYXZlIGVuX21hc2sgdXNlZCBhcyBk
aXZpZGVyIGVuYWJsZSBtYXNrIG9uIGFsbCBNZWRpYVRlayBTb0MNCg0KDQpXZWl5aSBMdSAoMzQp
Og0KICBkdC1iaW5kaW5nczogQVJNOiBNZWRpYXRlazogQWRkIG5ldyBkb2N1bWVudCBiaW5kaW5n
cyBvZiBjYW1zeXMgcmF3DQogICAgY29udHJvbGxlcg0KICBkdC1iaW5kaW5nczogQVJNOiBNZWRp
YXRlazogQWRkIG5ldyBkb2N1bWVudCBiaW5kaW5ncyBvZiBpbXAgaTJjDQogICAgd3JhcHBlciBj
b250cm9sbGVyDQogIGR0LWJpbmRpbmdzOiBBUk06IE1lZGlhdGVrOiBBZGQgbmV3IGRvY3VtZW50
IGJpbmRpbmdzIG9mIG1kcHN5cw0KICAgIGNvbnRyb2xsZXINCiAgZHQtYmluZGluZ3M6IEFSTTog
TWVkaWF0ZWs6IEFkZCBuZXcgZG9jdW1lbnQgYmluZGluZ3Mgb2YgbXNkYw0KICAgIGNvbnRyb2xs
ZXINCiAgZHQtYmluZGluZ3M6IEFSTTogTWVkaWF0ZWs6IEFkZCBuZXcgZG9jdW1lbnQgYmluZGlu
Z3Mgb2Ygc2NwIGFkc3ANCiAgICBjb250cm9sbGVyDQogIGR0LWJpbmRpbmdzOiBBUk06IE1lZGlh
dGVrOiBBZGQgbmV3IGRvY3VtZW50IGJpbmRpbmdzIG9mIHZkZWNzeXMgc29jDQogICAgY29udHJv
bGxlcg0KICBkdC1iaW5kaW5nczogQVJNOiBNZWRpYXRlazogRG9jdW1lbnQgYmluZGluZ3Mgb2Yg
TVQ4MTkyIGNsb2NrDQogICAgY29udHJvbGxlcnMNCiAgY2xrOiBtZWRpYXRlazogQWRkIGR0LWJp
bmRpbmdzIG9mIE1UODE5MiBjbG9ja3MNCiAgY2xrOiBtZWRpYXRlazogRml4IGFzeW1tZXRyaWNh
bCBQTEwgZW5hYmxlIGFuZCBkaXNhYmxlIGNvbnRyb2wNCiAgY2xrOiBtZWRpYXRlazogQWRkIGNv
bmZpZ3VyYWJsZSBlbmFibGUgY29udHJvbCB0byBtdGtfcGxsX2RhdGENCiAgY2xrOiBtZWRpYXRl
azogQWRkIE1UODE5MiBiYXNpYyBjbG9ja3Mgc3VwcG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQg
TVQ4MTkyIGF1ZGlvIGNsb2NrIHN1cHBvcnQNCiAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiBj
YW1zeXMgY2xvY2sgc3VwcG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIGNhbXN5cyBy
YXdhIGNsb2NrIHN1cHBvcnQNCiAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiBjYW1zeXMgcmF3
YiBjbG9jayBzdXBwb3J0DQogIGNsazogbWVkaWF0ZWs6IEFkZCBNVDgxOTIgY2Ftc3lzIHJhd2Mg
Y2xvY2sgc3VwcG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIGltZ3N5cyBjbG9jayBz
dXBwb3J0DQogIGNsazogbWVkaWF0ZWs6IEFkZCBNVDgxOTIgaW1nc3lzMiBjbG9jayBzdXBwb3J0
DQogIGNsazogbWVkaWF0ZWs6IEFkZCBNVDgxOTIgaW1wIGkyYyB3cmFwcGVyIGMgY2xvY2sgc3Vw
cG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIGltcCBpMmMgd3JhcHBlciBlIGNsb2Nr
IHN1cHBvcnQNCiAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiBpbXAgaTJjIHdyYXBwZXIgbiBj
bG9jayBzdXBwb3J0DQogIGNsazogbWVkaWF0ZWs6IEFkZCBNVDgxOTIgaW1wIGkyYyB3cmFwcGVy
IHMgY2xvY2sgc3VwcG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIGltcCBpMmMgd3Jh
cHBlciB3IGNsb2NrIHN1cHBvcnQNCiAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiBpbXAgaTJj
IHdyYXBwZXIgd3MgY2xvY2sgc3VwcG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIGlw
ZXN5cyBjbG9jayBzdXBwb3J0DQogIGNsazogbWVkaWF0ZWs6IEFkZCBNVDgxOTIgbWRwc3lzIGNs
b2NrIHN1cHBvcnQNCiAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiBtZmdjZmcgY2xvY2sgc3Vw
cG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTkyIG1tc3lzIGNsb2NrIHN1cHBvcnQNCiAg
Y2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiBtc2RjIHRvcCBjbG9jayBzdXBwb3J0DQogIGNsazog
bWVkaWF0ZWs6IEFkZCBNVDgxOTIgbXNkYyBjbG9jayBzdXBwb3J0DQogIGNsazogbWVkaWF0ZWs6
IEFkZCBNVDgxOTIgc2NwIGFkc3AgY2xvY2sgc3VwcG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQg
TVQ4MTkyIHZkZWNzeXMgY2xvY2sgc3VwcG9ydA0KICBjbGs6IG1lZGlhdGVrOiBBZGQgTVQ4MTky
IHZkZWNzeXMgc29jIGNsb2NrIHN1cHBvcnQNCiAgY2xrOiBtZWRpYXRlazogQWRkIE1UODE5MiB2
ZW5jc3lzIGNsb2NrIHN1cHBvcnQNCg0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssYXBtaXhl
ZHN5cy50eHQgICAgICB8ICAgIDEgKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssYXVkc3lzLnR4dCB8ICAgIDEgKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssY2Ftc3lz
LXJhdy55YW1sICAgICB8ICAgNTQgKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssY2Ftc3lzLnR4dCB8ICAgIDEgKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssaW1nc3lzLnR4dCB8ICAgIDIgKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW1wX2lp
Y193cmFwLnlhbWwgICB8ICAgNzggKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW5mcmFj
ZmcudHh0ICAgICAgICB8ICAgIDEgKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssaXBlc3lzLnR4dCB8ICAgIDEgKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbWRwc3lz
LnlhbWwgICAgICAgICB8ICAgMzggKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssbWZnY2ZnLnR4dCB8ICAgIDEgKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssbW1zeXMudHh0ICB8ICAgIDEgKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssbXNkYy55YW1sICB8ICAgNDYgKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWsscGVyaWNm
Zy55YW1sICAgICAgICB8ICAgIDEgKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssc2NwLWFk
c3AueWFtbCAgICAgICB8ICAgMzggKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdG9wY2tn
ZW4udHh0ICAgICAgICB8ICAgIDEgKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdmRlY3N5
cy1zb2MueWFtbCAgICB8ICAgMzggKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdmRlY3N5
cy50eHQgICAgICAgICB8ICAgIDEgKw0KIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdmVuY3N5
cy50eHQgICAgICAgICB8ICAgIDEgKw0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL0tjb25maWcgICAg
ICAgICAgICAgICAgICB8ICAxNDYgKysNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgfCAgIDI0ICsNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTky
LWF1ZC5jICAgICAgICAgfCAgMTE4ICsrDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1jYW0uYyAgICAgICAgIHwgICA3MiArDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1jYW1fcmF3YS5jICAgIHwgICA1OSArDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1jYW1fcmF3Yi5jICAgIHwgICA1OSArDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1jYW1fcmF3Yy5jICAgIHwgICA1OSArDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1pbWcuYyAgICAgICAgIHwgICA2MCArDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1pbWcyLmMgICAgICAgIHwgICA2MiArDQogLi4uL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWlt
cF9paWNfd3JhcF9jLmMgIHwgICA2MiArDQogLi4uL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWlt
cF9paWNfd3JhcF9lLmMgIHwgICA1OSArDQogLi4uL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWlt
cF9paWNfd3JhcF9uLmMgIHwgICA2MCArDQogLi4uL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWlt
cF9paWNfd3JhcF9zLmMgIHwgICA2MSArDQogLi4uL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWlt
cF9paWNfd3JhcF93LmMgIHwgICA1OSArDQogLi4uL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWlt
cF9paWNfd3JhcF93cy5jIHwgICA2MSArDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1pcGUuYyAgICAgICAgIHwgICA2NCArDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi1tZHAuYyAgICAgICAgIHwgICA4OSArKw0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgx
OTItbWZnLmMgICAgICAgICB8ICAgNTcgKw0KIGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgx
OTItbW0uYyAgICAgICAgICB8ICAxMDggKysNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
MTkyLW1zZGMuYyAgICAgICAgfCAgIDU3ICsNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
MTkyLW1zZGNfdG9wLmMgICAgfCAgIDcxICsNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
MTkyLXNjcF9hZHNwLmMgICAgfCAgIDU3ICsNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
MTkyLXZkZWMuYyAgICAgICAgfCAgIDgyICsNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
MTkyLXZkZWNfc29jLmMgICAgfCAgIDgyICsNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
MTkyLXZlbmMuYyAgICAgICAgfCAgIDYwICsNCiBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4
MTkyLmMgICAgICAgICAgICAgfCAxMzUwICsrKysrKysrKysrKysrKysrDQogZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLW10ay5oICAgICAgICAgICAgICAgIHwgICAgMiArDQogZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLW11eC5oICAgICAgICAgICAgICAgIHwgICAxNSArDQogZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLXBsbC5jICAgICAgICAgICAgICAgIHwgICAzMSArLQ0KIGluY2x1ZGUvZHQt
YmluZGluZ3MvY2xvY2svbXQ4MTkyLWNsay5oICAgICAgICB8ICA1OTIgKysrKysrKysNCiA0OCBm
aWxlcyBjaGFuZ2VkLCA0MDM2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQogY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0
ZWsvbWVkaWF0ZWssY2Ftc3lzLXJhdy55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW1wX2lpY193
cmFwLnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtZHBzeXMueWFtbA0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlh
dGVrLG1zZGMueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHNjcC1hZHNwLnlhbWwNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRl
ay9tZWRpYXRlayx2ZGVjc3lzLXNvYy55YW1sDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Y2xrL21lZGlhdGVrL2Nsay1tdDgxOTItYXVkLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1jYW0uYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWNhbV9yYXdhLmMNCiBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1jYW1fcmF3Yi5jDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItY2FtX3Jhd2MuYw0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWltZy5jDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItaW1nMi5j
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItaW1w
X2lpY193cmFwX2MuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9j
bGstbXQ4MTkyLWltcF9paWNfd3JhcF9lLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1pbXBfaWljX3dyYXBfbi5jDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItaW1wX2lpY193cmFwX3MuYw0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLWltcF9paWNf
d3JhcF93LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10
ODE5Mi1pbXBfaWljX3dyYXBfd3MuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQ4MTkyLWlwZS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDgxOTItbWRwLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9j
bGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1tZmcuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLW1tLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1tc2RjLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi1tc2RjX3RvcC5jDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxOTItc2NwX2Fkc3AuYw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLXZkZWMuYw0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLXZkZWNfc29jLmMN
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi12ZW5j
LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5Mi5j
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbXQ4MTkyLWNs
ay5oDQo=

