Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85656122333
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2019 05:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfLQEpN (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Dec 2019 23:45:13 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35877 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfLQEpM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Dec 2019 23:45:12 -0500
Received: by mail-pf1-f196.google.com with SMTP id x184so6841822pfb.3
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2019 20:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IFOKANEwowyMqUieyt/3xc40UqgVgL4V9AjtjYPrU80=;
        b=hwq1LeVPzmXCN5bkDg6sViC8UrSNXBnAr/kOYMwcvKNWqeqHwVfbOCXLAF/kdcTXGc
         YHcBAyZKcQmABsOTmsdjKVpFaNe1A+CguRV9XMPbBZJVdc6dzV/Fbr2kI6Ba0hYKMbum
         3mkxNKFo9JD8pJtyRijXdRPjNC+jYvSTqNl4MmLOspugxR/S9s8d5B5OHRsAksFve+02
         Uc6gUTRRNgqU4MoSXtvs76Kxe7ZDdYVMtlnuPfwlu+4so94y3kmcpl8zvn0qYbAJI1UV
         4LU2dA3crDQAr1vQ+sZtN3fvv9i35adZvQ7UZRIj0FLEg67Nvm8z0XakP0PgRBo/mtwd
         Pp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IFOKANEwowyMqUieyt/3xc40UqgVgL4V9AjtjYPrU80=;
        b=Z6ApqHSDEAO8itaaiMcmzUJHhmplgvAcYIfFHLKwW2fjL87cBtn/v9B2ecRXFCg/k8
         Luc275agtO8gBdXy5MRZtEacfRtdbgmJWDIZwoHBwEf7Rax44bD+BtKQbQbbgRAjXwCO
         ScRigKlsKK07jkDWmMV46nxaJznhCewv0YA3jbiENy2oRYlx9A1pf+V1VXKm8tkKisvF
         93lMm2Zvf5ZIHKX6EfoHuHQiJ2lC0M+zcELp4OMTYM+esLB/2QN0eLEyR4v71CMRboFN
         nPuSFCd2LYlj/Yjc43w6LXwVSXzVbkz8RqD4JEC+iyLuX+4/pMT0X6esWwocEFCCDt6a
         mpXg==
X-Gm-Message-State: APjAAAWR+OERQa22NV1nXVIt+tao5pptZjg8FXPBQO7WD3A9x3QoACEj
        v1sgOqTuB74qr+fhJLK/+81L0g==
X-Google-Smtp-Source: APXvYqy1w0O44FGIbN6ye1YVpK07d95OsREGZToQpWkiZo0HNxUzZTJL/QrtF7b+2ssKObkpqPKZlA==
X-Received: by 2002:a63:31d0:: with SMTP id x199mr23145963pgx.286.1576557912262;
        Mon, 16 Dec 2019 20:45:12 -0800 (PST)
Received: from rip.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id h6sm23597091pgq.61.2019.12.16.20.45.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Dec 2019 20:45:11 -0800 (PST)
From:   Olof Johansson <olof@lixom.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>
Subject: [PATCH v2] clk: declare clk_core_reparent_orphans() inline
Date:   Mon, 16 Dec 2019 20:45:05 -0800
Message-Id: <20191217044505.127574-1-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191217044146.127200-1-olof@lixom.net>
References: <20191217044146.127200-1-olof@lixom.net>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

A recent addition exposed a helper that is only used for
CONFIG_OF. Instead of figuring out best place to have it in the order
of various functions, just declare it as explicitly inline, and the
compiler will happily handle it without warning.

(Also fixup of a single stray empty line while I was looking at the code)

Fixes: 66d9506440bb ("clk: walk orphan list on clock provider registration")
Signed-off-by: Olof Johansson <olof@lixom.net>
---

v2: Forgot to amend when I switched from __maybe_unused to inline. Use
either version, your choice.

 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ae2795b30e060..dc1e6481f6b33 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3277,7 +3277,7 @@ static void clk_core_reparent_orphans_nolock(void)
 	}
 }
 
-static void clk_core_reparent_orphans(void)
+static void __maybe_unused clk_core_reparent_orphans(void)
 {
 	clk_prepare_lock();
 	clk_core_reparent_orphans_nolock();
@@ -3442,7 +3442,6 @@ static int __clk_core_init(struct clk_core *core)
 
 	clk_core_reparent_orphans_nolock();
 
-
 	kref_init(&core->ref);
 out:
 	clk_pm_runtime_put(core);
-- 
2.11.0

