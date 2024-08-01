Return-Path: <linux-clk+bounces-10288-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8F944FCB
	for <lists+linux-clk@lfdr.de>; Thu,  1 Aug 2024 17:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FF4F1F217D1
	for <lists+linux-clk@lfdr.de>; Thu,  1 Aug 2024 15:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAAA1B4C2A;
	Thu,  1 Aug 2024 15:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="lGNXsfes"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3632D1B3F05
	for <linux-clk@vger.kernel.org>; Thu,  1 Aug 2024 15:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722527945; cv=none; b=Rs2kpsDWbQR0upVWWVzaEeSHuwMZBCxLl2+ClGLCI/zRla+6WJO4ArjYPEn3zCVF7344cROK7KRqIuyI22S+M1EaF74ApCPhaiQgDJY85LSsc0BxMhEvyzWgaRipeQA5xNskal0Ij2y1rtlDNhCOJU4SyeGm0GNHrf6f/OrT6UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722527945; c=relaxed/simple;
	bh=Y8NzZ+2cCsBdUZUcYmx75X5l8PF6dYCbeZPYmVZ3FCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IG7pZKNsj2bkxV3kqtlCemCN/7EcaXk+C/IcMLL3QnCug9D8w/GzWGjt3IDlkR94RcMBuvVjZNUBUp98dLz0cZN0Q4A3otGWt0psxw9i/YgTE63HoCrbIU1jkjkW2ayBSs1dD3CdzP8/KpSRmvFdEnCmb9Z+Qy3lqMwGn5EBg/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=lGNXsfes; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f035ae0fe0so83150371fa.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Aug 2024 08:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722527941; x=1723132741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHstomqT0M/TXt45tukB029xYZE9aj0TxyTgGXluxnA=;
        b=lGNXsfes2Rk1yj37UdOM54z5bGweW10WyYVqws2XLvt7TQIRsm0bm94Jc9HK1ijO5X
         YP769e+bVOpQKJSZMfguyuegez99uueyGsj7/ghmct8u/OZolAMqrYK2/84DbViZeNH1
         UVFesrne/ePa/uOx9yJKfZXktoWbGNVqyQ0tHQjtPD/caEk4e9p1aBVjS12+bqYSaZVM
         ALVvQpGmMoDH931VO5qnHYodPqDdDs5+L78hTlhSvqQy3wPgCkOxAFAV0gxsl/idXo74
         p6KD65C8swZGo4AnpCwFtrdLgVJm3Mirjvg9/jFlowk2Hi0AkEfwlSrMm18heqaMf6ry
         nniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527941; x=1723132741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHstomqT0M/TXt45tukB029xYZE9aj0TxyTgGXluxnA=;
        b=AM0kGM/AvAMRXa2i60JxIEZqu1m5Lg5FFSn7JWDxrvhoF4sLyYyjYsxKLzFXUz0Li0
         l016YZxMFa0ILv/hl6ip0yo/7BkMrJdDYAfJuPwSYRcY/xiJbt15tXRifxEcj1LOdYTI
         k7BRCVhPXDzX0iiOlUxoJ9kZS0rHMijbQi0VlXX4XxtOoIqJNn+fLk5XBPYory2ZOXED
         oiU66tbIyX5ue+nWYcv7FLwa67GgCLb9sryEGOsT+8IFZwzwPiWIuz/U89Kg2dIcWMl9
         YZHj0hmzao+6E4rAR6fnmkigaxi1cqQDCWnf4+IaaJ6AxChMilkBZ45BsHab4lmGpuOL
         5d6A==
X-Gm-Message-State: AOJu0YzLhKWdvPXtGjznzRpIgvDR5HdfeUmSmenzn7Qr4izTm0GsAgA0
	25Bt3BMbdpSAQEX3rJ7/JTv2ASdbfjABXxVTJIjquFlnFF1zqYBId5Qgj+239QE=
X-Google-Smtp-Source: AGHT+IGHsHKzDK+INUytauc7w93lMmXusnl27xUxv3I2sd6nW4vMVIbrfIHDRMeA89WgfhaKfNhTNw==
X-Received: by 2002:a05:651c:c6:b0:2ef:1f10:e277 with SMTP id 38308e7fff4ca-2f15ab0bfe0mr4776971fa.34.1722527941161;
        Thu, 01 Aug 2024 08:59:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9895:bf13:f4de:f316])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e7d615sm1393875e9.29.2024.08.01.08.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:59:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 01 Aug 2024 17:58:49 +0200
Subject: [PATCH RFC 1/2] clk: provide
 devm_clk_get_optional_enabled_with_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240801-clk-new-helper-v1-1-81e9338b7b17@linaro.org>
References: <20240801-clk-new-helper-v1-0-81e9338b7b17@linaro.org>
In-Reply-To: <20240801-clk-new-helper-v1-0-81e9338b7b17@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3013;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZL/W72WhtKWlXQ3YfSXI2WBmEaie9uQcs/Yqqq5I764=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmq7DDIT7m5tdjMs5UvtI1BL78YM4BsLZCNjr8n
 OTRxHZN/U6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZquwwwAKCRARpy6gFHHX
 chUbEACegEoh/MQrCD3UG4dxKZMJk9n9v8hm/iPG3wDDf9N4ZPMyqrq5cM/Afy/BM0TrAYy9qud
 EjPkNrtuOHZBetaJt4aq4z1gfIf/gkvS1cy8U9edb0pJa8IydfVIgo2c/JOloPNzxrAm4Z5nT8g
 jSBnNdN0t+bhx4QNNc0uzbPo+TPlAO9wKpjWFkrOr/h1vPzwDe8hw5mWABvl/1GlGXJJJz2ebpU
 vETZc5dayYIU8WdEwKIP0yA2rwqFsiXbese7LMlkuaS9b3icjMdwMHv9ziKTJC9Fp9+aTASYbAe
 QI/uMCa+upQwT4TYxmnd6JZus/whd8ocr0XIHlY7pHD3Kb/jlNEXAMKpLo01HgT85jWXS1xuOaC
 JEnbH+I1nTGpRpnqIO4gfN0Z/5HmJ3WrzCz2QEvOahtC2d5QL7ZFYvjZIgZOfs/1/tx1uC1UoG8
 9Fp5VDpvLjA/RvSzng4/8xZOzIgxRVEt0Ohu88H9hqb1gmP2p2GUbobSx+3K3NdFm1a4p08yqwH
 QV+OkFxoUKTlrkgUwN3wRbD13TAHvUDW9ca0wJojJ1Jih5Iq3QYZmORiwHz0LrmjroB7nB5NUSF
 7l4OVnGc1UmOHEH6WUA7iEbcTe95PizvnzrhlRpplw5c+5W+cK+DMdr1gO9dhGkKFU2LNyuR36k
 bR0Dwfk0B83ix8Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are clock users in the kernel that can't use
devm_clk_get_optional_enabled() as they need to set rate after getting
the clock and before enabling it. Provide a managed helper that wraps
these operations in the correct order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/clk/clk-devres.c | 28 ++++++++++++++++++++++++++++
 include/linux/clk.h      | 26 ++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 90e6078fb6e1..34e800525e21 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -99,6 +99,34 @@ struct clk *devm_clk_get_optional_enabled(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL_GPL(devm_clk_get_optional_enabled);
 
+struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
+						    const char *id,
+						    unsigned long rate)
+{
+	struct clk *clk;
+	int ret;
+
+	clk = __devm_clk_get(dev, id, clk_get_optional, NULL,
+			     clk_disable_unprepare);
+	if (IS_ERR(clk))
+		return ERR_CAST(clk);
+
+	ret = clk_set_rate(clk, rate);
+	if (ret)
+		goto out_put_clk;
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		goto out_put_clk;
+
+	return clk;
+
+out_put_clk:
+	devm_clk_put(dev, clk);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(devm_clk_get_optional_enabled_with_rate);
+
 struct clk_bulk_devres {
 	struct clk_bulk_data *clks;
 	int num_clks;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 0fa56d672532..c8d237e9b8d4 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -640,6 +640,32 @@ struct clk *devm_clk_get_optional_prepared(struct device *dev, const char *id);
  */
 struct clk *devm_clk_get_optional_enabled(struct device *dev, const char *id);
 
+/**
+ * devm_clk_get_optional_enabled_with_rate - devm_clk_get_optional() +
+ *                                           clk_set_rate() +
+ *                                           clk_prepare_enable()
+ * @dev: device for clock "consumer"
+ * @id: clock consumer ID
+ * @rate: new clock rate
+ *
+ * Context: May sleep.
+ *
+ * Return: a struct clk corresponding to the clock producer, or
+ * valid IS_ERR() condition containing errno.  The implementation
+ * uses @dev and @id to determine the clock consumer, and thereby
+ * the clock producer.  If no such clk is found, it returns NULL
+ * which serves as a dummy clk.  That's the only difference compared
+ * to devm_clk_get_enabled().
+ *
+ * The returned clk (if valid) is prepared and enabled and rate was set.
+ *
+ * The clock will automatically be disabled, unprepared and freed
+ * when the device is unbound from the bus.
+ */
+struct clk *devm_clk_get_optional_enabled_with_rate(struct device *dev,
+						    const char *id,
+						    unsigned long rate);
+
 /**
  * devm_get_clk_from_child - lookup and obtain a managed reference to a
  *			     clock producer from child node.

-- 
2.43.0


