Return-Path: <linux-clk+bounces-20136-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0FA7B596
	for <lists+linux-clk@lfdr.de>; Fri,  4 Apr 2025 03:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B48CE189619E
	for <lists+linux-clk@lfdr.de>; Fri,  4 Apr 2025 01:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6FC13AA5D;
	Fri,  4 Apr 2025 01:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2PY+bazA"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E924D41C71
	for <linux-clk@vger.kernel.org>; Fri,  4 Apr 2025 01:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743731122; cv=none; b=QRAzV+YaG2E09dcNJmxxpJZYIFAAqXJnV32xuzeCdlJ7XqQGCJgbWBfD4bJ8GDthTf2iTJScUrQfSeIG+pLeglkZkTzk9pkRZy3PXaq1gL+w8AawC0pz3y/qnawogc6vmTZoVadKTnhq9q8Sp2UltALLFlVA/nVdhnjKezFLs+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743731122; c=relaxed/simple;
	bh=XyrVjnn9ecQMj9djszVEbyFjbsZwFr+wY/7gWXJsPWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TnsiIMGk2CruVI/sXc75TMDI2eTQtJxJXG2zYzu38ykrm5Blp6lRFZ08YYSX5XUI9nEu+lREZYyPpXFPBQUh3qwCoQ1N94R8bL9gl2AgTI6ZejaVmc8WeAqBrRY5Z6ONjcy7Z4uTKUixQMx3qLQPg76r7pHfzPvpqCig8y/KT1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2PY+bazA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso1548534b3a.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 18:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743731120; x=1744335920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hxebOweifStf3z6ySwTp+Xen1QFoSr5f3zR234iKrw=;
        b=2PY+bazAJKUH1xmEGpdz6p1tvfSyEwEcLlSal2nkHjO888ePbfLEdZRTD067SOOK/1
         j2QflwAemvw6lIIeqf0zUDMpnWLiw06UroGcvKNiHD7q5BUw5ZluzU7nzVMWb+qPb5wd
         +LrZqAdsztFfGqqzQXHrbX3/IGXnE9uU9pVVWljjr8q6nJDe7BxmY47d3T4RQ58+G8ah
         WhfsnYrFaD0wPvqXplx5DNtTAur56tww6IFWlcwrfGCVZogJ1UrfHiuoboLX2vngxn4w
         MIBRqkM93TsX1ijYY0LBPjSMsNVkn16xtypY8atx+Ywysjp/72JVaomyTxtPjIDA92d2
         2jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743731120; x=1744335920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hxebOweifStf3z6ySwTp+Xen1QFoSr5f3zR234iKrw=;
        b=B5j3FsngRWt9RHGJQ1DVO2kiCMtnkWRFwosxdI1A14UdLhpawIlmlXzJ5ZWSWqjOVq
         EmL1CfdUZwQU+v77Xy74N9mMJjzLZWLJyE4QrAWYB8nQ4SpQY6rCfcPxYR9OQnZEzpz8
         2/ubUthubgRPkCqtehzx8D+CE98cwepkhbonHmVwjYZqWGTn9L87qkMjEjLXuh51CmDR
         PsmQaK7Rar7NBilatTWrL3vWzyELNyLXuL6aA/YeiP2PAATtcPEMdvtsZRbw4oCV/wtR
         3FYo5rJiwMVXh6Ch1pa8QUTAzAy4JZqTNOfG9ULvP4VVw5eIP9VTrCUTTHXzna2IZcT9
         jcTA==
X-Forwarded-Encrypted: i=1; AJvYcCWCORxaK6gZ8mi+ImxQ3GVYQGVLbf3vq+cT2m30AoeLzjbYy7RgoWpEla6alY2ap9gpy2WNYdOvePA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaX/u2WAeaD2YawTxagQZJu0bJzTjDBJp31gyXl3ESxCK1OxOB
	1VP4DRNaDhLgoMQAWPuhxKIXAxyW3goKM0lciPbMAQPPwuWMytFvPTRnMvcrKOI=
X-Gm-Gg: ASbGncsJ0MiC9PYIvLZhyTPi3+uYMji891L0oUHn83PBmSdQ/rJ/n41FToS/7vzQHH/
	sj97ONCpyAT5qJMK1afH0dQgF6iKCXMkFwZ7ohuN80tjJxL5vPV994i/S+TwDnWFraUje9GDSTf
	vNAKdaLxTHJ/zIUASA+ZwTp/R+bxtDp/PAgR1QOfnnQAIGpKpdEhellIdJZUgab/awW8N7h2JNN
	wJTdAFaN5F9K2J2+rTQBsM1g52QjvSqsI2dxv30ibw15kAjZTDvzMag85SrXSlcTpiakUKyHl0Q
	17D9gfEwrPNjWcpV50JlCdO0tg5TGaRLYhgNze3xx33ADpfwlMJTALh1zgJNtoS/FYm1/KIiigW
	1WDst00keIquejoK2EA==
X-Google-Smtp-Source: AGHT+IEYtyq3ib8Nb7l29LOFumqsz6yP+qE+YaQmefqgCtGNFZVPQip/OmDYNm40WqWnzi/y6S7tzw==
X-Received: by 2002:a05:6a00:1701:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-739e46ba78cmr2077253b3a.0.1743731120108;
        Thu, 03 Apr 2025 18:45:20 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e3184sm2195304b3a.160.2025.04.03.18.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:45:19 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Tero Kristo <kristo@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: clock: ti: Convert fixed-factor-clock to yaml
Date: Thu,  3 Apr 2025 18:44:59 -0700
Message-Id: <20250404014500.2789830-4-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404014500.2789830-1-sbellary@baylibre.com>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert TI fixed-factor-clock binding to yaml.

This uses the ti,autoidle.yaml for clock autoidle support.
Clean up the example to meet the current standards.

Add the creator of the original binding as a maintainer.

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 .../bindings/clock/ti/fixed-factor-clock.txt  | 42 ----------
 .../clock/ti/ti,fixed-factor-clock.yaml       | 77 +++++++++++++++++++
 2 files changed, 77 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt b/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
deleted file mode 100644
index dc69477b6e98..000000000000
--- a/Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Binding for TI fixed factor rate clock sources.
-
-This binding uses the common clock binding[1], and also uses the autoidle
-support from TI autoidle clock [2].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-[2] Documentation/devicetree/bindings/clock/ti/autoidle.txt
-
-Required properties:
-- compatible : shall be "ti,fixed-factor-clock".
-- #clock-cells : from common clock binding; shall be set to 0.
-- ti,clock-div: fixed divider.
-- ti,clock-mult: fixed multiplier.
-- clocks: parent clock.
-
-Optional properties:
-- clock-output-names : from common clock binding.
-- ti,autoidle-shift: bit shift of the autoidle enable bit for the clock,
-  see [2]
-- reg: offset for the autoidle register of this clock, see [2]
-- ti,invert-autoidle-bit: autoidle is enabled by setting the bit to 0, see [2]
-- ti,set-rate-parent: clk_set_rate is propagated to parent
-
-Example:
-	clock {
-		compatible = "ti,fixed-factor-clock";
-		clocks = <&parentclk>;
-		#clock-cells = <0>;
-		ti,clock-div = <2>;
-		ti,clock-mult = <1>;
-	};
-
-	dpll_usb_clkdcoldo_ck: dpll_usb_clkdcoldo_ck {
-		#clock-cells = <0>;
-		compatible = "ti,fixed-factor-clock";
-		clocks = <&dpll_usb_ck>;
-		ti,clock-div = <1>;
-		ti,autoidle-shift = <8>;
-		reg = <0x01b4>;
-		ti,clock-mult = <1>;
-		ti,invert-autoidle-bit;
-	};
diff --git a/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml b/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml
new file mode 100644
index 000000000000..f597aedbad05
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti/ti,fixed-factor-clock.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti/ti,fixed-factor-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI fixed factor rate clock sources
+
+maintainers:
+  - Tero Kristo <kristo@kernel.org>
+  - Sukrut Bellary <sbellary@baylibre.com>
+
+description: |
+  This consists of a divider and a multiplier used to generate
+  a fixed rate clock. This also uses the autoidle support from
+  TI autoidle clock.
+
+allOf:
+  - $ref: /schemas/clock/ti/ti,autoidle.yaml#
+
+properties:
+  compatible:
+    const: ti,fixed-factor-clock
+
+  "#clock-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  ti,clock-div:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Fixed divider
+
+  ti,clock-mult:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Fixed multiplier
+
+  clocks:
+    description:
+      Link to phandle of parent clock.
+
+  clock-output-names:
+    description:
+      From common clock binding
+
+  ti,set-rate-parent:
+    description:
+      Propagate to parent clock
+    type: boolean
+
+required:
+  - compatible
+  - clocks
+  - "#clock-cells"
+  - ti,clock-mult
+  - ti,clock-div
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    bus{
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        clock@1b4 {
+            compatible = "ti,fixed-factor-clock";
+            reg = <0x1b4>;
+            clocks = <&dpll_usb_ck>;
+            #clock-cells = <0>;
+            ti,clock-mult = <1>;
+            ti,clock-div = <1>;
+            ti,autoidle-shift = <8>;
+            ti,invert-autoidle-bit;
+        };
+    };
-- 
2.34.1


