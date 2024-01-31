Return-Path: <linux-clk+bounces-3150-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88511843C55
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jan 2024 11:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42737293415
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jan 2024 10:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737447D3FD;
	Wed, 31 Jan 2024 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XEVJrs2r"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C39079DC6
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696448; cv=none; b=t/I7/UK0bV6mh5bMVA3xzFTkJaDbrF77MUeYTHy4jW1I/9jwNcVdak+TnNTwBVtXxKZuAVonbZkUeUJA9TkdkhK54TZnKJ/1Muz33KZ9Q1Ei+d0pJLbI853pKKBFTQATmZynTQxDlNJbvfeGrDe/n6YlycYj4M12yaJu8bop5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696448; c=relaxed/simple;
	bh=0dftQtlTKzHuj9IWE9pWuTjh5YsJl4kUvn8K1blNlbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nBi0SCwszzTWlljolHOp9Fh02jhS+/gul7x3KeSC62KDTUfRJeZuONVfIYgp6soEE3xu9kxkPAuGcQhB+e3ebP+MRdRFt/Vh1yyCRaS/OdeefswlDCyAu8u0Vl1czSSyp0vHMFtA3IutxCLpA4obYgjGG8rPgxbGXrEny8ZpxvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XEVJrs2r; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a359e6fde44so389462666b.3
        for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 02:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696444; x=1707301244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmXpMcL+a4xK2EumucI6WpPkZvFjtLKso9wLeHqAGmQ=;
        b=XEVJrs2r+nuYOcX7zvgUVad15w4EXtJMwhuwpJ0Vxbv+TjPZZgaPabRXYCodA+zSo4
         1sxUAMmk0pf+6aaSbWiQvCLmkrRXsUi5WcOSkaKM7+HqEedwLKVAWf7xwq0JjLDv0RYp
         YIpBz1mA2o1YFtynVC0SR39xpdI3rVNBFG8UZ0rxVXw/MgxiilO/OmXLH9Zf68cbYR48
         kIgnT/cUYOCOI3DvipEWPBrGuu6gAKRpfMuL3ywUrNusCW7jhKzdeI5d55hEsKVYCxRt
         CRb9lRXEPVaqpPkGG95jrR4R++Mx+3VYiwb3I30lVjBiiWHAehQCBp+Et5K3rQ579kmj
         Fuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696444; x=1707301244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmXpMcL+a4xK2EumucI6WpPkZvFjtLKso9wLeHqAGmQ=;
        b=EBeGp/+LhRSpyV6oZzN7CzJCJdhqLqssgtBMe6BlJK28Z4DEOaq/o9o11w6lQDVy+f
         /Th1XieTqmq2tRkNdRO88T+iQf+d8rluEK3JhiDiACxqesueMzVujeGqlgmfyiYmt4dM
         Ik7XVDhKXz3XMokjLRPQBOOgrXFbMlNaH/lz7P4BO4Vl+ZkXYA5Q19y+/fvBLivW5U0u
         WYKJSyh3H8GXuTn9LoJg57FAgoF2iZGQ43rFJSzzsDHq4NVMO/CgbkTY5tRYORGMTYxo
         CqABZgqxg4g32NSFbcP7sJuDdmHkLo/nBHFRuy0B1rX4FkcsJcRLcsv5NZRCkZAeukI5
         UUSw==
X-Gm-Message-State: AOJu0YzyBWQ7gUPnD1yAhWzBHN1QHHcxxnWvJYiLg27NU1mUttUjK4Ow
	WTcKqBD5ETtlRbYcvmDnVca55HcoOZMdaRfCg6vW8a6VJBWn4XeNk3lGc/JMXAA=
X-Google-Smtp-Source: AGHT+IFps8X5FH8Musfo5MwfimvlCJZcxx2As18CP6nyr/QE/sbS3BP5FnFDabOBEk/CWz+wioHuQw==
X-Received: by 2002:a17:906:c30a:b0:a35:86ce:688a with SMTP id s10-20020a170906c30a00b00a3586ce688amr831060ejz.60.1706696444399;
        Wed, 31 Jan 2024 02:20:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUJfiUSNwUPkkDT9D3tyFM9Vl9zLiMWZOUFyRM6rIof/uQXZIHtxFDLd+1FerYw8jj0kxcx9YU7IGgsNZCa77/VrgZvOode/K8hFwgmjAfa11j9mmq/LBTy4o6irjpFbtvK5JdtazAOPK2DIVsMba5qb8vmPEKU99XBucjzarnjigcIK+YXTvnkdyCFN/2gd3e0G4Sav+iFK/vgPSsbh7uVLBizEJ8S9sXReZbUoyaAaWos98XjA6CMpLXMuL9uIq4pjTw5c6ZcuUbITEhI7IyZSI7WZMm/bR06CgTZRz1lG7scFs/dZMycnStuUEEmjSFQEkoNL5f9aLNof9TZ78NaCDHBx8ddvciMqOljCBSBQMcS6XTI5qqPJh5joe6YfN/PH5E9qbWLZW+kduL42le+rYyahtx9ZStC1yFYx0eDlT0QizBm7LYcV4MjKXpBj1Q1EHkEUyTgjiLXB2LmhDwsVx/Zg9zT5mTe1krzRBBQ0gdUVJlLw86Nt6siU4Ngv3zBxwqIR6LIS0weJCWOgwsfqn23IP23N01/S3N87I+n5IheLHpGlber42dtwGi8fgSpNGYgyIsAIITETpf1wGHP82+UVtYxcu1R4/n7p4T7Mxo=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 10/11] arm64: dts: renesas: r9a08g045: Add watchdog node
Date: Wed, 31 Jan 2024 12:20:16 +0200
Message-Id: <20240131102017.1841495-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add the DT node for the watchdog IP accessible by Cortex-A of RZ/G3S
SoC (R9108G045).

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 5facfad96158..dfee878c0f49 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -264,6 +264,20 @@ gic: interrupt-controller@12400000 {
 			      <0x0 0x12440000 0 0x60000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		wdt0: watchdog@12800800 {
+			compatible = "renesas,r9a08g045-wdt", "renesas,rzg2l-wdt";
+			reg = <0 0x12800800 0 0x400>;
+			clocks = <&cpg CPG_MOD R9A08G045_WDT0_PCLK>,
+				 <&cpg CPG_MOD R9A08G045_WDT0_CLK>;
+			clock-names = "pclk", "oscclk";
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "wdt", "perrout";
+			resets = <&cpg R9A08G045_WDT0_PRESETN>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.39.2


