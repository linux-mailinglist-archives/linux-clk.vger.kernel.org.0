Return-Path: <linux-clk+bounces-5520-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5F78987C0
	for <lists+linux-clk@lfdr.de>; Thu,  4 Apr 2024 14:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7E81C21415
	for <lists+linux-clk@lfdr.de>; Thu,  4 Apr 2024 12:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6B64135406;
	Thu,  4 Apr 2024 12:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="evVkrYTZ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9681353E3
	for <linux-clk@vger.kernel.org>; Thu,  4 Apr 2024 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233651; cv=none; b=Ea3+kTCblZuJCX31iha9lFJzDqRgZYdm/7UHftPKas7Bp8ey0wZqL8nUy2ulcgblTTyq6ehghFmskWQvm9Xog2U+jBnO6SQEY1mtNiyvaI12E8Ky2vaJfPP5TZcDjhy3B134/3GHLlT2bwyojTXMqfSfK6lzzl6H9M/O7z5QU/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233651; c=relaxed/simple;
	bh=DpPQtX3Zqi2fd+m1VzltDJ0XBt3U5O/P9UnDTdTvH9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSGx0Vfbj53MfbwXEjDNjnuilDeuTgcXIPJjOW2gfyoOqWaGiHsQAuwhNOmCctd7ilRPc98Wu6RzShrcU+r9FFmgbo/DS2Y1YtyHyz5SJjVZiefhrzTTfqiWGIm/1b8Mb5SjQ0Ex0vWvSdTCsjvAOJRAf2qIJ6W8ea7iU51oUC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=evVkrYTZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4148c6132b4so12268985e9.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Apr 2024 05:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233648; x=1712838448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCoibUgVXrDhj6Ie2d9/sHJBy2MlyQN1DiiH4mHtSsU=;
        b=evVkrYTZdU6Grw8YVzTk0CrNoK9x9DjywkXBBgQvVEZjSVkUYExR0dtNHIQhC8/Lmn
         4EO1QW9OzDZ1JGFfs6x10RIzr9ldNOsqhYTrYL9X3ZRuR23rrZ64/vAM4Dz34JeyQ/bN
         RG832rMPGeN5AZQvUwbDmehHNE9fgdiiPvz7Cn5FGZHy/cMhEeWqfeq6js4t/INq6dDQ
         0cHQDAcG5gUhWNmwFrSbaO4yUp8s2RSEBRfMvRcCnseCPHwCjtLKWsJD2xeZNoMI6T3x
         T6H1Y7mJGNXfPi0Ej/ILjVKTQ8zHLUf8eQTwHCYRcCXc5pZ09LFNqr4FbqbboZ2krQC/
         mEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233648; x=1712838448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCoibUgVXrDhj6Ie2d9/sHJBy2MlyQN1DiiH4mHtSsU=;
        b=Lw7w5f5Tfl3RLkHh5TcoxyoKTFZUfV+g5G+2PrXQS/Gh0KSTWnZ4VrZQH8ZibnTNLR
         fYDpc6Sgb4Ox+SBqDOV2R6IqbVtUblw38B/BAValjmEgJwP9vHrKfZpQ21wMW6QrljTd
         TNsDlIgw2FutuIKaH8H92ZxaoglHDwyYJmkQTXN2KWkMqufcbB1YgfO4goYyKDA85OK0
         9S6KkkyflUHc21oeL6ZKOi2R46FKSSts1hXn1ESdnqxgfEASJ+OoHk6GpfVDex8cYCsB
         A8/FBBtC/uBNhgGDk9x3fIgjt7/80xuElhzegdSzwFng35jh0aMUzjADhnoyfqLt3UDc
         6q3w==
X-Forwarded-Encrypted: i=1; AJvYcCXnxfjfNjRURZRCUAaUQmEu0q6vUlBrj55lG7y0/fiwsxnuEbhK2dNB8SpmzDi+vklSzXrInF2ri7R1Zj0AuIssvjKDItU9iQWX
X-Gm-Message-State: AOJu0YxgTQasJ3+yATnpei1wx8K4dKUG4r573qDWHxX/7R1WUx+NxhRv
	4urdBpUgK6b7889YkfEmHS93FwgMC4D5RI+h+WWdyLUv8Mn8pRX0CI8+c+sK3Do=
X-Google-Smtp-Source: AGHT+IEUfAM9zfc1fEcONBjRrQZRgm3rufWc9YdQbrZ/Uj7Mr8B0aLztpGDLAE0O3aOZeWldQ4nn4g==
X-Received: by 2002:a05:6000:23a:b0:33e:710a:b699 with SMTP id l26-20020a056000023a00b0033e710ab699mr1951763wrz.9.1712233648344;
        Thu, 04 Apr 2024 05:27:28 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:27:27 -0700 (PDT)
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
	chanho61.park@samsung.com,
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
Subject: [PATCH 13/17] scsi: ufs: host: ufs-exynos: add EXYNOS_UFS_OPT_TIMER_TICK_SELECT option
Date: Thu,  4 Apr 2024 13:25:55 +0100
Message-ID: <20240404122559.898930-14-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This option is intended to be set for SoCs that have HCI_V2P1_CTRL
register and can select their tick source via IA_TICK_SEL bit.

Source clock selection for timer tick
0x0 = Bus clock (aclk)
0x1 = Function clock (mclk)

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 9 +++++++++
 drivers/ufs/host/ufs-exynos.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 7b68229f6264..1bfda9c75703 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -50,6 +50,8 @@
 #define HCI_ERR_EN_N_LAYER	0x80
 #define HCI_ERR_EN_T_LAYER	0x84
 #define HCI_ERR_EN_DME_LAYER	0x88
+#define HCI_V2P1_CTRL		0x8C
+#define IA_TICK_SEL		BIT(16)
 #define HCI_CLKSTOP_CTRL	0xB0
 #define REFCLKOUT_STOP		BIT(4)
 #define MPHY_APBCLK_STOP	BIT(3)
@@ -1005,6 +1007,13 @@ static void exynos_ufs_fit_aggr_timeout(struct exynos_ufs *ufs)
 {
 	u32 val;
 
+	/* Select function clock (mclk) for timer tick */
+	if (ufs->opts & EXYNOS_UFS_OPT_TIMER_TICK_SELECT) {
+		val = hci_readl(ufs, HCI_V2P1_CTRL);
+		val |= IA_TICK_SEL;
+		hci_writel(ufs, val, HCI_V2P1_CTRL);
+	}
+
 	val = exynos_ufs_calc_time_cntr(ufs, IATOVAL_NSEC / CNTR_DIV_VAL);
 	hci_writel(ufs, val & CNT_VAL_1US_MASK, HCI_1US_TO_CNT_VAL);
 }
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 0fc21b6bbfcd..acf07cc54684 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -222,6 +222,7 @@ struct exynos_ufs {
 #define EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER	BIT(4)
 #define EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR	BIT(5)
 #define EXYNOS_UFS_OPT_UFSPR_SECURE		BIT(6)
+#define EXYNOS_UFS_OPT_TIMER_TICK_SELECT	BIT(7)
 };
 
 #define for_each_ufs_rx_lane(ufs, i) \
-- 
2.44.0.478.gd926399ef9-goog


