Return-Path: <linux-clk+bounces-2158-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D0F826E6A
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 13:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8539280DF7
	for <lists+linux-clk@lfdr.de>; Mon,  8 Jan 2024 12:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB6753E35;
	Mon,  8 Jan 2024 12:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q2ID4Rxz"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9592453E3A
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-555f95cc2e4so1917057a12.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 04:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717167; x=1705321967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=es3sIhlGDf1CuQlkkc00Zg/vTP/uCDGZfoPs9xEXbjI=;
        b=Q2ID4RxzZ6T6ylVPGYVLhBhURr2F/lPM5rRIX/jYlh+Qyxp3Pi9u3N60Ljuj3Qti/A
         qNAqD1dQV046c6E7fPOL3ECv1QZgvll8hoDHsdDTulWiuRLMSB/czU8xj1kPWCzxYsfl
         9tLAd+nZuCtwn68pJUC2CIRcLtXEK5UpiA9gIdbpW3ef9Mq4MfeTTglkDoObm7hgWj7z
         aPof2ZNlOHYnD0cKtI/IySdVsSQBMifHiDYkps8HSMXgqE5qWtHCQ8GDPuHDHmeZbzZu
         Bqh7/FCvWJijjIcH3aWqEcKC49wyw4fsRcQoI29P239TtBV++dXYorGppzC8b029UNSA
         aG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717167; x=1705321967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=es3sIhlGDf1CuQlkkc00Zg/vTP/uCDGZfoPs9xEXbjI=;
        b=LlcZcotTmlrPOSaquonbcZ3NWs6EX55V7ZNsBItk7MCsl7b5XIcUluWzJTvwzgvqJ9
         M5Po25ZgQvIPo5Lt8CguDJU9+y/kO0VxCgNN0CXHrUMp9RYiImwtBA4pVuiMXlSCHc5Y
         cLIwLWxqLtPW1X4uoRjzsyvnCfKVvwhKwurqQsLgmSQwQeI8sc11VMxIuypMMm99NJdG
         RCIrGQs2sJSJqW/G2eotiW2/DxuOwiHsGJPMiDKqy8FJZo2s2sPxXoizidlx43/xc0VZ
         JwvbdsmBS7iBOqG0ncOGN569hpVPmCOxSaEM1M1iMEnWekGlNjqAk/5PW6E+QiRtb4tt
         lB/w==
X-Gm-Message-State: AOJu0YwLmpHQ4lhckrUuilPpCWuoougA1wZXEnb7iCKG4qw4iPTT07Jp
	O+2lxhzGWdcdyYt3lFykkoa+9hQGM2v5MQ==
X-Google-Smtp-Source: AGHT+IHaQEAPmiTM8eAULHe95MC/Lj0665NnRQlab4Y5l+3ob616OsI91ehrz9PVZI1RsNv/q2WYiA==
X-Received: by 2002:a17:906:3084:b0:a23:4c5d:dab4 with SMTP id 4-20020a170906308400b00a234c5ddab4mr1767674ejv.62.1704717166898;
        Mon, 08 Jan 2024 04:32:46 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:46 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:26 +0100
Subject: [PATCH 09/18] clk: qcom: gcc-sm8250: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-9-981c7a624855@linaro.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=949;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SFFzxNcr7/jZTP37CQ/Z62GhXmTvaQlLKwbcTSRc9QY=;
 b=JD1Ygm/Xmp1VCRjGkFFYdUi08P66LYvPhYSD9nD6DerU5BdQtANblM/wlcB2XJSAU0MyNlDV6
 Ic41jLf55iXDsAPp4NfdHZ5KRJG7c7eT5jpHYi2n7njSawy2F+EGm+X
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index c6c5261264f1..61d01d4c379b 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3576,8 +3576,8 @@ static const struct qcom_reset_map gcc_sm8250_resets[] = {
 	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
-	[GCC_VIDEO_AXI0_CLK_ARES] = { 0xb024, 2 },
-	[GCC_VIDEO_AXI1_CLK_ARES] = { 0xb028, 2 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { 0xb024, .bit = 2, .udelay = 150 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { 0xb028, .bit = 2, .udelay = 150 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.43.0


