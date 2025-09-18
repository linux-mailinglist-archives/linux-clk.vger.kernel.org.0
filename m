Return-Path: <linux-clk+bounces-27742-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78026B5631D
	for <lists+linux-clk@lfdr.de>; Sat, 13 Sep 2025 23:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E07D5669AD
	for <lists+linux-clk@lfdr.de>; Sat, 13 Sep 2025 21:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC43F28507F;
	Sat, 13 Sep 2025 21:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKN96Zxj"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06811283FF8
	for <linux-clk@vger.kernel.org>; Sat, 13 Sep 2025 21:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757798192; cv=none; b=PqKyDP+qBZNFK1LH5oJGyTrEaT/2cPOQ+oDDIxalyXApm2QDco6UvMujURb+vHBMoUm4Q9sw3PsDR75E2eiRLInbWemKyXevtd2GYpC/zLLeXLBFiBM5ysDJLHWqPGMGH1R4+KmaQnmyOcXlITck87C4CM7C7yzNAm8FhLfmRlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757798192; c=relaxed/simple;
	bh=ynGpFvUCNh2azNjzmvH2cd0Aa2mM+V6AhQ6aSG5iG90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K2TsH+5ZzKMBFhJo42h9AgLyrqeUig2JXFO4eDOp2c2VCrk37dRth+GSipqS3PhZfkUCL5Db8lrufHF5bq2ftgvh61IhPrhOKZSqGp6iuUIK/PyKCeXQLck1jSumrVRwg2tqoY4h7AqCvceHJr6jdUT18bY/3IJpYYwzy50J3o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKN96Zxj; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45cb659e858so21353395e9.2
        for <linux-clk@vger.kernel.org>; Sat, 13 Sep 2025 14:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798188; x=1758402988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xc1itu5KlQDWqH+H4ca13G4lDoFzZa+J7vZRdBNUkg8=;
        b=KKN96ZxjFxFJ7psFdFs1UzO6znIt2i6t2FwsDgapW0RWmqbIxpcKTx1C6e3YiLD+Z9
         PVLDFHr+1nS+EkjEGKHvJNn8aS1ffV78yKCExNddy5o0kUYqRYppLSaGlk/ygHo4nbQx
         XjaY3Bsa5rxyrUCPh7jLDMGiVgsxpx0B1g3RaG1o5jcZ/4EVJAcoLVKdNf/Zutgjm0Yj
         TMTGsi34i41gGeSBiHSto2xNqNePfo5zIgIdrB7aaXPRjZHFkh6jzbfp5CHqhpnWI3zU
         NJxBbQhnM1K/tUot4Dm+6mUxoF7SQ1HRZHN7PX3qYteDlGQbPAftjUwKJND9rITTAXK5
         Fx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798188; x=1758402988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc1itu5KlQDWqH+H4ca13G4lDoFzZa+J7vZRdBNUkg8=;
        b=CPbKsh+aExZadD1cccqJSWjRi9xGuYZXGnLG93z8qoMr/YxHKGtbu//FwwgTpLT2/a
         k/v7ZIxeFm3ohhi2uVeUm+eenbgYl3Rnds1XC3OWGfQjRgQvRaMHzZ2QpsWIhhY0f9oF
         mwLXh8zLyq7Ygj1mPGsUfO2wLWJ0IgAXNXoK7z1CpRbngh8kdjMpLUn4R/ui4JJVWWo4
         ju7vg5qWqZhfmyjUq0878Kbyg10QpJQWmgGXAkRsPtxEUG+dwpzD3XwmehpY/MA2xGhT
         FB93iMp4GrBFaRR+exUK5ElGOTY2njA2jvPW4qnhcV5EmEch2HcxllkljGEep+ieV0WC
         xGGg==
X-Forwarded-Encrypted: i=1; AJvYcCXSZuoLJpBTqVkbs3fWHkcN5ePJsRSL3nWFsBIELu975fvpRL+YkbYGLQ9/fRjuFjfNQpCz/WsTFKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSQztEMIwQphTE5p6f+QrJMhIDVZ740hIPC3XqdXOA/JnLEqRH
	SNUKWroS6cCNSI12Y4MuY/4bJ5VBD4JtCH+y5TJJlhp2BadLd295ffmX
X-Gm-Gg: ASbGncte335RfpQDjdpluEhbS9egEtKMOr+W0m7Tjho346RBdGHkF1P70ee+Ds/WN4R
	OC8JaYs83gLEJyUb+6zIxc0jtgdcUehKrZoNlXQrDAZ8Xcdnjh80MI7dP+csOkG1Nq/x5ci/fVm
	8aBBTqmPWT2HCQafNxek1a4N6qHmMJfKWJTBE+sknBQqaaYR/2VWXyLEKNspudymzaAWcYLxbjr
	G4plNWs3WfASVi6TerrtuqGLg4C9WzLywpqCOXCE4JtiqKxDuB80KcPPqP+deATqtDLny7HI1RA
	Ubz9dGddzA2bTNFMjGpJgPCG6TwMVuSB0ZKYehU6fDXNm2cASwjpfGzkiGuZCexfjzTxWTLecA1
	5a4Shjcfz9PEypxBd/soudxYkSb1aEqsQQeL8cUVpsA==
X-Google-Smtp-Source: AGHT+IGhdgswjdcu+5JC+27xL3gEdZUaPnM5znx2uaoFA5uc1n2maYqdCXzlYh1D0GuyCTtQVTqWqA==
X-Received: by 2002:a05:600c:1c13:b0:45d:db2a:ce30 with SMTP id 5b1f17b1804b1-45f25971c61mr39608505e9.0.1757798188371;
        Sat, 13 Sep 2025 14:16:28 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e014ac468sm65403145e9.0.2025.09.13.14.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:16:27 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:12:51 +0200
Subject: [PATCH v4 4/4] arm64: dts: marvell: pxa1908: Add power domains
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-genpd-v4-4-55e4cf32f619@dujemihanovic.xyz>
References: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-genpd-v4-0-55e4cf32f619@dujemihanovic.xyz>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=+LiKf5xAdZ3VQjErBPnxDlU3GQ3YyQ0Gx7TmBGM/obc=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlH7ysdPpw0RT3vQf4RtxL3zu1vTtn5ZOwt9qz2YQhlz
 BXfJbSso5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACZyaiLDP+1NE9us7d3Xf1+/
 vbXEtXlV949f9+TOOPZX37FVFJh0UJDhN+tPww0L66uakjo2sWksUrm+eyXf0oDUq8/EZyrWzZW
 z5QYA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

From: Duje Mihanović <duje@dujemihanovic.xyz>

Update the APMU clock controller's compatible to allow the new power
domain driver to probe. Also add the first two power domain consumers:
IOMMU (fixes probing) and framebuffer.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
v2:
- Drop power controller node
- &pd -> &apmu
---
 arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 1 +
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi                       | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index 47a4f01a7077bfafe2cc50d0e59c37685ec9c2e9..d61922f326a4654a45ab4312ea512ac1b8b01c50 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -23,6 +23,7 @@ chosen {
 		fb0: framebuffer@17177000 {
 			compatible = "simple-framebuffer";
 			reg = <0 0x17177000 0 (480 * 800 * 4)>;
+			power-domains = <&apmu PXA1908_POWER_DOMAIN_DSI>;
 			width = <480>;
 			height = <800>;
 			stride = <(480 * 4)>;
diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index cf2b9109688ce560eec8a1397251ead68d78a239..ae85b90eeb408a8f4014ec7b60048ae1fd3d4044 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/marvell,pxa1908.h>
+#include <dt-bindings/power/marvell,pxa1908-power.h>
 
 / {
 	model = "Marvell Armada PXA1908";
@@ -79,6 +80,7 @@ smmu: iommu@c0010000 {
 			#iommu-cells = <1>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&apmu PXA1908_POWER_DOMAIN_VPU>;
 			status = "disabled";
 		};
 
@@ -291,9 +293,10 @@ sdh2: mmc@81000 {
 			};
 
 			apmu: clock-controller@82800 {
-				compatible = "marvell,pxa1908-apmu";
+				compatible = "marvell,pxa1908-apmu", "syscon";
 				reg = <0x82800 0x400>;
 				#clock-cells = <1>;
+				#power-domain-cells = <1>;
 			};
 		};
 	};

-- 
2.51.0


