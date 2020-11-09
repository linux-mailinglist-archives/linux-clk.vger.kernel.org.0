Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCB32AAF12
	for <lists+linux-clk@lfdr.de>; Mon,  9 Nov 2020 03:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbgKICJW (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 8 Nov 2020 21:09:22 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:58255 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729100AbgKICJV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 21:09:21 -0500
X-UUID: 73bb0fff315c476ab367be3d75617052-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6mOjFQp5tiS27/BpZ/cU8++Z2JHSDO2GwBGWDc1VIQc=;
        b=SyD//EBgIW9PRKhNO28soRs1Xpw+M8s4wCY3AQ8YMRhe5b7AN62C2FGyYtvE1nR85swYDQTugxCrzeg1/AxJbWPxw/kTHlqqu3AOYSKm0UL4HxJNQ2bV26eG1VYaLXLMP9g/x1lbrYLW6rgSyJ8bGBsPqjCcGcu/saFxUKYtDA0=;
X-UUID: 73bb0fff315c476ab367be3d75617052-20201109
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 14594520; Mon, 09 Nov 2020 10:03:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:03:54 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5 21/24] clk: mediatek: Add MT8192 vdecsys clock support
Date:   Mon, 9 Nov 2020 10:03:46 +0800
Message-ID: <1604887429-29445-22-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

QWRkIE1UODE5MiB2ZGVjc3lzIGFuZCB2ZGVjc3lzIHNvYyBjbG9jayBwcm92aWRlcnMNCg0KU2ln
bmVkLW9mZi1ieTogV2VpeWkgTHUgPHdlaXlpLmx1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvY2xrL21lZGlhdGVrL0tjb25maWcgICAgICAgICAgIHwgIDYgKysrDQogZHJpdmVycy9jbGsv
bWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICAgfCAgMSArDQogZHJpdmVycy9jbGsvbWVkaWF0ZWsv
Y2xrLW10ODE5Mi12ZGVjLmMgfCA5NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQogMyBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLXZkZWMuYw0KDQpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jbGsvbWVkaWF0ZWsvS2NvbmZpZyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL0tjb25m
aWcNCmluZGV4IDEwMDllMWYuLjYzM2U4MDYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2Nsay9tZWRp
YXRlay9LY29uZmlnDQorKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9LY29uZmlnDQpAQCAtNTU3
LDYgKzU1NywxMiBAQCBjb25maWcgQ09NTU9OX0NMS19NVDgxOTJfU0NQX0FEU1ANCiAJaGVscA0K
IAkgIFRoaXMgZHJpdmVyIHN1cHBvcnRzIE1lZGlhVGVrIE1UODE5MiBzY3BfYWRzcCBjbG9ja3Mu
DQogDQorY29uZmlnIENPTU1PTl9DTEtfTVQ4MTkyX1ZERUNTWVMNCisJYm9vbCAiQ2xvY2sgZHJp
dmVyIGZvciBNZWRpYVRlayBNVDgxOTIgdmRlY3N5cyINCisJZGVwZW5kcyBvbiBDT01NT05fQ0xL
X01UODE5Mg0KKwloZWxwDQorCSAgVGhpcyBkcml2ZXIgc3VwcG9ydHMgTWVkaWFUZWsgTVQ4MTky
IHZkZWNzeXMgYW5kIHZkZWNzeXNfc29jIGNsb2Nrcy4NCisNCiBjb25maWcgQ09NTU9OX0NMS19N
VDg1MTYNCiAJYm9vbCAiQ2xvY2sgZHJpdmVyIGZvciBNZWRpYVRlayBNVDg1MTYiDQogCWRlcGVu
ZHMgb24gQVJDSF9NRURJQVRFSyB8fCBDT01QSUxFX1RFU1QNCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9tZWRpYXRlay9NYWtlZmlsZSBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL01ha2VmaWxlDQpp
bmRleCBhMzM2ZmU3Li44ODdkZDZiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsv
TWFrZWZpbGUNCisrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL01ha2VmaWxlDQpAQCAtNzgsNSAr
NzgsNiBAQCBvYmotJChDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfTUZHQ0ZHKSArPSBjbGstbXQ4
MTkyLW1mZy5vDQogb2JqLSQoQ09ORklHX0NPTU1PTl9DTEtfTVQ4MTkyX01NU1lTKSArPSBjbGst
bXQ4MTkyLW1tLm8NCiBvYmotJChDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfTVNEQykgKz0gY2xr
LW10ODE5Mi1tc2RjLm8NCiBvYmotJChDT05GSUdfQ09NTU9OX0NMS19NVDgxOTJfU0NQX0FEU1Ap
ICs9IGNsay1tdDgxOTItc2NwX2Fkc3Aubw0KK29iai0kKENPTkZJR19DT01NT05fQ0xLX01UODE5
Ml9WREVDU1lTKSArPSBjbGstbXQ4MTkyLXZkZWMubw0KIG9iai0kKENPTkZJR19DT01NT05fQ0xL
X01UODUxNikgKz0gY2xrLW10ODUxNi5vDQogb2JqLSQoQ09ORklHX0NPTU1PTl9DTEtfTVQ4NTE2
X0FVRFNZUykgKz0gY2xrLW10ODUxNi1hdWQubw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL21l
ZGlhdGVrL2Nsay1tdDgxOTItdmRlYy5jIGIvZHJpdmVycy9jbGsvbWVkaWF0ZWsvY2xrLW10ODE5
Mi12ZGVjLmMNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi5hNjA0M2MxDQot
LS0gL2Rldi9udWxsDQorKysgYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9jbGstbXQ4MTkyLXZkZWMu
Yw0KQEAgLTAsMCArMSw5NCBAQA0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9ubHkNCisvLw0KKy8vIENvcHlyaWdodCAoYykgMjAyMCBNZWRpYVRlayBJbmMuDQorLy8gQXV0
aG9yOiBXZWl5aSBMdSA8d2VpeWkubHVAbWVkaWF0ZWsuY29tPg0KKw0KKyNpbmNsdWRlIDxsaW51
eC9jbGstcHJvdmlkZXIuaD4NCisjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+DQorI2luY2x1
ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KKw0KKyNpbmNsdWRlICJjbGstbXRrLmgiDQor
I2luY2x1ZGUgImNsay1nYXRlLmgiDQorDQorI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210
ODE5Mi1jbGsuaD4NCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlX3JlZ3MgdmRlYzBf
Y2dfcmVncyA9IHsNCisJLnNldF9vZnMgPSAweDAsDQorCS5jbHJfb2ZzID0gMHg0LA0KKwkuc3Rh
X29mcyA9IDB4MCwNCit9Ow0KKw0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2dhdGVfcmVncyB2
ZGVjMV9jZ19yZWdzID0gew0KKwkuc2V0X29mcyA9IDB4MjAwLA0KKwkuY2xyX29mcyA9IDB4MjA0
LA0KKwkuc3RhX29mcyA9IDB4MjAwLA0KK307DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtf
Z2F0ZV9yZWdzIHZkZWMyX2NnX3JlZ3MgPSB7DQorCS5zZXRfb2ZzID0gMHg4LA0KKwkuY2xyX29m
cyA9IDB4YywNCisJLnN0YV9vZnMgPSAweDgsDQorfTsNCisNCisjZGVmaW5lIEdBVEVfVkRFQzAo
X2lkLCBfbmFtZSwgX3BhcmVudCwgX3NoaWZ0KQlcDQorCUdBVEVfTVRLKF9pZCwgX25hbWUsIF9w
YXJlbnQsICZ2ZGVjMF9jZ19yZWdzLCBfc2hpZnQsICZtdGtfY2xrX2dhdGVfb3BzX3NldGNscl9p
bnYpDQorDQorI2RlZmluZSBHQVRFX1ZERUMxKF9pZCwgX25hbWUsIF9wYXJlbnQsIF9zaGlmdCkJ
XA0KKwlHQVRFX01USyhfaWQsIF9uYW1lLCBfcGFyZW50LCAmdmRlYzFfY2dfcmVncywgX3NoaWZ0
LCAmbXRrX2Nsa19nYXRlX29wc19zZXRjbHJfaW52KQ0KKw0KKyNkZWZpbmUgR0FURV9WREVDMihf
aWQsIF9uYW1lLCBfcGFyZW50LCBfc2hpZnQpCVwNCisJR0FURV9NVEsoX2lkLCBfbmFtZSwgX3Bh
cmVudCwgJnZkZWMyX2NnX3JlZ3MsIF9zaGlmdCwgJm10a19jbGtfZ2F0ZV9vcHNfc2V0Y2xyX2lu
dikNCisNCitzdGF0aWMgY29uc3Qgc3RydWN0IG10a19nYXRlIHZkZWNfY2xrc1tdID0gew0KKwkv
KiBWREVDMCAqLw0KKwlHQVRFX1ZERUMwKENMS19WREVDX1ZERUMsICJ2ZGVjX3ZkZWMiLCAidmRl
Y19zZWwiLCAwKSwNCisJR0FURV9WREVDMChDTEtfVkRFQ19BQ1RJVkUsICJ2ZGVjX2FjdGl2ZSIs
ICJ2ZGVjX3NlbCIsIDQpLA0KKwkvKiBWREVDMSAqLw0KKwlHQVRFX1ZERUMxKENMS19WREVDX0xB
VCwgInZkZWNfbGF0IiwgInZkZWNfc2VsIiwgMCksDQorCUdBVEVfVkRFQzEoQ0xLX1ZERUNfTEFU
X0FDVElWRSwgInZkZWNfbGF0X2FjdGl2ZSIsICJ2ZGVjX3NlbCIsIDQpLA0KKwkvKiBWREVDMiAq
Lw0KKwlHQVRFX1ZERUMyKENMS19WREVDX0xBUkIxLCAidmRlY19sYXJiMSIsICJ2ZGVjX3NlbCIs
IDApLA0KK307DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZ2F0ZSB2ZGVjX3NvY19jbGtz
W10gPSB7DQorCS8qIFZERUNfU09DMCAqLw0KKwlHQVRFX1ZERUMwKENMS19WREVDX1NPQ19WREVD
LCAidmRlY19zb2NfdmRlYyIsICJ2ZGVjX3NlbCIsIDApLA0KKwlHQVRFX1ZERUMwKENMS19WREVD
X1NPQ19WREVDX0FDVElWRSwgInZkZWNfc29jX3ZkZWNfYWN0aXZlIiwgInZkZWNfc2VsIiwgNCks
DQorCS8qIFZERUNfU09DMSAqLw0KKwlHQVRFX1ZERUMxKENMS19WREVDX1NPQ19MQVQsICJ2ZGVj
X3NvY19sYXQiLCAidmRlY19zZWwiLCAwKSwNCisJR0FURV9WREVDMShDTEtfVkRFQ19TT0NfTEFU
X0FDVElWRSwgInZkZWNfc29jX2xhdF9hY3RpdmUiLCAidmRlY19zZWwiLCA0KSwNCisJLyogVkRF
Q19TT0MyICovDQorCUdBVEVfVkRFQzIoQ0xLX1ZERUNfU09DX0xBUkIxLCAidmRlY19zb2NfbGFy
YjEiLCAidmRlY19zZWwiLCAwKSwNCit9Ow0KKw0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2Ns
a19kZXNjIHZkZWNfZGVzYyA9IHsNCisJLmNsa3MgPSB2ZGVjX2Nsa3MsDQorCS5udW1fY2xrcyA9
IEFSUkFZX1NJWkUodmRlY19jbGtzKSwNCit9Ow0KKw0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRr
X2Nsa19kZXNjIHZkZWNfc29jX2Rlc2MgPSB7DQorCS5jbGtzID0gdmRlY19zb2NfY2xrcywNCisJ
Lm51bV9jbGtzID0gQVJSQVlfU0laRSh2ZGVjX3NvY19jbGtzKSwNCit9Ow0KKw0KK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG9mX21hdGNoX2Nsa19tdDgxOTJfdmRlY1tdID0gew0K
Kwl7DQorCQkuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItdmRlY3N5cyIsDQorCQkuZGF0
YSA9ICZ2ZGVjX2Rlc2MsDQorCX0sIHsNCisJCS5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5
Mi12ZGVjc3lzX3NvYyIsDQorCQkuZGF0YSA9ICZ2ZGVjX3NvY19kZXNjLA0KKwl9LCB7DQorCQkv
KiBzZW50aW5lbCAqLw0KKwl9DQorfTsNCisNCitzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBjbGtfbXQ4MTkyX3ZkZWNfZHJ2ID0gew0KKwkucHJvYmUgPSBtdGtfY2xrX3NpbXBsZV9wcm9i
ZSwNCisJLmRyaXZlciA9IHsNCisJCS5uYW1lID0gImNsay1tdDgxOTItdmRlYyIsDQorCQkub2Zf
bWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9jbGtfbXQ4MTkyX3ZkZWMsDQorCX0sDQorfTsNCisNCiti
dWlsdGluX3BsYXRmb3JtX2RyaXZlcihjbGtfbXQ4MTkyX3ZkZWNfZHJ2KTsNCi0tIA0KMS44LjEu
MS5kaXJ0eQ0K

