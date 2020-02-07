Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47B3215547F
	for <lists+linux-clk@lfdr.de>; Fri,  7 Feb 2020 10:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgBGJXo (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 7 Feb 2020 04:23:44 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:65411 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727341AbgBGJXn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Feb 2020 04:23:43 -0500
X-UUID: dc610e7274e642848d22b0c4376d7145-20200207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ue5J6Ylqt5B02qudp2UGXDakRTFXa6pHRAk49mWL1pE=;
        b=vGJ40xK4p7rz9WUMrPc5oXj54DW8Mr8bdJdaf4bpjhnO7xz8X5NlnvVamEYw62S8Mvqf5TGWuhXWmfePcYGaOQ35RrngM7h2a1Jsbjxf4tVD6K9Jjxf0Hw3vWNkjWQaGLQoP1h8jmSTrczoG1D9yV1x2mqfOn+lzn8+m9+SBvJ8=;
X-UUID: dc610e7274e642848d22b0c4376d7145-20200207
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1533895983; Fri, 07 Feb 2020 17:23:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 17:22:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 7 Feb 2020 17:22:59 +0800
From:   Macpaul Lin <macpaul.lin@mediatek.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        mtk01761 <wendell.lin@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        Mars Cheng <mars.cheng@mediatek.com>,
        Sean Wang <Sean.Wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Evan Green <evgreen@chromium.org>,
        Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Ryder Lee <Ryder.Lee@mediatek.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC:     Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Subject: [PATCH v7 6/7] arm64: dts: mediatek: add mt6765 support
Date:   Fri, 7 Feb 2020 17:20:49 +0800
Message-ID: <1581067250-12744-7-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1581067250-12744-1-git-send-email-macpaul.lin@mediatek.com>
References: <1581067250-12744-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

RnJvbTogTWFycyBDaGVuZyA8bWFycy5jaGVuZ0BtZWRpYXRlay5jb20+DQoNCkFkZCBiYXNpYyBj
aGlwIHN1cHBvcnQgZm9yIE1lZGlhdGVrIDY3NjUsIGluY2x1ZGUNCnVhcnQgbm9kZSB3aXRoIGNv
cnJlY3QgdWFydCBjbG9ja3MsIHB3cmFwIGRldmljZQ0KDQpBZGQgY2xvY2sgY29udHJvbGxlciBu
b2RlcywgaW5jbHVkZSB0b3Bja2dlbiwgaW5mcmFjZmcsDQphcG1peGVkc3lzIGFuZCBzdWJzeXN0
ZW0uDQoNClNpZ25lZC1vZmYtYnk6IE1hcnMgQ2hlbmcgPG1hcnMuY2hlbmdAbWVkaWF0ZWsuY29t
Pg0KU2lnbmVkLW9mZi1ieTogT3dlbiBDaGVuIDxvd2VuLmNoZW5AbWVkaWF0ZWsuY29tPg0KU2ln
bmVkLW9mZi1ieTogTWFjcGF1bCBMaW4gPG1hY3BhdWwubGluQG1lZGlhdGVrLmNvbT4NCkFja2Vk
LWJ5OiBNYXJjIFp5bmdpZXIgPG1hcmMuenluZ2llckBhcm0uY29tPg0KLS0tDQogYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICB8ICAgMSArDQogYXJjaC9hcm02NC9i
b290L2R0cy9tZWRpYXRlay9tdDY3NjUtZXZiLmR0cyB8ICAzMyArKysNCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210Njc2NS5kdHNpICAgIHwgMjUzICsrKysrKysrKysrKysrKysrKysr
DQogMyBmaWxlcyBjaGFuZ2VkLCAyODcgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Njc2NS1ldmIuZHRzDQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2NzY1LmR0c2kNCg0KZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUgYi9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlDQppbmRleCA0NThiYmM0MjJhOTQuLjIyYmRm
MWE5OWE2MiAxMDA2NDQNCi0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZp
bGUNCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUNCkBAIC0xLDYg
KzEsNyBAQA0KICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCiBkdGItJChDT05G
SUdfQVJDSF9NRURJQVRFSykgKz0gbXQyNzEyLWV2Yi5kdGINCiBkdGItJChDT05GSUdfQVJDSF9N
RURJQVRFSykgKz0gbXQ2NzU1LWV2Yi5kdGINCitkdGItJChDT05GSUdfQVJDSF9NRURJQVRFSykg
Kz0gbXQ2NzY1LWV2Yi5kdGINCiBkdGItJChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ2Nzk1
LWV2Yi5kdGINCiBkdGItJChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ2Nzk3LWV2Yi5kdGIN
CiBkdGItJChDT05GSUdfQVJDSF9NRURJQVRFSykgKz0gbXQ2Nzk3LXgyMC1kZXYuZHRiDQpkaWZm
IC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NjUtZXZiLmR0cyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2NzY1LWV2Yi5kdHMNCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjM2ZGRkZmYyYjdmOA0KLS0tIC9kZXYvbnVsbA0K
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NjUtZXZiLmR0cw0KQEAgLTAs
MCArMSwzMyBAQA0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQorLyoNCisg
KiBkdHMgZmlsZSBmb3IgTWVkaWF0ZWsgTVQ2NzY1DQorICoNCisgKiAoQykgQ29weXJpZ2h0IDIw
MTguIE1lZGlhdGVrLCBJbmMuDQorICoNCisgKiBNYXJzIENoZW5nIDxtYXJzLmNoZW5nQG1lZGlh
dGVrLmNvbT4NCisgKi8NCisNCisvZHRzLXYxLzsNCisjaW5jbHVkZSAibXQ2NzY1LmR0c2kiDQor
DQorLyB7DQorCW1vZGVsID0gIk1lZGlhVGVrIE1UNjc2NSBFVkIiOw0KKwljb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10Njc2NS1ldmIiLCAibWVkaWF0ZWssbXQ2NzY1IjsNCisNCisJYWxpYXNlcyB7
DQorCQlzZXJpYWwwID0gJnVhcnQwOw0KKwl9Ow0KKw0KKwltZW1vcnlANDAwMDAwMDAgew0KKwkJ
ZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsNCisJCXJlZyA9IDwwIDB4NDAwMDAwMDAgMCAweDFlODAw
MDAwPjsNCisJfTsNCisNCisJY2hvc2VuIHsNCisJCXN0ZG91dC1wYXRoID0gInNlcmlhbDA6OTIx
NjAwbjgiOw0KKwl9Ow0KK307DQorDQorJnVhcnQwIHsNCisJc3RhdHVzID0gIm9rYXkiOw0KK307
DQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NjUuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ2NzY1LmR0c2kNCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAuLjI2NjI0NzBmZTYwNw0KLS0tIC9kZXYvbnVsbA0K
KysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDY3NjUuZHRzaQ0KQEAgLTAsMCAr
MSwyNTMgQEANCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKy8qDQorICog
ZHRzIGZpbGUgZm9yIE1lZGlhdGVrIE1UNjc2NQ0KKyAqDQorICogKEMpIENvcHlyaWdodCAyMDE4
LiBNZWRpYXRlaywgSW5jLg0KKyAqDQorICogTWFycyBDaGVuZyA8bWFycy5jaGVuZ0BtZWRpYXRl
ay5jb20+DQorICovDQorDQorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9s
bGVyL2lycS5oPg0KKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9h
cm0tZ2ljLmg+DQorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210Njc2NS1jbGsuaD4NCisN
CisvIHsNCisJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUiOw0KKwlpbnRlcnJ1cHQtcGFy
ZW50ID0gPCZzeXNpcnE+Ow0KKwkjYWRkcmVzcy1jZWxscyA9IDwyPjsNCisJI3NpemUtY2VsbHMg
PSA8Mj47DQorDQorCXBzY2kgew0KKwkJY29tcGF0aWJsZSA9ICJhcm0scHNjaS0wLjIiOw0KKwkJ
bWV0aG9kID0gInNtYyI7DQorCX07DQorDQorCWNwdXMgew0KKwkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47DQorCQkjc2l6ZS1jZWxscyA9IDwwPjsNCisNCisJCWNwdUAwIHsNCisJCQlkZXZpY2VfdHlw
ZSA9ICJjcHUiOw0KKwkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTMiOw0KKwkJCWVuYWJs
ZS1tZXRob2QgPSAicHNjaSI7DQorCQkJcmVnID0gPDB4MDAwPjsNCisJCX07DQorDQorCQljcHVA
MSB7DQorCQkJZGV2aWNlX3R5cGUgPSAiY3B1IjsNCisJCQljb21wYXRpYmxlID0gImFybSxjb3J0
ZXgtYTUzIjsNCisJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOw0KKwkJCXJlZyA9IDwweDAwMT47
DQorCQl9Ow0KKw0KKwkJY3B1QDIgew0KKwkJCWRldmljZV90eXBlID0gImNwdSI7DQorCQkJY29t
cGF0aWJsZSA9ICJhcm0sY29ydGV4LWE1MyI7DQorCQkJZW5hYmxlLW1ldGhvZCA9ICJwc2NpIjsN
CisJCQlyZWcgPSA8MHgwMDI+Ow0KKwkJfTsNCisNCisJCWNwdUAzIHsNCisJCQlkZXZpY2VfdHlw
ZSA9ICJjcHUiOw0KKwkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTMiOw0KKwkJCWVuYWJs
ZS1tZXRob2QgPSAicHNjaSI7DQorCQkJcmVnID0gPDB4MDAzPjsNCisJCX07DQorDQorCQljcHVA
MTAwIHsNCisJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOw0KKwkJCWNvbXBhdGlibGUgPSAiYXJtLGNv
cnRleC1hNTMiOw0KKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQorCQkJcmVnID0gPDB4MTAw
PjsNCisJCX07DQorDQorCQljcHVAMTAxIHsNCisJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOw0KKwkJ
CWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTMiOw0KKwkJCWVuYWJsZS1tZXRob2QgPSAicHNj
aSI7DQorCQkJcmVnID0gPDB4MTAxPjsNCisJCX07DQorDQorCQljcHVAMTAyIHsNCisJCQlkZXZp
Y2VfdHlwZSA9ICJjcHUiOw0KKwkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNTMiOw0KKwkJ
CWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQorCQkJcmVnID0gPDB4MTAyPjsNCisJCX07DQorDQor
CQljcHVAMTAzIHsNCisJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOw0KKwkJCWNvbXBhdGlibGUgPSAi
YXJtLGNvcnRleC1hNTMiOw0KKwkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7DQorCQkJcmVnID0g
PDB4MTAzPjsNCisJCX07DQorCX07DQorDQorCWNsb2NrcyB7DQorCQljbGsyNm06IGNsazI2bSB7
DQorCQkJY29tcGF0aWJsZSA9ICJmaXhlZC1jbG9jayI7DQorCQkJI2Nsb2NrLWNlbGxzID0gPDA+
Ow0KKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNjAwMDAwMD47DQorCQl9Ow0KKw0KKwkJY2xrMzJr
OiBjbGszMmsgew0KKwkJCWNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KKwkJCSNjbG9jay1j
ZWxscyA9IDwwPjsNCisJCQljbG9jay1mcmVxdWVuY3kgPSA8MzIwMDA+Ow0KKwkJfTsNCisJfTsN
CisNCisJdGltZXIgew0KKwkJY29tcGF0aWJsZSA9ICJhcm0sYXJtdjgtdGltZXIiOw0KKwkJaW50
ZXJydXB0LXBhcmVudCA9IDwmZ2ljPjsNCisJCWludGVycnVwdHMgPSA8R0lDX1BQSSAxMyBJUlFf
VFlQRV9MRVZFTF9MT1c+LA0KKwkJCSAgICAgPEdJQ19QUEkgMTQgSVJRX1RZUEVfTEVWRUxfTE9X
PiwNCisJCQkgICAgIDxHSUNfUFBJIDExIElSUV9UWVBFX0xFVkVMX0xPVz4sDQorCQkJICAgICA8
R0lDX1BQSSAxMCBJUlFfVFlQRV9MRVZFTF9MT1c+Ow0KKwl9Ow0KKw0KKwlzb2Mgew0KKwkJI2Fk
ZHJlc3MtY2VsbHMgPSA8Mj47DQorCQkjc2l6ZS1jZWxscyA9IDwyPjsNCisJCWNvbXBhdGlibGUg
PSAic2ltcGxlLWJ1cyI7DQorCQlyYW5nZXM7DQorDQorCQlnaWM6IGludGVycnVwdC1jb250cm9s
bGVyQGMwMDAwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAiYXJtLGdpYy12MyI7DQorCQkJI2ludGVy
cnVwdC1jZWxscyA9IDwzPjsNCisJCQkjYWRkcmVzcy1jZWxscyA9IDwyPjsNCisJCQkjc2l6ZS1j
ZWxscyA9IDwyPjsNCisJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+Ow0KKwkJCWludGVycnVw
dC1jb250cm9sbGVyOw0KKwkJCXJlZyA9IDwwIDB4MGMwMDAwMDAgMCAweDQwMDAwPiwgIC8qIEdJ
Q0QgKi8NCisJCQkgICAgICA8MCAweDBjMTAwMDAwIDAgMHgyMDAwMDA+LCAvKiBHSUNSICovDQor
CQkJICAgICAgPDAgMHgwYzQwMDAwMCAwIDB4MjAwMD4sICAgLyogR0lDQyAqLw0KKwkJCSAgICAg
IDwwIDB4MGM0MTAwMDAgMCAweDIwMDA+LCAgIC8qIEdJQ0ggKi8NCisJCQkgICAgICA8MCAweDBj
NDIwMDAwIDAgMHgyMDAwMD47ICAvKiBHSUNWICovDQorCQkJaW50ZXJydXB0cyA9IDxHSUNfUFBJ
IDkgSVJRX1RZUEVfTEVWRUxfSElHSD47DQorCQl9Ow0KKw0KKwkJdG9wY2tnZW46IHN5c2NvbkAx
MDAwMDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUtdG9wY2tnZW4iLCAi
c3lzY29uIjsNCisJCQlyZWcgPSA8MCAweDEwMDAwMDAwIDAgMHgxMDAwPjsNCisJCQkjY2xvY2st
Y2VsbHMgPSA8MT47DQorCQl9Ow0KKw0KKwkJaW5mcmFjZmc6IHN5c2NvbkAxMDAwMTAwMCB7DQor
CQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUtaW5mcmFjZmciLCAic3lzY29uIjsNCisJ
CQlyZWcgPSA8MCAweDEwMDAxMDAwIDAgMHgxMDAwPjsNCisJCQlpbnRlcnJ1cHRzID0gPEdJQ19T
UEkgMTQ3IElSUV9UWVBFX0VER0VfUklTSU5HPjsNCisJCQkjY2xvY2stY2VsbHMgPSA8MT47DQor
CQl9Ow0KKw0KKwkJcGVyaWNmZzogcGVyaWNmZ0AxMDAwMzAwMCB7DQorCQkJY29tcGF0aWJsZSA9
ICJtZWRpYXRlayxtdDY3NjUtcGVyaWNmZyIsICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTAw
MDMwMDAgMCAweDEwMDA+Ow0KKwkJfTsNCisNCisJCXNjcHN5czogc2Nwc3lzQDEwMDA2MDAwIHsN
CisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc2NS1zY3BzeXMiOw0KKwkJCXJlZyA9CTww
IDB4MTAwMDYwMDAgMCAweDEwMDA+OyAvKiBzcG0gKi8NCisJCQkjcG93ZXItZG9tYWluLWNlbGxz
ID0gPDE+Ow0KKwkJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9NRkdfU0VMPiwNCisJCQkJ
IDwmdG9wY2tnZW4gQ0xLX1RPUF9NTV9TRUw+LA0KKwkJCQkgPCZtbXN5c19jb25maWcgQ0xLX01N
X1NNSV9DT01NT04+LA0KKwkJCQkgPCZtbXN5c19jb25maWcgQ0xLX01NX1NNSV9DT01NMD4sDQor
CQkJCSA8Jm1tc3lzX2NvbmZpZyBDTEtfTU1fU01JX0NPTU0xPiwNCisJCQkJIDwmbW1zeXNfY29u
ZmlnIENMS19NTV9TTUlfTEFSQjA+LA0KKwkJCQkgPCZpbWdzeXMgQ0xLX0lNR19MQVJCMj4sDQor
CQkJCSA8Jm1tc3lzX2NvbmZpZyBDTEtfTU1fU01JX0lNRz4sDQorCQkJCSA8JmNhbXN5cyBDTEtf
Q0FNX0xBUkIzPiwNCisJCQkJIDwmY2Ftc3lzIENMS19DQU1fREZQX1ZBRD4sDQorCQkJCSA8JmNh
bXN5cyBDTEtfQ0FNPiwNCisJCQkJIDwmY2Ftc3lzIENMS19DQU1fQ0NVPiwNCisJCQkJIDwmbW1z
eXNfY29uZmlnIENMS19NTV9TTUlfQ0FNPjsNCisJCQljbG9jay1uYW1lcyA9ICJtZmciLCAibW0i
LA0KKwkJCQkgICAgICAibW0tMCIsICJtbS0xIiwgIm1tLTIiLCAibW0tMyIsDQorCQkJCSAgICAg
ICJpc3AtMCIsICJpc3AtMSIsICJjYW0tMCIsICJjYW0tMSIsDQorCQkJCSAgICAgICJjYW0tMiIs
ICJjYW0tMyIsICJjYW0tNCI7DQorCQkJaW5mcmFjZmcgPSA8JmluZnJhY2ZnPjsNCisJCQlzbWlf
Y29tbSA9IDwmc21pX2NvbW1vbj47DQorCQl9Ow0KKw0KKwkJYXBtaXhlZDogc3lzY29uQDEwMDBj
MDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc2NS1hcG1peGVkc3lzIiwgInN5
c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxMDAwYzAwMCAwIDB4MTAwMD47DQorCQkJI2Nsb2NrLWNl
bGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCXN5c2lycTogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTAy
MDBhODAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NzY1LXN5c2lycSIsDQorCQkJ
CSAgICAgIm1lZGlhdGVrLG10NjU3Ny1zeXNpcnEiOw0KKwkJCWludGVycnVwdC1jb250cm9sbGVy
Ow0KKwkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8Mz47DQorCQkJaW50ZXJydXB0LXBhcmVudCA9IDwm
Z2ljPjsNCisJCQlyZWcgPSA8MCAweDEwMjAwYTgwIDAgMHg1MD47DQorCQl9Ow0KKw0KKwkJdWFy
dDA6IHNlcmlhbEAxMTAwMjAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUt
dWFydCIsDQorCQkJCSAgICAgIm1lZGlhdGVrLG10NjU3Ny11YXJ0IjsNCisJCQlyZWcgPSA8MCAw
eDExMDAyMDAwIDAgMHg0MDA+Ow0KKwkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA5MSBJUlFfVFlQ
RV9MRVZFTF9MT1c+Ow0KKwkJCWNsb2NrcyA9IDwmaW5mcmFjZmcgQ0xLX0lGUl9VQVJUMD4sDQor
CQkJCSA8JmluZnJhY2ZnIENMS19JRlJfQVBfRE1BPjsNCisJCQljbG9jay1uYW1lcyA9ICJiYXVk
IiwgImJ1cyI7DQorCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCisJCX07DQorDQorCQl1YXJ0MTog
c2VyaWFsQDExMDAzMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc2NS11YXJ0
IiwNCisJCQkJICAgICAibWVkaWF0ZWssbXQ2NTc3LXVhcnQiOw0KKwkJCXJlZyA9IDwwIDB4MTEw
MDMwMDAgMCAweDQwMD47DQorCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDkyIElSUV9UWVBFX0xF
VkVMX0xPVz47DQorCQkJY2xvY2tzID0gPCZpbmZyYWNmZyBDTEtfSUZSX1VBUlQxPiwNCisJCQkJ
IDwmaW5mcmFjZmcgQ0xLX0lGUl9BUF9ETUE+Ow0KKwkJCWNsb2NrLW5hbWVzID0gImJhdWQiLCAi
YnVzIjsNCisJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOw0KKwkJfTsNCisNCisJCWF1ZGlvOiBzeXNj
b25AMTEyMjAwMDAgew0KKwkJCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NzY1LWF1ZHN5cyIs
ICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTEyMjAwMDAgMCAweDEwMDA+Ow0KKwkJCSNjbG9j
ay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQltaXBpX3J4X2FuYV9jc2kwYTogc3lzY29uQDEx
YzEwMDAwIHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc2NS1taXBpMGEiLA0KKwkJ
CQkgICAgICJzeXNjb24iOw0KKwkJCXJlZyA9IDwwIDB4MTFjMTAwMDAgMCAweDEwMDA+Ow0KKwkJ
CSNjbG9jay1jZWxscyA9IDwxPjsNCisJCX07DQorDQorCQltbXN5c19jb25maWc6IHN5c2NvbkAx
NDAwMDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUtbW1zeXMiLCAic3lz
Y29uIjsNCisJCQlyZWcgPSA8MCAweDE0MDAwMDAwIDAgMHgxMDAwPjsNCisJCQlpbnRlcnJ1cHRz
ID0gPEdJQ19TUEkgMjI3IElSUV9UWVBFX0xFVkVMX0xPVz47DQorCQkJI2Nsb2NrLWNlbGxzID0g
PDE+Ow0KKwkJfTsNCisNCisJCXNtaV9jb21tb246IHNtaV9jb21tb25AMTQwMDIwMDAgew0KKwkJ
CWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2NzY1LXNtaS1jb21tb24iLCAic3lzY29uIjsNCisJ
CQlyZWcgPSA8MCAweDE0MDAyMDAwIDAgMHgxMDAwPjsNCisJCX07DQorDQorCQlpbWdzeXM6IHN5
c2NvbkAxNTAyMDAwMCB7DQorCQkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUtaW1nc3lz
IiwgInN5c2NvbiI7DQorCQkJcmVnID0gPDAgMHgxNTAyMDAwMCAwIDB4MTAwMD47DQorCQkJI2Ns
b2NrLWNlbGxzID0gPDE+Ow0KKwkJfTsNCisNCisJCXZlbmNfZ2Nvbjogc3lzY29uQDE3MDAwMDAw
IHsNCisJCQljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10Njc2NS12Y29kZWNzeXMiLCAic3lzY29u
IjsNCisJCQlyZWcgPSA8MCAweDE3MDAwMDAwIDAgMHgxMDAwMD47DQorCQkJI2Nsb2NrLWNlbGxz
ID0gPDE+Ow0KKwkJfTsNCisNCisJCWNhbXN5czogc3lzY29uQDFhMDAwMDAwICB7DQorCQkJY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDY3NjUtY2Ftc3lzIiwgInN5c2NvbiI7DQorCQkJcmVnID0g
PDAgMHgxYTAwMDAwMCAwIDB4MTAwMD47DQorCQkJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KKwkJfTsN
CisJfTsgLyogZW5kIG9mIHNvYyAqLw0KK307DQotLSANCjIuMTguMA0K

