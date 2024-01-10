Return-Path: <linux-clk+bounces-2022-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F36E982183A
	for <lists+linux-clk@lfdr.de>; Tue,  2 Jan 2024 09:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3C2B1F21D4A
	for <lists+linux-clk@lfdr.de>; Tue,  2 Jan 2024 08:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702EA46A0;
	Tue,  2 Jan 2024 08:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UOX/T3ze"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9046B1
	for <linux-clk@vger.kernel.org>; Tue,  2 Jan 2024 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c66b093b86so6472280a12.0
        for <linux-clk@vger.kernel.org>; Tue, 02 Jan 2024 00:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704183254; x=1704788054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=;
        b=UOX/T3zeZhd3vSpEjbWqh6OQTR++KLfbmdeqNnQoPNG/Mr9Mv7wU0cxf9Qaaj/yO3g
         D+EmrEP6OfXr4q5KNlzW+bN/b0azjkkkq3GKdqmduUIIwUipVxmVDWz4ShhJpqAc4ccc
         LpIBpKxuaMaXyH/9ExwmDKNxHwP2vCIr+s9pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704183254; x=1704788054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=;
        b=VcmzWREFuGJGIkqNCXkRT4Q8/VHVJ3ZktvX54tBuZJlJzcxH6ZUk8Yv1m/UuZvpG8q
         7cKMQ1geWgl2CwTGP1YYMi2LzZcK70Zgi6InACI4v6zYLl2yvKrzVytgRJOgn757oIiQ
         rTosc4xm7kBQIYpXF4p2vQrs+HNQ6BoSLF/fED2IVIztJnTjsaT/sL97oYN6Gls2let0
         iaXnYAFT1QhO+j7ZXfWX3cNcCqWc+IzWG91jKOLGm9LGc4KDIaxtUjHr2SyXI7mwJgbd
         0OytGf8j/9g4juOYMcsQt4W8HBBw4ziFK6eP7OnzxzcPo7ndYmGw/K0XGl/zRmyztcfu
         3Ayw==
X-Gm-Message-State: AOJu0YwAn7I6SlKKZnFmhg6/fctYnBUhHFWoIkqbj+T5L2hK0MioFHTb
	zRz5hCdnH4+kIJvYwkOh5fMNGkiyX8OQ
X-Google-Smtp-Source: AGHT+IHM8m/BePVX0/O3CWysvzAhUtnB/CIoZmU5nwbrD+ulhjtycO32Co8Ei+LLUe/a9ppmi+uE8A==
X-Received: by 2002:a17:90a:1506:b0:28b:efda:98da with SMTP id l6-20020a17090a150600b0028befda98damr20446795pja.17.1704183254545;
        Tue, 02 Jan 2024 00:14:14 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:232c:f04:85bb:a34c])
        by smtp.gmail.com with ESMTPSA id f3-20020a17090a638300b0028c8149ac6esm12640074pjj.42.2024.01.02.00.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 00:14:14 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on mt8183-mfgcfg
Date: Tue,  2 Jan 2024 16:12:53 +0800
Message-ID: <20240102081402.1226795-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102081402.1226795-1-treapking@chromium.org>
References: <20240102081402.1226795-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mt8183-mfgcfg has a mutual dependency with genpd during the probing
stage, so enable need_runtim_pm to prevent a deadlock in the following
call stack:

CPU0:  genpd_lock --> clk_prepare_lock
genpd_power_off_work_fn()
 genpd_lock()
 generic_pm_domain::power_off()
    clk_unprepare()
      clk_prepare_lock()

CPU1: clk_prepare_lock --> genpd_lock
clk_register()
  __clk_core_init()
    clk_prepare_lock()
    clk_pm_runtime_get()
      genpd_lock()

Do a runtime PM get at the probe function to make sure clk_register()
won't acquire the genpd lock.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

(no changes since v1)

 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index ba504e19d420..62d876e150e1 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] = {
 static const struct mtk_clk_desc mfg_desc = {
 	.clks = mfg_clks,
 	.num_clks = ARRAY_SIZE(mfg_clks),
+	.need_runtime_pm = true,
 };
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
-- 
2.43.0.472.g3155946c3a-goog


