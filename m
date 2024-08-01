Return-Path: <linux-clk+bounces-10289-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B37944FCD
	for <lists+linux-clk@lfdr.de>; Thu,  1 Aug 2024 17:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74A461F221C1
	for <lists+linux-clk@lfdr.de>; Thu,  1 Aug 2024 15:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5E11B4C2E;
	Thu,  1 Aug 2024 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qOVvoYSj"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1071B3F29
	for <linux-clk@vger.kernel.org>; Thu,  1 Aug 2024 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722527946; cv=none; b=IAsjiYv5qujtGF2dIAXEcX1iILrMunK2FTHi4kysD3kjiJOdkX5HZqzf5OcYkAXnksfpCWqcWOKxBsVcnOFx2Yso4r1IjfDjl9FvW6VsqLxILJx9X52AStUQ7up0YK1JgW7M2u0rNPLV5HMaTPb7KZINjJINlKWpu3U0nLGWcOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722527946; c=relaxed/simple;
	bh=Omcj2xWQwt6NtgOQkDGWvmMiPdAy1FRwJRfuq8HYeCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KnxCu6u+PaHMvD9r3r8i+9quEjEB+FQ2ht7+L2jcHN4FLKwHPAdC9qEeKuhOASCjO8zONCKenkrgqJ/dhvWJe0QJe0WY1GccKhNX3NLRAfww7MZTz653U7Q6GyxvF7Edh/c9PJcxaEncluGPHVDTxHqKbP+9RtwF9bUfyp8nPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qOVvoYSj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42808071810so47433325e9.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Aug 2024 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722527943; x=1723132743; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m5i/CoqWPo0A33bWnp2WK+u0zZkl20goXzr8vooyPLw=;
        b=qOVvoYSjDY+qN0ew3Vh1ST5RHysrvq14/pXzEceygec6tohb5ojFI/HVWzAph3tv0k
         cXsy8khrctnna4QydcBzg8DLNgXzqwGXh8oAqnHsr8TNheSEhuSnE64MiTzEQ4ADS43l
         q/loIJA9x2zWxHJpiTUdanmo3vGPpsulRtglvMLTQvT99ArqhFZJGK/qV9M42RXLn6Ga
         zm6lhDFp0A0LH2A+cUpV9d0O5o25BzuOva35zajI5um2do1xj48ZFaIoe1v6JtmPfleP
         GTaGdeY/k2eD/O3PnYwZp+8DwBuwoMNZoWukvncNoXEWo+xUJsxVhNOkcH6/dhZ3zEW8
         Fzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722527943; x=1723132743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m5i/CoqWPo0A33bWnp2WK+u0zZkl20goXzr8vooyPLw=;
        b=lJmNLse6fSrrsxqLqb041NlqGKilasJMkjEKJeL5QLB+q4r6Ry5JMxj4zeeRtEb0/j
         tsyshMeLGFBfbgvnX6dp/NllXmKwgDsclXcxFQhtpZwEpFWhFS6RQMsnZQqbQWVz+PiI
         cUaaCeklWT6JRNlhiTrFJgSk6hAQJFdGAxV/qX574P38KxXVqfTiQFdJhKrNZZsG9VTB
         J9s3fiDtXPIjyQKG4VWP3ycSZOaZ9EqdVS0wCYVA6oViIfmJIWHLBGjI88mnwlOr7xj0
         k8+7ktWcKuVEYKRs9z0V7GONuf/sxwvXzx2Ff7ki3epH8GmK2aaPWrnPVV5gQl0HAnhj
         Fx7A==
X-Gm-Message-State: AOJu0YwOAesqP5oWwIb41Z0CMN4uWvcNfi1kZnNbSwEzNwDlsSCh9UQh
	SnRpIbHLalYHPoV4QnhW1aD2bmXwkko7blAb3WjiG/rU9wvI9vPnbr9t1/xpC7Y=
X-Google-Smtp-Source: AGHT+IFIRyYV8wMpFEMoJ9mEI29GrIsoNHi74Ep547kloryWVfmLguZuTbUrIBagLig+4xgxpoADpw==
X-Received: by 2002:a05:600c:458b:b0:428:1dac:1890 with SMTP id 5b1f17b1804b1-428e6b9388fmr2368255e9.32.1722527942515;
        Thu, 01 Aug 2024 08:59:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:9895:bf13:f4de:f316])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e6e7d615sm1393875e9.29.2024.08.01.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:59:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 01 Aug 2024 17:58:50 +0200
Subject: [PATCH RFC 2/2] Bluetooth: hci_qca: use
 devm_clk_get_optional_enabled_with_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240801-clk-new-helper-v1-2-81e9338b7b17@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=P/Xbs1jF3li1v+zlwL+edbl5plqFHRk4jCw7biA6/os=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmq7DDH3C6eXuOAHHcbUdtceaK1dhjfbYwCeF7r
 5U3Y6TxXHSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZquwwwAKCRARpy6gFHHX
 ci4iD/4qInYT/hTR/ISAtD63aPZ6kdsTJ0DRSJT1AaffUMNUj26XEXUOhPxWGgPFeNMD/ySusmV
 1cbkeJIPVaGTfRstR7tP8dGrlTeL5sspUUYv8NWqXKzH0qq54SZO7ZCqKTEbenqdGqxo1gdadcK
 +TOeLfkzGsEzhO1n9USOt9X2php2JnrO/rMgKEdJuNpbeP6fGof+mhKkgw9CjW/Rvm4s95DlZn3
 22sOnAv8qdnX/uwZRudiR8/h0GSLSinxVBrsoSKjMQgC2epKVtGv+0QrNDab3nHUNVgUaCs/MqS
 BE0bAvaJrJwIgSDyYrmbCnxj89A2IwfV1IdRbUmO1VfwOFzeyPBLIBOjpcibJtkWZI4wtXdf/oB
 HL7h497eRfDbcsynrcK8JpqLaZ9+1dHkbq8dLVd4xI9/MM/xFgCPT4eCfrYMiolWYVJS9Ycrwst
 d7hMiSK1pszU4ho2GcwjZfI/0kSHFtGa8qEtND3EvF/2ipjeFv1hTk8sRpEU+O7WW97U7z1LgeA
 92WqlNz8JuODFgDdxTpaBN1QapJKVJiPukJXWRoUV3U1ILqIF2+V7VlnVxc6x8N3LY3EoW1BH7l
 TvWsQi4cG7fm9TQu7mJZobBcAvYfg15CZsFyTFBzOMoN7KGUZeIw91L6N5inFg1LPK03SaoKUb1
 zp3wa/Fo1LdxacQ==
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
index ca6466676902..0670f527909c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2297,13 +2297,6 @@ static int qca_init_regulators(struct qca_power *qca,
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
@@ -2433,25 +2426,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
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


