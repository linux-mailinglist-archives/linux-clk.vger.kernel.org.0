Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 174D87BBE7
	for <lists+linux-clk@lfdr.de>; Wed, 31 Jul 2019 10:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfGaIk1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 31 Jul 2019 04:40:27 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:32862 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbfGaIk0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Jul 2019 04:40:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id n9so68789662wru.0
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2019 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sLpjjKS1ce8bNQv8q/Qa2SJ22ctxx4jp20Vf7E5q7wU=;
        b=MV63+/qRVHk4pEL2HzlA9UVoc85DydE09k+CdU0asPODTFDtlVpRZcRLzSaAP0rUVm
         yi9qfx+pp21tlii4qTwgjeQVCMcugVuRyMpv+afoyKd4NMGKn42BJwxvqcBc7XYEgSUy
         Y02feLyW5nr4y+pPzjYnWIuzJF7q9aCqkio42k105UNNp1Y3SHilEVpJcVSYh2JJUqd0
         ZQfPsY/uuHth24yNpFCe0d1+UmcIZupfhlO+Sit5CsTagbQVc+wOcaFx9wlEC1r2q6YU
         DFmP6Me6nEMfvIU2AupxORQCbyYdfJ9ro2OYQwK/U4gvqdzrcbtA5q4UjiPNwYkvBR4G
         xqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sLpjjKS1ce8bNQv8q/Qa2SJ22ctxx4jp20Vf7E5q7wU=;
        b=dNXgztXGguvCbBUWptbIctTVMTyVMN7+yzOUuue6GDvRfuzL3y0DCbXij1mc3nssZx
         /t+lIpRG3S3TqORhtE7XMboKgdvw/nQnIXu0PKSwVuYEoB6ZehH8519h+PLd9OlwY/yD
         A8jE6Da4iXpk3cENgtigQfVVtVMK9OtS23xcNiOHsyKP18wT1J2aYFAxa0e+Py1Lh5cW
         TX36KBMQv6zCNXNKoR5EbJIzqxZQ+NREIM2rEJQHRalt1oH/S8B0E5J/ec8U3caTy7R1
         X4utGst3BE6PvuLt81SqA6TeEZkQYuW2GvvVNYBw//1XH4oEBGJMa/+O0uzcx7+0c0t3
         5x7A==
X-Gm-Message-State: APjAAAX3OgNLTaZPnO18u9iTF+E+cXDlm56E/SRTuUeKuDS+DKlUpfwJ
        qFfIjwMrSwMDPMpv7aiYnjLbw+9g/jg=
X-Google-Smtp-Source: APXvYqzqvEbqRWHT70qD1Gd6GbwhoKcTb1xDRKV5uUOaWJtUJ43Ikrt6tSU+oew0L9HjDkTlKmV47A==
X-Received: by 2002:adf:f186:: with SMTP id h6mr5501169wro.274.1564562423669;
        Wed, 31 Jul 2019 01:40:23 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 18sm56049308wmg.43.2019.07.31.01.40.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 01:40:23 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     sboyd@kernel.org, jbrunet@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/4] clk: core: introduce clk_hw_set_parent()
Date:   Wed, 31 Jul 2019 10:40:16 +0200
Message-Id: <20190731084019.8451-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731084019.8451-1-narmstrong@baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Introduce the clk_hw_set_parent() provider call to change parent of
a clock by using the clk_hw pointers.

This eases the clock reparenting from clock rate notifiers and
implementing DVFS with simpler code avoiding the boilerplates
functions as __clk_lookup(clk_hw_get_name()) then clk_set_parent().

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/clk.c            | 6 ++++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..c11b1781d24a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2487,6 +2487,12 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	return ret;
 }
 
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_parent);
+
 /**
  * clk_set_parent - switch the parent of a mux clk
  * @clk: the mux clk whose input we are switching
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2ae7604783dd..dce5521a9bf6 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -817,6 +817,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.22.0

