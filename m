Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE26F2C0DF
	for <lists+linux-clk@lfdr.de>; Tue, 28 May 2019 10:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfE1IIQ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 28 May 2019 04:08:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42191 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbfE1III (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 May 2019 04:08:08 -0400
Received: by mail-wr1-f65.google.com with SMTP id l2so19109574wrb.9
        for <linux-clk@vger.kernel.org>; Tue, 28 May 2019 01:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CL//C3ZWRy94QZXf1OCefDGPvk7lxcX63rkB08gtAL0=;
        b=T+9lv1CUPBY7+nH6hUamE+GmY2yjsCZdeXbGcWUTfKkdC2brA4WvKz118M+QdCKzqA
         T26S/U9q9f4yxgtsJvMeIXsRquyYqvHNnTO9BOsgwBZ7eZ9orheKBskPH9AKeGxWE0wB
         /Bnn+m6ev3TPdTClWioDpz/zFCATrTmTxuarBJHhwPBOmIBG1wuHEyJm2dvelAGVMLwq
         OIqBi44kCwbv9I4cmZD2YRtBxs7cY4ZWHqmWdaj4pSifcm3ehzivUGJy2Rlbs8r9katY
         Jjtcudwq/bn2HbUuS2cnt2MkgvTHotWH33avaiw/yvrI+xRL0bTAQWyAeWI9OY5LcdLb
         xd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CL//C3ZWRy94QZXf1OCefDGPvk7lxcX63rkB08gtAL0=;
        b=t+YxqyGBKi2K/ARu+cf4vpCaELQhp9Cf2r3Vh9t0xTLMslCXr0LaUfX1nxV1qG+r2E
         zy3SUzJz6Qa+kIbpJy3uPYBi9tBBMi1udGddNEHElx+JUF7ZwGkSwcmGWmGtBZa9fiLW
         ZQuZx+QvPc+EoLFu0bowXrwyISOuHnCRiiL1dq7qNagfJH6PKNCwVmR32b7u9kk0Ak/I
         b08AHaQ2FlwK1YMjTx1pTYBqdl7arMW3OCIPn410ouALj7bPu3q0E+rhxqlYggYISg5S
         zSjnlBniS/5Gr6auVHwnD2zMWO4KiO+bgASvE1CVboUdDI+vGIxMpRXlNNZCvUd8t7bN
         jPZg==
X-Gm-Message-State: APjAAAUCfEkDQP/blEqZNFdGved/dKfa/fdJt603HjfI/WUSBNHY7/rE
        g/Egzk7WO6hbJlQmapMxfB6kFA==
X-Google-Smtp-Source: APXvYqzKYPRMi57PTY6M5KUFleV+I7Dkh+1equfvb7EphYfx1TQ5qT2yKEdmtd5GNtC9yq3KcNPCuA==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr17366735wrj.15.1559030886540;
        Tue, 28 May 2019 01:08:06 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z74sm2456121wmc.2.2019.05.28.01.08.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 28 May 2019 01:08:06 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2 3/3] clk: meson: g12a: mark fclk_div3 as critical
Date:   Tue, 28 May 2019 10:07:58 +0200
Message-Id: <20190528080758.17079-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528080758.17079-1-narmstrong@baylibre.com>
References: <20190528080758.17079-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Amlogic Meson G12b platform, the fclk_div3 seems to be necessary for
the system to operate correctly.

Disabling it cause the entire system to freeze, including peripherals.

Let's mark this clock as critical, fixing boot on G12b platforms.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 1abe46a95dc1..3c75ef5e4d24 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -1350,6 +1350,16 @@ static struct clk_regmap g12a_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		/*
+		 * This clock is used by the resident firmware and is required
+		 * by the platform to operate correctly.
+		 * Until the following condition are met, we need this clock to
+		 * be marked as critical:
+		 * a) Mark the clock used by a firmware resource, if possible
+		 * b) CCF has a clock hand-off mechanism to make the sure the
+		 *    clock stays on until the proper driver comes along
+		 */
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.21.0

