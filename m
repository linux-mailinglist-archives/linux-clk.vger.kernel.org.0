Return-Path: <linux-clk+bounces-16204-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 940AA9FAE99
	for <lists+linux-clk@lfdr.de>; Mon, 23 Dec 2024 13:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D2818839EF
	for <lists+linux-clk@lfdr.de>; Mon, 23 Dec 2024 12:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229EB1B4121;
	Mon, 23 Dec 2024 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NPuOeQtB"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2538B1B413C
	for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734958583; cv=none; b=UasN+W3CRN0/S8+KSLgq8M0A8JI+MC3F2fiMk0UqJN2Q3EgNbsJEUNk0qXfLYL1B0OqOgQow3zXl6oAZFHHvjb14P1e1mODSFthFV9QKalWRNyFO1ow/qBa443Ey3EXpDabFPhDcPoTV0V/YnjYIHb26F7gV0qrs0VsnpxD2UlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734958583; c=relaxed/simple;
	bh=S/So5vFMwPiCGb84OLLu9zT0SjuLb1qUF85n0QV/Jmk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=nIXqFr2mCMERdv4zpvTv81+7UEJhuyZtAtVG4p3TrAOQOvPHW3A4OEwAS/A//a9AmPD7mzH9yqOv/QM8ed0otbbQfHdIVEVm1TelSzMeJiA4Ymwin9QKd53z2RnmjfL65goZ7V1bLTt2WoHybi8CUZmJ0UI6iNR977DYxp8rT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NPuOeQtB; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241223125618euoutp02aec34af94404a11c1803335929c8c4d4~Tz6JvxHs-1070510705euoutp02G
	for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2024 12:56:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241223125618euoutp02aec34af94404a11c1803335929c8c4d4~Tz6JvxHs-1070510705euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734958578;
	bh=bX0rUApl/OyXclMn0ZY1Lk+3ve7QkKG+T1s0MKtFTYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NPuOeQtB42sbyR8CNUHBqQ2VKzMck1RKJV+thEy4WsgHfw7/lzThtdyy0YnSp1TX8
	 agM8MUCwyPMe95310VEHMQvjHcOpmBO7UqVBJZjK5BWHNzTmcRUr3M+fuUbrbk3dey
	 kO+8yFnfn3QCzyua3+SbSignGv8Tc/rNHa2vd244=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241223125617eucas1p273275e5c6a512aca2d9a1358979c0b6c~Tz6JR10zl1778817788eucas1p2R;
	Mon, 23 Dec 2024 12:56:17 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 06.C6.20821.1FD59676; Mon, 23
	Dec 2024 12:56:17 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e~Tz6Iz8Ogf2931129311eucas1p2L;
	Mon, 23 Dec 2024 12:56:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241223125617eusmtrp17c06cae4cb0d979c22f08a886ea39975~Tz6IzBMMD2051220512eusmtrp1j;
	Mon, 23 Dec 2024 12:56:17 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-8f-67695df1e12a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id CD.F3.19920.0FD59676; Mon, 23
	Dec 2024 12:56:16 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241223125615eusmtip2ed9e2f327938a70fbc1bebd059b3c8a5~Tz6Hb2XDK2641026410eusmtip2m;
	Mon, 23 Dec 2024 12:56:15 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
	<m.wilczynski@samsung.com>
Subject: [RFC PATCH v2 12/19] dt-bindings: gpu: Add compatibles for T-HEAD
 TH1520 GPU
Date: Mon, 23 Dec 2024 13:55:46 +0100
Message-Id: <20241223125553.3527812-13-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRzved937zu4Nl8mxZNp5O7IqztAPQ+fKzPNsjc50/6y6Ax3471B
	jh9uLKWjgjZAcQL+6IiXEYg6abJQYgsI3LWQTbFRogOLgSYcwW3yY2LDHdTGS+V/n8/n+/l8
	fzz3CHGJlVwhzMjKZVVZMqWUjCSs3XOu+Om9GYq1+qpnkLO/HkOWIEehxk4Xhmq7XAI0dKMF
	QzdnJ0n07egvFPqzs5BA7oYaCmm7m0g0zg2RaFo/JEB97QYS+Y91AWT160hk7vJQqGm2FkOn
	py0EOtvaDlDxEaMA/XrtTeQZchJovE+Po2JuGfq7o5VCC+5LBKq+b6NQi/e4ADnMe5DOdorY
	8hwzOVBEMd7xcYL56fADiul8WEcwbZyHYvRt1wHTbDpCMoPuDpL5+uq7zPBRB8Z8d/ZzRmfu
	xpjy+bXM5OVbJFPWYgLMDW0/tVuSErkpjVVmfMyqEjfvi0z3XPKCnOPRhwpHnWQBmBKXgggh
	pDfACcsPoBRECiV0A4ALvptL5AGAfRedAp74ASwz9IYqwsVIjQ7y+nkArVeMFE+8AOpKglS4
	L0mvh3fO1y6mo+kiAhZdKVzsi9NjociIgQy7ltN7YOOjjsUEQcdBW8AoCGMRvQVe0AYIfsNY
	aPvxZzyMI0J6Y+kA4D1R8GrVyKIHD3m0lmqc95sj4Tctah6/ASuDxRSPl8MJR8sSXgl7TuqX
	+mfDO5aZpWw+bNM7lvArcND1iAyfjNMvwqb2RF7eCm32EYx/CTEc8EXxG4jhCWslzssieLhY
	wrtfgF/qj/031NVgxXjMQNfJckEFWM09dgv32C3c/3PrAG4CMaxGnalg1euy2IMJalmmWpOl
	SJBnZzaD0NfuWXDMtIKaiekEO8CEwA6gEJdGi+ySDIVElCbL+4RVZaeqNEpWbQfPCglpjCgu
	LZaV0ApZLrufZXNY1b9VTBixogBL/GBDyV+3qEPoxNN7ffUXk15N6i1x3072f3Ft0Bf3+6b7
	lerh/Nr8g6mG9Kden8obSV812tv5m8ZSl1qY/Jq3NWp0LkbQtOuc4Xv8zM4c7YQsdWF2rlsr
	lyk55YHyNW+lzHJFjiB3YKM0LdDzhGjlw9i7dNkO00cjz1eKc3Wng4qpVfvG5Mn3jrZ9en2b
	Uv7+9pfX1/VuZc9EGIt33XWURLmH2Nh60VfRyUkXKt6RmqtTSs7Fj6127h74w79MM79twHR7
	TJOkwKoC90yYb7w/YSK+ojmQM0w3l8ft4Hy0Z+N7MzWtm+c/vJynrTLWArFg+9Rn2NtPeuQF
	iv3tUhe+ZqeUUKfL1r2Eq9SyfwAYRxV/SQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xe7ofYjPTDY60W1qcuL6IyWLr71ns
	Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
	uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC3u3jvBYvHy
	cg+zRdssfov/e3awW/y7tpHFYva7/ewWW95MZLU4vjbcomX/FBYHOY/3N1rZPd68fMnicbjj
	C7vH3m8LWDx2zrrL7tGz8wyjx6ZVnWwed67tYfOYdzLQ4373cSaPzUvqPVrWHmPy6P9r4PF+
	31U2j74tqxg9LjVfZw8QitKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rez
	SUnNySxLLdK3S9DLuLvxDWPBRJGKxqcn2BoYP/B1MXJwSAiYSMxtkehi5OIQEljKKPFk6wmW
	LkZOoLiMxLXul1C2sMSfa11sEEWvGCW6vj1kBUmwCRhJPFg+H8wWEVjMIrF3XyVIEbPAW0aJ
	6zM3gnULC4RKnF/0mQ3EZhFQldj/YxlYA6+Ag8Tq5h9QG+Ql9h88ywxicwLF13TdYASxhQTs
	Jf6d+sAGUS8ocXLmE7B6ZqD65q2zmScwCsxCkpqFJLWAkWkVo0hqaXFuem6xoV5xYm5xaV66
	XnJ+7iZGYHrZduzn5h2M81591DvEyMTBeIhRgoNZSYT3kFBmuhBvSmJlVWpRfnxRaU5q8SFG
	U6C7JzJLiSbnAxNcXkm8oZmBqaGJmaWBqaWZsZI4r9vl82lCAumJJanZqakFqUUwfUwcnFIN
	TDX3GfsSPohGmPDcPTtNmnVTof60uPg3nktvGz7dPr9Zt3atcOu2+aldzgkbdIQlS9YnBa59
	XliZqPznvYLZ57UmBg+V75p9tuv+/+1p4sWvtzaqFyfoGk1c9eesmPH/5P9S/JMVKk+IRD65
	E9X4LaQvwLxE7fsBv9sna1NnFbvUZrdV7nideVf9L1vv9L3hnfP/CZ96oW6e8+Z4tFxK3gnT
	Czc+bu+rXVnGdsn30kcd/v1iSnwzje1n3AucYThn27fybz2s/8/Uttze26Dhy3jNLsNJreC/
	wqqs9Wv3buDV0pU4FN/mvD1aT4f1UHRvgFOycE7aUjMnvuydfNtr2G5dnsBwyzfV9erCtN5w
	JZbijERDLeai4kQAYzCmz7gDAAA=
X-CMS-MailID: 20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
	<CGME20241223125617eucas1p25256081c64ae4e64a12c6ec427f75e8e@eucas1p2.samsung.com>

Add a new SoC-specific compatible ("thead,th1520-gpu") for the T-HEAD
TH1520 GPU, alongside the Imagination BXM family compatible
("img,img-bxm").  This documents the GPU integration on the T-HEAD
platform.

Also adjust clock name constraints to accommodate a second clock named
"sys" instead of "mem" for T-HEAD. This is achieved by changing the
order, and making the 'sys' appear before 'mem'.

Provide example of the new GPU node.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4078cc816ea1..1eb1c15baec4 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -15,7 +15,10 @@ properties:
     items:
       - enum:
           - ti,am62-gpu
-      - const: img,img-axe # IMG AXE GPU model/revision is fully discoverable
+          - thead,th1520-gpu
+      - enum:
+          - img,img-axe # IMG AXE GPU model/revision is fully discoverable
+          - img,img-bxm
 
   reg:
     maxItems: 1
@@ -27,8 +30,8 @@ properties:
   clock-names:
     items:
       - const: core
-      - const: mem
       - const: sys
+      - const: mem
     minItems: 1
 
   interrupts:
@@ -62,6 +65,15 @@ allOf:
       properties:
         clocks:
           maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: thead,th1520-gpu
+    then:
+      properties:
+        clocks:
+          maxItems: 2
 
 examples:
   - |
@@ -77,3 +89,19 @@ examples:
         interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
         power-domains = <&k3_pds 187 TI_SCI_PD_EXCLUSIVE>;
     };
+
+    #include <dt-bindings/reset/thead,th1520-reset.h>
+    #include <dt-bindings/clock/thead,th1520-clk-ap.h>
+    #include <dt-bindings/power/thead,th1520-power.h>
+
+    gpu: gpu@fff0000 {
+        compatible = "thead,th1520-gpu", "img,img-bxm";
+        reg = <0xfff0000 0x1000>;
+        interrupt-parent = <&plic>;
+        interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clk CLK_GPU_CORE>, <&clk CLK_GPU_CFG_ACLK>;
+        clock-names = "core", "sys";
+        power-domains = <&pd TH1520_AON_GPU_PD>;
+        resets = <&rst TH1520_RESET_ID_GPU>;
+        reset-names = "gpu";
+    };
-- 
2.34.1


