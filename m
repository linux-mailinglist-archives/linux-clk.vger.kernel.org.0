Return-Path: <linux-clk+bounces-7141-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 736318C8711
	for <lists+linux-clk@lfdr.de>; Fri, 17 May 2024 15:16:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 198141F231EB
	for <lists+linux-clk@lfdr.de>; Fri, 17 May 2024 13:16:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B09C54657;
	Fri, 17 May 2024 13:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b="kkOf4K4L"
X-Original-To: linux-clk@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D765380D
	for <linux-clk@vger.kernel.org>; Fri, 17 May 2024 13:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715951783; cv=none; b=Qn3QEGT8np4XSgksv2tqZIm06LIWHpDsRQihQHJeDeQ2XbkjrlzH5LO/yfAYDOAjuT5YHSZqJ+qJXo9+cxCoEP9gcajoSiPZTYN6Urly5OzNnDIi4iVN50SBG9+tTmhCBKVXbihGY7vBdf/biMt9EnNzvpE2i4W4JjeN7Ncg5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715951783; c=relaxed/simple;
	bh=1yhPImTIxbRUJs4BEG3JtFs30Z11V54swjqaxOYSnE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lvdfw5pouCi1r8XvXlfLbnEpoHpCgnY00deqvGEKSlnVgB9uJYvy6RYT/Qp6YTELa2tF1SoiiboW9BD6ImuObwUMvkk1P6ybdUcKU7fN+SOEi8d+T4yAfsLE3uTrQx5UpI36ESyIsOF0xKywpW4f2KMm/NHKXxtGYpd4L6BM4YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk; spf=pass smtp.mailfrom=pqrs.dk; dkim=pass (2048-bit key) header.d=pqrs.dk header.i=@pqrs.dk header.b=kkOf4K4L; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pqrs.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pqrs.dk
X-Envelope-To: broonie@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
	t=1715951779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxTCkbzQ0q0xLLZFecGhD5poDn8vUvNddwfmtWAlFos=;
	b=kkOf4K4L/SGmGiCesu1d/Kul9e18UUApGAWfr11Xr4C+jyF0YzVqrzkZDLTgr5A9qVS+vJ
	S89BH6vtX3wc25vEdy1k8ZOKs3m6GOPJPoBA/3ju11K16Oo0ckZwhPSEePi4m4Nqwq+FrR
	Z9NZDsJAUILZugZuXpeOsL4T7LBhd9j0DABt+Q1ITg21URDsAPCbUbCPW208RAMORP1va7
	jd8uh9vfoax0vM6pl+HKqU27gwZDMBU9h8owM4Zkv1tWD3EPkr7UjpSLQpUsnJ7VQcRy0t
	Yrwv87/bBb6Yk31+YVlRcaJj//Qmcutcs4VNhEfceCDsB5TRzZ87E3VU/oqClw==
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: rafael@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: brgl@bgdev.pl
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: perex@perex.cz
X-Envelope-To: tiwai@suse.com
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: emas@bang-olufsen.dk
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: linux-i2c@vger.kernel.org
X-Envelope-To: alsi@bang-olufsen.dk
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 17 May 2024 15:02:17 +0200
Subject: [PATCH 10/13] dt-bindings: vendor-prefixes: add Bang & Olufsen a/s
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240517-a2b-v1-10-b8647554c67b@bang-olufsen.dk>
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Saravana Kannan <saravanak@google.com>
Cc: Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
X-Migadu-Flow: FLOW_OUT

From: Alvin Šipraga <alsi@bang-olufsen.dk>

Bang & Olufsen a/s is a Danish designer and manufacturer of high-end
consumer audio and home entertainment products.

The vendor prefix 'beo,' follows from the ubiquitous product naming
scheme, e.g. Beosound Balance, Beolab 28.

https://www.bang-olufsen.com/

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1..470ed53de8f1 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -208,6 +208,8 @@ patternProperties:
     description: Compass Electronics Group, LLC
   "^beagle,.*":
     description: BeagleBoard.org Foundation
+  "^beo,.*":
+    description: Bang & Olufsen a/s
   "^belling,.*":
     description: Shanghai Belling Co., Ltd.
   "^bhf,.*":

-- 
2.44.0


