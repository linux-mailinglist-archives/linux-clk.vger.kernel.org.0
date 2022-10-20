Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13217605882
	for <lists+linux-clk@lfdr.de>; Thu, 20 Oct 2022 09:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiJTH3A (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 20 Oct 2022 03:29:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiJTH27 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Oct 2022 03:28:59 -0400
Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2665F16020C;
        Thu, 20 Oct 2022 00:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666250898; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=kdLYwZDhp24poS9T8vwNHzSbnlFiC/4Yjd/u3EhCyjdTwCeRBjtLyNww/Lb+XV4xEAVL008PRmOu4WOFphoGs9msulBPFAE5TqmG/em+80Xg+TgToJJS/1NxJtveBtqEat1b4dLTNR4CW5rl2fwuQlzZhY6EobORdcpuQxhslfs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1666250898; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=nZtLa+5VE5jTe1U9kil22e7E5Qo/g/1xnIjPfOMmbqo=; 
        b=ihmhOTnYFJGrWBiwNzKaAbwA5vkF5DxlRgz0Z6fIiSlp9nLnjgt2VMK3kH/rI09SZCLFJ3McoF5MjXdIwrdUW/+UNAhWYkHHJshH12+E2KiotbiiHXHRHf0JyGBmoUd1kjd86X9P9rT7y/2mRWoT43EMiiWouEcxjcE/rZlTN6I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=icenowy.me;
        spf=pass  smtp.mailfrom=uwu@icenowy.me;
        dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666250898;
        s=zmail; d=icenowy.me; i=uwu@icenowy.me;
        h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
        bh=nZtLa+5VE5jTe1U9kil22e7E5Qo/g/1xnIjPfOMmbqo=;
        b=J62xo6WQdPksJQmtX/LFLGb4Kh6jun7d4vJ5aPO8TJowcGj7qcHNiKI9qOu7L59x
        W11MTETdFscGKX6EhlEVoMfhuf2/MMIf5ju1VidmNa2wJ3oWjI8ny3xLlwIWRWgBsUz
        +AKuJ6GqRkbuDILAp6opOhFCZbJk+uFU4wOjG7+4=
Received: from edelgard.fodlan.icenowy.me (112.94.100.46 [112.94.100.46]) by mx.zohomail.com
        with SMTPS id 1666250896383103.29582748144344; Thu, 20 Oct 2022 00:28:16 -0700 (PDT)
Message-ID: <23818a08294a6b32aa9c8eaf0f444eaef60080b8.camel@icenowy.me>
Subject: Re: [PATCH v1 25/30] dt-bindings: pinctrl: Add StarFive JH7110
 pinctrl bindings
From:   Icenowy Zheng <uwu@icenowy.me>
To:     Hal Feng <hal.feng@linux.starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        linux-kernel@vger.kernel.org
Date:   Thu, 20 Oct 2022 15:28:07 +0800
In-Reply-To: <20220930073845.6309-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
         <20220930073845.6309-1-hal.feng@linux.starfivetech.com>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

5ZyoIDIwMjItMDktMzDmmJ/mnJ/kupTnmoQgMTU6MzggKzA4MDDvvIxIYWwgRmVuZ+WGmemBk++8
mgo+IEZyb206IEppYW5sb25nIEh1YW5nIDxqaWFubG9uZy5odWFuZ0BzdGFyZml2ZXRlY2guY29t
Pgo+IAo+IEFkZCBwaW5jdHJsIGJpbmRpbmdzIGZvciBTdGFyRml2ZSBKSDcxMTAgU29DLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEppYW5sb25nIEh1YW5nIDxqaWFubG9uZy5odWFuZ0BzdGFyZml2ZXRl
Y2guY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwuZmVuZ0BsaW51eC5zdGFyZml2
ZXRlY2guY29tPgo+IC0tLQo+IMKgLi4uL3BpbmN0cmwvc3RhcmZpdmUsamg3MTEwLXBpbmN0cmwu
eWFtbMKgwqDCoMKgwqAgfCAyMDIKPiArKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFu
Z2VkLCAyMDIgaW5zZXJ0aW9ucygrKQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvc3RhcmZpdmUsamg3MTEwLQo+IHBpbmN0
cmwueWFtbAo+IAo+IGRpZmYgLS1naXQKPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL3N0YXJmaXZlLGpoNzExMC0KPiBwaW5jdHJsLnlhbWwKPiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0YXJmaXZlLGpoNzExMC0KPiBwaW5j
dHJsLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNDgy
MDEyYWQ4YTE0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9waW5jdHJsL3N0YXJmaXZlLGpoNzExMC0KPiBwaW5jdHJsLnlhbWwKPiBAQCAt
MCwwICsxLDIwMiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOgo+IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvc3RhcmZpdmUsamg3MTEwLXBpbmN0cmwueWFtbCMK
PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwj
Cj4gKwo+ICt0aXRsZTogU3RhckZpdmUgSkg3MTEwIFBpbiBDb250cm9sbGVyIERldmljZSBUcmVl
IEJpbmRpbmdzCj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICvCoCBCaW5kaW5ncyBmb3IgdGhlIEpI
NzExMCBSSVNDLVYgU29DIGZyb20gU3RhckZpdmUgVGVjaG5vbG9neSBMdGQuCj4gKwo+ICttYWlu
dGFpbmVyczoKPiArwqAgLSBKaWFubG9uZyBIdWFuZyA8amlhbmxvbmcuaHVhbmdAc3RhcmZpdmV0
ZWNoLmNvbT4KPiArCj4gK3Byb3BlcnRpZXM6Cj4gK8KgIGNvbXBhdGlibGU6Cj4gK8KgwqDCoCBl
bnVtOgo+ICvCoMKgwqAgLSBzdGFyZml2ZSxqaDcxMTAtc3lzLXBpbmN0cmwKPiArwqDCoMKgIC0g
c3RhcmZpdmUsamg3MTEwLWFvbi1waW5jdHJsCj4gKwo+ICvCoCByZWc6Cj4gK8KgwqDCoCBtaW5J
dGVtczogMgo+ICvCoMKgwqAgbWF4SXRlbXM6IDIKPiArCj4gK8KgIHJlZy1uYW1lczoKPiArwqDC
oMKgIGl0ZW1zOgo+ICvCoMKgwqDCoMKgIC0gY29uc3Q6IGNvbnRyb2wKPiArCj4gK8KgIGNsb2Nr
czoKPiArwqDCoMKgIG1heEl0ZW1zOiAxCj4gKwo+ICvCoCByZXNldHM6Cj4gK8KgwqDCoCBtYXhJ
dGVtczogMQo+ICsKPiArwqAgIiNncGlvLWNlbGxzIjoKPiArwqDCoMKgIGNvbnN0OiAyCj4gKwo+
ICvCoCBpbnRlcnJ1cHRzOgo+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPiArwqDCoMKgIGRlc2NyaXB0
aW9uOiBUaGUgR1BJTyBwYXJlbnQgaW50ZXJydXB0Lgo+ICsKPiArwqAgaW50ZXJydXB0LWNvbnRy
b2xsZXI6IHRydWUKPiArCj4gK8KgICIjaW50ZXJydXB0LWNlbGxzIjoKPiArwqDCoMKgIGNvbnN0
OiAyCj4gKwo+ICvCoCBuZ3Bpb3M6Cj4gK8KgwqDCoCBlbnVtOgo+ICvCoMKgwqAgLSA2NAo+ICvC
oMKgwqAgLSA0Cj4gKwo+ICtyZXF1aXJlZDoKPiArwqAgLSBjb21wYXRpYmxlCj4gK8KgIC0gcmVn
Cj4gK8KgIC0gcmVnLW5hbWVzCj4gK8KgIC0gY2xvY2tzCj4gK8KgIC0gIiNncGlvLWNlbGxzIgo+
ICvCoCAtIGludGVycnVwdHMKPiArwqAgLSBpbnRlcnJ1cHQtY29udHJvbGxlcgo+ICvCoCAtICIj
aW50ZXJydXB0LWNlbGxzIgo+ICsKPiArcGF0dGVyblByb3BlcnRpZXM6Cj4gK8KgICctWzAtOV0r
JCc6Cj4gK8KgwqDCoCB0eXBlOiBvYmplY3QKPiArwqDCoMKgIHBhdHRlcm5Qcm9wZXJ0aWVzOgo+
ICvCoMKgwqDCoMKgICctcGlucyQnOgo+ICvCoMKgwqDCoMKgwqDCoCB0eXBlOiBvYmplY3QKPiAr
wqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgIEEgcGlu
Y3RybCBub2RlIHNob3VsZCBjb250YWluIGF0IGxlYXN0IG9uZSBzdWJub2RlCj4gcmVwcmVzZW50
aW5nIHRoZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcGluY3RybCBncm91cHMgYXZhaWxhYmxlIG9u
IHRoZSBtYWNoaW5lLiBFYWNoIHN1Ym5vZGUgd2lsbAo+IGxpc3QgdGhlCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoCBwaW5zIGl0IG5lZWRzLCBhbmQgaG93IHRoZXkgc2hvdWxkIGJlIGNvbmZpZ3VyZWQs
IHdpdGgKPiByZWdhcmQgdG8KPiArwqDCoMKgwqDCoMKgwqDCoMKgIG11eGVyIGNvbmZpZ3VyYXRp
b24sIHN5c3RlbSBzaWduYWwgY29uZmlndXJhdGlvbiwgcGluCj4gZ3JvdXBzIGZvcgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqAgdmluL3ZvdXQgbW9kdWxlLCBwaW4gdm9sdGFnZSwgbXV4IGZ1bmN0aW9u
cyBmb3Igb3V0cHV0LAo+IG11eCBmdW5jdGlvbnMKPiArwqDCoMKgwqDCoMKgwqDCoMKgIGZvciBv
dXRwdXQgZW5hYmxlLCBtdXggZnVuY3Rpb25zIGZvciBpbnB1dC4KPiArCj4gK8KgwqDCoMKgwqDC
oMKgIHByb3BlcnRpZXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBzdGFyZml2ZSxwaW5zOgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOiB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFRoZSBsaXN0IG9mIHBpbiBpZGVudGlmaWVycyB0aGF0IHByb3BlcnRpZXMgaW4g
dGhlCj4gbm9kZSBhcHBseSB0by4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGhpcyBz
aG91bGQgYmUgc2V0IHVzaW5nIHRoZSBQQURfR1BJT1ggbWFjcm9zLgo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBUaGlzIGhhcyB0byBiZSBzcGVjaWZpZWQuCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWluaW11bTogMAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG1heGltdW06IDYzCgpIaSwKCkkgYW0gYWRhcHRpbmcgZm9yIFBpbmU2NCdzIFN0YXI2NCBi
b2FyZCwgd2hpY2ggdXRpbGl6ZXMgYSBKSDcxMTAgU29DLgoKSXQgZG9lcyBub3QgZmVhdHVyZXMg
YSBVU0Igb3ZlcmN1cnJlbnQgcGluIGFzIEdQSU8sIHRodXMgdGhpcyBwaW4gbmVlZHMKdG8gYmUg
cm91dGVkIGluIFBJTyBjb250cm9sbGVyIHRvIGZpeGVkIDEgKGJ5IHdyaXRpbmcgMSB0bwpTWVNf
SU9NVVhfQ0ZHU0FJRl9fU1lTQ0ZHX0ZNVVhfMzJbMjI6MTZdKS4KCkkgdGhpbmsgdGhpcyBraW5k
IG9mIHNpdHVhdGlvbiBuZWVkcyB0byBiZSBjb25zaWRlcmVkIGFzIHBhcnQgb2YgRFQKYmluZGlu
Zy4KCkJUVyBpZiB5b3UgaGF2ZSBhbnkgZGlmZmljdWx0eSByZWZhY3RvcmluZyB0aGUgRFQgYmlu
ZGluZyB0byBzdGFuZGFyZApwaW5jb25mIG9uZSwgSSBhbSBmcmVlIHRvIHByb3ZpZGUgaGVscC4K
ClRoYW5rcywKSWNlbm93eSBaaGVuZwoKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBzdGFyZml2
ZSxwaW5tdXg6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IHwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGhlIGxpc3Qgb2YgR1BJT3MgYW5kIHRoZWlyIG11eCBm
dW5jdGlvbnMgdGhhdAo+IHByb3BlcnRpZXMgaW4gdGhlCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG5vZGUgYXBwbHkgdG8uIFRoaXMgc2hvdWxkIGJlIHNldCB1c2luZyB0aGUKPiBQQURf
R1BJT1hfRlVOQ19TRUwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFjcm8gd2l0aCBp
dHMgdmFsdWUuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRoaXMgaXMgb3B0aW9uYWwg
Zm9yIHNvbWUgcGlucy4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGhlIHZhbHVlIG9m
IFBBRF9HUElPWF9GVU5DX1NFTCBtYWNybyBjYW4gc2VsZWN0czoKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDA6IEdQSU9YIG11eCBmdW5jdGlvbiAwLAo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMTogR1BJT1ggbXV4IGZ1bmN0aW9uIDEsCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAyOiBHUElPWCBtdXggZnVuY3Rpb24gMi4KPiArCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoCBzdGFyZml2ZSxwaW4taW9jb25maWc6Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZGVzY3JpcHRpb246IHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGhpcyBp
cyB1c2VkIHRvIGNvbmZpZ3VyZSB0aGUgY29yZSBzZXR0aW5ncyBvZiBzeXN0ZW0KPiBzaWduYWxz
Lgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGUgY29tYmluYXRpb24gb2YgR1BJT19J
RSBvciBHUElPX0RTIG9yIEdQSU9fUFUgb3IKPiBHUElPX1BEIG9yCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIEdQSU9fU0xFVyBvciBHUElPX1NNVCBvciBHUElPX1BPUy4KPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91
aW50MzIKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBzdGFyZml2ZSxwYWRtdXg6Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgVGhlIHBhZG11eCBpcyBmb3IgdmluL3ZvdXQgbW9kdWxlIHRvIHNlbGVjdCBwaW4KPiBn
cm91cHMuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDA6IHZvdXQgd2lsbCBiZSBzZXQg
YXQgcGlucyBmcm9tIFBBRF9HUElPNyB0bwo+IFBBRF9HUElPMzQsCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHdoZW4gUEFEX0dQSU9YX0ZVTkNfU0VMIGlzIHNldCBhcyAxLgo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2aW4gd2lsbCBiZSBzZXQgYXQgcGlu
cyBmcm9tIFBBRF9HUElPNiB0bwo+IFBBRF9HUElPMjAuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHdoZW4gUEFEX0dQSU9YX0ZVTkNfU0VMIGlzIHNldCBhcyAyLgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxOiB2b3V0IHdpbGwgYmUgc2V0IGF0IHBpbnMgZnJvbSBQ
QURfR1BJTzM2IHRvCj4gUEFEX0dQSU82MywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgd2hlbiBQQURfR1BJT1hfRlVOQ19TRUwgaXMgc2V0IGFzIDEuCj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZpbiB3aWxsIGJlIHNldCBhdCBwaW5zIGZyb20gUEFEX0dQ
SU8yMSB0bwo+IFBBRF9HUElPMzUuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHdoZW4gUEFEX0dQSU9YX0ZVTkNfU0VMIGlzIHNldCBhcyAyLgo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAyOiB2aW4gd2lsbCBiZSBzZXQgYXQgcGlucyBmcm9tIFBBRF9HUElPMzYgdG8K
PiBQQURfR1BJTzUwLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB3aGVuIFBB
RF9HUElPWF9GVU5DX1NFTCBpcyBzZXQgYXMgMgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGVudW06IFswLCAxLCAyXQo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgIHN0
YXJmaXZlLHBpbi1zeXNjb246Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246
IHwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVGhpcyBpcyB1c2VkIHRvIHNldCBwaW4g
dm9sdGFnZSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDogMy4zViwgMTogMi41Viwg
MjogMS44Vi4KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55
YW1sIy9kZWZpbml0aW9ucy91aW50MzIKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVtOiBb
MCwgMSwgMl0KPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBzdGFyZml2ZSxwaW4tZ3Bpby1kb3V0
Ogo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOiB8Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFRoaXMgaXMgdXNlZCB0byBzZXQgdGhlaXIgbXV4IGZ1bmN0aW9ucyBm
b3Igb3V0cHV0Lgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBUaGlzIHNob3VsZCBiZSBz
ZXQgdXNpbmcgdGhlIEdQT19YWFggbWFjcm8sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN1Y2ggYXMgR1BPX0xPVywgR1BPX1VBUlQwX1NPVVQuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbWluaW11bTogMAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1h
eGltdW06IDEwNwo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXJmaXZlLHBpbi1ncGlvLWRv
ZW46Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IHwKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgVGhpcyBpcyB1c2VkIHRvIHNldCB0aGVpciBtdXggZnVuY3Rpb25z
IGZvciBvdXRwdXQKPiBlbmFibGUuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRoaXMg
c2hvdWxkIGJlIHNldCB1c2luZyB0aGUgT0VOX1hYWCBtYWNybywKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3VjaCBhcyBPRU5fTE9XLCBPRU5fSTJDMF9JQ19DTEtfT0UuCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMv
dWludDMyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWluaW11bTogMAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1heGltdW06IDQ5Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgc3RhcmZp
dmUscGluLWdwaW8tZGluOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOiB8
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRoaXMgaXMgdXNlZCB0byBzZXQgdGhlaXIg
bXV4IGZ1bmN0aW9ucyBmb3IgaW5wdXQuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRo
aXMgc2hvdWxkIGJlIHNldCB1c2luZyB0aGUgR1BJX1hYWCBtYWNybywKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3VjaCBhcyBHUElfQ0FOMF9DVFJMX1JYRCwgR1BJX0kyQzBfSUNfQ0xL
X0lOX0EuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvdWludDMyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWluaW11bTog
MAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1heGltdW06IDkwCj4gKwo+ICvCoMKgwqDCoMKg
wqDCoCBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiArCj4gK8KgwqDCoCBhZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsK
PiArZXhhbXBsZXM6Cj4gK8KgIC0gfAo+ICvCoMKgwqAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL3N0YXJmaXZlLWpoNzExMC1zeXMuaD4KPiArwqDCoMKgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9yZXNldC9zdGFyZml2ZS1qaDcxMTAuaD4KPiArwqDCoMKgICNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9waW5jdHJsL3BpbmN0cmwtc3RhcmZpdmUtamg3MTEwLmg+Cj4gKwo+ICvCoMKgwqAgZ3Bpbzog
Z3Bpb0AxMzA0MDAwMCB7Cj4gK8KgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcx
MTAtc3lzLXBpbmN0cmwiOwo+ICvCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHgxMzA0MDAwMCAweDAg
MHgxMDAwMD47Cj4gK8KgwqDCoMKgwqAgcmVnLW5hbWVzID0gImNvbnRyb2wiOwo+ICvCoMKgwqDC
oMKgIGNsb2NrcyA9IDwmY2xrZ2VuIEpINzExMF9TWVNfSU9NVVhfUENMSz47Cj4gK8KgwqDCoMKg
wqAgcmVzZXRzID0gPCZyc3RnZW4gUlNUTl9VMF9TWVNfSU9NVVhfUFJFU0VUTj47Cj4gK8KgwqDC
oMKgwqAgaW50ZXJydXB0cyA9IDw4Nj47Cj4gK8KgwqDCoMKgwqAgaW50ZXJydXB0LWNvbnRyb2xs
ZXI7Cj4gK8KgwqDCoMKgwqAgI2dwaW8tY2VsbHMgPSA8Mj47Cj4gK8KgwqDCoMKgwqAgbmdwaW9z
ID0gPDY0PjsKPiArwqDCoMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4gKwo+ICvCoMKgwqDCoMKg
IHVhcnQwX3BpbnM6IHVhcnQwLXBpbnMgewo+ICvCoMKgwqDCoMKgwqDCoCB1YXJ0MC1waW5zLXR4
IHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXJmaXZlLHBpbnMgPSA8UEFEX0dQSU81PjsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgIHN0YXJmaXZlLHBpbi1pb2NvbmZpZyA9IDxJTyhHUElPX0lFKDEp
IHwgR1BJT19EUygzKSk+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgc3RhcmZpdmUscGluLWdwaW8t
ZG91dCA9IDxHUE9fVUFSVDBfU09VVD47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBzdGFyZml2ZSxw
aW4tZ3Bpby1kb2VuID0gPE9FTl9MT1c+Owo+ICvCoMKgwqDCoMKgwqDCoCB9Owo+ICsKPiArwqDC
oMKgwqDCoMKgwqAgdWFydDAtcGlucy1yeCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBzdGFyZml2
ZSxwaW5zID0gPFBBRF9HUElPNj47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBzdGFyZml2ZSxwaW5t
dXggPSA8UEFEX0dQSU82X0ZVTkNfU0VMIDA+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgc3RhcmZp
dmUscGluLWlvY29uZmlnID0gPElPKEdQSU9fSUUoMSkgfCBHUElPX1BVKDEpKT47Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoCBzdGFyZml2ZSxwaW4tZ3Bpby1kb2VuID0gPE9FTl9ISUdIPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgIHN0YXJmaXZlLHBpbi1ncGlvLWRpbiA9wqAgPEdQSV9VQVJUMF9TSU4+
Owo+ICvCoMKgwqDCoMKgwqDCoCB9Owo+ICvCoMKgwqDCoMKgIH07Cj4gK8KgwqDCoCB9Owo+ICsK
PiArwqDCoMKgICZ1YXJ0MCB7Cj4gK8KgwqDCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0
IjsKPiArwqDCoMKgwqDCoCBwaW5jdHJsLTAgPSA8JnVhcnQwX3BpbnM+Owo+ICvCoMKgwqDCoMKg
IHN0YXR1cyA9ICJva2F5IjsKPiArwqDCoMKgIH07Cj4gKwo+ICsuLi4KCg==

