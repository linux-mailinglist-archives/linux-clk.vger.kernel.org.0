Return-Path: <linux-clk+bounces-9398-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534B92CFB5
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 12:49:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B52E71C23893
	for <lists+linux-clk@lfdr.de>; Wed, 10 Jul 2024 10:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E94E18FDDD;
	Wed, 10 Jul 2024 10:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b="Y5ISJrmz"
X-Original-To: linux-clk@vger.kernel.org
Received: from forward502a.mail.yandex.net (forward502a.mail.yandex.net [178.154.239.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224FF17FD;
	Wed, 10 Jul 2024 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720608146; cv=none; b=eZiiMeKqk8YLtWZd/+jsF3H8W4908tcSvkMkZlUk7C6VbnQdJ1br4nQHDNWnyRFl6duKS7yMGuZVkzQBa0kh2FD4ea265AMG5VZ1uF6X1ThCjUZ1WS6oTWFIXDkePOIHqJVlXHAWBG/zFJ9I+7WIF7cDhR4v/4jgijQFGSGPlQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720608146; c=relaxed/simple;
	bh=zA/s72wiN2pGMjFDnSx867sVm5NZRTaaJ8hJWSjGRdA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V3EqIFYth7f0YFyAR1BGhVxUwrZccCiInTLe6SrSpYhU0Sr1QubavWS6tAap195Kt/qzYvFAKdhIzkfKX9U/DWq+DPgAMeltCGGnkOrvCNLceMS1YZ4Fpkulb1AKQSsSUvYy5PJR07fsHEkkEv1e4165Hb9ETNXRQs33R7XILVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me; spf=pass smtp.mailfrom=maquefel.me; dkim=pass (1024-bit key) header.d=maquefel.me header.i=@maquefel.me header.b=Y5ISJrmz; arc=none smtp.client-ip=178.154.239.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net [IPv6:2a02:6b8:c1f:610c:0:640:1005:0])
	by forward502a.mail.yandex.net (Yandex) with ESMTPS id 5BC4761CB5;
	Wed, 10 Jul 2024 13:34:13 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id BYbV1A2p9Ko0-8ekmB8iL;
	Wed, 10 Jul 2024 13:34:12 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1720607652; bh=zA/s72wiN2pGMjFDnSx867sVm5NZRTaaJ8hJWSjGRdA=;
	h=References:Date:In-Reply-To:Cc:To:From:Subject:Message-ID;
	b=Y5ISJrmzkg9nQOOUQp9khJvf22bMTs46g1dhrGw3TTYp2bwAWT+MFYX9j89z038ms
	 xpqUxmFir4jkq1spOJwRUXkWweVHj4q1fJIzq3o3oUVq/9wsBbWUhxDPwqwbk3VHH1
	 2plhMtE8NQyR7gbcKxYGVO9J0Aqgo91MfidZWdxI=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
Message-ID: <7f2bf860ffaccd10899b72fdda6a3ca9c50d2107.camel@maquefel.me>
Subject: Re: [PATCH v10 03/38] clk: ep93xx: add DT support for Cirrus EP93xx
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Nikita Shubin via B4 Relay
 <devnull+nikita.shubin.maquefel.me@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Arnd Bergmann
	 <arnd@arndb.de>
Date: Wed, 10 Jul 2024 13:34:12 +0300
In-Reply-To: <6c5d6c0730698969ef613ec9ec4aa14a.sboyd@kernel.org>
References: <20240617-ep93xx-v10-0-662e640ed811@maquefel.me>
	 <20240617-ep93xx-v10-3-662e640ed811@maquefel.me>
	 <6c5d6c0730698969ef613ec9ec4aa14a.sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGVsbG8gU3RlcGhlbiEKCk9uIE1vbiwgMjAyNC0wNy0wOCBhdCAxNToxOCAtMDcwMCwgU3RlcGhl
biBCb3lkIHdyb3RlOgo+IFF1b3RpbmcgTmlraXRhIFNodWJpbiB2aWEgQjQgUmVsYXkgKDIwMjQt
MDYtMTcgMDI6MzY6MzcpCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWVwOTN4eC5j
IGIvZHJpdmVycy9jbGsvY2xrLWVwOTN4eC5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5hMDQzMGE1YWU0ZGEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL2RyaXZlcnMvY2xrL2Nsay1lcDkzeHguYwo+ID4gQEAgLTAsMCArMSw4MzQgQEAKPiA+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+ID4gKy8qCj4gWy4u
Ll0KPiA+ICsKPiA+ICtzdGF0aWMgaW50IGVwOTN4eF9jbGtfZW5hYmxlKHN0cnVjdCBjbGtfaHcg
Kmh3KQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IGVwOTN4eF9jbGsgKmNsayA9IGVw
OTN4eF9jbGtfZnJvbShodyk7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBlcDkzeHhfY2xrX3By
aXYgKnByaXYgPSBlcDkzeHhfcHJpdl9mcm9tKGNsayk7Cj4gPiArwqDCoMKgwqDCoMKgIHUzMiB2
YWw7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIGd1YXJkKHNwaW5sb2NrX2lycXNhdmUpKCZwcml2
LT5sb2NrKTsKPiAKPiBJIHRob3VnaHQgZ3VhcmQoKSB3YXMgbW9zdCBpbXBvcnRhbnQgd2hlbiB0
aGVyZSB3ZXJlIG11bHRpcGxlIGV4aXQKPiBwYXRocwo+IGZyb20gYSBmdW5jdGlvbiwgYnV0IE9L
Lgo+IAo+ID4gKwo+IFsuLi5dCj4gPiArCj4gPiArc3RhdGljIGludCBlcDkzeHhfcGxsc19pbml0
KHN0cnVjdCBlcDkzeHhfY2xrX3ByaXYgKnByaXYpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoCBj
b25zdCBjaGFyIGZjbGtfZGl2aXNvcnNbXSA9IHsgMSwgMiwgNCwgOCwgMTYsIDEsIDEsIDEgfTsK
PiA+ICvCoMKgwqDCoMKgwqAgY29uc3QgY2hhciBoY2xrX2Rpdmlzb3JzW10gPSB7IDEsIDIsIDQs
IDUsIDYsIDgsIDE2LCAzMiB9Owo+IFsuLi5dCj4gPiArwqDCoMKgwqDCoMKgIGlmICghKHZhbHVl
ICYgRVA5M1hYX1NZU0NPTl9DTEtTRVQyX05CWVAyKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNsa19wbGwyX3JhdGUgPSBFUDkzWFhfRVhUX0NMS19SQVRFOwo+ID4gK8KgwqDC
oMKgwqDCoCBlbHNlIGlmICh2YWx1ZSAmIEVQOTNYWF9TWVNDT05fQ0xLU0VUMl9QTEwyX0VOKQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrX3BsbDJfcmF0ZSA9IGNhbGNfcGxs
X3JhdGUoRVA5M1hYX0VYVF9DTEtfUkFURSwKPiA+IHZhbHVlKTsKPiA+ICvCoMKgwqDCoMKgwqAg
ZWxzZQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrX3BsbDJfcmF0ZSA9IDA7
Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIGh3ID0gZGV2bV9jbGtfaHdfcmVnaXN0ZXJfZml4ZWRf
cmF0ZShkZXYsICJwbGwyIiwgInh0YWxpIiwKPiA+IDAsIGNsa19wbGwyX3JhdGUpOwo+IAo+IFBs
ZWFzZSB1c2UgY2xrX3BhcmVudF9kYXRhIGZvciB0b3BvbG9neSBkZXNjcmlwdGlvbnMuCgpJdCdz
IGxvb2sgbGlrZSBjbGtfaHdfcmVnaXN0ZXJfZml4ZWRfcmF0ZV9wYXJlbnRfaHcoKSBpcyBtaXNz
aW5nIGRldm1fCnZlcnNpb24gb2YgdGhpcyBmdW5jdGlvbi4gSXMgaXQgb2sgdG8gcHJvdmlkZSB3
cmFwcGVyIGZvcgpfX2Nsa19od19yZWdpc3Rlcl9maXhlZF9yYXRlKCkgaW4gZHJpdmVycy9jbGsv
Y2xrLWVwOTN4eC5jID8KCj4gCj4gPiArwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoaHcpKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoaHcpOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoCBwcml2LT5maXhlZFtFUDkzWFhfQ0xLX1BMTDJdID0gaHc7Cj4gPiAr
Cj4gPiArwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50
IGVwOTN4eF9jbGtfcHJvYmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXYsCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdCBzdHJ1Y3QgYXV4aWxpYXJ5X2RldmljZV9pZAo+ID4gKmlkKQo+ID4gK3sKPiA+ICvCoMKg
wqDCoMKgwqAgc3RydWN0IGVwOTN4eF9yZWdtYXBfYWRldiAqcmRldiA9Cj4gPiB0b19lcDkzeHhf
cmVnbWFwX2FkZXYoYWRldik7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBjbGtfcGFyZW50X2Rh
dGEgeHRhbGkgPSB7IC5pbmRleCA9IDAgfTsKPiA+ICvCoMKgwqDCoMKgwqAgc3RydWN0IGNsa19w
YXJlbnRfZGF0YSBkZGl2X3BkYXRhWzNdID0geyB9Owo+ID4gK8KgwqDCoMKgwqDCoCB1bnNpZ25l
ZCBpbnQgY2xrX3NwaV9kaXYsIGNsa191c2JfZGl2Owo+ID4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3Qg
Y2xrX3BhcmVudF9kYXRhIHBkYXRhID0ge307Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBkZXZp
Y2UgKmRldiA9ICZhZGV2LT5kZXY7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBlcDkzeHhfY2xr
X3ByaXYgKnByaXY7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBlcDkzeHhfY2xrICpjbGs7Cj4g
PiArwqDCoMKgwqDCoMKgIHN0cnVjdCBjbGtfaHcgKmh3Owo+ID4gK8KgwqDCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgaWR4Owo+ID4gK8KgwqDCoMKgwqDCoCBpbnQgcmV0Owo+ID4gK8KgwqDCoMKgwqDC
oCB1MzIgdmFsdWU7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHByaXYgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzdHJ1Y3Rfc2l6ZShwcml2LCByZWcsIDEwKSwKPiA+IEdGUF9LRVJORUwpOwo+ID4gK8Kg
wqDCoMKgwqDCoCBpZiAoIXByaXYpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrX2luaXQoJnBy
aXYtPmxvY2spOwo+ID4gK8KgwqDCoMKgwqDCoCBwcml2LT5kZXYgPSBkZXY7Cj4gPiArwqDCoMKg
wqDCoMKgIHByaXYtPmF1eF9kZXYgPSByZGV2Owo+ID4gK8KgwqDCoMKgwqDCoCBwcml2LT5tYXAg
PSByZGV2LT5tYXA7Cj4gPiArwqDCoMKgwqDCoMKgIHByaXYtPmJhc2UgPSByZGV2LT5iYXNlOwo+
ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCByZXQgPSBlcDkzeHhfcGxsc19pbml0KHByaXYpOwo+ID4g
K8KgwqDCoMKgwqDCoCBpZiAocmV0KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHJldDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgcmVnbWFwX3JlYWQocHJpdi0+bWFw
LCBFUDkzWFhfU1lTQ09OX0NMS1NFVDIsICZ2YWx1ZSk7Cj4gPiArwqDCoMKgwqDCoMKgIGNsa191
c2JfZGl2ID0gKHZhbHVlID4+IDI4ICYgR0VOTUFTSygzLCAwKSkgKyAxOwo+ID4gK8KgwqDCoMKg
wqDCoCBodyA9IGRldm1fY2xrX2h3X3JlZ2lzdGVyX2ZpeGVkX2ZhY3RvcihkZXYsICJ1c2JfY2xr
IiwKPiA+ICJwbGwyIiwgMCwgMSwgY2xrX3VzYl9kaXYpOwo+IAo+IFRoaXMgb25lIGNhbiB1c2Ug
Y2xrX2h3IHRvIHJlZmVyZW5jZSBwbGwyLgo+IAo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoSVNfRVJS
KGh3KSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGh3
KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqAgcHJpdi0+Zml4ZWRbRVA5M1hYX0NMS19VU0JdID0g
aHc7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHJldCA9IGVwOTN4eF91YXJ0X2Nsb2NrX2luaXQo
cHJpdik7Cj4gPiArwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCByZXQgPSBlcDkz
eHhfZG1hX2Nsb2NrX2luaXQocHJpdik7Cj4gPiArwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoCBjbGtfc3BpX2RpdiA9IGlkLT5kcml2ZXJfZGF0YTsKPiA+ICvCoMKgwqDCoMKgwqAg
aHcgPSBkZXZtX2Nsa19od19yZWdpc3Rlcl9maXhlZF9mYWN0b3IoZGV2LCAiZXA5M3h4LXNwaS4w
IiwKPiA+ICJ4dGFsaSIsCj4gCj4gQXJlIHRoZXNlIGNsayBuYW1lcyB0cnlpbmcgdG8gbWF0Y2gg
ZGV2aWNlIG5hbWVzPwo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
LCAxLCBjbGtfc3BpX2Rpdik7Cj4gPiArwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoaHcpKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoaHcpOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoCBwcml2LT5maXhlZFtFUDkzWFhfQ0xLX1NQSV0gPSBodzsKPiA+ICsK
PiA+ICvCoMKgwqDCoMKgwqAgLyogUFdNIGNsb2NrICovCj4gPiArwqDCoMKgwqDCoMKgIGh3ID0g
ZGV2bV9jbGtfaHdfcmVnaXN0ZXJfZml4ZWRfZmFjdG9yKGRldiwgInB3bV9jbGsiLAo+ID4gInh0
YWxpIiwgMCwgMSwgMSk7Cj4gPiArwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoaHcpKQo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoaHcpOwo+ID4gKwo+ID4g
K8KgwqDCoMKgwqDCoCBwcml2LT5maXhlZFtFUDkzWFhfQ0xLX1BXTV0gPSBodzsKPiA+ICsKPiA+
ICvCoMKgwqDCoMKgwqAgLyogVVNCIGNsb2NrICovCj4gPiArwqDCoMKgwqDCoMKgIGh3ID0gZGV2
bV9jbGtfaHdfcmVnaXN0ZXJfZ2F0ZShwcml2LT5kZXYsICJvaGNpLXBsYXRmb3JtIiwKPiA+ICJ1
c2JfY2xrIiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAwLCBwcml2LT5iYXNlICsKPiA+IEVQOTNY
WF9TWVNDT05fUFdSQ05ULAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEVQOTNYWF9TWVNDT05fUFdS
Q05UX1VTSF9FTiwKPiA+IDAsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJnByaXYtPmxvY2spOwo+
ID4gK8KgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGh3KSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGh3KTsKPiA+ICsKCg==


