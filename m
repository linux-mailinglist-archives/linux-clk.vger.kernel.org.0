Return-Path: <linux-clk+bounces-3006-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF883FA7F
	for <lists+linux-clk@lfdr.de>; Sun, 28 Jan 2024 23:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE96EB21CD0
	for <lists+linux-clk@lfdr.de>; Sun, 28 Jan 2024 22:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BAE4EB47;
	Sun, 28 Jan 2024 22:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="stNZrCMw"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19AB4CE18
	for <linux-clk@vger.kernel.org>; Sun, 28 Jan 2024 22:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706482371; cv=none; b=dTtuRj+uFJM4S+u/ULzELQYULMQloTV+xSowH6kNbE76d/egUIlvRMzYisUCHxKBRz5C7gB0kfXLNxwt1kUrH59+WKPed0zFvTRCXQqgR2B3WW3Gq5o+4k4PGk4nSK33MPK5fZGOXsBFV5dCycBbmb/EbOJ2NhXAwHggELAyST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706482371; c=relaxed/simple;
	bh=MFwMHCciCr3tYy66HerqfKHLryxInNGU4q5BCDEwKWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYWnQYhPgxZBjlCENoGa/fLKhdQcIBB+5yLvqM1HAZOYqARp79KvUDgRxPiw4dRJzFxVRxEboyvx1Mh4AJPYIIQpbbwyliuWWBbD5XpEO9PPZRjjjnwgqeqMEnCgxhIqRs+mBGeae2HkGXC+0OHT5ds1klUV99ph7PJvGrct0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=stNZrCMw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3542a3374bso162667166b.2
        for <linux-clk@vger.kernel.org>; Sun, 28 Jan 2024 14:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706482368; x=1707087168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVNXxg+9nL5wJKIK1np/vV0mTD7W9fQ7IDNoTCiFtT4=;
        b=stNZrCMwhD770c02I4B//Dt9RuOm4UHYwwvhAGEnw9K5nXGjqkzg6n64a9vJRb4txi
         rJC+GLZ2IUyhHoAcp2mTvbzP6t04eusoi55z5NoC0Z+DXxY5fxlHzrdjmpoS67C+m3NY
         HlVIEwkhX668Dlq1t0wAFhGmTy0wTOP/H5EFxgElOeP9xVCp/PC/35q/LHrKoooDNj4k
         er7JjXS+c21k518VU74e1+mPp3DeNR61gN8VMkfS4xb7lD+4bbC84aJKXd2l333Iw+Vi
         YEkAFh+MvfXLX/DfIt1Q5OPFIw+aAAIskXKYo0xT+hPgRWrPw3blLLiwRq5jmOQujH/G
         4J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706482368; x=1707087168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVNXxg+9nL5wJKIK1np/vV0mTD7W9fQ7IDNoTCiFtT4=;
        b=ncIET5an2O0RbfDTW0U0MBR9HiSdrmJNmX7aORUDE2dPYp1nmpYNZ4kgGOlXCwyRfr
         JAsLQE/3hufmEMxRS7gcKbtkGd6RuPbgvDnY2ztP8OhSNVjkb0h8s+tmOWkfKZFwk07N
         04bnaxqrKymftMHeHInpUy/eeESwsSAVhzB56WUIvCg9ejCPFrrihbfURLJzN/CEKJZW
         dTzL2cPc9m+2QN1+sfkgKJ/G6fcdDuJ++W2568GWszhIZZerW42lKzsHLVHddHgGONRt
         4rC0o/V1AhHNtHvgqFk4hbFmewin4RyHV34Ru5WVbBLNsJ4nxPMSbsaQZDuqnZU6jgs5
         P/Xw==
X-Gm-Message-State: AOJu0YwI5//bQjjYd+CHXNqMPLsL2vnOeuWnFzXZ4hFoNeKZx1jIIRMv
	ycf4ieRcwIKHVLcqYwthe4/Od+kVEgxrBiHgoDz4v94sUlDMK01YLMLKeEZA5jw=
X-Google-Smtp-Source: AGHT+IH8tWollI9sPewjS/EgpUkHWIn8KikZL4SFAVU7pJB0NaHxToAzHSnhteYhtHxb0Rk/JIosgA==
X-Received: by 2002:a17:906:f2d6:b0:a31:5941:4f7 with SMTP id gz22-20020a170906f2d600b00a31594104f7mr3152771ejb.39.1706482368076;
        Sun, 28 Jan 2024 14:52:48 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id k11-20020a1709061c0b00b00a30cd599285sm3259996ejg.223.2024.01.28.14.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 14:52:47 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 00:52:19 +0200
Subject: [PATCH v3 06/10] clk: qcom: clk-alpha-pll: Add support for zonda
 ole pll configure
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-clock-controllers-v3-6-d96dacfed104@linaro.org>
References: <20240129-x1e80100-clock-controllers-v3-0-d96dacfed104@linaro.org>
In-Reply-To: <20240129-x1e80100-clock-controllers-v3-0-d96dacfed104@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3693; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=pUaL0S9mlmI81sPMJsRfFAirIeeYUm7HXjGy1jinNxQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlttqvV1vebhb4xSO8ZPRYHZm5eydbrUBKGLSiY
 NPUodtszSyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbbarwAKCRAbX0TJAJUV
 VqbMEACUNCtQRGoP/DbbszMEtXIFbsvjUaFLyhkE1sqzGkE5O9SCED4yWhzMKsVZiaVAOh6WlYD
 XN/WxOfbWVk6dAmIAB4WQQsmvaS9yY9ixfR3v8S29YaH5aFUmtGr7FDS3J/QB5cy6SKn4REKZKx
 yi67KnCOwLCx1fAEiqMxslhgGkX2G0ZGCDXT4TMDtlGMF3JKdBlH02cipubajvb6B6Mk2z41EeM
 h9UcETAPq2WxZzc06dq82n1qvx7MBNdfSs66TuxSbWnvAAKahMcMUKqf+7fnSPM+FxJ4tSm5jre
 3MTCDkAuWt6jJo2WC1bP8Kkdbi5A53eNIRyKJ4FBK1St69WV93mLclJ/FdCphQJRKnOGzgu+wJ2
 3FWGY2rpuQNuDwHppvnNB52tx95uXTu05TpmfwsM7pPNUWMP6jr0PDchWoauoSYjxBeSAI/f/uO
 8HwUGYsz/TemyGYMaOpOMdPyKjANlarVquA2QDTPg6mRCfDMH3s9ENBpM3ctH6eoLKAAO4xL6QV
 +Kf+y2Ol6/QkJ7RAoculcKMTzP8EsRsJfSuPz3Bc/QxC6fPobHlRu7HgxrWgieMfKMKB/ZHXyHe
 kmmiuEh5q0ep+u2s5W88tZenCKzHzB5ycmOH6nyv7b3iFuswtXaYlBIHZAA0hhvByt7Q10YHqV3
 EBbUuJt4cGHup6A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

From: Rajendra Nayak <quic_rjendra@quicinc.com>

Zonda ole pll has as extra PLL_OFF_CONFIG_CTL_U2 register, hence add
support for it.

Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 26 ++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 05898d2a8b22..85f8e2ad0b37 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -52,6 +52,7 @@
 #define PLL_CONFIG_CTL(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL])
 #define PLL_CONFIG_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U])
 #define PLL_CONFIG_CTL_U1(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U1])
+#define PLL_CONFIG_CTL_U2(p)	((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U2])
 #define PLL_TEST_CTL(p)		((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
 #define PLL_TEST_CTL_U(p)	((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
 #define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
@@ -228,6 +229,21 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_ALPHA_VAL] = 0x24,
 		[PLL_OFF_ALPHA_VAL_U] = 0x28,
 	},
+	[CLK_ALPHA_PLL_TYPE_ZONDA_OLE] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_ALPHA_VAL] = 0x08,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_USER_CTL_U] = 0x10,
+		[PLL_OFF_CONFIG_CTL] = 0x14,
+		[PLL_OFF_CONFIG_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U2] = 0x20,
+		[PLL_OFF_TEST_CTL] = 0x24,
+		[PLL_OFF_TEST_CTL_U] = 0x28,
+		[PLL_OFF_TEST_CTL_U1] = 0x2c,
+		[PLL_OFF_OPMODE] = 0x30,
+		[PLL_OFF_STATUS] = 0x3c,
+	},
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
@@ -2093,6 +2109,16 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 
+const struct clk_ops clk_alpha_pll_zonda_ole_ops = {
+	.enable = clk_zonda_pll_enable,
+	.disable = clk_zonda_pll_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_trion_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = clk_zonda_pll_set_rate,
+};
+EXPORT_SYMBOL(clk_alpha_pll_zonda_ole_ops);
+
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index a1a75bb12fe8..99a3db9de4a1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -21,6 +21,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
+	CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
@@ -42,6 +43,7 @@ enum {
 	PLL_OFF_CONFIG_CTL,
 	PLL_OFF_CONFIG_CTL_U,
 	PLL_OFF_CONFIG_CTL_U1,
+	PLL_OFF_CONFIG_CTL_U2,
 	PLL_OFF_TEST_CTL,
 	PLL_OFF_TEST_CTL_U,
 	PLL_OFF_TEST_CTL_U1,
@@ -119,6 +121,7 @@ struct alpha_pll_config {
 	u32 config_ctl_val;
 	u32 config_ctl_hi_val;
 	u32 config_ctl_hi1_val;
+	u32 config_ctl_hi2_val;
 	u32 user_ctl_val;
 	u32 user_ctl_hi_val;
 	u32 user_ctl_hi1_val;
@@ -173,6 +176,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
 
 extern const struct clk_ops clk_alpha_pll_zonda_ops;
 #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
+extern const struct clk_ops clk_alpha_pll_zonda_ole_ops;
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;

-- 
2.34.1


