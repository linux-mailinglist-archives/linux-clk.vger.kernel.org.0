Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE41C2B646D
	for <lists+linux-clk@lfdr.de>; Tue, 17 Nov 2020 14:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732786AbgKQNrZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 17 Nov 2020 08:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387713AbgKQNrX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Nov 2020 08:47:23 -0500
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE8EC061A51
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2020 05:47:20 -0800 (PST)
Received: by mail-qk1-x741.google.com with SMTP id a13so1281403qkl.4
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2020 05:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5QU426516gN5B7sidkCWDZ3OKQOV/oU0oHJW0VHpSkg=;
        b=rwMZLeyLWttxc4XDjPnukiljhxU6HO3ndxtJOhGkDy8LDVIdx4DadyIdeZojxsuUDn
         KCrLXLoxruP5kULRvPuTwyt95lKqokIZq8M/ifyDy3PL15YgwVOPNK/i614h62o1x8CG
         /0qzdeWOJJb8Iz41v/PP7p78hdDdWUFQ3nSEWp4q7BKGOWLOjPk5uU9ZuLzsoeatHEru
         HrJNpafaix2c82oPFeM6675vuqdjyC0N0kYum1G60R614a4Gtlgb+hPpNNxZRMUn4wfw
         +eaDq/TtS9z97xWmDELh2yhTyQvMssgxjXvmKByEtIw12UjAy2zig7SwrIbtl0fQ6Pmh
         9YDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5QU426516gN5B7sidkCWDZ3OKQOV/oU0oHJW0VHpSkg=;
        b=C1KyMg1Y59bji2QJily8H9m6LnRDuiMhGvbc9m6+11JlOOShkJKTkOPOyC3NfBZx3O
         ngfTG6nhlR6aOdKrwCHHNsW67TIKkUGMw28Pb1m7RF8cQXj/IxTZ5dtNErJyw8yzXTkO
         D3O+GBfEnvWbi2Gx1zLifJlI4btAmlqvCj/28RnWQK0umIgabU/zbBhrGDcG2bsZ+t7O
         Gv1MNQ6Fim+pwt1ruGxz2+Jrz9KG7pinOBHHFfz2v59zj9hnpslepKY4qITL2GQCVf5T
         WjaDLRra10jnQd+gd3fsqeWzLBu26YelMtjyncmaA2/6eamkPF8+w4da1eaTmor+2vc7
         pBBQ==
X-Gm-Message-State: AOAM533BQSeqatZyRRHWMf41pmT5RQKklnhzFyM3qoKgZbc3ZrP6kD+o
        2xi2QAPJB7Y347mpSJ12+KqpeA==
X-Google-Smtp-Source: ABdhPJzxr/ei6ibxqMp8Adp1P5r3wT5YbF8z+z4rZ4fzSkPXu5USsiUxhdomudmHb+pE5AtUkGD3lw==
X-Received: by 2002:a37:8c03:: with SMTP id o3mr3914007qkd.41.1605620839526;
        Tue, 17 Nov 2020 05:47:19 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id t133sm14607355qke.82.2020.11.17.05.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 05:47:18 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 3/6] drivers:crypto:qce: Enable support for crypto engine on sdm845.
Date:   Tue, 17 Nov 2020 08:47:11 -0500
Message-Id: <20201117134714.3456446-4-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117134714.3456446-1-thara.gopinath@linaro.org>
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support Qualcomm Crypto Engine accelerated encryption and
authentication algorithms on sdm845.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/crypto/qce/core.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index ea616b7259ae..67c3ca13e55b 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -160,7 +160,21 @@ static int qce_check_version(struct qce_device *qce)
 		return -ENODEV;
 
 	qce->burst_size = QCE_BAM_BURST_SIZE;
-	qce->pipe_pair_id = 1;
+
+	/*
+	 * Rx and tx pipes are treated as a pair inside CE.
+	 * Pipe pair number depended on the actual BAM dma pipe
+	 * that is used for transfers. The BAM dma pipes are passed
+	 * from the device tree and used to derive the pipe pair
+	 * id in the CE driver as follows.
+	 * 	BAM dma pipes(rx, tx)		CE pipe pair id
+	 *		0,1				0
+	 *		2,3				1
+	 *		4,5				2
+	 *		6,7				3
+	 *		...
+	 */
+	qce->pipe_pair_id = qce->dma.rxchan->chan_id >> 1;
 
 	dev_dbg(qce->dev, "Crypto device found, version %d.%d.%d\n",
 		major, minor, step);
@@ -261,6 +275,7 @@ static int qce_crypto_remove(struct platform_device *pdev)
 
 static const struct of_device_id qce_crypto_of_match[] = {
 	{ .compatible = "qcom,crypto-v5.1", },
+	{ .compatible = "qcom,crypto-v5.4", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
-- 
2.25.1

