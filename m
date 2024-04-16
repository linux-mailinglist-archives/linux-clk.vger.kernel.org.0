Return-Path: <linux-clk+bounces-5986-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 794BB8A6AC4
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 14:21:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23CA1F21659
	for <lists+linux-clk@lfdr.de>; Tue, 16 Apr 2024 12:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2B412AAE5;
	Tue, 16 Apr 2024 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RiJ8v845"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1185E12A177
	for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713270080; cv=none; b=WG5gw+b9tdvB5yeYdIwa1Pu1qNq8pjNzJNJWxUcCwfL7elAQ3oIhGHemocaXwmfpu4LWdJiVIrzOaV/jprgoMudkSMRObcibsES8pi5GdSKzClAu06iQ56pPZkM4+5kyG9l9WUoFbXl6jyQi3fckog8KyBfIbBlJ9rqhSYPQc4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713270080; c=relaxed/simple;
	bh=PpGMn2INMbylfu21Bj48tT8p8k7cCHT4iq/KSWuJyTg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WA72OANJ91+mNMCL9DkK7aVu8tCB+Py7RoFAGG69q9ZZXlG7ApLR3lOBlefWv9De9d/bCkzBsPsqYfN3Zpqury1wT5apKjdkZOJRxS9+rrSqCdflQjM+jGXUYR0NJTLrqd5sMKLhVQfnfADxpphRaU4xUko+18vh/AdbEqGj4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RiJ8v845; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-418a2de4d8fso1372405e9.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Apr 2024 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713270077; x=1713874877; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PpGMn2INMbylfu21Bj48tT8p8k7cCHT4iq/KSWuJyTg=;
        b=RiJ8v845EGOdqa2pEpylA4TK4TdFfvFTUauoaWaFXf14MXgyjiDVDXHt3BG2VcNO39
         ZcbnlhZcQ3HSoREVvA42MkEOVQg/JWJEhPcJKzlRlmfM5dBi8g87EV+7hl/BP+2iONpT
         3U3VFKriZvyG9k7gT+N6zfz9i1D08mD+hSC2Y0E+yVImT8OJZGoTnXtfQFIy4i2imIeJ
         84njENQvgfYdmvdgBnVxRBBl9xI3OS88blfio9ISlljo17UoKJq9DBKCjKSD0PgpugA8
         79t8Ksp8Y8Bm6X2/0CWRBFC/2VeGCDXzYx1F1DcH5TisbNdVZlTe7Rq2/jt/nEJwf6wN
         8Mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713270077; x=1713874877;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PpGMn2INMbylfu21Bj48tT8p8k7cCHT4iq/KSWuJyTg=;
        b=K/vNYbHoTyHLA3nIu7qQJTFEmMmsEfFNw0WLhYrsrhUyyk7gvGWjS62iKRfgUFD9kk
         RgZQXSrna3+rG6vdEaBpGecQpiXSfGyXo+Gnfpz/yfhGgQKIdcGNjN2ZXRvjaq7VP6FO
         MFM0Msg0plyC5z4YvEs6a4ZjWI4guMSA0dzvu2JUsf+3ghVDOKn7RqhbfmIP4Yaspwl7
         11WmkcKABqNTZM8e4KI4eJ+IJX19J/ux1Q6pzaD17yNuxrcqeRsWaHnF5OcmnjcvdHRx
         XyS9xkVamHmcqMMklp/36ApTJODHkFqZG0HvgQbG0of9e3PF5OuPlCFUELIJlgbVQLHF
         r4NA==
X-Forwarded-Encrypted: i=1; AJvYcCW7VRYANtV0999EEQBlZDwIawSY4Rzx0iVzFQraPpz30DZsuA4EiOSdhF61Rsvnj4t7z6HuXvefG+AqDgB6B+4RBi0VAIdGVeN8
X-Gm-Message-State: AOJu0Yyl26Ia7HH5Y3ck0KrUTk7E3WkvxIDebruF0hWg70LBLkkBibTJ
	DVrjgSCzL7aUws0CV5hLQeuGgguDjLddjRDxf2nXW9iDfjUKgucMJW5gV85/ojQ=
X-Google-Smtp-Source: AGHT+IEarf8EjO2ZNF9aRPs7b+B99CG3Z13jwHh5GhKJjOi8E/PYDa6irLtmrtjDcPbYmA7uQaI9Vw==
X-Received: by 2002:a05:600c:4748:b0:418:2ccf:cbc7 with SMTP id w8-20020a05600c474800b004182ccfcbc7mr6287275wmo.2.1713270077431;
        Tue, 16 Apr 2024 05:21:17 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ay29-20020a05600c1e1d00b0041892e839bcsm2285227wmb.33.2024.04.16.05.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 05:21:16 -0700 (PDT)
Message-ID: <fd7fe44ecbd99358bac583df3cc8192e250e758b.camel@linaro.org>
Subject: Re: [PATCH 05/17] arm64: dts: exynos: gs101: enable cmu-hsi2 clock
 controller
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 kishon@kernel.org,  alim.akhtar@samsung.com, avri.altman@wdc.com,
 bvanassche@acm.org,  s.nawrocki@samsung.com, cw00.choi@samsung.com,
 jejb@linux.ibm.com,  martin.petersen@oracle.com, chanho61.park@samsung.com,
 ebiggers@kernel.org,  linux-scsi@vger.kernel.org,
 linux-phy@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 tudor.ambarus@linaro.org,  saravanak@google.com, willmcvicker@google.com
Date: Tue, 16 Apr 2024 13:21:15 +0100
In-Reply-To: <CADrjBPqwLt6gzwMpkZvxp5sC-owdDYUN91F0-nV2NvEzek_v9g@mail.gmail.com>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-6-peter.griffin@linaro.org>
	 <391a874522a4141b4bc7f0314a9e50d27142123a.camel@linaro.org>
	 <CADrjBPqwLt6gzwMpkZvxp5sC-owdDYUN91F0-nV2NvEzek_v9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgUGV0ZSwKCk9uIFR1ZSwgMjAyNC0wNC0xNiBhdCAxMjo1NiArMDEwMCwgUGV0ZXIgR3JpZmZp
biB3cm90ZToKPiBIaSBBbmRyw6ksCj4gCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+IAo+IE9u
IEZyaSwgNSBBcHIgMjAyNCBhdCAwODozOCwgQW5kcsOpIERyYXN6aWsgPGFuZHJlLmRyYXN6aWtA
bGluYXJvLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IE9uIFRodSwgMjAyNC0wNC0wNCBhdCAxMzoyNSAr
MDEwMCwgUGV0ZXIgR3JpZmZpbiB3cm90ZToKPiA+ID4gRW5hYmxlIHRoZSBjbXVfaHNpMiBjbG9j
ayBtYW5hZ2VtZW50IHVuaXQuIEl0IGZlZWRzIHNvbWUgb2YKPiA+ID4gdGhlIGhpZ2ggc3BlZWQg
aW50ZXJmYWNlcyBzdWNoIGFzIFBDSWUgYW5kIFVGUy4KPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFBldGVyIEdyaWZmaW4gPHBldGVyLmdyaWZmaW5AbGluYXJvLm9yZz4KPiA+ID4gLS0tCj4g
PiA+IMKgYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZ29vZ2xlL2dzMTAxLmR0c2kgfCAxMiAr
KysrKysrKysrKysKPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+ID4g
PiAKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2dvb2dsZS9n
czEwMS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9leHlub3MvZ29vZ2xlL2dzMTAxLmR0c2kK
PiA+ID4gaW5kZXggZWRkYjZiMzI2ZmRlLi4zOGFjNGZiMTM5N2UgMTAwNjQ0Cj4gPiA+IC0tLSBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2dvb2dsZS9nczEwMS5kdHNpCj4gPiA+ICsrKyBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZXh5bm9zL2dvb2dsZS9nczEwMS5kdHNpCj4gPiA+IEBAIC0x
MjUzLDYgKzEyNTMsMTggQEAgcGluY3RybF9oc2kxOiBwaW5jdHJsQDExODQwMDAwIHsKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8
R0lDX1NQSSA0NzEgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfTsKPiA+ID4gCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY211
X2hzaTI6IGNsb2NrLWNvbnRyb2xsZXJAMTQ0MDAwMDAgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImdvb2dsZSxnczEwMS1jbXUt
aHNpMiI7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDE0NDAwMDAwIDB4NDAwMD47Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICNjbG9jay1jZWxscyA9IDwxPjsKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZleHRfMjRfNW0+LAo+ID4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8JmNtdV90b3AgQ0xLX0RPVVRfQ01VX0hTSTJfQlVTPiwKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjbXVfdG9wIENM
S19ET1VUX0NNVV9IU0kyX1BDSUU+LAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNtdV90b3AgQ0xLX0RPVVRfQ01VX0hT
STJfVUZTX0VNQkQ+LAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNtdV90b3AgQ0xLX0RPVVRfQ01VX0hTSTJfTU1DX0NB
UkQ+Owo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjbG9j
ay1uYW1lcyA9ICJvc2NjbGsiLCAiYnVzIiwgInBjaWUiLCAidWZzX2VtYmQiLCAibW1jX2NhcmQi
Owo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gPiAKPiA+IFRoaXMgZG9lc24n
dCBidWlsZCBiZWNhdXNlIHlvdSBkaWRuJ3QgYWRkIHRoZSBjbG9jayBpZHMgaW4gdGhlIGJpbmRp
bmcgcGF0Y2guCj4gCj4gVGhlc2UgY2xvY2sgSURzIGFyZSBmb3IgY211X3RvcCwgbm90IGNtdV9o
c2kyLgoKUmlnaHQuIEkgcmVwbGllZCB0byB0aGUgd3JvbmcgcGF0Y2guIFNvcnJ5IGZvciB0aGF0
LiBJdCBpcyBwYXRjaCA3IHRoYXQKdXNlcyBjbG9jayBpZHMgdGhhdCBhcmUgb25seSBhZGRlZCBp
biBwYXRjaCA4LiBUaGUgY2xvY2sgaWRzIGZyb20gcGF0Y2ggOAppbiBpbmNsdWRlL2R0LWJpbmRp
bmdzL2Nsb2NrL2dvb2dsZSxnczEwMS5oIHNob3VsZCBiZSBhZGRlZCBpbiBwYXRjaCAxCmluc3Rl
YWQuCgpDaGVlcnMsCkFuZHJlJwoK


