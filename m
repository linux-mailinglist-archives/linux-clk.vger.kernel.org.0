Return-Path: <linux-clk+bounces-18117-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22460A372D8
	for <lists+linux-clk@lfdr.de>; Sun, 16 Feb 2025 09:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70A916DD19
	for <lists+linux-clk@lfdr.de>; Sun, 16 Feb 2025 08:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0A7175D39;
	Sun, 16 Feb 2025 08:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b="luloQ2zZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AXFvNKDs"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9648C1632DA;
	Sun, 16 Feb 2025 08:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739696312; cv=none; b=Rhx9J6SFDL/qhSei69MmLnxsQmJ50Bb2V2mfhj53juwPfoQGaCDxL4/uhNGc5M3EMocJiAkL9rH5EC487hgE3bUuOVrthLH9Tv8f1KxfVWPVJdbOgH4w1vBSzKIa/+jjt3SXsPhfiDGBAxUQSxxlsMR2hKoDjXXYjFmv6GkyXuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739696312; c=relaxed/simple;
	bh=Ct+Muw7MCCDwvd/3l6Jw/3dvyEMKoNpJSEqLbJh/HfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVtzB41YIW1wmBv4CXH1ucU815rsDsqdfWxWLhmVvbUcr1k6t6Lc1Isky9idqB6YGRICQ9r3HwivqUzMor1koY1gYO21MUx/a3MyecNqn+WJAPOx0nXt7Utuk1s9pc3pWhID+z8ewV3Wh6OwcUbA3G4kLardKjnh9o3fE/fqvC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com; spf=pass smtp.mailfrom=testtoast.com; dkim=pass (2048-bit key) header.d=testtoast.com header.i=@testtoast.com header.b=luloQ2zZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AXFvNKDs; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=testtoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=testtoast.com
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 41E9225400CE;
	Sun, 16 Feb 2025 03:58:29 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sun, 16 Feb 2025 03:58:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739696309; x=
	1739782709; bh=MHFZi57lqGB7elcnnVw9vwRemFAicTlVo9LJ+zS40fQ=; b=l
	uloQ2zZfrvaEles6N3NfXWLzq9eqCSbhpfdjactSGTdKWqVrp4shMP3iyLzaCXa7
	H2jYtV+YwNUzVEkZaQrCHva/YLN0tqQl/Dq0d2dM5KzTQPdL8hOZMVUq0TgA5QYD
	jfq9J2o8k8pjRmId9n0tdRbq+15OJTby54hMUT7aCn398KKhjfIqboPp5RL+t1LY
	zCElb5OPXyTc0xaYFFi2BdB9phEskJq/J8Leez9HU9UUDVWTMmd0EUL3AB2/Ea4s
	fUvyptOKsbVbjO+A256LUAOGJzBmwgivy65m+/Jf/xonda44u6PyAzlzEJO7/2Y4
	G7MeRiHVqJRQC8LMxeQ9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739696309; x=1739782709; bh=M
	HFZi57lqGB7elcnnVw9vwRemFAicTlVo9LJ+zS40fQ=; b=AXFvNKDsrOKeLZ6bX
	p0JcPgZ13fkKp+0fr5vw0aIzrXOeSeAURiV+V29bjsgxGoJ8rtJfY7e5o2no+Lv9
	cXbgnH1IlViqcVr7LB/F25kVl4d5GNtVUb89juq/4guGV49WB3AHt+F0osjU/Vd5
	GD0sgi4aDVgJXxnz3BoppkPDsqSd40iSSR6w4uHWI8yJbPeIGJIhGJuLIbSk3r4E
	KAxIpoPdQiC4C8Zbanz3zixipNBYC36KXI0B3kyh5oMZeREmBrdq2vB7RJFgdQmT
	V3y06y01V7u2xv+1rI5qvv8M8KxjGP+Mcb2qbWp/xEgjM5LrOZ4dzq3MBEGX/7hS
	tf8ew==
X-ME-Sender: <xms:tKixZ6LzQ3c_EOo5lHJd82J-HmhGQDF-bFmRc9F8xxLoAjUHK6pkcQ>
    <xme:tKixZyJkIDLF4uchTaogJ6-z-2sCZchUOZa2eCzwfERvvLrT_6ov59pcF1AXPo1PY
    PPm97-ZyFUNE_IgIA>
X-ME-Received: <xmr:tKixZ6uGeTT3uwFTviPCH_5yfGCYlu4GLZUv4GiFCIDnhKEyOxcoRf6y6E8-8IOlOwaZZNS-Yp1s4LIvDnPzd6RpDa9lWdQwn6v5HDNcGCWU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedvhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihhprghrug
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrghdprhgt
    phhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphht
    thhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlse
    hffhiflhhlrdgthhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgpdhrtg
    hpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:tKixZ_ZkQzuZ9PbecnHyJyUx0hU_gZe-7_7Ni7fRykfl5Otm3mD8BQ>
    <xmx:taixZxbFcmu9SGzA58H-cK3iQnjU2oPQoJf1V14Mtno-SNdj-_VBDA>
    <xmx:taixZ7BKHiIy8DTdGOdFQSZE76CIoew4NkDKh14brBm4ANb-ZYgnRw>
    <xmx:taixZ3Z-3apiVPQdiIrXYBK17CBhTlDJFytJ-KMagNTCUYPC934ADw>
    <xmx:taixZ-Sd9uJwi72tSkOngufYPp8XPRc34scUAo0rsWq1X-PwaOIQ8u5u>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 03:58:22 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Ryan Walklin <ryan@testtoast.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 22/27] dt-bindings: allwinner: add H616 DE33 mixer binding
Date: Sun, 16 Feb 2025 21:50:53 +1300
Message-ID: <20250216085432.6373-24-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216085432.6373-2-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner H616 and variants have a new display engine revision
(DE33).

The mixer configuration registers are significantly different to the DE3
and DE2 revisions, being split into separate top and display blocks,
therefore a fallback for the mixer compatible is not provided.

Add a display engine mixer binding for the DE33.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>

---
Changelog v2..v3:
- Separate content into three patches for three separate subsystems

Changelog v5..v6:
- increase reg maxItems to 3 and add conditional for h616-de33
---
 .../allwinner,sun8i-a83t-de2-mixer.yaml       | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
index b75c1ec686ad2..274f5e6327333 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
@@ -24,9 +24,11 @@ properties:
       - allwinner,sun50i-a64-de2-mixer-0
       - allwinner,sun50i-a64-de2-mixer-1
       - allwinner,sun50i-h6-de3-mixer-0
+      - allwinner,sun50i-h616-de33-mixer-0
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   clocks:
     items:
@@ -61,6 +63,23 @@ properties:
     required:
       - port@1
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun50i-h616-de33-mixer-0
+
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+    else:
+      properties:
+        reg:
+          maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.48.1


