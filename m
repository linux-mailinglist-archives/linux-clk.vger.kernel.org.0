Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6E0648595
	for <lists+linux-clk@lfdr.de>; Fri,  9 Dec 2022 16:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiLIPaa (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 9 Dec 2022 10:30:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiLIPa2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 10:30:28 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E655A20F44
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 07:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670599769;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lr1I/+6NJl6q9eP4NAD2iuzXJUU4OlB0nQOPAqBaOdE=;
        b=AFsm+CMkjPk5MMpQPYIBrLX6gFBQf1vywBNGbpE0+fvaTiz2vdemUK2OF9/up7Siz3WcOb
        +10sWoZXV06BfwGFAYsOGz/1qNsNY//YlrmcDtRch+VWbVDv/4ohCBdToyCIgHuCYBlgTn
        pzELadEGmS72hDfHZAoffslWHj+JcWc=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-464-BjDaVspkNMK3W5UMN087HQ-1; Fri, 09 Dec 2022 10:29:27 -0500
X-MC-Unique: BjDaVspkNMK3W5UMN087HQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-3dddef6adb6so53777817b3.11
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 07:29:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lr1I/+6NJl6q9eP4NAD2iuzXJUU4OlB0nQOPAqBaOdE=;
        b=t0FEhn745Oy5N+1w2zstOKqs6Rw6BsQiZmk3DcKgz9Z6yDPiuvimvdPbmJCpwCIDHd
         mXFb4OXNBbpdDYpoqGv0b8zm8U7unYH+FIPqGKptF0djsI01RgdlzEO8WATq7MueeF7D
         nJDAbF+rsGpUbVHXKTXwyMcWYDXbUMdNPUDLXYZpf9XO7tLKAJmVXHpnscB6r2aBsN3a
         X7P5x3hPRTWMsBW7diB0XjNbw+dVGL8+laEPXbZdR3ZOsLVRCz2djHaJ7WbiwH4vjMjo
         daeocPvva+jec0eg5CRCKC/mg6eJOw4sgrFzgZta2aoQW07kDwrCWXGqrmxZQmb2D0mO
         M3dA==
X-Gm-Message-State: ANoB5pkEXYDNTDiRKxPG2sPvML2Q/U9fQjSJc7eZ8TpkYn9wlstgokgD
        Do3zMOKAyv3JPx0puvnwO6mJZzxlB2atVuZNyZg3g4H59J4oMiAJ27IlI1IlHrFkluWXvu0bgDb
        lcgxJUR4NHDLPXPGDYYE=
X-Received: by 2002:a25:3c1:0:b0:711:a37b:d738 with SMTP id 184-20020a2503c1000000b00711a37bd738mr4987647ybd.1.1670599766788;
        Fri, 09 Dec 2022 07:29:26 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ZJUWfeSaSFSwEQOFa+G+37DwRvr94jg0o73/+tgv7A/3Ara71ex+J6cW4fNuj7wJ9mdAwfQ==
X-Received: by 2002:a25:3c1:0:b0:711:a37b:d738 with SMTP id 184-20020a2503c1000000b00711a37bd738mr4987629ybd.1.1670599766591;
        Fri, 09 Dec 2022 07:29:26 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-28-158.cust.vodafonedsl.it. [2.34.28.158])
        by smtp.gmail.com with ESMTPSA id dt26-20020a05620a479a00b006fbf88667bcsm29484qkb.77.2022.12.09.07.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:29:26 -0800 (PST)
From:   Marco Pagani <marpagan@redhat.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marco Pagani <marpagan@redhat.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] clk: socfpga: arria10: use of_clk_add_hw_provider and improve error handling
Date:   Fri,  9 Dec 2022 16:29:11 +0100
Message-Id: <20221209152913.1335068-5-marpagan@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209152913.1335068-1-marpagan@redhat.com>
References: <20221209152913.1335068-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The function of_clk_add_provider() has been deprecated, so use its
suggested replacement of_clk_add_hw_provider() instead.

Since of_clk_add_hw_provider() can fail, like of_clk_add_provider(),
check its return value and do the error handling.

The indentation of the init function parameters has been aligned
to match open parenthesis as suggested by checkpatch.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/clk/socfpga/clk-gate-a10.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
index 7cdf2f07c79b..06f129c160bc 100644
--- a/drivers/clk/socfpga/clk-gate-a10.c
+++ b/drivers/clk/socfpga/clk-gate-a10.c
@@ -40,7 +40,7 @@ static struct clk_ops gateclk_ops = {
 };
 
 static void __init __socfpga_gate_init(struct device_node *node,
-	const struct clk_ops *ops)
+				       const struct clk_ops *ops)
 {
 	u32 clk_gate[2];
 	u32 div_reg[3];
@@ -94,13 +94,25 @@ static void __init __socfpga_gate_init(struct device_node *node,
 	socfpga_clk->hw.hw.init = &init;
 	hw_clk = &socfpga_clk->hw.hw;
 
-	if (clk_hw_register(NULL, hw_clk)) {
-		kfree(socfpga_clk);
-		return;
+	rc = clk_hw_register(NULL, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock:%s\n", clk_name);
+		goto err_clk_hw_register;
 	}
-	rc = of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
-	if (WARN_ON(rc))
-		return;
+
+	rc = of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw_clk);
+	if (rc) {
+		pr_err("Could not register clock provider for node:%s\n",
+		       clk_name);
+		goto err_of_clk_add_hw_provider;
+	}
+
+	return;
+
+err_of_clk_add_hw_provider:
+	clk_hw_unregister(hw_clk);
+err_clk_hw_register:
+	kfree(socfpga_clk);
 }
 
 void __init socfpga_a10_gate_init(struct device_node *node)
-- 
2.38.1

