Return-Path: <linux-clk+bounces-13855-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 279089B1977
	for <lists+linux-clk@lfdr.de>; Sat, 26 Oct 2024 17:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47A0F1C20F5C
	for <lists+linux-clk@lfdr.de>; Sat, 26 Oct 2024 15:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7292D05E;
	Sat, 26 Oct 2024 15:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R3akHMfK"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA2E1D6DCC
	for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 15:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729957640; cv=none; b=dU8D3turPN9bJSrolszTiXVx/yN6IeTu4kQc/6l4DdCzoaFydPRQJs6Fggb3mMRXmb5odqN7Y0ukhuSN+mJLAVIoE/Tn+dFmjFd8mHlGDu7DD1F7OPSC0GqdWueaSLO/JbdWzlEnU9/oJLWPCyAsKdsaa9v9M7c55JebW9LX9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729957640; c=relaxed/simple;
	bh=DWgkCUleQv61cF52XKRC6NW3EAFyFKJ2O9J1+CznBwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nsGWEoCxqEAos9AsfSyru7VwUMyJ6XDcODTOrwP0YTYKk9ceVJ/q/+CR/0XzgLrXHnaIPrH2utQ/Z4cBwg82T/2yEvt2C/F89qQGuL0IFvMRFO+pMJlnwHif/tOM4C3DrlfzVfY9tNHkyP7TjgEI21AH3OgugqHbpBfXdqPDIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R3akHMfK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e8607c2aso3225095e87.3
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 08:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729957636; x=1730562436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWbqeFeatJwTSwfIbMsvs+JYctmC6KE3I7fU3fJLjdw=;
        b=R3akHMfK9AUBKtwJf689FKMC/32OmRQ7muHGTGL01jdo9sD6kQXnCpCIMLPKR2c3OQ
         RVZKoLxD+yeYP6jkq4G9sXW1fN2gU8kJUjFqYSa6ei0BUgpdw0mEeJThNPF47b3NULj5
         Cp5vh49Wykgl60mllLJYPpvv7zoE82zliiwQNk+52N4Dz09wmc6AYe9WB2JU85k1rc4U
         Pw/SDiIo8+FzWMvn6UvPXC3igjKAgw233SBdqrgZajRU11u1Vd26cIeSpBYhXSB96Dz3
         g0Kwr328J1C59XtxWy6H3dYk7uuH5X6yXzjL+ETJgaauirLbl7QDv4CRMn+X5xXOGT2c
         dRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729957636; x=1730562436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWbqeFeatJwTSwfIbMsvs+JYctmC6KE3I7fU3fJLjdw=;
        b=M0/PR+gxWJKmSjibXJ2tE0BHP6/zMye2hoD54b2v25t/iQO/HxudfRSHFuOM0A1wFV
         DO99Dbt3Mar8axeaTueHfY9asObrkSlwLWgd446E33diKc0GaNmjHr22EBYe2E2VwCw0
         tltutR5BiItOm0HbXWGoTh4LUdBoKLiHKfVDF5FtxVqwuD4PNPtiy7vu4q+2vG2L7Sa3
         f4Agvr4Ik8II/2affZTXsN7nRWQ7feGuHu71pDruuFcd8Ynf9PbdW6PvvUEoiL5rYQ8b
         wOzPcnPWQWuuDGW6gf9GB8DcjPd7vYDvF2d1wCYr422pY9bKQTzc5zU2dc47neBQ8Kc4
         Gf8A==
X-Forwarded-Encrypted: i=1; AJvYcCW3hLu6QuNUvVRWvwy1Iz2t55H5MNU9FXv5yaXBHZA8mRik/usqXVgfesoWVYtCAXC1D/L5nNBDmgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo0Yfv6zpE28w9QHG2ASsedieLaCE3J25bUdlGdfrawPXFW9c1
	MO6K7ce73vHF+xlyK23MfNpjiPRgDTBVIC/I7e3hDknk0obLXC9U9pgmiE47Cxs=
X-Google-Smtp-Source: AGHT+IE6i7CSybN5gUWzFj6/0VyeRzDipnfXS930jjM1qudoiBVERghhchTrByBIRt4dm9S4QTKLjA==
X-Received: by 2002:a05:6512:230d:b0:539:8df0:4d45 with SMTP id 2adb3069b0e04-53b3491cb0cmr1148014e87.38.1729957636045;
        Sat, 26 Oct 2024 08:47:16 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c7cf4sm532188e87.184.2024.10.26.08.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 08:47:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Oct 2024 18:47:04 +0300
Subject: [PATCH v4 06/11] clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-sar2130p-clocks-v4-6-37100d40fadc@linaro.org>
References: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
In-Reply-To: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DWgkCUleQv61cF52XKRC6NW3EAFyFKJ2O9J1+CznBwg=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHQ73KLFFylh/qubDEYZzLJrmI6t6eB5YlJfcI
 x5D3BQGzuGJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx0O9wAKCRAU23LtvoBl
 uPl+EAC7nKI4uK6vIRMdkL6ZKxDNviGSEuUd4oE/T8Aiavbc0J+0wi4PPj7hBe1fgleQQ3i6aJY
 O86qnLjUwdTR3yc4ZsVHiyf0rivoUxPi4LupxA0FgsSVbjoC+7q+xUgnekigzH0GzvYQ4aNQ9YZ
 N8u/vKvPMqsZN7BGbI8BKk1mnRtiPQgFPZFGpX1U8IOR4FwsGcua/LDmYk1Vqhi80XOESxLJ4Qa
 1su29XMKgPGEADXDklRr8YQIgu8aul6kkv5Iip3eLIQTd8+CObKyNoSk2oatu4zugr5Z9mdq8GY
 ArlaGQQhLSP4Ot+mQAwjRH5RzYA7ezHPh8oD35leccTjc+HychM6hTqRc+u+YsFRSKerTeP8de8
 /AaPz73vgeePHCvr53G+wO8EMEa1kysf35Y7VLLI9Y4kEnnNJaYnZwdtnYG/AI0XMWI6ELyFuDF
 l7a/TqAzh4LxAD95y/dOssuof+LmgQmxCZPlJrYbqCSvGdChswjF5XAaPeLXDv7r8YCEiDqjW6j
 sHw870nX2CK1yFC3E4Car3vQzQS6RKxP/Um2PLDu/02H7mjcPpVg3AbNoeTwN/4y9s38XqDLk0Q
 XBxx5LomgUZ3NuZy3dVQ2WGZRpRVVxxLQLxJGTQkgrX73dIlSw3gtl97eQA8iKuP0+4Jznobrdq
 /UGsu11z5Sca2iQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Generally SDCC clocks use clk_rcg2_floor_ops, however on SAR2130P
platform it's recommended to use rcg2_shared_ops for all Root Clock
Generators to park them instead of disabling. Implement a mix of those,
clk_rcg2_shared_floor_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 48 ++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 8e0f3372dc7a8373d405ef38e3d5c747a6d51383..80f1f4fcd52a68d8da15e3e1405703b6ddc23421 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_shared_floor_ops;
 extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
 
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f006724b447bb0d9b11889d316cb6d0..bf6406f5279a4c75c0a42534c15e9884e4965c00 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1186,15 +1186,23 @@ clk_rcg2_shared_force_enable_clear(struct clk_hw *hw, const struct freq_tbl *f)
 	return clk_rcg2_clear_force_enable(hw);
 }
 
-static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long parent_rate)
+static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate,
+				      enum freq_policy policy)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(rcg->freq_tbl, rate);
-	if (!f)
+	switch (policy) {
+	case FLOOR:
+		f = qcom_find_freq_floor(rcg->freq_tbl, rate);
+		break;
+	case CEIL:
+		f = qcom_find_freq(rcg->freq_tbl, rate);
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	/*
 	 * In case clock is disabled, update the M, N and D registers, cache
@@ -1207,10 +1215,28 @@ static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
 	return clk_rcg2_shared_force_enable_clear(hw, f);
 }
 
+static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
 static int clk_rcg2_shared_set_rate_and_parent(struct clk_hw *hw,
 		unsigned long rate, unsigned long parent_rate, u8 index)
 {
-	return clk_rcg2_shared_set_rate(hw, rate, parent_rate);
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
+static int clk_rcg2_shared_set_floor_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
+}
+
+static int clk_rcg2_shared_set_floor_rate_and_parent(struct clk_hw *hw,
+		unsigned long rate, unsigned long parent_rate, u8 index)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
 }
 
 static int clk_rcg2_shared_enable(struct clk_hw *hw)
@@ -1348,6 +1374,18 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+const struct clk_ops clk_rcg2_shared_floor_ops = {
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_floor_rate,
+	.set_rate = clk_rcg2_shared_set_floor_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_floor_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_floor_ops);
+
 static int clk_rcg2_shared_no_init_park(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);

-- 
2.39.5


