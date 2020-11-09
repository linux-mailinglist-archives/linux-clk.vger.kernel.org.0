Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF992AAEE6
	for <lists+linux-clk@lfdr.de>; Mon,  9 Nov 2020 03:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgKICD4 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 8 Nov 2020 21:03:56 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:57216 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728006AbgKICDz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 8 Nov 2020 21:03:55 -0500
X-UUID: c058d45166cf44b3956d474af6916420-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=CfolAVAIVBgojYCJsdzPsl30xlismFKIvMN+6BWxbY4=;
        b=KKliRxlAFi8em5m2dDnm4UupAjSa7yE0s/7dUETq9gjfcSSRrfYghNDiroOrwfcjiV6MDIPjPlqpxWaqHTr5rK5SGs8eiC56zH3D6zR3RtvKaZr9DQs7QbR4EMLj+9tqcBC0mKopAb8GJQWQC75snye/NbWMMBgmzVqR495WQ0I=;
X-UUID: c058d45166cf44b3956d474af6916420-20201109
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <weiyi.lu@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 687300587; Mon, 09 Nov 2020 10:03:53 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 10:03:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 9 Nov 2020 10:03:51 +0800
From:   Weiyi Lu <weiyi.lu@mediatek.com>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v5 05/24] dt-bindings: ARM: Mediatek: Document bindings of MT8192 clock controllers
Date:   Mon, 9 Nov 2020 10:03:30 +0800
Message-ID: <1604887429-29445-6-git-send-email-weiyi.lu@mediatek.com>
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

VGhpcyBwYXRjaCBhZGRzIHRoZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gb2YgdG9wY2tnZW4sIGFw
bWl4ZWRzeXMsDQppbmZyYWNmZywgcGVyaWNmZyBhbmQgc3Vic3lzdGVtIGNsb2NrcyBmb3IgTWVk
aWF0ZWsgTVQ4MTkyLg0KDQpTaWduZWQtb2ZmLWJ5OiBXZWl5aSBMdSA8d2VpeWkubHVAbWVkaWF0
ZWsuY29tPg0KLS0tDQogLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxhcG1peGVk
c3lzLnR4dCAgfCAgMSArDQogLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxhdWRz
eXMudHh0ICAgICAgfCAgMSArDQogLi4uL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxj
YW1zeXMudHh0ICAgICAgfCAyMiArKysrKysrKysrKysrKysrKysrKysrDQogLi4uL2JpbmRpbmdz
L2FybS9tZWRpYXRlay9tZWRpYXRlayxpbWdzeXMudHh0ICAgICAgfCAgMiArKw0KIC4uLi9iaW5k
aW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW5mcmFjZmcudHh0ICAgIHwgIDEgKw0KIC4uLi9i
aW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaXBlc3lzLnR4dCAgICAgIHwgIDEgKw0KIC4u
Li9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbWZnY2ZnLnR4dCAgICAgIHwgIDEgKw0K
IC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0ICAgICAgIHwgIDEg
Kw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWsscGVyaWNmZy55YW1sICAgIHwg
IDEgKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdG9wY2tnZW4udHh0ICAg
IHwgIDEgKw0KIC4uLi9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdmRlY3N5cy50eHQg
ICAgIHwgIDggKysrKysrKysNCiAuLi4vYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHZl
bmNzeXMudHh0ICAgICB8ICAxICsNCiAxMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCsp
DQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21l
ZGlhdGVrL21lZGlhdGVrLGFwbWl4ZWRzeXMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxhcG1peGVkc3lzLnR4dA0KaW5kZXggZWE4
MjdlODcuLjU1MWMzMDcgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLGFwbWl4ZWRzeXMudHh0DQorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLGFwbWl4ZWRz
eXMudHh0DQpAQCAtMTgsNiArMTgsNyBAQCBSZXF1aXJlZCBQcm9wZXJ0aWVzOg0KIAktICJtZWRp
YXRlayxtdDgxNjctYXBtaXhlZHN5cyIsICJzeXNjb24iDQogCS0gIm1lZGlhdGVrLG10ODE3My1h
cG1peGVkc3lzIg0KIAktICJtZWRpYXRlayxtdDgxODMtYXBtaXhlZHN5cyIsICJzeXNjb24iDQor
CS0gIm1lZGlhdGVrLG10ODE5Mi1hcG1peGVkc3lzIiwgInN5c2NvbiINCiAJLSAibWVkaWF0ZWss
bXQ4NTE2LWFwbWl4ZWRzeXMiDQogLSAjY2xvY2stY2VsbHM6IE11c3QgYmUgMQ0KIA0KZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVk
aWF0ZWssYXVkc3lzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssYXVkc3lzLnR4dA0KaW5kZXggYjMyZDM3NC4uNjk5Nzc2YiAxMDA2
NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsv
bWVkaWF0ZWssYXVkc3lzLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxhdWRzeXMudHh0DQpAQCAtMTMsNiArMTMsNyBAQCBS
ZXF1aXJlZCBQcm9wZXJ0aWVzOg0KIAktICJtZWRpYXRlayxtdDc2MjMtYXVkc3lzIiwgIm1lZGlh
dGVrLG10MjcwMS1hdWRzeXMiLCAic3lzY29uIg0KIAktICJtZWRpYXRlayxtdDgxNjctYXVkaW9z
eXMiLCAic3lzY29uIg0KIAktICJtZWRpYXRlayxtdDgxODMtYXVkaW9zeXMiLCAic3lzY29uIg0K
KwktICJtZWRpYXRlayxtdDgxOTItYXVkc3lzIiwgInN5c2NvbiINCiAJLSAibWVkaWF0ZWssbXQ4
NTE2LWF1ZHN5cyIsICJzeXNjb24iDQogLSAjY2xvY2stY2VsbHM6IE11c3QgYmUgMQ0KIA0KZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsv
bWVkaWF0ZWssY2Ftc3lzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vbWVkaWF0ZWsvbWVkaWF0ZWssY2Ftc3lzLnR4dA0KaW5kZXggYTBjZTgyMC4uN2QwYjE0ZSAx
MDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0
ZWsvbWVkaWF0ZWssY2Ftc3lzLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxjYW1zeXMudHh0DQpAQCAtOSw2ICs5LDEwIEBA
IFJlcXVpcmVkIFByb3BlcnRpZXM6DQogCS0gIm1lZGlhdGVrLG10Njc2NS1jYW1zeXMiLCAic3lz
Y29uIg0KIAktICJtZWRpYXRlayxtdDY3NzktY2Ftc3lzIiwgInN5c2NvbiINCiAJLSAibWVkaWF0
ZWssbXQ4MTgzLWNhbXN5cyIsICJzeXNjb24iDQorCS0gIm1lZGlhdGVrLG10ODE5Mi1jYW1zeXMi
LCAic3lzY29uIg0KKwktICJtZWRpYXRlayxtdDgxOTItY2Ftc3lzX3Jhd2EiLCAic3lzY29uIg0K
KwktICJtZWRpYXRlayxtdDgxOTItY2Ftc3lzX3Jhd2IiLCAic3lzY29uIg0KKwktICJtZWRpYXRl
ayxtdDgxOTItY2Ftc3lzX3Jhd2MiLCAic3lzY29uIg0KIC0gI2Nsb2NrLWNlbGxzOiBNdXN0IGJl
IDENCiANCiBUaGUgY2Ftc3lzIGNvbnRyb2xsZXIgdXNlcyB0aGUgY29tbW9uIGNsayBiaW5kaW5n
IGZyb20NCkBAIC0yMiwzICsyNiwyMSBAQCBjYW1zeXM6IGNhbXN5c0AxYTAwMDAwMCAgew0KIAly
ZWcgPSA8MCAweDFhMDAwMDAwICAwIDB4MTAwMD47DQogCSNjbG9jay1jZWxscyA9IDwxPjsNCiB9
Ow0KKw0KK2NhbXN5c19yYXdhOiBzeXNjb25AMWEwNGYwMDAgew0KKwljb21wYXRpYmxlID0gIm1l
ZGlhdGVrLG10ODE5Mi1jYW1zeXNfcmF3YSIsICJzeXNjb24iOw0KKwlyZWcgPSA8MCAweDFhMDRm
MDAwIDAgMHgxMDAwPjsNCisJI2Nsb2NrLWNlbGxzID0gPDE+Ow0KK307DQorDQorY2Ftc3lzX3Jh
d2I6IHN5c2NvbkAxYTA2ZjAwMCB7DQorCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTkyLWNh
bXN5c19yYXdiIiwgInN5c2NvbiI7DQorCXJlZyA9IDwwIDB4MWEwNmYwMDAgMCAweDEwMDA+Ow0K
KwkjY2xvY2stY2VsbHMgPSA8MT47DQorfTsNCisNCitjYW1zeXNfcmF3Yzogc3lzY29uQDFhMDhm
MDAwIHsNCisJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItY2Ftc3lzX3Jhd2MiLCAic3lz
Y29uIjsNCisJcmVnID0gPDAgMHgxYTA4ZjAwMCAwIDB4MTAwMD47DQorCSNjbG9jay1jZWxscyA9
IDwxPjsNCit9Ow0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW1nc3lzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW1nc3lzLnR4dA0KaW5kZXggZGNl
NGM5MjQuLmI5ZTU5OWUgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLGltZ3N5cy50eHQNCisrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaW1nc3lzLnR4dA0K
QEAgLTE1LDYgKzE1LDggQEAgUmVxdWlyZWQgUHJvcGVydGllczoNCiAJLSAibWVkaWF0ZWssbXQ4
MTY3LWltZ3N5cyIsICJzeXNjb24iDQogCS0gIm1lZGlhdGVrLG10ODE3My1pbWdzeXMiLCAic3lz
Y29uIg0KIAktICJtZWRpYXRlayxtdDgxODMtaW1nc3lzIiwgInN5c2NvbiINCisJLSAibWVkaWF0
ZWssbXQ4MTkyLWltZ3N5cyIsICJzeXNjb24iDQorCS0gIm1lZGlhdGVrLG10ODE5Mi1pbWdzeXMy
IiwgInN5c2NvbiINCiAtICNjbG9jay1jZWxsczogTXVzdCBiZSAxDQogDQogVGhlIGltZ3N5cyBj
b250cm9sbGVyIHVzZXMgdGhlIGNvbW1vbiBjbGsgYmluZGluZyBmcm9tDQpkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxp
bmZyYWNmZy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlh
dGVrL21lZGlhdGVrLGluZnJhY2ZnLnR4dA0KaW5kZXggZWIzNTIzYy4uNmUwNWEwMCAxMDA2NDQN
Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVk
aWF0ZWssaW5mcmFjZmcudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLGluZnJhY2ZnLnR4dA0KQEAgLTE5LDYgKzE5LDcgQEAg
UmVxdWlyZWQgUHJvcGVydGllczoNCiAJLSAibWVkaWF0ZWssbXQ4MTY3LWluZnJhY2ZnIiwgInN5
c2NvbiINCiAJLSAibWVkaWF0ZWssbXQ4MTczLWluZnJhY2ZnIiwgInN5c2NvbiINCiAJLSAibWVk
aWF0ZWssbXQ4MTgzLWluZnJhY2ZnIiwgInN5c2NvbiINCisJLSAibWVkaWF0ZWssbXQ4MTkyLWlu
ZnJhY2ZnIiwgInN5c2NvbiINCiAJLSAibWVkaWF0ZWssbXQ4NTE2LWluZnJhY2ZnIiwgInN5c2Nv
biINCiAtICNjbG9jay1jZWxsczogTXVzdCBiZSAxDQogLSAjcmVzZXQtY2VsbHM6IE11c3QgYmUg
MQ0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVk
aWF0ZWsvbWVkaWF0ZWssaXBlc3lzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssaXBlc3lzLnR4dA0KaW5kZXggMmNlODg5Yi4uOWNk
MTAzNSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssaXBlc3lzLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxpcGVzeXMudHh0DQpAQCAtNyw2ICs3
LDcgQEAgUmVxdWlyZWQgUHJvcGVydGllczoNCiANCiAtIGNvbXBhdGlibGU6IFNob3VsZCBiZSBv
bmUgb2Y6DQogCS0gIm1lZGlhdGVrLG10Njc3OS1pcGVzeXMiLCAic3lzY29uIg0KKwktICJtZWRp
YXRlayxtdDgxOTItaXBlc3lzIiwgInN5c2NvbiINCiAtICNjbG9jay1jZWxsczogTXVzdCBiZSAx
DQogDQogVGhlIGlwZXN5cyBjb250cm9sbGVyIHVzZXMgdGhlIGNvbW1vbiBjbGsgYmluZGluZyBm
cm9tDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9t
ZWRpYXRlay9tZWRpYXRlayxtZmdjZmcudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtZmdjZmcudHh0DQppbmRleCAwNTQ0MjRmLi42
YmZiNDlhIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9tZWRpYXRlay9tZWRpYXRlayxtZmdjZmcudHh0DQorKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLG1mZ2NmZy50eHQNCkBAIC0xMCw2
ICsxMCw3IEBAIFJlcXVpcmVkIFByb3BlcnRpZXM6DQogCS0gIm1lZGlhdGVrLG10Njc3OS1tZmdj
ZmciLCAic3lzY29uIg0KIAktICJtZWRpYXRlayxtdDgxNjctbWZnY2ZnIiwgInN5c2NvbiINCiAJ
LSAibWVkaWF0ZWssbXQ4MTgzLW1mZ2NmZyIsICJzeXNjb24iDQorCS0gIm1lZGlhdGVrLG10ODE5
Mi1tZmdjZmciLCAic3lzY29uIg0KIC0gI2Nsb2NrLWNlbGxzOiBNdXN0IGJlIDENCiANCiBUaGUg
bWZnY2ZnIGNvbnRyb2xsZXIgdXNlcyB0aGUgY29tbW9uIGNsayBiaW5kaW5nIGZyb20NCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21l
ZGlhdGVrLG1tc3lzLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
bWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0DQppbmRleCBkOGM5MTA4Li44MWZhMzQ1IDEwMDY0
NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9t
ZWRpYXRlayxtbXN5cy50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMudHh0DQpAQCAtMTUsNiArMTUsNyBAQCBSZXF1
aXJlZCBQcm9wZXJ0aWVzOg0KIAktICJtZWRpYXRlayxtdDc2MjMtbW1zeXMiLCAibWVkaWF0ZWss
bXQyNzAxLW1tc3lzIiwgInN5c2NvbiINCiAJLSAibWVkaWF0ZWssbXQ4MTczLW1tc3lzIiwgInN5
c2NvbiINCiAJLSAibWVkaWF0ZWssbXQ4MTgzLW1tc3lzIiwgInN5c2NvbiINCisJLSAibWVkaWF0
ZWssbXQ4MTkyLW1tc3lzIiwgInN5c2NvbiINCiAtICNjbG9jay1jZWxsczogTXVzdCBiZSAxDQog
DQogRm9yIHRoZSBjbG9jayBjb250cm9sLCB0aGUgbW1zeXMgY29udHJvbGxlciB1c2VzIHRoZSBj
b21tb24gY2xrIGJpbmRpbmcgZnJvbQ0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWsscGVyaWNmZy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxwZXJpY2Zn
LnlhbWwNCmluZGV4IDg3MjNkZmUuLmI0MDVjYmMgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHBlcmljZmcueWFtbA0K
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRp
YXRlayxwZXJpY2ZnLnlhbWwNCkBAIC0yNiw2ICsyNiw3IEBAIHByb3BlcnRpZXM6DQogICAgICAg
ICAgICAgICAtIG1lZGlhdGVrLG10ODEzNS1wZXJpY2ZnDQogICAgICAgICAgICAgICAtIG1lZGlh
dGVrLG10ODE3My1wZXJpY2ZnDQogICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE4My1wZXJp
Y2ZnDQorICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE5Mi1wZXJpY2ZnDQogICAgICAgICAg
ICAgICAtIG1lZGlhdGVrLG10ODUxNi1wZXJpY2ZnDQogICAgICAgICAgIC0gY29uc3Q6IHN5c2Nv
bg0KICAgICAgIC0gaXRlbXM6DQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayx0b3Bja2dlbi50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHRvcGNrZ2VuLnR4
dA0KaW5kZXggNWNlNzU3OC4uMTYyN2UzOCAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdG9wY2tnZW4udHh0DQorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVr
LHRvcGNrZ2VuLnR4dA0KQEAgLTE4LDYgKzE4LDcgQEAgUmVxdWlyZWQgUHJvcGVydGllczoNCiAJ
LSAibWVkaWF0ZWssbXQ4MTY3LXRvcGNrZ2VuIiwgInN5c2NvbiINCiAJLSAibWVkaWF0ZWssbXQ4
MTczLXRvcGNrZ2VuIg0KIAktICJtZWRpYXRlayxtdDgxODMtdG9wY2tnZW4iLCAic3lzY29uIg0K
KwktICJtZWRpYXRlayxtdDgxOTItdG9wY2tnZW4iLCAic3lzY29uIg0KIAktICJtZWRpYXRlayxt
dDg1MTYtdG9wY2tnZW4iDQogLSAjY2xvY2stY2VsbHM6IE11c3QgYmUgMQ0KIA0KZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWssdmRlY3N5cy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21l
ZGlhdGVrL21lZGlhdGVrLHZkZWNzeXMudHh0DQppbmRleCA5ODE5NTE2Li4zNzZjODJlIDEwMDY0
NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9t
ZWRpYXRlayx2ZGVjc3lzLnR4dA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayx2ZGVjc3lzLnR4dA0KQEAgLTE0LDYgKzE0LDggQEAg
UmVxdWlyZWQgUHJvcGVydGllczoNCiAJLSAibWVkaWF0ZWssbXQ4MTY3LXZkZWNzeXMiLCAic3lz
Y29uIg0KIAktICJtZWRpYXRlayxtdDgxNzMtdmRlY3N5cyIsICJzeXNjb24iDQogCS0gIm1lZGlh
dGVrLG10ODE4My12ZGVjc3lzIiwgInN5c2NvbiINCisJLSAibWVkaWF0ZWssbXQ4MTkyLXZkZWNz
eXMiLCAic3lzY29uIg0KKwktICJtZWRpYXRlayxtdDgxOTItdmRlY3N5c19zb2MiLCAic3lzY29u
Ig0KIC0gI2Nsb2NrLWNlbGxzOiBNdXN0IGJlIDENCiANCiBUaGUgdmRlY3N5cyBjb250cm9sbGVy
IHVzZXMgdGhlIGNvbW1vbiBjbGsgYmluZGluZyBmcm9tDQpAQCAtMjcsMyArMjksOSBAQCB2ZGVj
c3lzOiBjbG9jay1jb250cm9sbGVyQDE2MDAwMDAwIHsNCiAJcmVnID0gPDAgMHgxNjAwMDAwMCAw
IDB4MTAwMD47DQogCSNjbG9jay1jZWxscyA9IDwxPjsNCiB9Ow0KKw0KK3ZkZWNzeXNfc29jOiBz
eXNjb25AMTYwMGYwMDAgew0KKwljb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi12ZGVjc3lz
X3NvYyIsICJzeXNjb24iOw0KKwlyZWcgPSA8MCAweDE2MDBmMDAwIDAgMHgxMDAwPjsNCisJI2Ns
b2NrLWNlbGxzID0gPDE+Ow0KK307DQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayx2ZW5jc3lzLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssdmVuY3N5cy50
eHQNCmluZGV4IDZhNmExNGUuLmQyMmRlMDEgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHZlbmNzeXMudHh0DQorKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVr
LHZlbmNzeXMudHh0DQpAQCAtMTEsNiArMTEsNyBAQCBSZXF1aXJlZCBQcm9wZXJ0aWVzOg0KIAkt
ICJtZWRpYXRlayxtdDY3OTctdmVuY3N5cyIsICJzeXNjb24iDQogCS0gIm1lZGlhdGVrLG10ODE3
My12ZW5jc3lzIiwgInN5c2NvbiINCiAJLSAibWVkaWF0ZWssbXQ4MTgzLXZlbmNzeXMiLCAic3lz
Y29uIg0KKwktICJtZWRpYXRlayxtdDgxOTItdmVuY3N5cyIsICJzeXNjb24iDQogLSAjY2xvY2st
Y2VsbHM6IE11c3QgYmUgMQ0KIA0KIFRoZSB2ZW5jc3lzIGNvbnRyb2xsZXIgdXNlcyB0aGUgY29t
bW9uIGNsayBiaW5kaW5nIGZyb20NCi0tIA0KMS44LjEuMS5kaXJ0eQ0K

