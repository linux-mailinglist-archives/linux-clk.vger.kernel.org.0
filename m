Return-Path: <linux-clk+bounces-2139-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3C826952
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 09:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76E351C21B3C
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 08:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D18BA53;
	Mon,  8 Jan 2024 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eSIDp8pI"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C4AB65E
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 08:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d3ea5cc137so13461765ad.0
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704701923; x=1705306723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=;
        b=eSIDp8pIUHRUnRMpRxvShBcC93mhY4GBatmmS/Et4yMbFzihxilFXskFnVeRsq1UR+
         azfv0ojCvJMg5TCEURzdYa1TkJttmljkwoaP0BfNHFSQHyO8jWiCCQoORok67sVUWRwG
         zgO566agMWhFxA279kj/GOPpZWNG5g4RMgJ60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704701923; x=1705306723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=;
        b=hU+s9rJUehlWLNSHQnArYBBIlZfYRcoIRrC4SZfKnJ8e6kNoeoc4ZssjqJPvKElIs9
         vh0knkPzFuc1fhablsuUrxzF+yWD1o1QNyWGqO/2umHh5ZBatvienM7ZXTK9Sa/LRfP/
         JNXCxCD7a+FocF0WvvEERGp+DrLnZNzLvATro7/I9AsrJRDAhx+d9mWvrh5pJkXrOQqL
         0AD+hQQubnFk+bbrLve3zSIPANl6VHbGF1zbOZv03VfB41WcJeVKq6MPFKjS3LTk4krK
         T1DLg6Da4x3zRuNKfNlIHDbJHDhEA12BINkCQkQIz9QLPuT+teXm4J9Vp14xXlASDZKU
         Opag==
X-Gm-Message-State: AOJu0Yww6NYzg7AVKLf8tK7GaFrx8WnzDalrdbz7UwneIxlv+FfWkYob
	ugFV/7Y9+UxLNBwnFWUHaXM4SYoeEeZ0
X-Google-Smtp-Source: AGHT+IHWcp3e1C1pCxpD9ZE1ctDnpB0lvwh36vHDQttf1iujltl/YpMCv6WgVen6qzG0XRhu94epxQ==
X-Received: by 2002:a17:902:dac5:b0:1d0:6ffe:9f5 with SMTP id q5-20020a170902dac500b001d06ffe09f5mr4245569plx.83.1704701923020;
        Mon, 08 Jan 2024 00:18:43 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:6859:f8da:3370:7a74])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170903048400b001d078445059sm5672513plb.143.2024.01.08.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 00:18:42 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on mt8183-mfgcfg
Date: Mon,  8 Jan 2024 16:18:16 +0800
Message-ID: <20240108081834.408403-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240108081834.408403-1-treapking@chromium.org>
References: <20240108081834.408403-1-treapking@chromium.org>
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


