Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4E1255AE92
	for <lists+linux-clk@lfdr.de>; Sun, 26 Jun 2022 06:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233816AbiFZEDs (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sun, 26 Jun 2022 00:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiFZEDr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 26 Jun 2022 00:03:47 -0400
Received: from m1550.mail.126.com (m1550.mail.126.com [220.181.15.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BB43611A05
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 21:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=MnfC0
        qinu6z34K9z86NHk8uz9gb1Ca3ro4DUuOnwVO4=; b=SsRbTvt+TL3Ff8ynveXg3
        K+HEyAhjdBu1z18WG6cb3tF4EeLQCofwuUF0hVr9UYZfqedWoiGBBFzKNbSUut37
        9txV6LhARqzQQjdh7waDMLwsf+hIyAtoLFnT6D1JhqCmXIoAyhVqTfZ0ASx9lmy+
        pHRD5akO4coJNdUK/aPD58=
Received: from windhl$126.com ( [124.16.139.61] ) by ajax-webmail-wmsvr50
 (Coremail) ; Sun, 26 Jun 2022 12:03:31 +0800 (CST)
X-Originating-IP: [124.16.139.61]
Date:   Sun, 26 Jun 2022 12:03:31 +0800 (CST)
From:   "Liang He" <windhl@126.com>
To:     "Orson Zhai" <orsonzhai@gmail.com>
Cc:     mturquette@baylibre.com, "Stephen Boyd" <sboyd@kernel.org>,
        "Baolin Wang" <baolin.wang7@gmail.com>,
        "Lyra Zhang" <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org
Subject: Re:Re: Re: [PATCH] clk/sprd: Hold reference returned by
 of_get_parent()
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 126com
In-Reply-To: <CA+H2tpHyXD1pr7G9nxU9tJPgtfE5MioFE+Dy+bUwz+z=ap-MXg@mail.gmail.com>
References: <20220624103809.4167753-1-windhl@126.com>
 <CA+H2tpEZ6GNYjZ669w4yxK7EPm8bk_uRdq+6-5Z95FpPy4S8nA@mail.gmail.com>
 <7cb414e.2aa5.1819b7e699f.Coremail.windhl@126.com>
 <CA+H2tpHyXD1pr7G9nxU9tJPgtfE5MioFE+Dy+bUwz+z=ap-MXg@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <1a1ed744.abe.1819e2dd0bc.Coremail.windhl@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: MsqowADHHPGU2rdi5J89AA--.15339W
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuAgsF2JVkDHahAABsC
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CgpBdCAyMDIyLTA2LTI2IDExOjMyOjQwLCAiT3Jzb24gWmhhaSIgPG9yc29uemhhaUBnbWFpbC5j
b20+IHdyb3RlOgo+SGkgTGlhbmcsCj4KPk9uIFNhdCwgSnVuIDI1LCAyMDIyIGF0IDExOjM0IFBN
IExpYW5nIEhlIDx3aW5kaGxAMTI2LmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+IEF0IDIwMjItMDYtMjUg
MTY6MzY6MDQsICJPcnNvbiBaaGFpIiA8b3Jzb256aGFpQGdtYWlsLmNvbT4gd3JvdGU6Cj4+ID5I
aSBMaWFuZywKPj4gPgo+PiA+T24gRnJpLCBKdW4gMjQsIDIwMjIgYXQgNjozOSBQTSBMaWFuZyBI
ZSA8d2luZGhsQDEyNi5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+PiBXZSBzaG91bGQgaG9sZCB0aGUg
cmVmZXJlbmNlIHJldHVybmVkIGJ5IG9mX2dldF9wYXJlbnQoKSBhbmQgdXNlIGl0Cj4+ID4+IHRv
IGNhbGwgb2Zfbm9kZV9vdXQoKSBmb3IgcmVmY291bnQgYmFsYW5jZS4KPj4gPj4KPj4gPj4gRml4
ZXM6IGY5NWU4Yzc5MjNkMSAoImNsazogc3ByZDogc3VwcG9ydCB0byBnZXQgcmVnbWFwIGZyb20g
cGFyZW50IG5vZGUiKQo+PiA+PiBTaWduZWQtb2ZmLWJ5OiBMaWFuZyBIZSA8d2luZGhsQDEyNi5j
b20+Cj4+ID4+IC0tLQo+PiA+PiAgdGhlc2UgYnVncyBhcmUgZm91bmQgaW4gNS4xOXJjMgo+PiA+
PiAgdGhlc2UgYnVncyBhcmUgY29uZmlybWVkIG5vdCBmaXhlZCBieSBsb3JlLmtlcm5lbC5vcmcK
Pj4gPj4gIHRoZXNlIGJ1Z3MgYXJlIGNvbXBpbGVkIHRlc3RlZCBpbiA1LjE5cmMyIHdpdGggYXQ5
MV9kdF9kZWZjb25maWcKPj4gPj4KPj4gPj4gIGRyaXZlcnMvY2xrL3NwcmQvY29tbW9uLmMgfCAx
NiArKysrKysrKysrKy0tLS0tCj4+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPj4gPj4KPj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL3Nw
cmQvY29tbW9uLmMgYi9kcml2ZXJzL2Nsay9zcHJkL2NvbW1vbi5jCj4+ID4+IGluZGV4IGQ2MjBi
YmJjZGZjOC4uMDhjMWQ3YTllYzhiIDEwMDY0NAo+PiA+PiAtLS0gYS9kcml2ZXJzL2Nsay9zcHJk
L2NvbW1vbi5jCj4+ID4+ICsrKyBiL2RyaXZlcnMvY2xrL3NwcmQvY29tbW9uLmMKPj4gPj4gQEAg
LTQxLDM1ICs0MSw0MSBAQCBpbnQgc3ByZF9jbGtfcmVnbWFwX2luaXQoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwKPj4gPj4gIHsKPj4gPj4gICAgICAgICB2b2lkIF9faW9tZW0gKmJhc2U7
Cj4+ID4+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPj4gPj4gLSAg
ICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBkZXYtPm9mX25vZGU7Cj4+ID4+ICsgICAg
ICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9ub2RlLCAqbnA7Cj4+ID4+ICAg
ICAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+PiA+Pgo+PiA+PiArICAgICAgIG5wID0gb2Zf
Z2V0X3BhcmVudChkZXYtPm9mX25vZGUpOwo+PiA+PiAgICAgICAgIGlmIChvZl9maW5kX3Byb3Bl
cnR5KG5vZGUsICJzcHJkLHN5c2NvbiIsIE5VTEwpKSB7Cj4+ID4+ICAgICAgICAgICAgICAgICBy
ZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKG5vZGUsICJzcHJkLHN5c2Nv
biIpOwo+PiA+Cj4+ID5XaHkgbm90IHRvIGNhbGwgb2Zfbm9kZV9wdXQoKSBpbiB0aGlzIGZ1bmN0
aW9uPwo+PiA+SGUgcmV0dXJucyBhbiBlcnJvciBhbmQgaXQgaXMgaGlzIHJlc3BvbnNpYmlsaXR5
IHRvIGNsZWFuIHVwCj4+ID5ldmVyeXRoaW5nIGhlIHVzZWQsIHJpZ2h0Pwo+PiA+Cj4+ID4tT3Jz
b24KPj4gPgo+PiBIaSwgT3Jzb24sCj4+Cj4+IEkgb25seSBrbm93IHdlIHNob3VsZCB1c2UgdGhl
IHBhaXIgb2YgZnVuY3Rpb25zIChvZl9nZXRfcGFyZW50KCksIG9mX25vZGVfcHV0KQo+PiB0byBr
ZWVwIHJlZmNvdW50IGJhbGFuY2UuCj4+Cj4+IEhvd2V2ZXIsIGFzIEkgZG8gbm90IHJlYWxseSBr
bm93IHRoZSBzZW1hbnRpYyBvZiBvdGhlciBmdW5jdGlvbnMsIHNvIEkgY2Fubm90Cj4+IGdpdmUg
b3RoZXIga2luZHMgb2YgcGF0Y2guCj4KPlNvcnJ5LCBJIGRpZG4ndCBjYXRjaCB5b3VyIHBvaW50
IGJlZm9yZS4KPllvdSdyZSByaWdodCBvbiB0aGlzIHVuYmFsYW5jZS4gQnV0IGl0IGhhcyBubyBk
aXJlY3QgcmVsYXRpb24gdG8gdGhlCj5mdW5jdGlvbiBoZXJlLgoKVGhhbmtzIGZvciB5b3VyIHVu
ZGVyc3RhbmRpbmcuIEFuZCB5ZXMsIGl0IGhhcyBubyBkaXJlY3QgcmVsYXRpb24KIHRvIHRoZSBm
dW5jdGlvbiBoZXJlLgoKPkkgdGhpbmsgaXQgaXMgYmV0dGVyIHRvIG1pbmltaXplIHRoZSBlZmZl
Y3RpdmUgcmFuZ2Ugb2Ygb2ZfZ2V0X3BhcmVudCgpCj4KPkNvdWxkIHlvdSByZWZlciB0byBQYW50
ZWxpcydzIGFuc3dlciB0byB0aGUgbGFzdCBxdWVzdGlvbiBhdCBbMV0uCj4KPlRoYW5rcy4KPi1P
cnNvbgo+Cj5bMV0gaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvZGV2aWNldHJlZS9tc2cx
MjI1NTUuaHRtbAo+CgpUaGFua3MsIE9yc29uLgoKWWVzLCBJIGFsc28gd2FudGVkIHRvIG1ha2Ug
YSBiZXR0ZXIgcGF0Y2ggc29sdXRpb24gYXMgdGhlIGJ1ZyBpcyBvbmx5IGNhdXNlZCAKYnkgdGhl
ICdlbHNlIGlmJyBicmFuY2guCgpIb3dldmVyLCBJIGNhbm5vdCBmaW5kIGEgYmV0dGVyIHNvbHV0
aW9uIHRvIGZpeCB0aGUgYnVnIGluIHRoZSBtaWRkbGUgb2YgbmVzdGVkIAonaWYtZWxzZSBpZi1l
bHNlJyBicmFuY2VzIHVubGVzcyB3ZSB0cnkgdG8gcmV3cml0ZSB0aGVtLCB3aGljaCBpcyBtb3Jl
IGRpZmZpY3VsdCBmb3IgbWUsIG5vdy4KCkJ1dCBpZiB5b3UgdGhpbmsgaXQgaXMgKHNlbWFudGlj
KSBzYWZlIHRvIHJld3JpdGUgdGhlc2UgYnJhbmNoZXMsIEkgY2FuIHRyeSBpdC4KClRoYW5rcyBh
Z2FpbiBmb3IgeW91ciByZWxweS4KCkxpYW5nIAoKPj4KPj4gQnkgdGhlIHdheSwgaWYgd2UgY2hv
c2UgdG8gcHV0IG9mX25vZGVfcHV0KCkgaW4gdGhpcyBmdW5jdGlvbiwgSSB0aGluayBpdCBhbHNv
IG5lZWQKPj4gdG8gcHV0IG9mX25vZGVfcHV0KCkgaW50byAnZGV2aWNlX25vZGVfdG9fcmVnbWFw
JyBhcyBpdCBhbHNvIHJldHVybiBlcnJvciBjb2RlIGluCj4+IGZvbGxvd2luZyBwYXRoLgo+Pgo+
PiBBbnl3YXksIHRoYW5rcyB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVwbHkgYW5kIHJldmlldyBvbiBt
eSBwYXRjaCBjb2RlLgo+Pgo+PiBMaWFuZwo+Pgo+Pgo+PiA+PiAgICAgICAgICAgICAgICAgaWYg
KElTX0VSUihyZWdtYXApKSB7Cj4+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgIHByX2Vycigi
JXM6IGZhaWxlZCB0byBnZXQgc3lzY29uIHJlZ21hcFxuIiwgX19mdW5jX18pOwo+PiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChucCk7Cj4+ID4+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJlZ21hcCk7Cj4+ID4+ICAgICAgICAgICAgICAgICB9
Cj4+ID4+IC0gICAgICAgfSBlbHNlIGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShvZl9nZXRf
cGFyZW50KGRldi0+b2Zfbm9kZSksCj4+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICJz
eXNjb24iKSkgewo+PiA+PiAtICAgICAgICAgICAgICAgcmVnbWFwID0gZGV2aWNlX25vZGVfdG9f
cmVnbWFwKG9mX2dldF9wYXJlbnQoZGV2LT5vZl9ub2RlKSk7Cj4+ID4+ICsgICAgICAgfSBlbHNl
IGlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgInN5c2NvbiIpKSB7Cj4+ID4+ICsgICAg
ICAgICAgICAgICByZWdtYXAgPSBkZXZpY2Vfbm9kZV90b19yZWdtYXAobnApOwo+PiA+PiAgICAg
ICAgICAgICAgICAgaWYgKElTX0VSUihyZWdtYXApKSB7Cj4+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIG9mX25vZGVfcHV0KG5wKTsKPj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgZGV2
X2VycihkZXYsICJmYWlsZWQgdG8gZ2V0IHJlZ21hcCBmcm9tIGl0cyBwYXJlbnQuXG4iKTsKPj4g
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPj4gPj4g
ICAgICAgICAgICAgICAgIH0KPj4gPj4gICAgICAgICB9IGVsc2Ugewo+PiA+PiAgICAgICAgICAg
ICAgICAgYmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPj4g
Pj4gLSAgICAgICAgICAgICAgIGlmIChJU19FUlIoYmFzZSkpCj4+ID4+ICsgICAgICAgICAgICAg
ICBpZiAoSVNfRVJSKGJhc2UpKSB7Cj4+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIG9mX25v
ZGVfcHV0KG5wKTsKPj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIo
YmFzZSk7Cj4+ID4+ICsgICAgICAgICAgICAgICB9Cj4+ID4+Cj4+ID4+ICAgICAgICAgICAgICAg
ICByZWdtYXAgPSBkZXZtX3JlZ21hcF9pbml0X21taW8oJnBkZXYtPmRldiwgYmFzZSwKPj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3ByZGNsa19y
ZWdtYXBfY29uZmlnKTsKPj4gPj4gICAgICAgICAgICAgICAgIGlmIChJU19FUlIocmVnbWFwKSkg
ewo+PiA+PiArICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChucCk7Cj4+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIHByX2VycigiZmFpbGVkIHRvIGluaXQgcmVnbWFwXG4iKTsK
Pj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsKPj4g
Pj4gICAgICAgICAgICAgICAgIH0KPj4gPj4gICAgICAgICB9Cj4+ID4+Cj4+ID4+ICsgICAgICAg
b2Zfbm9kZV9wdXQobnApOwo+PiA+PiAgICAgICAgIHNwcmRfY2xrX3NldF9yZWdtYXAoZGVzYywg
cmVnbWFwKTsKPj4gPj4KPj4gPj4gICAgICAgICByZXR1cm4gMDsKPj4gPj4gLS0KPj4gPj4gMi4y
NS4xCj4+ID4+Cg==
