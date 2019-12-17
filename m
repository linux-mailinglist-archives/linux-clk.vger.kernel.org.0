Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6836412233C
	for <lists+linux-clk@lfdr.de>; Tue, 17 Dec 2019 05:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbfLQEqm (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 16 Dec 2019 23:46:42 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33801 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbfLQEqm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Dec 2019 23:46:42 -0500
Received: by mail-pf1-f195.google.com with SMTP id l127so5046111pfl.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Dec 2019 20:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0F0MkR1JRqDekqk4jUNdiQGr6cEsKuLu66z/RkLTN2A=;
        b=HJVh2+BuYsEZ9uTAWiEcNpkne75QSKbMD3rtUSoALv40QtftJv0tRDneAFitaNW7gL
         GvNsN+oP1fgi/rH2fE93+tqe66T25wAu3mhNtg3omMgAwY9kDkH45EXgTy6qk1Ox45/5
         Hj9JKZXhnK5D3jYBNuCLy1az04HIh/ayTcbiA3Jniuu4LHi8Oc0LhuKPOETczWpfb7op
         FxqwKv4m+Hi3VAp5fANaFp5Ibiv7HodrrJeXMXet7pGI8a13ESgjzM00wiXk1qyIcc58
         4Zx9BQC/zbdg4Sz7rz+cJM4p9t8SyfdWeIHAZMdvgAwhZ3u7Aag8Y57F1lrZ0LWreaqG
         809g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0F0MkR1JRqDekqk4jUNdiQGr6cEsKuLu66z/RkLTN2A=;
        b=TaqqEMvH8TIN7eaqDvPtwMPyU/XNrJ8CJMCpVa1nxDgM/hHJzmfBgjk3U3HHm2xTIE
         RdPvkRGLoPtwfi1d4lu3FjO+y+nBksAq5uF/pa8rxSRps7aOEccH7jCK9UJWqc+pzLuT
         5JcjuRfj25C/PzxtdoPw+VQLPDTsDTIT0CH/tSiiEFK8UZlH+qDJWfhtNHukfq039RqM
         u4OHJiyUGKxxAUlaHjA4PIejHCAuaKnMH6AMVeR6aMAO10Bq3G75hQV9ytUxh6DLXa6y
         /NIav7adVGEFijMsirjcCx1P/egbLMhPCdDNMnqab1RwU6NVZENC5jWKkRYeORVl3LMC
         936Q==
X-Gm-Message-State: APjAAAUqatozvfq5ZdrEbXmvluIt/E7YpLTwRjLs4HZy4wRq9m0q4THX
        pAnDXwPF6JeSPk1xMRRt46yFNQ==
X-Google-Smtp-Source: APXvYqyPrSASNn9/ioGFsWW1l32w1KIj82W7Q6YFe8j8rFs1uwbd2Ec+cbkR57rojUImMim9MClHFA==
X-Received: by 2002:a63:d00f:: with SMTP id z15mr22767593pgf.143.1576558001540;
        Mon, 16 Dec 2019 20:46:41 -0800 (PST)
Received: from rip.lixom.net (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id k60sm1201638pjh.22.2019.12.16.20.46.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Dec 2019 20:46:40 -0800 (PST)
From:   Olof Johansson <olof@lixom.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>
Subject: [PATCH v3] clk: declare clk_core_reparent_orphans() inline
Date:   Mon, 16 Dec 2019 20:46:35 -0800
Message-Id: <20191217044635.127912-1-olof@lixom.net>
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

v3: ACTUALLY amend this time. Sigh. Time to go home.

 drivers/clk/clk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ae2795b30e060..2b0f54b6af9d5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3277,7 +3277,7 @@ static void clk_core_reparent_orphans_nolock(void)
 	}
 }
 
-static void clk_core_reparent_orphans(void)
+static void inline clk_core_reparent_orphans(void)
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

