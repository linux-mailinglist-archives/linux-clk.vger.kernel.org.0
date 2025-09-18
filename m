Return-Path: <linux-clk+bounces-26324-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03812B2C0EA
	for <lists+linux-clk@lfdr.de>; Tue, 19 Aug 2025 13:48:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF2EC726276
	for <lists+linux-clk@lfdr.de>; Tue, 19 Aug 2025 11:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF793314A1;
	Tue, 19 Aug 2025 11:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMnhn/jn"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB5532C304
	for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 11:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603957; cv=none; b=Kn2lsdkUrWORm7IoYTLdbvrLwFZh/OFgH3V4KdHmRxvYv5OFdr1gaGmtZhoBkiylHULgeCz5GuH/BOlLM2UrAhEsYk5tOIm8xr07Pky9rq+t/LvDBLtGPHwgbgZxbAWBgG0F9nwAw3IaLbBwEiJg5VPGtUpuYZm/+WmJaJQGL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603957; c=relaxed/simple;
	bh=RHgzxERFqXBJayCLtp1I/QWWv579hP721Hv537Vxp6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=twUO1UWTvmUhkXHkKacE7GDx4XM4XxcAGpYeWV1Jp3WzPeWIXn5gspEBtjHF8lt57om00CH4b1ylubmTP8KaqbMZG6bGC+DjOnYZ2wSA8NqhFo/1fdN+uKuWsPT+Mb4EG561TL2QHW3IRhHqrLXI023KEBi70W579LFcgjqduJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMnhn/jn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b00e4a1so35458455e9.0
        for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 04:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755603954; x=1756208754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AQC/lHj8toc5TCrfcLhMJT3E3jz1/e+YpE7xJHN8Uxc=;
        b=mMnhn/jnB0TOfLsAGsa0OIw/Krg4lwJOUyMntBVx6SrwwTzFp3Ow1CdFNCC6/XPiUG
         n1aI3UVolCTCYie36baKz1GA7n3NjG8SyjYlq6WUWVCPFftHOi3XrEMB+GuSZC2Sy0B3
         J1jjx49YgjMBf3dvtstTZlkx3ddd2tl3Dcb5b/87RioSrwQQGBQ3Hv60za/ANQeM9A1t
         Nh9uz3MpDDPDrc/pHZyDug1X4aoMPndgmO5KEHAiITIJkKIa3Ekuw+/eSy2nK58/UqU/
         o962eY1/U6TZNMpAhhNGRpTjo90GVUp/lv2C423oa8s+lXy5hYEcoS1f2sIBD2NeQxbX
         H7Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755603954; x=1756208754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQC/lHj8toc5TCrfcLhMJT3E3jz1/e+YpE7xJHN8Uxc=;
        b=sXxsKWTtv1VtBmtc7tgA8HglAtJunC/UEHnKBQtDbXoXDaBxda7h3WKchDbEsuYmBC
         eZ+2GccsF/qfmAKrpa7Fo/qk85YDzmM/rEPiJyTC6jvFD/r8HdlXLY0PFFzA2FM4SiNg
         9M6m+08YGDg41UrGObcb+jnOsMMZTPJg8NiKsriS946fXd4q9M74Y/YxHgYfAE5DJVjt
         BFuKZ0PZH9g9jmOyuzRdRUDQH5mV6S6l19goWxyQQQBxPNFDumHncpKanxCTjtaaaPtE
         VWBVhgNBdrpDsCS1ypi3r2UJP5naStDkabT3ch7VUPQWCf0P29go+btGqi7rdwZ8TIxb
         Yn6g==
X-Forwarded-Encrypted: i=1; AJvYcCWujuUDS1sJkj4fltKlCLfCu90NzI3YHbwvCZlo67ET+6QyMgnP0F6Y0NZN1knKSLSu/UU89gJZpjM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzvl+8aM2YvPVXNS8fg2GsIG/rZdYdWLPYUdzrcXXixeGAS/Fc
	H6Aoe2oVX06it0dgIXS4efIYwHHhK3bt4zY3zz1X1fGSSjFPqM98wt6Gwo/5/yGgLD0=
X-Gm-Gg: ASbGncum6cotr3J0TwaC+ok21jxpCglNa0ZGCdIWtWqM0dq5jgb+elb+BHYMDia5quT
	JEZ6+eTGc4P5uj2KDsFq2sgJdzPLuHo5lsc9TFADagVWkh4crHEKeIWa5NAgBd+4MpSO+xpdXdc
	DTPE8XZN+QINRcMpQiR4ah73gz//NTulrSzw+1080kj9lZw44yxlq23BJlLvJ88AVLO/QPfTKYL
	lkLSKunIUImiQoHu4uyrKThy4Jtc9SBdKf1PqKPlUGF0Eknjl5oWWebv1JdlRtYpd4ChFs7UyC0
	/IyfyuksKogwGNnkcPz1zXd0vZbdm0CtpRUw/hQgpe+T+ymaHN46hO23XQ/pq764hljLbNmMG2y
	ImaGiZa2qFaOWJpXAEDlYpdzG6iP/D0yqiA4Jpke7kcXd1RjjxIh1MTIAuDlY6MM3xsZuQ4tKip
	xPJw==
X-Google-Smtp-Source: AGHT+IF3fExSedP+rhMqtDX0FAinw193ciSJFQj94UbY/WOxq/Wu+sbuY/lPivyxNBf7lI4vygbdfg==
X-Received: by 2002:a05:600c:1d2a:b0:458:b01c:8f with SMTP id 5b1f17b1804b1-45b43dc68a8mr15298175e9.8.1755603954043;
        Tue, 19 Aug 2025 04:45:54 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm3430817f8f.48.2025.08.19.04.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:45:53 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 11:45:36 +0000
Subject: [PATCH 1/3] dt-bindings: firmware: google,gs101-acpm-ipc: add
 clocks node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-clk-v1-1-6bbd97474671@linaro.org>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
In-Reply-To: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755603952; l=2971;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=RHgzxERFqXBJayCLtp1I/QWWv579hP721Hv537Vxp6E=;
 b=0VhemtYEBOAIemXpjyQfMxDu+WLHs0AJDariMAZ3V8vjYybaLCcOrMVRTwR064RJ8oH8Qlkro
 INmqzkQoG67CliO24U9NMFfvexZ3ErbbkxnpAIzvSJXbHEqDgAb42pu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The firmware exposes clocks that can be controlled via the ACPM
interface. Describe the clocks exposed by the APM firmware.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 28 ++++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           | 15 ++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index 9785aac3b5f34955bbfe2718eec48581d050954f..27cdf9c881ca680e78e77a0e14ffcffeba970871 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -27,6 +27,29 @@ properties:
   mboxes:
     maxItems: 1
 
+  clocks:
+    description:
+      Clocks that are variable and index based. These clocks don't provide
+      an entire range of values between the limits but only discrete points
+      within the range. The firmware also manages the voltage scaling
+      appropriately with the clock scaling.
+    type: object
+    additionalProperties: false
+
+    properties:
+      compatible:
+        const: google,gs101-acpm-dvfs-clocks
+
+      "#clock-cells":
+        const: 1
+        description:
+          The argument is the ID of the clock contained by the firmware
+          messages.
+
+    required:
+      - compatible
+      - "#clock-cells"
+
   pmic:
     description: Child node describing the main PMIC.
     type: object
@@ -59,6 +82,11 @@ examples:
         mboxes = <&ap2apm_mailbox>;
         shmem = <&apm_sram>;
 
+        clocks {
+            compatible = "google,gs101-acpm-dvfs-clocks";
+            #clock-cells = <1>;
+        };
+
         pmic {
             compatible = "samsung,s2mpg10-pmic";
             interrupts-extended = <&gpa0 6 IRQ_TYPE_LEVEL_LOW>;
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 442f9e9037dc33198a1cee20af62fc70bbd96605..f1d0df412fdd49b300db4ba88bc0b1674cf0cdf8 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -634,4 +634,19 @@
 #define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
 #define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
 
+#define CLK_ACPM_DVFS_MIF				0
+#define CLK_ACPM_DVFS_INT				1
+#define CLK_ACPM_DVFS_CPUCL0				2
+#define CLK_ACPM_DVFS_CPUCL1				3
+#define CLK_ACPM_DVFS_CPUCL2				4
+#define CLK_ACPM_DVFS_G3D				5
+#define CLK_ACPM_DVFS_G3DL2				6
+#define CLK_ACPM_DVFS_TPU				7
+#define CLK_ACPM_DVFS_INTCAM				8
+#define CLK_ACPM_DVFS_TNR				9
+#define CLK_ACPM_DVFS_CAM				10
+#define CLK_ACPM_DVFS_MFC				11
+#define CLK_ACPM_DVFS_DISP				12
+#define CLK_ACPM_DVFS_BO				13
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */

-- 
2.51.0.rc1.167.g924127e9c0-goog


