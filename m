Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 117892AAF24
	for <lists+linux-clk@lfdr.de>; Mon,  9 Nov 2020 03:13:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgKICNp (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 8 Nov 2020 21:13:45 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:38108 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729122AbgKICNo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 21:13:44 -0500
X-UUID: 127a9d94570648ec9dd925fd0af861cc-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wi2FfHDUviFWRGjbJAxecTKg5y6KMeXLiAAcMbDHRS8=;
        b=R7WETo0zu801E3wP9+P3Ke7r2zoD5znNdSc7Cys6wQYVjdLpVbOIPl1dqnocHXUEOi03NxU3vVL5dGLhHYmdM8UnJnGTvsgij1wdVZV26O8xw1AlvrVkoaGl+oS8pyRfnlXlyH3ZAmq8oUkxU6+8YXliXE37GgWxkEAZVFe8dD0=;
X-UUID: 127a9d94570648ec9dd925fd0af861cc-20201109
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1974731608; Mon, 09 Nov 2020 10:13:37 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:13:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:13:36 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Subject: [PATCH v2 01/13] clk: mediatek: Clean up the pll_en_bit from en_mask on MT2701
Date:   Mon, 9 Nov 2020 10:13:16 +0800
Message-ID: <1604888008-30555-2-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604888008-30555-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

cmVtb3ZlIHBsbF9lbl9iaXQoYml0MCkgZnJvbSBlbl9tYXNrIHRvIG1ha2UgZW5fbWFzayBhIHB1
cmUgZW5fbWFzaw0KdGhhdCBvbmx5IHVzZWQgZm9yIHBsbCBkaXZpZGVycy4NCg0KU2lnbmVkLW9m
Zi1ieTogV2VpeWkgTHUgPHdlaXlpLmx1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZlcnMvY2xr
L21lZGlhdGVrL2Nsay1tdDI3MDEuYyB8IDI2ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tDQog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10MjcwMS5jIGIvZHJpdmVycy9jbGsv
bWVkaWF0ZWsvY2xrLW10MjcwMS5jDQppbmRleCA2OTViZTBmLi40NjJhOTk4IDEwMDY0NA0KLS0t
IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10MjcwMS5jDQorKysgYi9kcml2ZXJzL2Nsay9t
ZWRpYXRlay9jbGstbXQyNzAxLmMNCkBAIC05MzQsMzEgKzkzNCwzMSBAQCBzdGF0aWMgaW50IG10
a19wZXJpY2ZnX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJfQ0KIA0KIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX3BsbF9kYXRhIGFwbWl4ZWRfcGxsc1tdID0gew0KLQlQTEwo
Q0xLX0FQTUlYRURfQVJNUExMLCAiYXJtcGxsIiwgMHgyMDAsIDB4MjBjLCAweDgwMDAwMDAxLA0K
KwlQTEwoQ0xLX0FQTUlYRURfQVJNUExMLCAiYXJtcGxsIiwgMHgyMDAsIDB4MjBjLCAweDgwMDAw
MDAwLA0KIAkJCVBMTF9BTywgMjEsIDB4MjA0LCAyNCwgMHgwLCAweDIwNCwgMCksDQotCVBMTChD
TEtfQVBNSVhFRF9NQUlOUExMLCAibWFpbnBsbCIsIDB4MjEwLCAweDIxYywgMHhmMDAwMDAwMSwN
CisJUExMKENMS19BUE1JWEVEX01BSU5QTEwsICJtYWlucGxsIiwgMHgyMTAsIDB4MjFjLCAweGYw
MDAwMDAwLA0KIAkJICBIQVZFX1JTVF9CQVIsIDIxLCAweDIxMCwgNCwgMHgwLCAweDIxNCwgMCks
DQotCVBMTChDTEtfQVBNSVhFRF9VTklWUExMLCAidW5pdnBsbCIsIDB4MjIwLCAweDIyYywgMHhm
MzAwMDAwMSwNCisJUExMKENMS19BUE1JWEVEX1VOSVZQTEwsICJ1bml2cGxsIiwgMHgyMjAsIDB4
MjJjLCAweGYzMDAwMDAwLA0KIAkJICBIQVZFX1JTVF9CQVIsIDcsIDB4MjIwLCA0LCAweDAsIDB4
MjI0LCAxNCksDQotCVBMTChDTEtfQVBNSVhFRF9NTVBMTCwgIm1tcGxsIiwgMHgyMzAsIDB4MjNj
LCAweDAwMDAwMDAxLCAwLA0KKwlQTEwoQ0xLX0FQTUlYRURfTU1QTEwsICJtbXBsbCIsIDB4MjMw
LCAweDIzYywgMCwgMCwNCiAJCQkJMjEsIDB4MjMwLCA0LCAweDAsIDB4MjM0LCAwKSwNCi0JUExM
KENMS19BUE1JWEVEX01TRENQTEwsICJtc2RjcGxsIiwgMHgyNDAsIDB4MjRjLCAweDAwMDAwMDAx
LCAwLA0KKwlQTEwoQ0xLX0FQTUlYRURfTVNEQ1BMTCwgIm1zZGNwbGwiLCAweDI0MCwgMHgyNGMs
IDAsIDAsDQogCQkJCTIxLCAweDI0MCwgNCwgMHgwLCAweDI0NCwgMCksDQotCVBMTChDTEtfQVBN
SVhFRF9UVkRQTEwsICJ0dmRwbGwiLCAweDI1MCwgMHgyNWMsIDB4MDAwMDAwMDEsIDAsDQorCVBM
TChDTEtfQVBNSVhFRF9UVkRQTEwsICJ0dmRwbGwiLCAweDI1MCwgMHgyNWMsIDAsIDAsDQogCQkJ
CTIxLCAweDI1MCwgNCwgMHgwLCAweDI1NCwgMCksDQotCVBMTChDTEtfQVBNSVhFRF9BVUQxUExM
LCAiYXVkMXBsbCIsIDB4MjcwLCAweDI3YywgMHgwMDAwMDAwMSwgMCwNCisJUExMKENMS19BUE1J
WEVEX0FVRDFQTEwsICJhdWQxcGxsIiwgMHgyNzAsIDB4MjdjLCAwLCAwLA0KIAkJCQkzMSwgMHgy
NzAsIDQsIDB4MCwgMHgyNzQsIDApLA0KLQlQTEwoQ0xLX0FQTUlYRURfVFJHUExMLCAidHJncGxs
IiwgMHgyODAsIDB4MjhjLCAweDAwMDAwMDAxLCAwLA0KKwlQTEwoQ0xLX0FQTUlYRURfVFJHUExM
LCAidHJncGxsIiwgMHgyODAsIDB4MjhjLCAwLCAwLA0KIAkJCQkzMSwgMHgyODAsIDQsIDB4MCwg
MHgyODQsIDApLA0KLQlQTEwoQ0xLX0FQTUlYRURfRVRIUExMLCAiZXRocGxsIiwgMHgyOTAsIDB4
MjljLCAweDAwMDAwMDAxLCAwLA0KKwlQTEwoQ0xLX0FQTUlYRURfRVRIUExMLCAiZXRocGxsIiwg
MHgyOTAsIDB4MjljLCAwLCAwLA0KIAkJCQkzMSwgMHgyOTAsIDQsIDB4MCwgMHgyOTQsIDApLA0K
LQlQTEwoQ0xLX0FQTUlYRURfVkRFQ1BMTCwgInZkZWNwbGwiLCAweDJhMCwgMHgyYWMsIDB4MDAw
MDAwMDEsIDAsDQorCVBMTChDTEtfQVBNSVhFRF9WREVDUExMLCAidmRlY3BsbCIsIDB4MmEwLCAw
eDJhYywgMCwgMCwNCiAJCQkJMzEsIDB4MmEwLCA0LCAweDAsIDB4MmE0LCAwKSwNCi0JUExMKENM
S19BUE1JWEVEX0hBRERTMlBMTCwgImhhZGRzMnBsbCIsIDB4MmIwLCAweDJiYywgMHgwMDAwMDAw
MSwgMCwNCisJUExMKENMS19BUE1JWEVEX0hBRERTMlBMTCwgImhhZGRzMnBsbCIsIDB4MmIwLCAw
eDJiYywgMCwgMCwNCiAJCQkJMzEsIDB4MmIwLCA0LCAweDAsIDB4MmI0LCAwKSwNCi0JUExMKENM
S19BUE1JWEVEX0FVRDJQTEwsICJhdWQycGxsIiwgMHgyYzAsIDB4MmNjLCAweDAwMDAwMDAxLCAw
LA0KKwlQTEwoQ0xLX0FQTUlYRURfQVVEMlBMTCwgImF1ZDJwbGwiLCAweDJjMCwgMHgyY2MsIDAs
IDAsDQogCQkJCTMxLCAweDJjMCwgNCwgMHgwLCAweDJjNCwgMCksDQotCVBMTChDTEtfQVBNSVhF
RF9UVkQyUExMLCAidHZkMnBsbCIsIDB4MmQwLCAweDJkYywgMHgwMDAwMDAwMSwgMCwNCisJUExM
KENMS19BUE1JWEVEX1RWRDJQTEwsICJ0dmQycGxsIiwgMHgyZDAsIDB4MmRjLCAwLCAwLA0KIAkJ
CQkyMSwgMHgyZDAsIDQsIDB4MCwgMHgyZDQsIDApLA0KIH07DQogDQotLSANCjEuOC4xLjEuZGly
dHkNCg==

