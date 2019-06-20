Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3A24D138
	for <lists+linux-clk@lfdr.de>; Thu, 20 Jun 2019 17:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbfFTPB3 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 20 Jun 2019 11:01:29 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40391 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731943AbfFTPA1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jun 2019 11:00:27 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so3496603wmj.5
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2019 08:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j3tTOMHSiFLp+myEpmzmt12jpkjBS7JqoQLTAOWEufU=;
        b=BViqmsQ5foznBhU97cwBP9VbZrKPmLd0cybtB6EXw4tXt0WePDI0JEDxWIpG6iSQoi
         jXseiSDXzCZWAH+hUXGclwQSkU023IAkyoO97sLtfKaqWDVbwm78SitxkIeQKCPp1MTq
         Ipmp5yuUb24kxuvvJmJE6bdQCpPMwVR0R/yhHa+9DehOo8HgmZUNNP5VCS+9Wb4mVMiT
         r6C/0RSeH3nc/Ru8H7RLDkhx2opcrmeoWebTXbTKOz52XCEKlt7nv+Vs9z8xYJYpYDBx
         Tm8ix/M+0NDe8ba6+KDU/X67qmImXaCr3+SnJAhFIlcOZC361jVgiugWBSPWcwG6wJ1Z
         yvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j3tTOMHSiFLp+myEpmzmt12jpkjBS7JqoQLTAOWEufU=;
        b=q0LGj6XyeSOivcreaNXIO4JFICzXAO9WlWpYxGzCFXnm/cOISyZDDpsbv0xmJEfIJ7
         S4UfiU6Ke2kcciFxdBO6ia5t0oUptrR3rPEv/noR9I9mHm8QILAsoBZ1bTeK8luUfC24
         ugWUtmZoLdPVXd7ZHEKcC3jdhtTe3as1UrDdP5Ymoa17Q21HMd+LPrc2ZrzdAgwIy9yw
         /Odsfh+0+xsSYrEIoBvL44eJcxZL+k8oa0F/Xk4ZD4WN2mpy4dmH9skICM1C/tWFJ+cb
         rZwRv8a4uBSfD9kj6UraKbKMuv9VohrDHbamyyDsgVa7w2COlblccOhg5Ofw4Y/QqIxL
         lmQg==
X-Gm-Message-State: APjAAAW0VTc2fe4Y6dfr67/EaifJcPYp1grUIGdI0mDuEFnvwK2UQdF7
        tJyu+kj2KIKKIjPKs040Dn+LVQ==
X-Google-Smtp-Source: APXvYqwW09JatGavk0kfkKK3QI+iY3OiKQCr/aYkFwqWsgEoBB3fJbciAsuTmwz4Yh3rFxMBDCYTQA==
X-Received: by 2002:a1c:a7ca:: with SMTP id q193mr60560wme.150.1561042826032;
        Thu, 20 Jun 2019 08:00:26 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 08:00:25 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT 05/14] soc: amlogic: meson-clk-measure: protect measure with a mutex
Date:   Thu, 20 Jun 2019 17:00:04 +0200
Message-Id: <20190620150013.13462-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to protect clock measuring when multiple process asks for
a mesure, protect the main measure function with mutexes.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 19d4cbc93a17..c470e24f1dfa 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -11,6 +11,8 @@
 #include <linux/debugfs.h>
 #include <linux/regmap.h>
 
+static DEFINE_MUTEX(measure_lock);
+
 #define MSR_CLK_DUTY		0x0
 #define MSR_CLK_REG0		0x4
 #define MSR_CLK_REG1		0x8
@@ -360,6 +362,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	unsigned int val;
 	int ret;
 
+	ret = mutex_lock_interruptible(&measure_lock);
+	if (ret)
+		return ret;
+
 	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
 
 	/* Set measurement duration */
@@ -377,8 +383,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 
 	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
 				       val, !(val & MSR_BUSY), 10, 10000);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&measure_lock);
 		return ret;
+	}
 
 	/* Disable */
 	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
@@ -386,6 +394,8 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
 	/* Get the value in multiple of gate time counts */
 	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
 
+	mutex_unlock(&measure_lock);
+
 	if (val >= MSR_VAL_MASK)
 		return -EINVAL;
 
-- 
2.21.0

