Return-Path: <linux-clk+bounces-1869-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F0881CD4F
	for <lists+linux-clk@lfdr.de>; Fri, 22 Dec 2023 17:54:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57657B21A11
	for <lists+linux-clk@lfdr.de>; Fri, 22 Dec 2023 16:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DD4286B2;
	Fri, 22 Dec 2023 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T4vglsCI"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B52724B3D
	for <linux-clk@vger.kernel.org>; Fri, 22 Dec 2023 16:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d3ae326f6so19921565e9.3
        for <linux-clk@vger.kernel.org>; Fri, 22 Dec 2023 08:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703264082; x=1703868882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQK2VmtCHYl6yYZDh5S9BZ2JwRKpJFyjaq6UtHRGJsk=;
        b=T4vglsCIaAvQRh2yHcdaByv7aSOUPj0md4uP+JWWW5Qh5kUZ0jC2eUM90EmaSZxNGD
         hFPR0mRNbIBG2CBdcZ1v1Lc2lWf8V+uvVbc6qG3Mkg5WaCaaeAiVbcn3KrZ+NsJ/9Sgn
         TzHZ9rmL3Leub3Ja1gR3QQ3QXOk+BsIpYe0/UsG3fZQOBEpHk+vKdN+fZxStrta/E3VH
         sHQja6CfvmQMLdQztv2ojqNPatBdFu+uaMrRAfxvINdc75WeoWBse5nnS+/48ccWgjji
         mNX9v3G9+jQNggEqnvfWSbTvmFYtWKfBg0dvgpKnbnME3R6q/behd6NjERbfqRmxnN9q
         2GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703264082; x=1703868882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kQK2VmtCHYl6yYZDh5S9BZ2JwRKpJFyjaq6UtHRGJsk=;
        b=N1rGJeCtns7LRjBG4PjrfipKCBP61wtJ7gQD8S4dXh/T5GtM0QPsj08nhSK/d1RVg1
         sW1XJAuOnKTztZPUFXFZ6GOFhPm65AZgGeF/lyE0A4to2n7wdrPAYXt3y3aeg/BLEXR4
         dAyyajQAeMLPcU0qnQPuOXy+rrsriFbN9U0QqDvEumz5ucLh1eVU+EnBDJ09EW8HNJj6
         0SmQo10b+alLZAILs4GiTXcq+GGJLzMUopB13C26nChDYv4fQa3HpQBNgbOZoA0yPd55
         bybMhmgwGRx8fbIAUOd/iRT8oaIAwJlrLpSbVJB6NEKQs6ZE/YeitmOCyoix4BuiUV2m
         Pg3w==
X-Gm-Message-State: AOJu0YxNMuNDq7EtsEV1/BILNAwjTJkLpa9b/0TepCmIjfz7NU/QMYAB
	gqgrFhZJhDHdw3Ga6BH360AHsIvzDzGivw==
X-Google-Smtp-Source: AGHT+IFGi3TkdV0/ZkWoMA0Zj2LD/mEXVScaCaz/LMNhdFpRM0fz7SwOa9CY7MhveuIg3OuXknU8lA==
X-Received: by 2002:a05:600c:34d6:b0:40d:43ea:e56b with SMTP id d22-20020a05600c34d600b0040d43eae56bmr853910wmq.22.1703264082711;
        Fri, 22 Dec 2023 08:54:42 -0800 (PST)
Received: from gpeter-l.lan (host-78-151-55-40.as13285.net. [78.151.55.40])
        by smtp.gmail.com with ESMTPSA id i15-20020a05600c354f00b0040d378510adsm10138520wmq.1.2023.12.22.08.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 08:54:41 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com
Subject: [PATCH 1/3] dt-bindings: timer: exynos4210-mct: Add google,gs101-mct compatible
Date: Fri, 22 Dec 2023 16:53:53 +0000
Message-ID: <20231222165355.1462740-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231222165355.1462740-1-peter.griffin@linaro.org>
References: <20231222165355.1462740-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated google,gs101-mct compatible to the dt-schema for
representing mct timer of the Google Tensor gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 829bd2227f7c..774b7992a0ca 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - axis,artpec8-mct
+              - google,gs101-mct
               - samsung,exynos3250-mct
               - samsung,exynos5250-mct
               - samsung,exynos5260-mct
@@ -127,6 +128,7 @@ allOf:
           contains:
             enum:
               - axis,artpec8-mct
+              - google,gs101-mct
               - samsung,exynos5260-mct
               - samsung,exynos5420-mct
               - samsung,exynos5433-mct
-- 
2.43.0.472.g3155946c3a-goog


