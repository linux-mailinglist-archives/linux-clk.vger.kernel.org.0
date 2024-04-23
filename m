Return-Path: <linux-clk+bounces-6302-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BD8AF85E
	for <lists+linux-clk@lfdr.de>; Tue, 23 Apr 2024 22:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D3E51C241AA
	for <lists+linux-clk@lfdr.de>; Tue, 23 Apr 2024 20:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C96E144D2E;
	Tue, 23 Apr 2024 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qTT8aJ1U"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D06144D09
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 20:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905424; cv=none; b=GjQT2EonSk7j5dG1lda3ScdXRI/x0eMozBFZDZV+ZQaFIdu2BNXeuMYHFHCKPTt0eyIAKGlHGv/oV33ol9f4WGgjhsri/kFMUgZn09wmTukjRUujRoHgBUgLsFpsOgWkDMSrB5SUbse5G4vAQXXZEXHpcCM03lnH2iOoJuJqA1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905424; c=relaxed/simple;
	bh=a6EGwwE1CgLZpsZYJuC5A51LDW52KwBPo3aH4tUpo8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SywVXngxFULO8LUGnhfuNkZwSSazphYi2XtFQa6+D1rJN05DbZJ5rLHZw0I9vXmgph62Qxv1qzP6/myTf4iSkfw8OkiaHl/BPYzxwN2kGiUap592fIAdBmXBt1IICkcX+gPcF6eRZhV/xU/XRwtEFjwlGa1BmyuO3s51xNO6b8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qTT8aJ1U; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41adf155cffso4805495e9.2
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905421; x=1714510221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQFFeizie+WDtAymx9A6IFxdpuXrJrETM1fm6NIco7s=;
        b=qTT8aJ1UHBP7Srgo+JFOO35ujlTmB0hBC2OIuztV+aSoZ06pW/YN/B1Q110zqW57WC
         VXvSlyQKnE50o7YjFHYKEMCies9UTpkASkwXkBrXwr8s0WdKLXqvFMN+wUMEiU86Ubn2
         lc/HrJzIH5d0GdLIKcbGd+h9bweTMoTOlKLRSV5kd5cFI492ZvC7xhGR2d2EEZ4x5KcC
         J4f2JoyaWslKWtdSE1/csF7JFZV+itIITGqYw45OAuXzWa3SZG2mnOhxmWcwPxhXsktB
         61Qg7NPkY2u40lO/KBeoFGxRPyxNd1fbiuHKFytyVWk3Pw0e6zjmLc0WQCAX1H67RGUC
         aYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905421; x=1714510221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQFFeizie+WDtAymx9A6IFxdpuXrJrETM1fm6NIco7s=;
        b=ONWkOknB4K2K1hZlyyndno8hGMfTIUnl0W0aSG+LCD7s4V3ys78+jLyAPRnBXd2R4O
         VBHmSXeM8wzOILBQ/YRNvSHckWBg6Uvth0Kb0OI/7S50ZcCJemJhufbiiMQnS/cHO4Ix
         /ThasB7Bid9/WsHiC/ijUwQiZb8JMzE0KzP0itZaYrMz6xTmLxiegRC48WzYQvcj/AiI
         d1HWElLpGSolcQBfb+cvkj2PkHQc2bQo0zM+Kz5ORlfApxYGHRFNB9QSghEQahTHbBCA
         NhWwTsZCT7MSW5S9RU/xMtwzdEL89eE1mWQ4TzAM6UwJOmR7lk7MlzDyXwAXgfnWTymo
         zEYg==
X-Forwarded-Encrypted: i=1; AJvYcCXLXu2nf4LIQiX8brjEUTe/NeXptAP05z4jS4G6cF1uWxJWHO6rYsYUSK9t+Ssv8AnN2Mc0CsLpXaiFcPyfBqK031xzW1Otb8SX
X-Gm-Message-State: AOJu0YxUUWZzX9I4lsQeqarTfHc6VtOIvGQS5lJD3/udizdeGRcSodKB
	+RMF9DKHxq4a3W/fj+TptiRE5NzSxaiewcR8L2TJkWNBh2BfKDB3UxfCuijKcY0=
X-Google-Smtp-Source: AGHT+IEoN9BL+beMqGZgZJ7I01F7imeAY0oItPApC+eGoxgDcTY3kaq69qarTURQu5n1FxjQvFK/vw==
X-Received: by 2002:a05:600c:4586:b0:415:6bd7:9681 with SMTP id r6-20020a05600c458600b004156bd79681mr219733wmo.35.1713905421546;
        Tue, 23 Apr 2024 13:50:21 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:21 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 05/14] arm64: dts: exynos: gs101: Add the hsi2 sysreg node
Date: Tue, 23 Apr 2024 21:49:57 +0100
Message-ID: <20240423205006.1785138-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This has some configuration bits such as sharability that
are required by UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 38ac4fb1397e..09044deede63 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1265,6 +1265,12 @@ cmu_hsi2: clock-controller@14400000 {
 			clock-names = "oscclk", "bus", "pcie", "ufs_embd", "mmc_card";
 		};
 
+		sysreg_hsi2: syscon@14420000 {
+			compatible = "google,gs101-hsi2-sysreg", "syscon";
+			reg = <0x14420000 0x10000>;
+			clocks = <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
+		};
+
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;
-- 
2.44.0.769.g3c40516874-goog


