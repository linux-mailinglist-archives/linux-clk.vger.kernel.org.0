Return-Path: <linux-clk+bounces-27809-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2035FB57249
	for <lists+linux-clk@lfdr.de>; Mon, 15 Sep 2025 10:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16260189FC4A
	for <lists+linux-clk@lfdr.de>; Mon, 15 Sep 2025 08:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1303F2EBDC2;
	Mon, 15 Sep 2025 08:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EkhM5i9L"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC85A2E5B26
	for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 08:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757923350; cv=none; b=prCtB5fRgEbO/hS8DnCW9BFB5anbA7cGOMC8FhDawOS+hjQ9fbRojGlSfZe6qOfCCoXP1NLh2lDAyvUgA8qW61k6pgWojMr3rJKqnwe5DeIJEINah/ED3xQ+TMLrN/T3mlQDbUVY1pxFKrzhjnSyvsOER8dWgUD9KLqmXUBKtJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757923350; c=relaxed/simple;
	bh=2HS2x4Zwn3/d1ZJd+mHwB+t2npx1DDRup9HpkomrkfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gP/4MbKBD0lE4NEIY5wJs2l15s04kpZceK8zgDRR0A5NsHSzjGIVHpBTMaqp5NqTQbn0Q6Ri3o/9y5U5h+5H3C0Xvg6yVQ7dhrI9DaGeDiwi1kA5sis1tvaXyZ/vpckr8t5uuair7eKWvF7U95UrQqt7UE/hbui6iOQLAa07lDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EkhM5i9L; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5720a18b137so1599395e87.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Sep 2025 01:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757923345; x=1758528145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcvS1l+DUe5XdhH4VUkP5ymD62cqO3nzvy0Q17N2d10=;
        b=EkhM5i9LV+fdycvVn6mwYHfiey2jyjmlIooaNyDJLG9Vfeh4zdlN2VlDbBiahI7aII
         0cONOl+65nphgOEwKQ4plT/zmY8+/Qww8nVjFGDzA3m4w4C5XTbytVO5gyWEq5AvGxXU
         0hHPuGrNY5DdOp9Ljjmip6kFv3KJbkNMWhfBXq/J2L2WiQv94glmev+S4CjNpf5b9n9W
         5QKGOPOTaYHR4c6R0iAHm2/wasKj9iAvUGgPU4qXAP5ju2ZxWnbY5NvBU2RrWOuM8jO7
         W5i3y1Avv+8brGYpXGSfYGHiBCM9aAvcy/aqyvl1ugC3SSRwb9qYOTaEy2yfKu8jMdOW
         UoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757923345; x=1758528145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcvS1l+DUe5XdhH4VUkP5ymD62cqO3nzvy0Q17N2d10=;
        b=jR5zy2wsjg3/3Tx/CJReYHpmFFzv6nqIJV3eSdh85/qoVAVUEmXc1PXqI88CgkU+xt
         Ioq3d5QaWLT8IFS80T2kWtwPBsd7GTxu18+HXMjqMbJ4xOYffnpJNHLgPpNoG3rqqb0L
         TJXkOpoYeg2TO1uFh/KOArECszeKnTFfc6wXU3xCpIEW608ydUjbN0b2PdzeW9TI6F7w
         DibSbi1K/d5GaZ+9PFzqky7aJmcg1H0yycXSrPVDiMPlzCa2rutyqEOHkPxrZVz5x+bv
         V/6S4opqSign9rZa/dV9hg2yQVOWVaaaostSwJzsqsco/cCLtxBtudZvjEcfLa0uqHyI
         QATA==
X-Forwarded-Encrypted: i=1; AJvYcCWMDWxtZl+R1zW8aFPPP5TvWsAtFMPE+GvEZCvRLCNOGzDmhojoMwGKoh3Rt3PWltDz8vsfV1t7QSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY+bRC6oNkkoSGwLfdYXQnIr8Bylkah1MMuUynwGr0jYM7F4Zx
	5Puns+zYnTMafAXIkrw8MiLdSSTvl3Sfrf/m1HLiqs1EQXfvJMXxsXlP
X-Gm-Gg: ASbGncunZjXrSrOsQtk4U/IkqQ+pGmB2aLPkV/W27tZWVwcdG0Jt+MEzUMsKQPGj08v
	Iy3i8R2ZLBdaN5op0lqKI9wwCnJsCuFrPwEXqPvuukkchHSwXNvWUZJ3fzA78NdtlflhGb76ZxJ
	exGwWW6CR81JUX0ZLQ2Jj1DThknlhkr6BmE8xqLhHlB9FSi73YL4bCR1ljKDuczpiSzMz4rZI2t
	2UPMgoF1t4tCdMjSg7O/uGZO5uc7T4Jgnht1CqQWBJtLbZqgp2bf2rUZ8/Wo3vmv07k+REIfnRx
	QCgJno7xQEfZUfWmsGDSsuA52vCDa4AQy7HNmxeD+4DFc3fymMsXZgtSB+n4GAA5ddnZh3XV3eb
	o0QHUWk5j0Y1wo53lPqc7ryZ9
X-Google-Smtp-Source: AGHT+IG3XB+VvXjojvfZWSOr8AupWtLXNT3yogCB7qwPpJNLsWVULqrW/kotBHJYn0rOd1mx07GyJg==
X-Received: by 2002:a05:6512:2513:b0:55f:6883:cd26 with SMTP id 2adb3069b0e04-5704d1f4373mr3419989e87.32.1757923345366;
        Mon, 15 Sep 2025 01:02:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e6460dec4sm3392381e87.103.2025.09.15.01.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:02:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dmitry Osipenko <digetx@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 03/11] dt-bindings: memory: Document Tegra114 Memory Controller
Date: Mon, 15 Sep 2025 11:01:49 +0300
Message-ID: <20250915080157.28195-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250915080157.28195-1-clamor95@gmail.com>
References: <20250915080157.28195-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Tegra114 support into existing Tegra124 MC schema with the most
notable difference in the amount of EMEM timings.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../nvidia,tegra124-mc.yaml                   | 97 ++++++++++++++-----
 1 file changed, 74 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
index 7b18b4d11e0a..9cc9360d3bd0 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-mc.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-mc
+    enum:
+      - nvidia,tegra114-mc
+      - nvidia,tegra124-mc
 
   reg:
     maxItems: 1
@@ -64,29 +66,10 @@ patternProperties:
 
           nvidia,emem-configuration:
             $ref: /schemas/types.yaml#/definitions/uint32-array
-            description: |
+            description:
               Values to be written to the EMEM register block. See section
-              "15.6.1 MC Registers" in the TRM.
-            items:
-              - description: MC_EMEM_ARB_CFG
-              - description: MC_EMEM_ARB_OUTSTANDING_REQ
-              - description: MC_EMEM_ARB_TIMING_RCD
-              - description: MC_EMEM_ARB_TIMING_RP
-              - description: MC_EMEM_ARB_TIMING_RC
-              - description: MC_EMEM_ARB_TIMING_RAS
-              - description: MC_EMEM_ARB_TIMING_FAW
-              - description: MC_EMEM_ARB_TIMING_RRD
-              - description: MC_EMEM_ARB_TIMING_RAP2PRE
-              - description: MC_EMEM_ARB_TIMING_WAP2PRE
-              - description: MC_EMEM_ARB_TIMING_R2R
-              - description: MC_EMEM_ARB_TIMING_W2W
-              - description: MC_EMEM_ARB_TIMING_R2W
-              - description: MC_EMEM_ARB_TIMING_W2R
-              - description: MC_EMEM_ARB_DA_TURNS
-              - description: MC_EMEM_ARB_DA_COVERS
-              - description: MC_EMEM_ARB_MISC0
-              - description: MC_EMEM_ARB_MISC1
-              - description: MC_EMEM_ARB_RING1_THROTTLE
+              "20.11.1 MC Registers" in the Tegea114 TRM or
+              "15.6.1 MC Registers" in the Tegra124 TRM.
 
         required:
           - clock-frequency
@@ -109,6 +92,74 @@ required:
   - "#iommu-cells"
   - "#interconnect-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra114-mc
+    then:
+      patternProperties:
+        "^emc-timings-[0-9]+$":
+          patternProperties:
+            "^timing-[0-9]+$":
+              properties:
+                nvidia,emem-configuration:
+                  items:
+                    - description: MC_EMEM_ARB_CFG
+                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
+                    - description: MC_EMEM_ARB_TIMING_RCD
+                    - description: MC_EMEM_ARB_TIMING_RP
+                    - description: MC_EMEM_ARB_TIMING_RC
+                    - description: MC_EMEM_ARB_TIMING_RAS
+                    - description: MC_EMEM_ARB_TIMING_FAW
+                    - description: MC_EMEM_ARB_TIMING_RRD
+                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
+                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
+                    - description: MC_EMEM_ARB_TIMING_R2R
+                    - description: MC_EMEM_ARB_TIMING_W2W
+                    - description: MC_EMEM_ARB_TIMING_R2W
+                    - description: MC_EMEM_ARB_TIMING_W2R
+                    - description: MC_EMEM_ARB_DA_TURNS
+                    - description: MC_EMEM_ARB_DA_COVERS
+                    - description: MC_EMEM_ARB_MISC0
+                    - description: MC_EMEM_ARB_RING1_THROTTLE
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra124-mc
+    then:
+      patternProperties:
+        "^emc-timings-[0-9]+$":
+          patternProperties:
+            "^timing-[0-9]+$":
+              properties:
+                nvidia,emem-configuration:
+                  items:
+                    - description: MC_EMEM_ARB_CFG
+                    - description: MC_EMEM_ARB_OUTSTANDING_REQ
+                    - description: MC_EMEM_ARB_TIMING_RCD
+                    - description: MC_EMEM_ARB_TIMING_RP
+                    - description: MC_EMEM_ARB_TIMING_RC
+                    - description: MC_EMEM_ARB_TIMING_RAS
+                    - description: MC_EMEM_ARB_TIMING_FAW
+                    - description: MC_EMEM_ARB_TIMING_RRD
+                    - description: MC_EMEM_ARB_TIMING_RAP2PRE
+                    - description: MC_EMEM_ARB_TIMING_WAP2PRE
+                    - description: MC_EMEM_ARB_TIMING_R2R
+                    - description: MC_EMEM_ARB_TIMING_W2W
+                    - description: MC_EMEM_ARB_TIMING_R2W
+                    - description: MC_EMEM_ARB_TIMING_W2R
+                    - description: MC_EMEM_ARB_DA_TURNS
+                    - description: MC_EMEM_ARB_DA_COVERS
+                    - description: MC_EMEM_ARB_MISC0
+                    - description: MC_EMEM_ARB_MISC1
+                    - description: MC_EMEM_ARB_RING1_THROTTLE
+
 additionalProperties: false
 
 examples:
-- 
2.48.1


