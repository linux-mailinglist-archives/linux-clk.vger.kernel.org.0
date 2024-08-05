Return-Path: <linux-clk+bounces-10414-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE79477CA
	for <lists+linux-clk@lfdr.de>; Mon,  5 Aug 2024 11:00:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 330E71F22535
	for <lists+linux-clk@lfdr.de>; Mon,  5 Aug 2024 09:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD04E155A34;
	Mon,  5 Aug 2024 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="d79wxPw3"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F9D155733
	for <linux-clk@vger.kernel.org>; Mon,  5 Aug 2024 08:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848266; cv=none; b=SEcE7cmj/YXDLRj50GlQZNlbGQTAl0Hi0e7il8XN6H6NJYEVpoL3pclGxGyGbqEeomeoR5DJgrMgnn+O3tYN1ts/AEL+TZNJ+8k9hgPWUxDjCoA6lkwjBp46kTVZB6vHjmQtx2zCKZQ2Nr8X4bVDur/9PVvflk1L+LjCMu7F0ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848266; c=relaxed/simple;
	bh=36NnOLplO77djyzlvXQnVzouJ7TT3p/GzId2VWjtvKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uKh+FmJjCovmGIazEZmexDFkrvYMKPVq3lYEgdzppJf+g7hE6qea3k5mGv5iydaRCkG7W/uDOO3j+iOkbT3RJPll4DSKYBSgIJcJSNeBnTTb4HHsz98T39FxVGbKrdPLqm2fSUlFYaFXYHRZn9VQlI2fbPvydFBcT8caAubdzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=d79wxPw3; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so151195131fa.0
        for <linux-clk@vger.kernel.org>; Mon, 05 Aug 2024 01:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722848263; x=1723453063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1x43mfYgw7nL6QeZFykXYvWOxjJoouW6Zs1bP+hA8K8=;
        b=d79wxPw36aEErUug9rJKffog0Cnti1MMHBjBjlCM9lnSk1oCVjqr/SQ1Q0I12oSqnT
         p8VbXxvvpdivVxktzWAWNi6z7Uh03bLrXfI8JOyCGbXApdlUfQzetS2D4Ba7TBp3ZgOj
         V+/Sz9DLeVAar37rRe8AGsg/SJZ8n1YLaiFcCg/XBcpbHEOFvWhLImdfAIVsLLpjq/1b
         NccbEP3TvXyYkMOozvC8Z3xOXR0rePS0HPA1YqD6RGTpKTwyvWsJkWub4aQq7tkIXZ8P
         k1M5DiIdvqWoXuPPOvhe1MHtw10fR3Qv/Zdt9ZxyLe+XUK29d6qldKse5yz96dC5awbP
         5Ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722848263; x=1723453063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1x43mfYgw7nL6QeZFykXYvWOxjJoouW6Zs1bP+hA8K8=;
        b=bkYED/05otvT6BJbZCm+jPjm9+FmIvFtd3+baw/duKrFiMhcM3DlXKNZzjxV+tDc1O
         6/8popkGbohvUKnYf5j4b2Mh25VGfCLcwYSfPg8+EXpti9h6bWVSJybydwvmAKfUjNQk
         gF2kfNzZfw760U81nwTssJpuqvNpBGKCFu9yjsvKJ69bZr3stVqmDI4LOn0aSE86hmVR
         2rjplsrvrdDn1vNcyzHBXjM8L90zsiKy+dTNcVDwvuBgwuT+oKHeW6y6YKBX7CnHq5YG
         PckliTIWppcp4Uk+ikhHfQewUbeNuKHu1qtAkVEFJ5ccqUt5ydA9tXPbI24K7OiVeojo
         gPEQ==
X-Gm-Message-State: AOJu0YwH31z2bMA0m4T9GmmLZ+I9n0+J5bA78hljMd92qZJawR2gHREZ
	oJQK0Aj7dKKAmEWBmexzqJvqiXjIJeykUnAdxOPpDJTW/SaVS8WtoKl/TFqGjK8=
X-Google-Smtp-Source: AGHT+IEtHLKv1Mqn5raXFR4VEU4NyPgTFTmTnh/i5twYhcDnQ4t8OK0kgrYcm9UIv7a6WPsjI+ZCyA==
X-Received: by 2002:a2e:a70e:0:b0:2f1:68fb:22ff with SMTP id 38308e7fff4ca-2f168fb244cmr46007531fa.40.1722848262851;
        Mon, 05 Aug 2024 01:57:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb9d786sm190235665e9.44.2024.08.05.01.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 01:57:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 10:57:32 +0200
Subject: [PATCH v2 2/2] Bluetooth: hci_qca: use
 devm_clk_get_optional_enabled_with_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-clk-new-helper-v2-2-e5fdd1e1d729@linaro.org>
References: <20240805-clk-new-helper-v2-0-e5fdd1e1d729@linaro.org>
In-Reply-To: <20240805-clk-new-helper-v2-0-e5fdd1e1d729@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gfW9sB7IaFh6kJb55xtZBjV4gSGbrOIUg13gxXaUtkU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsJQCN3T2vwVhqoe02uzChcgwD5fd76UQWd3cg
 /H/IqVPDqyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrCUAgAKCRARpy6gFHHX
 ct1lD/454at/a/4w2a/E+ep2QikxeJ5g04JrZ6y1qiIbiHaF0se4x9OQJuKFLcK45ChbwAdNc7T
 LsddCtqKQZklOMb/7yupQk+A+PKftOu/1mjbhitI2JiUMH4u+csM/q1UcLISIqYYyZqnKPBWCBF
 A+y7HFbkHS2ic0gsBfK9nvbqXXF1ztM5JdvcrPPoVPgLpfdyXpZcKTUb8nDo7xRsYFraRPyGPSD
 XWICQiqR9Z0exhrI6x7P3ZsJtNNIQWeNRV1z/DK/k6CWVhD2onk27lBZZI01cc/iaOScfQ7E2fl
 ZLNRuvjBs2I+nk7T8x7f0UXIZjm54cTdbug3oqA067+jWOxgvrLftZmdFsCtTP0gfDZwgdwhy5S
 APfADnRCBmeACwMZvVpUCqYnjjw6z1C1zzbiOKBLeQyYFCeto7lXtGXx62PS9N/I6VR1AP0Jboj
 I26ilgfgcA38QN3xllo1SOSB/rb2rP9QgcMFeLez8cB3jTYp0O5xYy4Gvyg4j+O24C0o3fpfEXg
 O+kG5s5XfSvk/Mh9tfUdBI4XlF4ZxlkQcJOhRRoi6TM7gI7c5ptR8G2bh4TrrTGP35N0+9nQSna
 6PsVzQ0omLO7Z8FYtsrNIh9tl0wb9Nz6cYCnk4EXtNiJ9ol38vEhJytCN9E6kLm4kn6uS5pLy/1
 mfqlYqMUNk/0v0w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Use the new devm_clk_get_optional_enabled_with_rate() clock helper to
shrink the code a bit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 45adc1560d94..7bee8102caf8 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2293,13 +2293,6 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
-static void qca_clk_disable_unprepare(void *data)
-{
-	struct clk *clk = data;
-
-	clk_disable_unprepare(clk);
-}
-
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2432,25 +2425,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		if (!qcadev->bt_en)
 			power_ctrl_enabled = false;
 
-		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
+		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
+					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
 		if (IS_ERR(qcadev->susclk)) {
 			dev_warn(&serdev->dev, "failed to acquire clk\n");
 			return PTR_ERR(qcadev->susclk);
 		}
-		err = clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
-		if (err)
-			return err;
-
-		err = clk_prepare_enable(qcadev->susclk);
-		if (err)
-			return err;
-
-		err = devm_add_action_or_reset(&serdev->dev,
-					       qca_clk_disable_unprepare,
-					       qcadev->susclk);
-		if (err)
-			return err;
-
 	}
 	
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);

-- 
2.43.0


